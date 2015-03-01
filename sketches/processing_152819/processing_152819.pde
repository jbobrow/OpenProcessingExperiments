
//DISCLAIMER: that code is a dirty baby

float x1 = 0;
float y1 = 0;
float x2 = 5;
float y2 = 0;

float radius;
float angle;
float sc;

float value = 0;

boolean boolChange = false;

void setup(){
  size(400, 400);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  //scale(sc);
  //scale(1.5f);
  strokeWeight(1);
  stroke(255);
  
  rotate(QUARTER_PI+angle);
  line(x1, y1, x2, y2);
  rotate(QUARTER_PI);
  line(x1, y1, x2, y2);
  rotate(QUARTER_PI);
  line(x1, y1, x2, y2);
  rotate(QUARTER_PI);
  line(x1, y1, x2, y2);
  rotate(QUARTER_PI);
  line(x1, y1, x2, y2);
  rotate(QUARTER_PI);
  line(x1, y1, x2, y2);
  rotate(QUARTER_PI);
  line(x1, y1, x2, y2);
  rotate(QUARTER_PI);
  line(x1, y1, x2, y2);
  noFill();
  for(int i =1; i < 30; i++){
  ellipse(0, 0, (radius*radius)/i,(radius*radius)/i);
  }
  ellipse(0, 0, (radius), (1/radius)*20);
  rotate(QUARTER_PI);
  ellipse(0, 0, (radius), (1/radius)*20);
  rotate(QUARTER_PI);
  ellipse(0, 0, (radius), (1/radius)*20);
  rotate(QUARTER_PI);
  ellipse(0, 0, (radius), (1/radius)*20);
  
  if(boolChange){
   change(); 
  }
  
  if(!boolChange){
   if(x2 > 10) x2--;
   if(y1 > 0) y1--; 
   if(angle > 0) angle -=0.01;
  }
  
  value+=0.005;
  change();
}

void mousePressed(){
 boolChange = true;
}

void mouseReleased(){
 boolChange = false; 
}

void change(){
  x2+=sin(value)/10;
 y1+=sin(value)/10;
 angle += sin(value)/10;
 radius += sin(value)/2;
 sc = (sin(value));
 constrain(sc, 0.1, 1);
}
