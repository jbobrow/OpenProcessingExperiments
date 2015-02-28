
//je donne une taille à mon sketch et un fond noir
void setup (){
  size(200,200);
  background(0);
  smooth();
}

void draw (){
  frameRate(15);
  ellipse(mouseX,mouseY,20,20);
  strokeWeight(5);
  line(0,0,200,200);
  ellipse(100,100,50,50);
  }



