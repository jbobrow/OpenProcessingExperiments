
float angulo = 0;


void setup(){

  //frameRate(15);
  size (600,600);

  smooth();
}


void draw(){
  
  float achica = map(second(), 0, 60, width-50, 0);
  float agranda = map(second(), 0, 60, 0, width-50);
  float colormas = map(second(), 0, 60, 0, 255);
  float colormenos= map(second(), 0, 60, 255, 0);
  
  fill(0,15);
  noStroke();
  rectMode(CORNER);
  rect(0,0,600,600);

  noFill();
  rectMode(CENTER);


pushMatrix();
  stroke (colormas,0,colormenos);
  translate(300,300);
  rotate(angulo);
  ellipse(0,0,random(0,agranda),agranda); // probar con achica y agranda
popMatrix();


angulo += 0.02;


}
