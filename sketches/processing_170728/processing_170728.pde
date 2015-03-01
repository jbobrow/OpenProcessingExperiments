
void setup() {
  size(200, 200); //size 200 by 200
}

void draw () {

  if (mousePressed) {
    rectMode(CENTER);
    rect (mouseX, mouseY, 700, 700);//if mouse pressed it will make random forgrounds 
    fill (random(1, 255), random(1, 255), random(1, 255)); //changes to random colors
  } else if (keyPressed) {
    float shapes = random (0, 100);
    ellipse (random (0, 200), random (0, 200), shapes, shapes);
    fill (random(0, 255), random(0, 255), random(0, 255)); //everytime you click circles appear with random sizes, co-ordinates and colors
  } else {
    rect (-40,-40,700,700); 
   
  }
}
for (int x = 50; x<100; x = x+10) {
  rect(mouseX,mouseY,x, x);
movement();
}
void movement (){
  
}

