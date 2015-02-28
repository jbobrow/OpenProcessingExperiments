
void setup () {
  size (500,500);
  //noLoop ();
}

void draw () {
  background (0);
  
  fill (random (0,255), random(0,255), random(0,255));
  for(int x=0; x< width; x=x+100) {
    
    for (int y=0; y< height; y=y+100){
    
    rect (x,  y, random(1,80),random(1,800));
    
  }
}
}

