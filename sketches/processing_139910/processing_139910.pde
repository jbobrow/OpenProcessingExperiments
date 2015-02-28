
void setup(){
  size(400,400);
  background(0);
}

void draw (){
  background(0);
  int i = 0;
  while (i <width ) {
    noStroke();
    float distance = abs (mouseX - i) ;
    fill (distance,100,10) ;
    rect(i,0,30,height);
    
    i+=10;
  }
}



