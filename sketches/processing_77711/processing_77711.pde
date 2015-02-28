
float angle = 0.0;

void setup() {
  size (600, 600);
  background (255);

  
}


void draw() {

float x = random (0,600);
float y = random (0,600);
float rotar = random (0.0, 3.14);
float movT= random (10, 200);
float movE= random (40, 300);
float movC= random (0, 600);
float diam = 3;


//morado
  noStroke();
  fill(223, 18, 255, 60);
  pushMatrix();
  translate(x + movE, y + movE);
  ellipse(60, 60, diam+2, diam+2);
  popMatrix(); 
 
 
 //verde 
  noStroke();
  fill(10, 255, 132, 60);
  pushMatrix();
  translate (x+ movE, y + movE);
  ellipse(0, 0, diam, diam);
  popMatrix(); 
 
 //rojo 
  noStroke();
  fill(255, 0, 0, 40);
  pushMatrix();
  translate(x + movT, y + movT);
  rotate(rotar);
  beginShape(TRIANGLES);
  vertex (105, 200);
  vertex (115, 195);
  vertex (107, 205);
  endShape(CLOSE);
  popMatrix();
  
  //amarillo
  noStroke();
  fill(253, 222, 18, 60);
  pushMatrix();
  translate(x + movC, y+ movC);
  rotate(rotar);
  beginShape();
  vertex(30, 20);
  vertex(35, 20);
  vertex(35, 25);
  vertex(30, 25);
  endShape(CLOSE);
  popMatrix();
    
  
  
}




void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}
