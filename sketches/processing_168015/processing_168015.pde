
float r;
float g;
float b;

void setup()
{
size (800,800);
background(#FFFFFF);


fill(#FF0D15);
  rect(0,0,100,100);
  
  
 fill(#FEFF03);
  stroke(#FEFF03);
  rect(100,0,100,100);
  
   fill(#3FF040);
  stroke(#3FF040);
  rect(200,0,100,100);
  
  fill(#FF9008);
  stroke(#FF9008);
  rect(300,0,100,100);
  
    fill(#FFA2F3);
  stroke(#FFA2F3);
  rect(400,0,100,100);
  
   fill(#46CFFF);
  stroke(#46CFFF);
  rect(500,0,100,100);
  
   fill(r,g,b);
  stroke(r,g,b);
  r=random(135);
  g=random(12);
  b=random(237);
  rect(600,0,100,100);
  

}

void draw()
{
  
if(mousePressed){
   line(mouseX,mouseY,pmouseX,pmouseY);
  }
  
  if(mouseX>0 && mouseX<100 && mouseY>0 && mouseY<100)
  {
    stroke(255,0,0);
  }
  
   if(mouseX>100 && mouseX<200 && mouseY>0 && mouseY<100)
  {
    stroke(#FEFF03);
  }
  
   if(mouseX>200 && mouseX<300 && mouseY>0 && mouseY<100)
  {
    stroke(#3FF040);
  }
  
   if(mouseX>300 && mouseX<400 && mouseY>0 && mouseY<100)
  {
    stroke(#FF9008);
  }
  
    
   if(mouseX>400 && mouseX<500 && mouseY>0 && mouseY<100)
  {
    stroke(#FFA2F3);
  }
  
   if(mouseX>500 && mouseX<600 && mouseY>0 && mouseY<100)
  {
    stroke(#46CFFF);   
  }
  
   if(mouseX>600 && mouseX<700 && mouseY>0 && mouseY<100)
  {
    stroke(r,g,b); 
   r=random(135);
  g=random(12);
  b=random(237);  
  }
}
