
void setup(){
  size(200,200);
    background(140,0,200);
   smooth();
}
void draw(){
  stroke(20,120,40);
  fill(20, 180, 40);
  rectMode(CENTER);
  //cabeza
  ellipse(100, 100, 50, 50);
  //patitas
  ellipse(120,120,20,10);
  ellipse(80,120,20,10);
  //ojos
  stroke(0);
  fill(0,0,0);
  ellipse(90,102,10,10);
  ellipse(109,102,10,10);
  //brillo en ojos
  fill(255,255,255);
  ellipse(87,102,5,5);
  ellipse(106,102,5,5);
  //chapetes
  noStroke();
   fill(250,0,0);
  ellipse(85,107,8,5);
  ellipse(115,107,8,5);
  //boca
  stroke(0);
  line(97,110,103,110);

}
  void mousePressed(){
  noStroke();
  fill(260, mouseY, mouseX);
  
  ellipse(mouseX, mouseY, 16, 16);
}
void keyPressed(){
  background(140,0,200);
}

