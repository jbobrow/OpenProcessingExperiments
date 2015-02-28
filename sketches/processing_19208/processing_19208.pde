
float x=0;

void setup (){
  size (250,250);
 smooth();
}



void draw (){
  background (50);
 float weight = dist (mouseX, mouseY, pmouseX, pmouseY);
 fill (70);
 stroke (100);
 strokeWeight (weight);
  ellipse (mouseX, mouseY, x, x);
  strokeWeight (1);
  line(mouseX,mouseY, x, 0);
   line(mouseX,mouseY, 0, x+5);
line(mouseX,mouseY, x+50, 0);
  line(mouseX,mouseY, x+200, 0);
   line(mouseX,mouseY, 250, x);
    line(mouseX,mouseY, x, 250);
     line(mouseX,mouseY, x+60, 250);
}


void mouseDragged(){
  x= x+4;
  if (x>150){
    x=10;
  }
}
  

