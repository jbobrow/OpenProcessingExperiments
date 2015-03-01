
void setup()
{
  size(600,600);
  background(90,150,200);
  frameRate(6);
}

void draw()
{
  background(90,150,200);
  fill(204,240,240,120);
  stroke(204,240,240,60);
  ellipse(30,45,70,50);
  ellipse(120,60,150,50);
  ellipse(300,60,150,60); 
  ellipse(450,60,150, 50);
  
  for(float x=0; x<width; x+=3){
    float cloudY = random(0,45);
    float cloudW = random(80,150);
    float cloudH = random(30,90);
    ellipse(x,cloudY,cloudW,cloudH);
  }
    
    for(float y=0; y<height; y+=3) {
      float rainX = random(0,width);
      float rainAg = random(0,12);
      float rainLth = random(0,height);
      line(rainX,y,rainX+rainAg,rainLth);
    }
      
        for(float Y=0; Y<height; Y+=8) {
      float rainX1 = random(0,width);
      float rainSt = random(0,height);
      rect(rainX1, Y, 1, rainSt);
    }
    
  if(mousePressed){
  stroke(120,90,40);
  strokeWeight(3);
  line(mouseX,mouseY-3,mouseX+60,mouseY-3);
  
  fill(90,150,200);
  noStroke();
  rect(mouseX,mouseY,60,height);
}else{
  stroke(120,90,40);
  strokeWeight(1);
  fill(120,90,40);
  rect(mouseX,mouseY,60,6);
}
}

