program Calc;
// 2018 year
uses GraphABC;

const
  a: array[1..4, 1..4] of char = (('1', '2', '3', 'C'), ('4', '5', '6', '*'), ('7', '8', '9', '/'), ('0', '+', '-', '='));

var
  real_1, real_2: real;
  res_text, res_text2: String;
  command: integer;// 1 - '+', 2 - '-', 3 - '/', 4 - '*', 5 - '^'

procedure UserInterface();
begin
  Window.Caption := 'Калькулятор';
  Window.IsFixedSize := true; //Изменяемый размер окна программы = нет
  Window.Height := 340;
  Window.Width := 290;
  Window.Clear(Color.Gray);
  SetPenColor(Color.Black);
  SetPenWidth(1);
  SetBrushColor(Color.AliceBlue);
  Rectangle(10, 10, 280, 50);
  for var x := 1 to 4 do
    for var y := 1 to 4 do
    begin
      Rectangle((70 * x) - 60, (70 * y) - 10, (60 + 70 * x) - 60, (60 + 70 * y) - 10);
      SetFontSize(20);
      textout((x * 70) - 40, (y * 70 + 15) - 10, a[y, x]);   
    end;
end;

procedure distext(text: string);
begin
  TextOut(15, 20, '                                               ');
  TextOut(15, 20, text);
end;

procedure numButton(id: byte);
begin
  if(command = 1) then begin
    res_text2 := res_text2 + id;
    distext(res_text2);
  end else if(command = 2) then begin
    res_text2 := res_text2 + id;
    distext(res_text2);
  end else if(command = 3) then begin
    res_text2 := res_text2 + id;
    distext(res_text2);
  end else if(command = 4) then begin
    res_text2 := res_text2 + id;
    distext(res_text2);
  end else begin
    res_text := res_text + id;
    distext(res_text);
  end;
end;

procedure calculation();
begin
  real_2 := real.Parse(res_text2);
  case command of
    1:
      begin
        res_text := (real_1 + real_2).ToString;
        distext(res_text);
        command := 0;
        res_text2 := '';
      end;
    2:
      begin
        res_text := (real_1 - real_2).ToString;
        distext(res_text);
        command := 0;
        res_text2 := '';
      end;
    3:
      begin
        res_text := (real_1 / real_2).ToString;
        distext(res_text);
        command := 0;
        res_text2 := '';
      end;
    4:
      begin
        res_text := (real_1 * real_2).ToString;
        distext(res_text);
        command := 0;
        res_text2 := '';
      end;
  end;
end;

procedure onClick(x, y, mousebutton: integer);//Данная процедура выполняется при нажатии мыши.
begin
  if(mousebutton = 1) then begin
    SetFontSize(15); //Размер шрифта 15
    if(x > 10) and (x < 70) and (y > 60) and (y < 118) then begin//Проверяем что мышь была кликнута именно по 1-ой кнопке
      numButton(1); //Добавления на экран (1)  
    end; 
    if(x > 80) and (x < 140) and (y > 60) and (y < 118) then begin//Проверяем что мышь была кликнута именно по 2-ой кнопке
      numButton(2); //Добавления на экран (2)
    end;
    if(x > 150) and (x < 209) and (y > 60) and (y < 118) then begin//Проверяем что мышь была кликнута именно по 3-ой кнопке
      numButton(3); //Добавления на экран (3)
    end;
    if(x > 10) and (x < 70) and (y > 130) and (y < 187) then begin//Проверяем что мышь была кликнута именно по 4-ой кнопке
      numButton(4); //Добавления на экран (4)
    end;  
    if(x > 80) and (x < 140) and (y > 130) and (y < 187) then begin//Проверяем что мышь была кликнута именно по 5-ой кнопке
      numButton(5); //Добавления на экран (5)
    end;
    if(x > 150) and (x < 210) and (y > 130) and (y < 187) then begin//Проверяем что мышь была кликнута именно по 6-ой кнопке
      numButton(6); //Добавления на экран (6)
    end;
    if(x > 10) and (x < 70) and (y > 200) and (y < 260) then begin//Проверяем что мышь была кликнута именно по 7-ой кнопке
      numButton(7); //Добавления на экран (7)
    end;  
    if(x > 80) and (x < 140) and (y > 200) and (y < 260) then begin//Проверяем что мышь была кликнута именно по 8-ой кнопке
      numButton(8); //Добавления на экран (8)
    end;
    if(x > 150) and (x < 210) and (y > 200) and (y < 260) then begin//Проверяем что мышь была кликнута именно по 9-ой кнопке
      numButton(9); //Добавления на экран (9)
    end;
    if(x > 10) and (x < 70) and (y > 270) and (y < 330) then begin//Проверяем что мышь была кликнута именно по 0-ой кнопке
      numButton(0); //Добавления на экран (0)
    end;  
    if(x > 80) and (x < 140) and (y > 270) and (y < 330) then begin//Проверяем что мышь была кликнута по кнопке сложения
      real_1 := real.Parse(res_text); //Преобразование значение из текстового вида в тип real
      command := 1; //Выбираем команду "+"
      distext('                                               '); //Очистка поля результата 
    end;
    if(x > 150) and (x < 210) and (y > 270) and (y < 330) then begin//button -
      real_1 := real.Parse(res_text); //Преобразование значение из текстового вида в тип real
      command := 2; //Выбираем команду "-"
      distext('                                               '); //Очистка поля результата 
    end;
    if(x > 210) and (x < 280) and (y > 60) and (y < 118) then begin//button √
      real_1 := 0; //Очистка числового результата (1) 
      real_2 := 0; //Очистка числового результата (2)
      res_text := ''; //Очистка поля результата (1) 
      res_text2 := '';  //Очистка поля результата (2) 
      distext('                                               '); //Очистка поля результата 
    end;
    if(x > 210) and (x < 280) and (y > 130) and (y < 187) then begin//button *
      real_1 := real.Parse(res_text); //Преобразование значение из текстового вида в тип real
      command := 4; //Выбираем команду "*"
      distext('                                               '); //Очистка поля результата  
    end;
    if(x > 210) and (x < 280) and (y > 200) and (y < 260) then begin//button /
      real_1 := real.Parse(res_text); //Преобразование значение из текстового вида в тип real
      command := 3; //Выбираем команду "/"
      distext('                                               '); //Очистка поля результата 
    end;
    if(x > 210) and (x < 280) and (y > 270) and (y < 330) then begin//button = 
      if(real_1 <> 0) then //Проверка, что числа были введены (т.е не равнялись нулю)
        calculation; //Вызываем процедуру расчета
    end;
  end;
end;

begin
  res_text := '';
  real_1 := 0;
  real_2 := 0;
  UserInterface();
  onmousedown := onClick;
end.
