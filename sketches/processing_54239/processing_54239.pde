
void setup(){
  size(600,500);
  smooth();

}

void draw(){
  
 background(37,122,160); 
  
horst(200,0,20);
horst(100,0,20);
horst(0,0,40);
horst(280,43,frameCount);
  
}

void horst(int x, int y, float winkel){
 
 pushMatrix();
  
  translate(x,y);
  rotate(radians(winkel));
  
  
   
  fill(255);
   noStroke();
  ellipse(250,100,80,80);
  ellipse(250,200,140,140);
  
  fill(0);
  
  rect(225,10,50,50);
  ellipse(250,60,150,30);
  ellipse(250,10,50,20);
  stroke(0);
  strokeWeight(10);
  point(230,90);
  point(260,90);
  point(250,180);
  point(250,200);
  point(250,220);
  
  stroke(255,195,41);
  strokeWeight(2);
  line(240,110,250,130);
  line(250,130,260,110);
  line(260,110, 240,110);
  
  stroke(54,44,20);
  strokeWeight(7);
  line(300,200,380,100);
  strokeWeight(3);
  line(380,100,370,50);
  line(380,100,380,50);
  line(380,100,390,50);  
  
  popMatrix();
}

