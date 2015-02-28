
int x=0;
int y=0;
int y2=500;
int y3=0;
int change=1;
int move=1;



void setup () 
{
  size(500, 500);
  colorMode(HSB);
}
 
void draw ()
{

   whitesun();

  if (mouseY>height/2) {
    fill(mouseX,mouseY,100);
    ellipse(mouseX, mouseY, 100, 100);
    
  }
  else{
    background(mouseY);
    rectMode(CENTER);
    fill(mouseX,mouseY,200);
    noStroke();
    rect(mouseX,mouseY,100,100);
  }
}
  void whitesun()
{
     
  stroke(0);
   ellipse(250,y2,y3,y3);
   y2=y2-change;
   y3=y3+change;
   if(y3>400)
   {
     change=-1;
   }
   if(y3<0)
   {
     change=1;
   }
}




