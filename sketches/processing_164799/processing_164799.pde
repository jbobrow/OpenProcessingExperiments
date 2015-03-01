
//THIS CODE USES THE MOUSE WHEEL, AND NEEDS TO BE PASTED INTO PROCESSING TO SEE ITS FULL FUNCTIONALITY

int csize;
void setup()
{
  size(500, 500);
  background(0,0,0);
  csize=15;
}

void draw()
{ 

  
  if (mousePressed) {
    fill(random(255), random(255), random(255));
    noStroke();
    ellipse(mouseX, mouseY, csize, csize);
    
   if(mousePressed){
  noStroke();
  fill(mouseY,random(255),random(255));
  rect(mouseX+random(-25,25),mouseY+random(-25,25), random(5,10),random(5,10));}
}
if(!mousePressed){
  filter(BLUR, 1);
}
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e==-1){
    csize+=4;
    
  }
  if(e==1){
    csize-=4;
     
  }
}
