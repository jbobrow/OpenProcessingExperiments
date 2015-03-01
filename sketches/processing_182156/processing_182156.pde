
float i = 0;
float x,y,z;

void setup() {
  size(700,700,P3D);
  background(10,10,50);
}

void draw() {
  background(10,10,50);
  stroke(200,220,250);
  fill(230,0,100);
  
  //println("wassup world");
  //ellipse((mouseX+i)/2, (mouseX+i)/2, mouseX+i, (mouseX+i));
  rectMode(CENTER);
  rect(350, 350, (mouseX-350)*2, (mouseY-350)*2);
  //println(mouseY, " ", mouseY - 350);
}

void mouseClicked(){
  clear();
}

