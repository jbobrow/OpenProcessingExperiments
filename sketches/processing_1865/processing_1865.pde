
void setup(){

  size(800,600);
  background(0);

}

void draw(){

  translate(width/2,height/2);
  //palo de la flor
  stroke(65,200,65);
  strokeWeight(15);
  line(0,-150,0,150);
  fill(25,100,75);

  //suelo
  noStroke();
  rectMode(CENTER);
  rect(0,250,800,200);

  //bola amarilla
  stroke(255);
  fill(255,255,55);
  ellipse(0,-100,100,100);


  //petalos
  int i;
  float j;


  translate(0,-100);
  for (i = 0; i < 20; i++){
    pushMatrix();
    stroke(125,0,125,random(50));
    strokeWeight(5);
    fill(225,25,75);
    rotate(TWO_PI/20*i);
    for (j = 0; j <13;j++){
      ellipse(90,0,75/j,25*j);
    }
    popMatrix();
  }

}


