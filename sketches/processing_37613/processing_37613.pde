
void setup() {
  size(640, 640);
  background(127);
  smooth();
}

void draw(){

  strokeWeight(abs(mouseY-pmouseY));
  int a = abs(mouseX-pmouseX);
  stroke(random(25)*a,50,random(255));
  
  line(mouseX+random(30), mouseY+random(30), -2*pmouseX+(920)+random(30), -2*pmouseY+(920)+random(30));
  println(a);

  strokeWeight(abs(mouseY-pmouseY));
  //int a = abs(mouseX-pmouseX);
  stroke(25 *random(10));
  line(mouseX+random(30), mouseY+random(30), -2*pmouseX+(920)+random(30), -2*pmouseY+(920)+random(30));
  
  stroke(random(255),0,random(255));
  line(mouseX+random(30), mouseY+random(30), -2*pmouseX+(920)+random(30), -2*pmouseY+(920)+random(30));

}

