
int x;


void setup()
{
 background(100,200,198,20);
 colorMode(HSB);
 size(600,600);
 
}
 
 
void draw(){
  
  pushMatrix();
  //translate(150,300);
   //strokeWeight(.05);
   noStroke();
   fill(130,mouseX,100,20);
   quad(mouseX,mouseY,mouseX,mouseY,mouseY,mouseY,60,60);
   rect(mouseX,mouseY,mouseX,0);
   fill(40,180,198,20);
   ellipse(mouseX,mouseY,60,60);
   fill(136,187,78,20);
   rect(mouseX,mouseY,mouseX,mouseY,600,600);
  popMatrix();
}

