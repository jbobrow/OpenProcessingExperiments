
int a;
int index;
float[] posx=new float[20];
float[] posy=new float[20];

void setup()
{
  a=0;
  index=0;
  size(400, 400);
  background(255);
  fill (255, 0, 255);
  strokeWeight(5);
  ellipseMode(CENTER);
}



void draw()
{
  background(255);
  for (a=0;a!=index;a=a+1) {
    ellipse(posx[a], posy[a], 25, 25);
  }
  ellipse(mouseX, mouseY, 25, 25);
}


void mousePressed() {
  if(mouseButton==RIGHT){
    for(a=0;a!=index;a=a+1){
      if(mouseX<(posx[a]+13)&& mouseX>(posx[a]-13) && mouseY<(posy[a]+13)&&mouseY;>(posy[a]-13)){
       /*stroke(255);
        fill(255);
        ellipse(mouseX,mouseY,25,25);*/
        posx[a]=0;
        posy[a]=0;
      }
    }
  }
  if (mouseButton==LEFT) {
    posx[index]=mouseX;
    posy[index]=mouseY;
    index=index+1;
  }
}


