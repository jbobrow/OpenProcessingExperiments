
int numTri = 25;
int numCir = 30;
int val;
float xCir = 0.0;
float yCir = 0.0;

//creamos array de posiciones
PVector[] posiciones = new PVector[numTri];

//variable para el tamaño ir
float med = random(2,15);

void setup() {
  size(900,900);
  frameRate(50);
  background(random(255),random(255),random(255),20);
  smooth();
  
  //inicializamos PVectors:
  for (int i = 0; i<numTri; i++){
  posiciones[i] = new PVector(width/2,height/2);
  }
}   

void draw(){

  //variable para random de tamaño tri
  float X = random(-width/4,width/4);
  float Y = random(-height/4,height/4);
  float Z = random(50,150);
  
  //dibujo
  translate(450,450);
  rotate(random(HALF_PI/2,(PI/4)*3));
  stroke(noise(0,255),noise(0,255),noise(0,255),90);
  strokeWeight(random(2,5));
  fill(random(255),random(255),random(255),70);
  triangle(0,0,X,Y,X,Y-Z);
  
  if (mousePressed == true) {
   noStroke();
   fill(noise(0,255),noise(0,255),noise(0,255),20);
   rect(0,0,1000,1000);
   rect(-1000,-1000,1000,1000);
  }
  
  if ((keyPressed == true) && (keyPressed != (key == 'o' || key == 'O'))) {
   background(random(255),random(255),random(255),20);
  }
  
  if ((keyPressed == true) && (keyPressed == (key == 'o' || key == 'O'))) {
        ellipse(xCir, yCir, 10, 10);
        xCir = map(noise(frameCount/100.0, mouseY), 0, 1,-width, width);
        yCir = map(noise(frameCount/100.0, mouseX), 0, 1,-height,height);
  } 
  
}

