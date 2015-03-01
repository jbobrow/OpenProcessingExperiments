
void setup (){
  size (600,600);
}
void draw (){
  background (900);
  for (int x=0; x<width; x+=20){
    for (int y =0; y<width; y+=20){
      float d= dist (mouseX, mouseY, x, y);
      d=d/8;
      noStroke ();
      rect (x,y,d,d);
      
    }
  }
}
