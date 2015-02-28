
Robot[] robots;

PShape body, globe, flower, snow;
float g, targetg, easingg;
float angle_globe, angle_globe2;
float angle = 0.0;
float scalor = 13.0;
float scalor2 = 1.6;
float speed_s = 0.0;
float speed_f= 0.0;
float y_f, y_f2, y_f3, y_f4;
float y_s, y_s2, y_s3, y_s4, y_s5;


void setup() {


  size(480, 320);
  smooth();
  shapeMode(CENTER);
  
  body = loadShape("body.svg");
  globe = loadShape("bg_globe.svg");
  flower= loadShape("flower.svg");
  snow = loadShape("snow.svg");
  
  robots = new Robot[10];
  
  int radius = 175;
  int deg = 20;
  for (int i = 0; i < robots. length; i ++ ) {
  deg = deg - 20;
  float angle = radians(deg);
  float x = 10 + (cos(angle) * radius);
  float y = 10 + (sin(angle) * radius);
   
  robots[i] = new Robot(220+x, 250+y/1.13);


  }
}

void draw() {

  
  
  float b1 = norm(mouseX,0,480);
  float b2 = lerp(0,b1,255);

 
  background(204);
  background(b2,105,100);
    
  angle_globe2 = map(mouseX, 0, 480, 0.7, 6); //globe
  angle_globe = angle_globe - 0.01*angle_globe2;
  
  pushMatrix();
  translate(width/2-10, 323);
  rotate(angle_globe);
  shape(globe,0,0);
  popMatrix();

  
  for(int i = 0; i < robots. length; i ++ ) {

  robots [i]. display();
  robots [i]. movement();

  }
  robots[0]. snow();
  robots[0]. flower();

}


class Robot {
 
 float x;
 float y;

 Robot (float xpos, float ypos){

 x = xpos;
 y = ypos;   
}

void snow() {

  float trans = map(mouseX, 0, 480, 255, 0);
  float currentTime = millis()/1000.0;
  
  stroke(255, trans);
  strokeWeight(2);
  fill(#D4FFFD, trans);
  
  if(currentTime<3.0) {speed_s = 5;}
  else {speed_s = 3;}
  y_s = y_s+speed_s;
  if(y_s >320) {y_s = 0;}  
  ellipse(100, y_s, 10, 10);
  ellipse(300, y_s+100, 10, 10);
  
  if(currentTime<4.0) {speed_s = 3;}
  else {speed_s = 2.5;}
  y_s2 = y_s2+speed_s;
  if(y_s2 >320) {y_s2 =-100;}  
  ellipse(400, y_s2+100, 10, 10);
  ellipse(30, y_s2+100, 10, 10);
  
  if(currentTime<5.0) {speed_s = 3;}
  else {speed_s = 4;}
  y_s3 = y_s3+speed_s;
  if(y_s3 >320) {y_s3 =-30;}  
  ellipse(450, y_s3+20, 10, 10);
  ellipse(320, y_s3+60, 10, 10);
  
  if(currentTime<6.0) {speed_s = 2;}
  else {speed_s = 3;}
  y_s4 = y_s4+speed_s;
  if(y_s4 >320) {y_s4 =-50;}  
  ellipse(240, y_s4+10, 10, 10);
  ellipse(280, y_s4+60, 10, 10);
  
  if (mouseX<100) {
  
  shape(snow, 200, y_s2);
  shape(snow, 20, y_s3-100);
  shape(snow, 400, y_s4+40); }
}

void flower() {
  if(mouseX>width/2+50) {
    
  float trans = map(mouseX, 0, 480, 0, 255);
  float currentTime = millis()/1000.0;
  
  if(currentTime<3.0) {speed_f = 2;}
  else {speed_f = 4.5;}
  y_f = y_f+speed_f;
  if(y_f >320) {y_f = 0;}  
  shape(flower, 100, y_f); 
  shape(flower, 300, y_f+100);
  shape(flower, 160, y_f+40);
  
  if(currentTime<4.0) {speed_f = 4.5;}
  else {speed_f = 2.5;}
  y_f2 = y_f2+speed_f;
  if(y_f2 >320) {y_f2 =-90;}  
  shape(flower, 400, y_f2+100);
  shape(flower, 30, y_f2+100);
  
  if(currentTime<5.0) {speed_f = 1.5;}
  else {speed_f = 5.5;}
  y_f3 = y_f3+speed_f;
  if(y_f3 >320) {y_f3 =-30;}  
  shape(flower, 450, y_f3+20);
  shape(flower, 320, y_f3+60);
  
  if(currentTime<6.0) {speed_f = 3.5;}
  else {speed_f = 4;}
  y_f4 = y_f4+speed_f;
  if(y_f4 >320) {y_f4 =-50;}  
  shape(flower, 240, y_f4+10);
  shape(flower, 280, y_f4+60);
  }
  
  
}

void movement() {
  
 float s3 = sin(angle)*scalor2;
 angle = angle + PI/60.0;
 y = y+s3;
  
}

void display() {


 
  float a = norm(mouseX, 0, height*1.01);
  float b = lerp(0,1, a);
  float s = sin(angle)*scalor;
  angle = angle + PI/130.0*b;
  
  float a2 = norm(mouseX, 0, height*1.1); //(also for arm2)
  float b2 = lerp(0,2, a2); //(also for arm2)
  float s2 = sin(angle)*scalor; //(also for arm2)
  angle = angle + PI/140.0*b2;
 
  stroke(0);
  fill(#D9DBEE);      //leg
  strokeWeight(2);
  beginShape();  
  vertex(x+5,y+40);
  vertex(x+s+10, y+54);
  bezierVertex(x+s+15, y+61, x+s+17, y+61, x+s+20, y+54);
  vertex(x+s+20, y+54);
  vertex(x+21, y+40);
  endShape(CLOSE);
  
  pushMatrix();
  translate(-27, 0);
  beginShape();  
  vertex(x+5,y+40);
  vertex(x+s+10, y+54);
  bezierVertex(x+s+15, y+61, x+s+17, y+61, x+s+20, y+54);
  vertex(x+s+20, y+54);
  vertex(x+21, y+40);
  endShape(CLOSE);
  popMatrix();
  
  beginShape(); //arm
  vertex(x-30, y-7);
  vertex(x-42, y+s2+11);
  bezierVertex(x-44, y+s2+14, x-44, y+s2+23, x-42, y +s2+26);
  vertex(x-42, y +s2+26);
  vertex(x-30, y+10); 
  endShape(CLOSE);
  
  beginShape(); //arm 2
  vertex(x+27, y-7);
  vertex(x+39, y+s2+11);
  bezierVertex(x+41, y+s2+14, x+41, y+s2+23, x+39, y +s2+26);
  vertex(x+39, y +s2+26);
  vertex(x+27, y+8); 
  endShape(CLOSE);
  
  shape(body, x, y);
}
}

