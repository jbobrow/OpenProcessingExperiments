
//Greg Conte
//Clock
//4/15/2013

 
 
void setup(){
  size(500,500);
}
 
void draw() {
  println(hour() + " : " +minute() + ": " + second());
  background(0);
  
   
   
  float w= map(second(), 0, 59,0,width);
  fill(255);
  ellipse(250,250,w,w);
  float h= map(minute(), 0, 59,0,width);
  fill(255,0,0,150);
  noStroke();
  ellipse(250,250,h,h);
  float p= map(hour(), 0, 23,0,width);
  fill(0,0,200,100);
  noStroke();
  ellipse(250,250,p,p);
   fill(255);
    text(minute()+":"+second(), 230, 250);

  
   
}



