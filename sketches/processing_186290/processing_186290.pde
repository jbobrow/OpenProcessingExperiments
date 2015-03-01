
void setup() {   
  size(300, 200);
  background(255);   
}

void draw() {   
  //noStroke();
 // fill(0);

 }
void mousePressed(){
 float r=random(255)
    fill(mouseX,r,50);
     ellipse(50,50, 20, 20)
     ellipse(50,50, 10, 10)
}

