

String url= "http://pagesperso-orange.fr/parachutisme.tandem/images/jersey_parachutisme_en_face_%5B1280x768%5D.JPG";
PImage m;
int x,y,s; // s sera le rayon du rectangle


void setup(){
  size(400,400);
  x = 20;
  y = 20;
  s = 20;
  m = loadImage(url);
  m.filter(INVERT);
}

void draw(){
  background(255);
  if (mouseX >= x && mouseX <= x+s && 
    mouseY >= y && mouseY <= y+s){

    image(m,40,0,360,400);
    println("bravo");

  }
  else{
    println("tant pis");
  }
  rect(x,y,s,s);
}







