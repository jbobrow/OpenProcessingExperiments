
int mida=40;


void setup (){
 size(255,255);
 background(0,0,0);
  
}

void draw(){
  //creu
  int diagran = (mouseY+mida)*90/height;
  int diapetit = (mouseY+mida/2)*50/height;
  
  stroke(255,255,255);
  strokeWeight(2);
  background(0);
  line(mouseX-mida,mouseY-mida,mouseX+mida,mouseY+mida);
  line(mouseX-mida,mouseY+mida,mouseX+mida,mouseY-mida);
  
  //boles
 fill(255,mouseX,35);
 ellipse(mouseX,mouseY,diagran,diagran); 
 ellipse(mouseX+mida, mouseY-mida,diapetit,diapetit);
 ellipse(mouseX-mida,mouseY-mida,diapetit,diapetit);
}
