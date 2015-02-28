
void setup (){
//tamaño de fondo
  size (300, 400);
}
void draw (){
  println(mouseX+ "," +mouseY);
  noStroke();

// CAP
  background(255,255,255);
  fill(255,210,160);
  ellipse(150, 180, 200, 260);
  
  //Boca
  fill(#FFFFFF);
  arc(150, 230, 100, 50, 0, PI, OPEN);
  //Ulls
stroke(#000000);
  ellipse(110,132,35,30);
  ellipse(192,133,35,30);
  fill(#ffffff);
  ellipse(110,132,35,30);
  ellipse(192,133,35,30);
  fill(#000000);
  ellipse(110,132,23,18);
  ellipse(192,133,23,18);
  
  // Nas
  fill(255,160,122);
  ellipseMode(CENTER);
  ellipse(150,180,15,15);

//bigoti
fill(#000000);
rect(135,202,30,20);


}


