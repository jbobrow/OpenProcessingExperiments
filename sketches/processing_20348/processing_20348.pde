
void setup() {
  size(700, 300);
  background(245); // white
  smooth();

}



void draw() {
    // variable
float value = random(1, 1.5);
println(value);
float rectSize = random(0, 2);
println(rectSize);
float linex = random(30);
float liney = random(30);

 stroke(50);
 fill(50);
 rect(mouseX, mouseY, rectSize, rectSize);
 rect((value*mouseX), (value*mouseY), rectSize, rectSize);
 stroke(50);
 strokeWeight(random(.2));
 //long lines
line((mouseX+linex), (mouseY+liney), (10*liney), (10*linex));
// short lines
//line((mouseX+linex), (mouseY+liney), (mouseX+(1.5*liney)), (mouseY+(1.5*linex)));
  
}


void mouseClicked() {
 save("offf.jpg");

}



