
void setup() {
 size(450, 300);

PImage img;
  img = loadImage("finished-manatees-colored.png");
  image(img, 0, 0);

}

 
void draw() {

  
  fill(255);
  rect(mouseX,mouseY,50,50);
  
  if(mousePressed == true){
  fill(255,0,0);
  rect(mouseX,mouseY,50,50);
  }


}


