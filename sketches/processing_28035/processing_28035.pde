
float a;
float b;
void setup(){
  size(500,500);
  background(#FAE18D);
  smooth();
  noCursor();
  strokeWeight(0.1);
}


void draw(){
stroke(0);

  a=random (0,500);
  b=random (240,260);
line (0,b,250,a);
stroke(50);
line (500,b,250,a);

if(mousePressed){
  stroke(#FAE18D);
   a=random (0,500);
  b=random (240,260);
line (0,b,250,a);
stroke(#FAE18D);
line (500,b,250,a);
}  


}

           
                
