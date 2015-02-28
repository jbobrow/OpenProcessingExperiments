
class rec{
  void draw(){
    pushMatrix();
    stroke(random(30,70),random(50,90),random(10,200));
    strokeWeight(10);
    line(mouseX+random(1,2),mouseY+random(1,2),mouseX+random(19,21),mouseY+random(39,41));
   line(mouseX+random(1,2),mouseY+random(1,2),mouseX-20,mouseY+40);
   line(mouseX-random(9,11),mouseY+random(19,21),mouseX+10,mouseY+20);
popMatrix();  
}
}
class plus{
  void draw(){
    pushMatrix();
    noStroke();
    fill(random(10,230),random(30,90),random(10,200));
   rect(mouseX+random(49,51),mouseY+random(1,2),10,50);
   rect(mouseX+random(29,31),mouseY+random(19,21),50,10);
   popMatrix();
  }
}
class T{
  void draw(){
    pushMatrix();
    noStroke();
    fill(random(10,230),random(30,90),random(10,200));
   rect(mouseX+random(99,101),mouseY,10,50);
   rect(mouseX+random(79,81),mouseY,50,10);
   popMatrix();
  }
}
  
  rec myrect1;
  plus rect1;
  T te1;
  
void setup() {
  myrect1=new rec();
  rect1=new plus();
  te1=new T();
  size(400, 400);
  smooth();
  strokeWeight(3);
  frameRate(20);
 
}

void draw() {
  background(random(0,10),random(10,20),random(0,30));

myrect1.draw();
rect1.draw();
te1.draw();
}
