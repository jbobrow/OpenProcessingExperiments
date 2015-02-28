
void setup(){
  size(640,480);
  smooth();
}

void draw(){
  background(15,75,50);
  strokeWeight(3);
  stroke(10,25,75);
  fill(200,150,25);
  ellipse(100, 100, 150, 50);
  arc(300, 240, 500, 300, PI/2, PI);
  triangle(200, 350, 400, 400, 350, 75);
  strokeWeight(5);
  stroke(150,100,100);
  fill(100,150,25);
  arc(200, 250, 500, 350, TWO_PI-PI/2, TWO_PI);
  ellipse(400, 175, 300, 55);
  strokeWeight(3);
  stroke(10,25,75);
  fill(200,150,25);
  ellipse(400, 175, 275, 25);
  

 
 
  println("x: "+ mouseX + " y: "+ mouseY);

  
  
}



