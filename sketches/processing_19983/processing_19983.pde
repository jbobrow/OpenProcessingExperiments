
PImage bg;

void setup() 
{
  size(700,500);
  bg = loadImage("zzz.jpg");
  
}

void draw() 
{
  background(bg);
  if (mousePressed){
    for(int i=0;i<270;i+=1){
  noFill();
  stroke(0);
  strokeWeight(1.5);
  bezier(260, 320, random(i), random(i), random(i), random(i), 260, 320);
  }
  }
}


