
void setup()
{
  size(600,600);
  frameRate(4);
}

void draw()//concrete rain
{
  background(232);
  noStroke();
  fill(135,206,250);
  rect(0,0,width,height/9);
    fill(20);
    rect(0,8*width/9, width, height);
    fill(150);
    triangle(0,8*width/9, 0,height, 2*width/9, height);
  if(mousePressed){
    
    
    
  }
  else{
  
  fill(random(110,160),206,random(230,270));
  rect(0,0,width,height/9);
    
   stroke(135,206,250);
  for (float z=0; z< height; z+=30){
    float rainX1 = random(0, width);
    float rainY2 = random(0, height);
    float rainX2 = random(0, width);
    line(rainX1, rainX2, rainX1, rainY2);
    }
    
    
  }
}
  
