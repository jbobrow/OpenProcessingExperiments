
float  x = 50;
float y = 50;
float n1 = 0.0;
  
void setup(){
 size(600,600);
 background(255);
 rectMode(CENTER);
 frameRate(10);
}
  
void draw(){
  int seconds = millis()/300;
  x = random(100,500);
  y = random(100,500);
  rotate(seconds+radians(30));
  strokeWeight(random(0,0.5));
  float n = noise(n1) * random(0,255);
  fill(random(0,255),n,random(0,50));
  rect(x,y,random(50),random(50));
  println(frameCount); 
  
  if(frameCount%100==0){
    background(255);
  }
}



