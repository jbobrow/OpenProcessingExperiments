
float a; //переменная с плавающей запятой 
PImage bg;
void setup() {
  size(600, 600, P3D); 
  background(0);
  smooth();  //сглаживание линий включено
}

void draw() {


translate(width/2, height/2); //Размещение граффического обьекта в окне
    rotateX(a*PI); //2
    rotateY(a*0.5);//вращение вокруг оси Y (значения от 0 до PI * 2
    stroke(random(128), random(30), random(255));
    line(200, 100, 150, 100);
    a += 0.02; //изменить угол наклона 
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
}

