

float a;

void setup(){
  size(500,500,P3D);
  smooth();
  fill(255);
}

void draw(){
  background(0);
  lights();
  translate(250,0,0);
  rotateY(a);
  a+=0.1;
  for(int i = 0;i<250;i+=25){
    translate(0,0,25);
    for(int x = -250;x<250;x+=50){
      for(int y =0;y<500;y+=50){
      rect(x,y,25,25);
     }
    }
  }
}


