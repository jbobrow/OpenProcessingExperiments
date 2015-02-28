




void setup(){
  size(500,500);
  background(80,40,220);

}

void draw(){

  float cr = random(50);

  fill(0,205,5);
  rectMode(CENTER);
  translate(width/2,height/2);
  rect(0,250,500,150);

  //gambo
  stroke(0,255,0);
  strokeWeight(15);
  smooth();
  line(0,175,0,0);

  //centro flor
  stroke(255);
  strokeWeight(6);
  fill (255,155,5);
  ellipse(0,0,50,50);

  //petalos
  fill(190,20,25);
  stroke(255,150,80);
  strokeWeight(3);
  ellipse(0,65,20,80);
  pushMatrix();

  for(int i=0; i<20; i++)
  {
    //rotazione
    rotate(TWO_PI/20);
    ellipse(0,65,20,80);


  }
  popMatrix();
  //oja
  stroke(0,255,0);
  strokeWeight(2);
  fill(0,225,0);
  translate(15,130);
  rotate(TWO_PI/7);
  ellipse(4,-4,20,50);

}


