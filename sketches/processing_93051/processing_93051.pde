
void setup (){
size (500,400);
background (255);
smooth ();
frameRate (12);


}
void draw() {
}  
void mouseMoved () {
  float mx=mouseX;
  float my=mouseY;
  int dim=30;
  triangle (      mx+random(-dim,dim),my+random(-dim,dim),
  mx+random(-dim,dim),my+random(-dim,dim),
  mx+random(-dim,dim),my+random(-dim,dim));
  
}

