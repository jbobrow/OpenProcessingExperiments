
void setup(){
  size (200,200);
  frameRate(15);
  smooth();
}

void draw(){
  background(150);
  rectMode(CENTER);
  rect(100,100,20,100);
  ellipse(100,70,60,60);
  ellipse(81,70,16,32); 
  ellipse(119,70,16,32); 
  triangle(50,50,100,20,150,50);
  line(90,150,random(70,90),180);
  line(110,150,random(110,130),180);
  //haende
  line(110,118,140,100);
  line(90,118,60,100);
  
  println("koordinaten (x/y): " + mouseX + "/"+ mouseY);
}
