

void setup () {
size (500,400);
background (0);
colorMode(RGB,255);
//noStroke ();
smooth ();
}

void draw () {
  
  stroke (0,random (255),0, 12);
  fill (0,random (255),0,8);
}

void mouseMoved (){ //isso aqui faz com que a ellipse seja
  for(int i = 0; i < 500; i +=2){ 
  ellipse (mouseX, mouseY,30,30);
  }
  

}
