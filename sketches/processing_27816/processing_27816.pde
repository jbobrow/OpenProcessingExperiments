
int dia =10;
void setup(){
size (500,500);
background(0);
smooth();
}
void draw(){
  background(0);
  noStroke();
  fill(246,255,129);
  ellipse(mouseX,mouseY,dia,dia);
  if(mousePressed == true){
    if(mouseButton == RIGHT){
      dia= dia+1;
      
      
    }
    else if (mouseButton == LEFT)
    {
      dia = dia - 1;
     
     
      }
  }
}

