
void setup()
{
  size(2000,1500);
  background(0);
}

void draw()
{

  if(mousePressed) {
   noFill();
   ellipse(width/2,height/2,5,5);
   fill(255);
    float colorR = random(0,180);
    float colorG = random(200,220);
    float colorB = random(0,10);
    stroke(colorR, colorG, colorB);


  float size = random(1,9);
  float d1= random(0,600);
  float d2= random(0,600);
  float d3= random(0,600);
  ellipse(mouseX,mouseY,size,size);
  ellipse(mouseX+d1,mouseY+d2,size,size);
  ellipse(mouseX-d2,mouseY-d1,size,size);
  ellipse(mouseX-d2,mouseY+d3,size,size);
  ellipse(mouseX+d3,mouseY-d1,size,size);

}  
else{
  stroke(0);
  rect(0,0,width,height);
  fill(0);
  
  
  
}

  }


