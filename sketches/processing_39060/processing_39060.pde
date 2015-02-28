
void setup(){
  size(400,400);
  background(255);
}
void draw(){     
  for(int r=1; r<width; r+=100){
    for(int b=1; b<width; b+=100){
  Reptar(r,b);
  
}
  }
noLoop();
}
   
 
//The inspiration for this function...my Guinea Pig Reptar
void Reptar(float x, float y){
  pushMatrix();
  noStroke();
  translate(x,y);
  smooth();
  //Ears
  fill(0);
  ellipse(35,20,10,20);
  ellipse(65,20,10,20);
  //Face
  fill(165,100,20);
  ellipse(50,50,40,70);
  fill(70,70,60);
  //Left Eye
  ellipse(40,40,10,15);
  strokeWeight(7);
  stroke(0);
  point(40,40);
  strokeWeight(0);
  fill(70,70,60);
  //Right Eye
  ellipse(60,40,10,15);
  strokeWeight(7);
  stroke(0);
  point(60,40);
  //Left Whiskers
  strokeWeight(0);
  line(20,60,40,60);
  line(20,70,42,62);
  line(20,80,44,64);
  //Right Whiskers
  line(55,60,75,60);
  line(55,62,75,70);
  line(55,64,75,80);
  //Nose
  stroke(230,285,75);
  strokeWeight(1);
  line(50,70,40,60);
  line(50,70,60,59);
  noStroke();
  popMatrix();
}

