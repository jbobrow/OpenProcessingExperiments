
String [] ls = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
Ball[] balls;
Button button;
int k =9;
color ba = color(k * 3 *20 % 255,k * 5 *20 % 255,k * 7 *20 % 255,150);
color bb = color(k * 3 *20 % 255+50,k * 5 *20 % 255+50,k * 7 *20 % 255,205);
color ca = color(1 * 3 *20 % 255,1 * 5 *20 % 255,1 * 7 *20 % 255,150);
color cb = color(1 * 3 *20 % 255+50,1 * 5 *20 % 255+50,1 * 7 *20 % 255,255);
int credit = 0;

void setup() {
  size(610, 700);
  noStroke();
  smooth();
  frameRate(5);
  balls = new Ball[100];
  button = new Button (500,640,60,30,"Try Me",bb,ba);
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      balls[i+10*j] = new Ball(60*i+35, 60*j+35, 50, ls[round(random(25))], ca,cb);
    }
  }
}

void draw() {
  background(2,6,9,200);
  textSize(30);
  fill(200,200);
  text(credit,100,660);
  for (int i = 0; i < 100; i++) {
    balls[i].react(); 
    balls[i].display();  
  }
  button.react();
  button.display();
  check();
}

void check() {
   String [] pair = {};
   if (button.getColor() == ba) {
   for (int i = 0; i < 100; i++) {
    if (balls[i].getColor()==cb) { 
      balls[i].die(); 
      pair = append(pair,balls[i].getname());
    } 
  }
   if (pair[0]==pair[1]) {
      textSize(30);
      fill(200,200);
      credit +=1;  
      text("+1",160,660);
      }
   if (pair[0]!=pair[1]) {
      textSize(30);
      fill(200,200); 
      credit -=1;  
      text("-1",160,660);
      }
}
}



class Ball {
  float x, y;
  int size;
  String name;
  color c,c1,c2;
  
  Ball(int xTemp, int yTemp, int sizeTemp, String nameTemp, color c1Temp,color c2Temp) {
    x = xTemp;
    y = yTemp;
    size = sizeTemp;
    name = nameTemp;
    c1 = c1Temp;
    c2 = c2Temp;
    c=c1;
  }
  
  void react() {
    if ( dist(mouseX,mouseY,x,y)<25 & mousePressed) {
      if (c == c1) {c=c2;}
      else {c=c1;}  
    }
  }
 
   
  void display() {
    fill(c);
    //strokeWeight(3);
    //stroke(1,3,5,10);
    ellipse( x, y, size, size);
    fill(0);
    textSize(18);
    textAlign(CENTER);
    text(name,x, y+5);
  }  

  int getColor() {
  return c;
  }
  
  String getname() {
  return name;
  }

  void die() {
    c=color(2,6,9);  
  }
  
  
}


class Button {
  float x, y;
  int xSize, ySize;
  String name;
  color c,c1,c2;
  
  Button(int xTemp, int yTemp, int xsizeTemp, int ysizeTemp, String nameTemp, color c1Temp,color c2Temp) {
    x = xTemp;
    y = yTemp;
    xSize = xsizeTemp;
    ySize = ysizeTemp;
    name = nameTemp;
    c1 = c1Temp;
    c2 = c2Temp;
    c=c1;
  }
  
  void react() {
    if ( dist(mouseX,mouseY,x,y)<50 & mousePressed) { c=c2;}
      else {c=c1;}  
  }
  
  void display() {
    strokeWeight(2);
    stroke(100,100);
    fill(c);
    rect( x, y, xSize, ySize);
    fill(20,20,20);
    textSize(14);
    textAlign(CENTER);
    text(name,x+30, y+20);
  }  
  
  int getColor() {
  return c;
  }
  
}


