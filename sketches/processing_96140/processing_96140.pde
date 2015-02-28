
//JESSICA XIAO YANG

float s;
float h;
float m;

void setup(){
  size(600,600);
 
}

void draw(){
  println(hour() + " : " +minute() + ": " + second());
  background(255);
  fill(200,200,200,100);
  noStroke();
  //rect(0, height/2, width, height/2);
  float s = map(second(), 0, 59, 0, width);
  float h = map(hour(), 0, 59, 0, width);
  float m = map(minute(), 0, 59, 0, width);
//ellipse(height/2, width/2, h,h);
  ellipse(height/2, width/2, m,m);
  fill(200,200,255,100);
  ellipse(height/2, width/2, s,s);
  
  
  //tryin to tell the time
 stroke(255,255,255);
 //0
  point(height/2, width/2);
  fill(255,255,255,0);
  stroke(255,255,255,200);
 // 15
 ellipse(height/2, width/2, height/4,width/4);
 //height/2 is 30
  ellipse(height/2, width/2, height/2,width/2);
  //45
  ellipse(height/2, width/2, (3*height)/4,(3*width)/4);
}
