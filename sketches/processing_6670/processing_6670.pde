
boolean firststart = false;
PImage a,b;
int w=300;
int h = 300;


void setup(){

  size(w,h,P3D); //P3D
  noSmooth();
  hint(DISABLE_OPENGL_2X_SMOOTH);
  a= new PImage(w,h);
  b = new PImage(w,h);
  loadPixels();

}
void draw(){
//updatePixels();

  if (firststart){
    arraycopy(pixels,a.pixels);
    firststart = false;
  }
  else
  {
    arraycopy(pixels,a.pixels);
    arraycopy(a.pixels,b.pixels);
    b.filter(INVERT);
    image(b,mouseX,mouseY);  
  }




}


void keyPressed(){
save("P3dalias.png"); 
}

void mousePressed(){
  background(255); 
}



