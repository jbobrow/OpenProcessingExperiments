

/* переменная, которая будет содержать значение
скорости движения мыши */
float Mspeed;
 
void setup() {
  size(700, 450); //1024, 768 - 1200, 780
  background(0); 
  smooth(); //сглаживание линий включено
}


void draw() {
  Mspeed=abs(mouseX-pmouseX); //вычисляем абсолютное значение
  println(Mspeed); //выводим информацию о значении скорости мыши в debug-окно
  noStroke(); //цвет линий отключен
  
}
void keyPressed(){ //кнопка нажата?
  
  if (key == 's') { //это клавиша «s» была нажата?
    println("Сохранение..."); //выводим дополнительную информацию	
    saveFrame("Изображение-####.png"); //задаем название сохраняемого изображения
    println("Сохранено.");
    }
  if (key == 'c') { //закрашиваем фон
      background(0);
      }
//line(mouseX, mouseY, mouseX, 0); сверху, 
//line(mouseX, mouseY, mouseX, width); снизу
//line(mouseX, mouseY, width, 0); правый верхний угол
//line(mouseX, mouseY, 0, height); левый нижний
//line(mouseX, mouseY, width, height); левый нижний
//width

  if (key == 'q') { // лесенка
    if( mousePressed && mouseButton == LEFT ) { 

     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     // (random(128), random(30), random(255) фиолетовый
     stroke(random(255), random(255), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     line(height, mouseY, mouseX, height); //рисуем линию
     stroke(0); 
     }
  }

  if (key == 'w') { //вертикально-горизонтальная линия
    if( mousePressed && mouseButton == LEFT ) {
     
      strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
      stroke(random(255), random(255), random(255)); //задаем цвет для линий или обводки фигур
      strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
      line(mouseX, mouseY, height, mouseY);  //рисуем линию
      stroke(0); 
      }
  }
  
    if (key == 'e') { // слева красиво
    if( mousePressed && mouseButton == LEFT ) {
     
     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     stroke(random(128), random(30), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     line(mouseX, mouseY, 0, mouseX);  //рисуем линию, где 0 - начало отсчета слева
     stroke(0);
     }
    }
        if (key == 'r') { // справа красиво
    if( mousePressed && mouseButton == LEFT ) {
     
     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     stroke(random(255), random(255), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     line(mouseX, mouseY, width, mouseX);  //рисуем линию
     stroke(0);
     }
    }
     if (key == 't') { // горизонтально слева
    if( mousePressed && mouseButton == LEFT ) {
     
     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     stroke(random(255), random(255), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     line(0, mouseY, mouseX, mouseY);  //рисуем линию
     stroke(0);
     }
    }
         if (key == 'y') { // горизонтально справа
    if( mousePressed && mouseButton == LEFT ) {
     
     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     stroke(random(255), random(255), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     line(width, mouseY, mouseX, mouseY);  //рисуем линию
     stroke(0);
     }
    }
            if (key == 'a') { // обе линии вместе
    if( mousePressed && mouseButton == LEFT ) {
     
     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     stroke(random(128), random(30), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     line(mouseX, mouseY, 0, mouseX);  //рисуем линию, где 0 - начало отсчета слева
     line(mouseX, mouseY, width, mouseX);
     stroke(0);
     }
    }
    
                if (key == 'd') { // обе вместе с вертикальной полосой ограничения
    if( mousePressed && mouseButton == LEFT ) {
     
     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     stroke(random(128), random(30), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     line(mouseX, mouseY, 0, height);  //рисуем линию, где 0 - начало отсчета слева
     line(mouseX, mouseY, width, mouseX);
     stroke(0);
     }
    }
    
                    if (key == 'f') { // доработка
    if( mousePressed && mouseButton == LEFT ) {
     
     strokeWeight(0.1+Mspeed/20); //толщина линий или обводки фигур
     stroke(random(128), random(30), random(255)); //задаем цвет для линий или обводки фигур
     strokeWeight(0.1+Mspeed/20); //толщина линии (зависимость от скорости)
     beginShape(LINES);
     point(mouseX, mouseY);  //рисуем линию
     stroke(0);
     }
    }
 }

