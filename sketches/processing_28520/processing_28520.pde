
float a;
float b;
float c;
float e;
float opacity;
void setup(){
  size(500,500);
  background(#FAE18D);
  smooth();
  noCursor();
  strokeWeight(0.25);
}


void draw(){


if(mousePressed){
  stroke(#FAE18D);
 a=random (-500,1000);
line (-750,a,250,mouseY);
stroke(#FAE18D);
line (1250,a,250,mouseY);  
 stroke(#FAE18D);
   a=random (0,500);
  b=random (240,260);
line (0,b,250,a);
stroke(#FAE18D);
line (500,b,250,a);
} else{
  stroke(0);
stroke(0);
 
  a=random (0,500);
  b=random (240,260);
line (0,b,250,a);
stroke(50);
line (500,b,250,a);

  a=random (-500,1000);
  c=random (0,500);
line (-750,a,250,mouseY);
stroke(35);
line (1250,a,250,mouseY);
}
}
void keyPressed(){
  if(key == CODED);
  if(keyCode == ENTER);
  background(#FAE18D);
}

