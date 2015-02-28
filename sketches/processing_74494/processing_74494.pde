
void setup (){
  size (400,400);
  background (10, 100, 250);
  smooth ();
}
 
void draw (){
  
    fill(10,100,250,60);
  rect(0,0,width,height);
  
 stroke(200,100,200);
 fill (200,100,200);
  ellipse (mouseX, mouseY, mouseX/2, mouseX/2);

  }
