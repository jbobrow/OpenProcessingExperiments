
float x = 60;
float y = 60;
float w = 50;
float h = 50;
float rad = 20; 
float eyeSpace = 30;
float eyeLine = 40;
float teethx= x-30;
//boolean button = false;
String text1 = "press a, b, c, d, e, f, g";
String text2 = "see what happens";
int state = 0;
int speed = 60;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  stroke(1);
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  moveCrab();
  pressCrab();
  switchCrab();
}

void moveCrab(){
  //move
  
  if (state == 0){
    drawCrab(-PI, speed, 100);
    speed = speed + 3;
    if(speed > width){
      speed = 110;
      state = 1;
    } 
  }
  
  else if(state == 1){
    drawCrab(-PI/2, 300, speed);
    speed = speed + 3;
    if (speed > height - 60){
      speed = width-110;
      state = 2;
    }
  } else if(state == 2){
    drawCrab(0, speed, 300);
    speed = speed - 3;
    if(speed < 60){
      speed = height-110;
      state = 3;
    }
  } else if(state == 3){
    drawCrab(PI/2, 100, speed);
    speed = speed - 3;
    if(speed < 60){
      speed = 110;
      state = 0;
    }
  }
}


void drawCrab(float angle, float transX, float transY){
  //text
  fill(0);
  textSize(15);
  text(text1, 120, 150);
  text(text2, 120, 170);
  
  translate(transX, transY);
  rotate(angle);
  
  //eyeline
  line(x-eyeSpace, y, x-eyeSpace, y-eyeLine);
  line(x+eyeSpace, y, x+eyeSpace, y-eyeLine);
  
  //body
  fill(255, 83, 3);
  ellipse(x, y, 2*w, h);
  
  //eye
  fill(0, 255, 0);
  arc(x-eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
  arc(x+eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
  
  //legs
  line(x+45, y-10, x+60, y-20);
  line(x+48, y-5, x+65, y-10);
  line(x+50, y+3, x+65, y+5);
  line(x+45, y+10, x+60, y+20);
  
  line(x-45, y+10, x-60, y+20);
  line(x-48, y+5, x-65, y+10);
  line(x-50, y-3, x-65, y-5);
  line(x-45, y-10, x-60, y-20);
  
  for(float teethx= x-30; teethx <= x+(w-20) && teethx >= x-30; teethx += 10){
    float r = random(255);
    float g = random(255);
    float b = random(255);
    rectMode(CENTER);
    fill(r, g, b);
    rect(teethx, y-5, 8, 10);
  }
}

void pressCrab(){
   char [] smallk = {'a', 'b', 'c', 'd', 'e', 'f', 'g'};
   char [] bigk = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
   
   if(keyPressed){
     for(int i = 0; i<smallk.length; i++){
       if(key == smallk[i] || key == bigk[i]){
         fill(255, 0, 0);
         triangle(x-(30-i*10), y-10, x-(25-i*10), y, x-(35-i*10), y);
       } else {
         fill(255);
         rect(x-(30-i*10), y-5, 8, 10);
       }
     }
   }
}
 
boolean button = false; 
void switchCrab(){
  if(button){
    fill(0, 255, 0);
    ellipse(x-eyeSpace, y-eyeLine, rad, rad);
    line(x-eyeSpace, y-eyeLine, x-eyeSpace, y-eyeLine-rad/2);
    ellipse(x+eyeSpace, y-eyeLine, rad, rad);
    line(x+eyeSpace, y-eyeLine, x+eyeSpace, y-eyeLine-rad/2);
  } else {
    fill(0, 255, 0);
    arc(x-eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
    arc(x+eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
  }
}
   
   
void mousePressed(){
  button = !button;
 } 


