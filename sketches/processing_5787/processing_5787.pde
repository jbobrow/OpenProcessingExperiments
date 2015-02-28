

PShape body,mouth1, eyes, lcd;
PImage sky,balloon, balloon2, balloon3;
float angle = 0.0;
float scalor = 13.0;
float speed1 = 0.0;
float y, y2, y3, y4 ;

void setup(){

  size(320, 480);
  shapeMode(CENTER);
  smooth();


  mouth1 = loadShape("mouth1.svg");
  eyes = loadShape("eyes.svg");
  lcd = loadShape("lcd.svg");
  balloon = loadImage("movingballoon.png");
  balloon2 = loadImage("movingballoon2.png");
  balloon3 = loadImage("movinballoon3.png");
 sky = loadImage("sky.png");

}

void draw() {

  background(204);
  background(#98D4F9);
 sky(0,0);
  balloon();
  
  leg(width/2-33, 380);
  leg(width/2+10, 380);
  arm(width/2-63, 280);
  arm2(width/2+57, 279);
  body(width/2,320);
  
  lcd(width/2+2, 310);

  head(width/2, 237);
  mouth(width/2, 260);
  eyes(width/2-30, 213);


}

void body(int x, int y) {
  
  float a = norm(mouseX, 0,width*1.7);
  float b = lerp(0, 70, a);
 
  rectMode(CENTER);
  stroke(0);
  rect(x, y, 123+b/4, 120+b); 

}

void head(int x, int y) {
  
  float a = norm(mouseX, 0, width*1.2);
  float b = lerp(0, 30, a);

  fill(#D9DBEE);
  stroke(0);
  strokeWeight(4);
  rectMode(CENTER);
  rect(x, y-b, 85+b/6  , 85+b/6);


}

void leg(int x, int y) {
  
  float a = norm(mouseX, 0 , width*1.9);
  float b = lerp(390, 470, a);
  float a2 = norm(mouseY, height*1.1, 0);
  float b2 = lerp(0,2, a2);
 
  float s = sin(angle)*scalor;
  angle = angle + PI/15.0*b2;
  
  stroke(0);
  fill(#D9DBEE);   
  strokeWeight(4); 
  beginShape(); 
  vertex(x,y);
  vertex(x+s+4, b+39);
  bezierVertex(x+s+10, b+46, x+s+16, b+46, x+s+22, b+39);
  vertex(x+s+22, b+39);
  vertex(x+26, y);
  endShape(CLOSE);
}

void arm (int x , int y) {
  
  float a = norm(mouseX, width*1.7, 0);
  float b = lerp(0, 100, a);
  float a2 = norm(mouseY, height*1.1, 0);
  float b2 = lerp(0,2, a2);
 
  float s = sin(angle)*scalor;
  angle = angle + PI/40.0*b2;
    
  stroke(0);
  strokeWeight(4);
  stroke(0);
  beginShape(); 
  vertex(x, y);
  vertex(b-29, y+s+36);
  bezierVertex(b-31, y+s+44, b-31, y+s+53, b-29, y +s+56);
  vertex(b-29, y +s+ 56);
  vertex(x, y+27); 
  endShape(CLOSE);
}

void arm2 (int x, int y) {
  
  float a = norm(mouseX, 0,width*1.7);
  float b = lerp(220, 330, a);
  float a2 = norm(mouseY, height*1.1, 0);
  float b2 = lerp(0,2, a2);
 
  float s = sin(angle)*scalor;
  angle = angle + PI/40.0*b2;

  stroke(0);
  strokeWeight(4);
  stroke(0);
  beginShape(); 
  vertex(x, y);
  vertex(b+29, y+s+36);
  bezierVertex(b+31, y+s+44, b+31, y+s+53, b+29, y+s + 56);
  vertex(b+29, y+s + 56);
  vertex(x, y+27); 
  endShape(CLOSE);
}

void mouth(int x, int y) {
 
 float a = norm(mouseX, 0, width*1.2);
 float b = lerp(0, 35, a);
 
 shape(mouth1, x, y-b);
}  

void eyes(int x, int y){
 
  float a = norm(mouseX, 0, width*1.2);
  float b = lerp(0, 35, a);
 
  shape(eyes, x, y-b);
}

void lcd(int x, int y) {
 
  float a = norm(mouseX, 0, width*1.4);
  float b = lerp(0, 50, a);
 
  shape(lcd, x, y-b/4);
}

void sky(int x, int y) {
float e = norm(mouseX,0,520);
float f = lerp(0, 455,e);
 tint(0,0,f,f);

image(sky,x,y); 
}
void balloon() {

  if( mouseX< 5.0) {speed1 = 0.0;} 
  else if (mouseX<100) {speed1 = 0.5;}
  else if (mouseX<200) {speed1 =1.0;}
  else {speed1 = 3.0;}
  y = y+speed1;
  if (y>320) { //making rotation
   y = 0; 
}
  image(balloon, 30, -y +240);


  if( mouseX< 100.0) {speed1 = 0.0;} 
  else if (mouseX<200.0) {speed1 = 0.5;}
  else if (mouseX<300.0) {speed1 =1.0;}
  else {speed1 = 1.5;}
  y2 = y2+speed1;
  if (y2>320) {
  y2 = 0;
}
image(balloon2, 160, -y2+240);


  if( mouseX< 50.0) {speed1 = 0.0;} 
  else if (mouseX<100.0) {speed1 = 0.5;}
  else if (mouseX<150.0) {speed1 =2.0;}
  else if(mouseX<300.0) {speed1 = 3.0;}
  else {speed1 = 3.5;}
  y3 = y3 + speed1;
  if (y3>320) {
  y3 = 0;
}
  image(balloon3, 280, -y3+200);

}


