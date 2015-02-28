
Body body1;

PShape mouth1, eyes, lcd, bg, body2;

boolean lamp = false;
boolean fireflies = false;

void setup() {
  
  size(320, 480);
  shapeMode(CENTER);
  smooth();
  
  bg = loadShape("background1.svg");
  eyes = loadShape("eyes.svg");
  lcd = loadShape("lcd.svg");
  mouth1 = loadShape("mouth1.svg");
  body2 = loadShape("body2.svg");
  body1 = new Body(width/2, 320);
 
}

void draw() {

  background(204);

  float mx = map(mouseX, 0, 320, 320, 0); 
  float my = map(mouseY, 0, 480, 379, 89);

  shape(bg, mx, my);

  movementofsun();
  body1. display();
  body1. drawLamp1();
  body1. firefly();

}

void mousePressed() {if (mouseButton == LEFT) {lamp = true; 
                     fireflies = true;} else {lamp = false;
                     fireflies = false;}}


 void movementofsun() {

  float c;    //limit for color 
  float x2;   //limit for xpos of sun
  float y2;   //limit for ypos of sun  
  
  c = map( mouseX,0, 320, 140, 255);
  x2 = map(mouseX, 0, 320, 70, 260);
  y2 = map(mouseY, 100, 200, 0, 80); 

  if((mouseY > 0) && (mouseY < 240)) {
  
  stroke(300, c+20, 30);  // change from sun to moon as mouse moves
  strokeWeight(5);
  fill(300, c, 30);
  ellipse(x2, 100-y2, 70, 70); 
  }
}


class Body {
  
  float x;
  float y;
  float angle = 0.0;
  float scalor = 13.0;
  float Lx, Ly, Lx2, Ly2, s3;
  float fx, fy, fx2, fy2, s4;        //variables for fireflies
  float f,targetf, easingf = 0.2; 
  float f2, targetf2, easingf2 = 0.3;
  float f3, targetf3, easingf3 = 0.24;
  
   
  Body(float xpos, float ypos ) {
    x = xpos;
    y = ypos;

 
  }


 void drawLamp1(){
  
  float Lx = norm(mouseY, height*1.1, 0); 
  float Ly = lerp(0,2, Lx); 
  
  float s3 = sin(angle)*scalor; 
  angle = angle + PI/40.0*Ly;
  
  float Lx2 = norm (mouseX, 0, width*1.7);
  float Ly2 = lerp(220, 317, Lx2);
  
  float r = random(0, 7);
  float r2 = random(0, 30);

  float trans = map(mouseX, 0, 320, 0, 255);  //variables for lamp
  float trans2 = map(mouseX, 0, 320, 0, 150);
  float trans3 = map(mouseX, 0, 320, 0, 140);
  
  
  if (lamp == false) { 
    
  noStroke(); //light behind the lamp
  fill(#FCCC00, trans3);
  ellipse(Ly2+23, y+s3+47, 85 + r2, 85+r2);
  
  fill(#CCCACB, trans);  //cap of the lamp
  stroke(#303030, trans);
  strokeWeight(1);
  rect(Ly2+22, y+s3+10, 9, 12); 
  beginShape();
    vertex(Ly2+5, y+s3+27);
    bezierVertex(Ly2+21, y+s3+12, Ly2+25, y+s3+12, Ly2+41, y+s3+27);
    vertex(Ly2+41, y+s3+27);
    vertex(Ly2+5, y+s3+27);
  endShape();
  
  fill(#94F0FF, trans2);
  rect(Ly2+23, y+s3+43, 27, 32); //glass
  
  fill(#CCCACB, trans); //strings
  stroke(#303030, trans);
  strokeWeight(1);
  rect(Ly2+23 , y+s3+60, 25, 5); //bottom 
  rect(Ly2+8, y+s3+45,6, 35); //left 
  rect(Ly2+38, y+s3+45, 6, 35); //right 
    
  fill(#FFF208, trans); //small light
  stroke(#FFC82C, trans);
  strokeWeight(3);
  ellipse(Ly2+23, y+s3+47, 4+ r, 20+r);  

  
} else {
 
  fill(#CCCACB, trans);  //cap of the lamp
  stroke(#303030, trans);
  strokeWeight(1);
  rect(Ly2+22, y+s3+10, 9, 12); 
  beginShape();
    vertex(Ly2+5, y+s3+27);
    bezierVertex(Ly2+21, y+s3+12, Ly2+25, y+s3+12, Ly2+41, y+s3+27);
    vertex(Ly2+41, y+s3+27);
    vertex(Ly2+5, y+s3+27);
  endShape();
  
  fill(#94F0FF, trans2);
  rect(Ly2+23, y+s3+43, 27, 32); //glass
  
  fill(#CCCACB, trans); //strings
  stroke(#303030, trans);
  strokeWeight(1);
  rect(Ly2+23 , y+s3+60, 25, 5); //bottom 
  rect(Ly2+8, y+s3+45, 6, 35); //left 
  rect(Ly2+38, y+s3+45, 6, 35); //right 
  
  }
}
   
void firefly() {
 
  float r = random(0, 7);
  float trans = map(mouseX, 0, 320, 0, 180);  //variables for lamp

  targetf = map(mouseX, 0, 320, 0, 290);
  targetf2 = map (mouseX, 0,320, 0, 290);
  targetf3 = map(mouseY, 0, 320, 0, 480);
  
   
  f = f + ((targetf - f) *easingf);
  f2 = f2 + ((targetf2 - f2) *easingf2);
   f3 = f3 + ((targetf3 - f3) *easingf3);
   
  strokeWeight(1);
  stroke(0, trans);

  if(fireflies == false) {  
 
  fill(#EFFF22, trans);
  ellipse(f+20+r, y+r, 5, 5);
  ellipse(f2+20+ r, y-r*2+70 , 7, 7);
  ellipse(f +46+r, y+r+58, 5, 5);
  ellipse(f2+63 + r, y-r*2+10 , 7, 7); 
   shape(body2, f+20, f3-60);
  }
}

void display() {
  
  stroke(0);

  float a2 = norm(mouseX, 0 , width*1.9); //variables for legs
  float b2 = lerp(390, 470, a2);
  float a3 = norm(mouseY, height*1.1, 0);
  float b3 = lerp(0,3, a3);

  float s = sin(angle)*scalor;
  angle = angle + PI/13.0*b3;
  
  float a4 = norm(mouseX, width*1.8, 0); //variables for arm1
  float b4 = lerp(0, 100, a4);
  float a5 = norm(mouseY, height*1.1, 0); //(also for arm2)
  float b5 = lerp(0,2, a5); //(also for arm2)

  float s2 = sin(angle)*scalor; //(also for arm2)
  angle = angle + PI/40.0*b5;
  
  float a = norm (mouseX, 0, width*1.7); //variables for body
  float b = lerp (0, 70, a);
  float b6 = lerp(220, 317, a); //variable for arm2
  
  float c = norm (mouseX, 0, width*1.2); //variables for head
  float d = lerp (0, 30, c);
  
  float e = norm (mouseX, 0, width*1.4); //variables for LCD
  float f = lerp (0, 50, e);
  
  rectMode(CENTER);
  fill(#D9DBEE);
  strokeWeight(4);
  
  beginShape();  //leg
    vertex(x+10,y+60);
    vertex(x+s+14, b2+34);
    bezierVertex(x+s+20, b2+41, x+s+26, b2+41, x+s+32, b2+34);
    vertex(x+s+32, b2+34);
    vertex(x+36, y+60);
  endShape(CLOSE);
  
  beginShape();  //leg2
    vertex(x-35,y+60);
    vertex(x+s-31, b2+34);
    bezierVertex(x+s-25, b2+41, x+s-19, b2+41, x+s-13, b2+34);
    vertex(x+s-13, b2+34);
    vertex(x-9, y+60);
  endShape(CLOSE);

  beginShape(); //arm
    vertex(x-60, y-46);
    vertex(b4-39, y+s2-4);
    bezierVertex(b4-41, y+s2+4, b4-41, y+s2+13, b4-39, y +s2+16);
    vertex(b4-39, y +s2+ 16);
    vertex(x-60, y-13); 
  endShape(CLOSE);
  
  beginShape(); //arm 2
    vertex(x+60, y-46);
    vertex(b6+39, y+s2-4);
    bezierVertex(b6+41, y+s2+4, b6+41, y+s2+13, b6+39, y +s2+16);
    vertex(b6+39, y +s2+ 16);
    vertex(x+60, y-13); 
  endShape(CLOSE);
  
  rect(x, y, 123+b/4, 120+b); //body
  
  rect(x, y-85-d, 85+d/6  , 85+d/6); //head
  
  shape(eyes, x-30, y-111-d); //eyes
  
  shape(mouth1, x, y-65-d); //mouth
  
  shape(lcd, x+3, y-15-f/4); //LCD
  }
}


