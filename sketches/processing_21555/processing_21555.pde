
PImage z2;
PImage z2B;
PImage z3;
PImage z1;

float displacement;
float slope; 
float progress; 
boolean reset = true;
float duration;
float now;
float then;
int linecount = 0;
//a
//pos
int x = 360;
int y = 150;
//map
int w = 60;
int h = 170;
//r
//pos
int x1 = 460;
int y1 = 200;
//map
int w1 = 100;
int h1 = 150;
//c
//pos
int x2 = 10;
int y2 = 40;
//map
int w2 = 119;
int h2 = 480;




//circle car
  float centerX = 122;
  float centerY = 240;
  float radius = 95;
  float angle = atan2(mouseY - centerY, mouseX - centerX);

void setup() {
  size(640,480);
   background(255);
  strokeWeight(3);
  stroke(150);


  //Zopcar Fill 1
  z2 = loadImage("zipcar2-01.png");
 
  //Zipcar Fill car
  z2B = loadImage("zipcar2B.png");
  
  //zlogo
  z1 = loadImage ("Z.png");

}


void draw () {
  if (now!=millis())
  {

    now=millis();
  }

  if(reset) {
    linecount++;

    then = now;
    reset = false;
  }
  //Z
  //line1
  if(now<=then+duration && linecount == 1)
  {
    duration = 200;
    drawLine(45,120,220,199);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==1)
  {
    reset = true;
  }
  //line2
  if(now<=then+duration && linecount == 2)
  {
    duration = 200;
    drawLine(251,157,64,347);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==2)
  {
    reset = true;
  }
  //line3
  if(now<=then+duration && linecount == 3)
  {
    duration = 200;
    drawLine(88,242,233,347);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==3)
  {

    reset = true;
  }
  //line4

  if(now<=then+duration && linecount == 4)
  {
    duration = 250;
    drawLine(230,306,178,347);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==4)
  {
    reset = true;
  }
  
   //line5

  if(now<=then+duration && linecount == 5)
  {
    duration = 250;
    
    drawLine(69,311,178,347);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==5)
  {
    reset = true;
  }
  
   //line6

  if(now<=then+duration && linecount == 6)
  {
    duration = 250;
    drawLine(177,178,239,135);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==6)
  {
    reset = true;
  }
//I
  //line1
  if(now<=then+duration && linecount == 7)
  {
    duration = 150;
    drawLine(320,50,320,350);
    image(z2, 0, 0);
  } 
  else if(now > then + duration && linecount ==7)
  {
    reset = true;
  }
  //line2
  if(now<=then+duration && linecount == 8)
  {
    duration = 200;
    drawLine(293,50,36,93);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==8)
  {
    reset = true;
  }
  //line3
  if(now<=then+duration && linecount == 9)
  {
    duration = 250;
    drawLine(300,134,364,177);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==9)
  {

    reset = true;
  }
  //line4

  if(now<=then+duration && linecount == 10)
  {
    duration = 250;
    drawLine(364,177,299,222);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==10)
  {
    reset = true;
  }
  
   //line5

  if(now<=then+duration && linecount == 11)
  {
    duration = 250;
    drawLine(293,304,355,350);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==11)
  {
    reset = true;
  }
//P
 //line1
  if(now<=then+duration && linecount == 12)
  {
    duration = 150;
    drawLine(435,132,435,450);
    image(z2, 0, 0);
  } 
  else if(now > then + duration && linecount ==12)
  {
    reset = true;
  }
  //line2
  if(now<=then+duration && linecount == 13)
  {
    duration = 200;
    drawLine(462,350,406,306);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==13)
  {
    reset = true;
  }
  //line3
  if(now<=then+duration && linecount == 14)
  {
    duration = 250;
    drawLine(406,306,585,180);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==14)
  {

    reset = true;
  }
  //line4

  if(now<=then+duration && linecount == 15)
  {
    duration = 250;
    drawLine(585,270,406,135);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==15)
  {
    reset = true;
  }
  
   //line5

  if(now<=then+duration && linecount == 16)
  {
    duration = 250;
    drawLine(406,220,532,133);
    image(z2, 0, 0);
  }
  else if(now > then + duration && linecount ==16)
  {
    reset = true;
  }
if (linecount == 17)
{
  background(255);
  //mouse x and y car
  
  
  
//  pushMatrix();
  translate(0,0);
  
  //a
  if((mouseX > x) && (mouseX <x+w) &&
     (mouseY > y) && (mouseY <y+h)) {

noStroke();
  rect(x,y,w,h);
  stroke(0);
  strokeWeight(15);
    line(mouseX,mouseY,mouseX,mouseY+20);
}
//r
if((mouseX > x1) && (mouseX <x1+w1) &&
     (mouseY > y1) && (mouseY <y1+h1)) {

noStroke();
  rect(x1,y1,w1,h1);
  stroke(0);
  strokeWeight(15);
    image(z1,mouseX-100,mouseY-100);
}  
//c
if((mouseX > x2) && (mouseX <x2+w2) &&
     (mouseY > y2) && (mouseY <y2+h2)) {

 //center point
  fill(0);
  ellipse(centerX, centerY, 10, 10);
  //limit
  noFill();
  noStroke();
  float angle = atan2(mouseY - centerY, mouseX - centerX);
  ellipse(centerX, centerY, radius * 2, radius * 2);
  //the magic equasion
  float x = centerX + cos(angle) * radius;
  float y = centerY + sin(angle) * 0.85 * radius;
  //car
  fill(0);
  stroke(0);
  strokeWeight(15);
  line(x, y-10, x, y+10);
  noFill();
     }


  image(z2B, 0,0);


//  popMatrix();

}

//zip image

  
  
  

  //draw Z
}
void drawLine(float x1, float y1,float x2, float y2) {

  progress = (now-then)/(duration);
  if (x1 != x2){
  displacement = x2 - x1;
  slope = (y2-y1)/(x2-x1);
    line (x1,y1,x1+(progress*displacement), y1+(slope*progress*displacement));
}
  else{
    displacement = y2-y1;
    slope = 1;
   line (x1,y1,x2, y1+(slope*progress*displacement));
  }

  

}


