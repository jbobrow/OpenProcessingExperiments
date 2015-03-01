
//Assignment 5b: Make a drawing tool.
float sizeCounter = 10;
float randcolor;
float r;
float g;
float b;

void setup(){
 
 size(800,800); 
  background(255);

}

void draw()
{
  textSize(32);
text("Press L", 30, 30); 
text("Press S", 30, 70); 
text("Press C", 30, 110); 
text("To Erase Press E", width-400, 30);
text("+ and - to change sizes", width-400, 70);
text("Press P for random color", width-400, 110);
 erase();
 
 keyPressed();
 plusMinus();
if(key=='p')
  {
   r = random(255);
  g = random(255);
 b = random(255);
  }
 
 pushMatrix();
 stroke(0);
 fill(150);
 rect(0,0,25,height);
 popMatrix();
 line(0,0,25,25);
 rect(0,45,25,25);
 ellipse(13,100,25,25);
 
}

void erase()
{
 if ((keyPressed==true) && (key=='e'))
 {
   background(255);
 }
}
void plusMinus()
{
  if((keyPressed==true) && (key=='+'))
  {
    sizeCounter+=1;
  }
  else if((keyPressed==true) && (key=='-'))
  {
    sizeCounter-=1;
  }
}
void keyPressed()
{
 
  pushMatrix();
  fill(r,g,b);
  stroke(r,g,b);
  

  if(mousePressed){
  if((key=='l'))
      {
   line(mouseX,mouseY,pmouseX,pmouseY); 
  }
  if((key=='s'))
  {
    rect(mouseX,mouseY,sizeCounter,sizeCounter); 
  }
  if((key=='c'))
  {
    ellipse(mouseX,mouseY,sizeCounter,sizeCounter); 
  }
  }
 popMatrix();
}

  
  



