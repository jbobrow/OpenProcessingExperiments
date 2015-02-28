
float deg = 0;
float degDelta = 0;
float degDeltaMax = 20;

void setup(){
  size(250, 250);
smooth();
background(255);

}



void draw(){
noStroke();
fill(#FFB01F);
ellipse(125,125,170,170);

 pushMatrix();
 fill(#F75D74);

  translate(width/2, height/2);
  rotate(radians(deg));
  rectMode(CENTER);
  arc(-10, 0, 150, 150, -PI, 0);
  scale(-1, -1);
  arc(-10, 0, 150, 150, -PI, 0);
  popMatrix();
 
  if(mousePressed){
    if(degDelta<degDeltaMax){
      degDelta += 0.08;
    }
    else if(degDelta>degDeltaMax){
      degDelta=degDeltaMax;
    }
  } 
  else{
    if(degDelta>0){
      degDelta -= 0.08;
    }
    else if (degDelta<0){
      degDelta=0;
    }
  }
 
  deg += degDelta;
  println(degDelta);

 



noStroke();
fill(255);
ellipse(125,125,70.66,70.66);

stroke(255);
strokeWeight(0.125);
noFill();
ellipse(125,125,76.8,76.8);

stroke(255);
strokeWeight(0.15);
noFill();
ellipse(125,125,83,83);

stroke(255);
strokeWeight(0.175);
noFill();
ellipse(125,125,89.3,89.3);

stroke(255);
strokeWeight(0.2);
noFill();
ellipse(125,125,95.5,95.5);

stroke(255);
strokeWeight(0.225);
noFill();
ellipse(125,125,101.7,101.7);

stroke(255);
strokeWeight(0.25);
noFill();
ellipse(125,125,107.5,107.5);

stroke(255);
strokeWeight(0.275);
noFill();
ellipse(125,125,114.125,114.125);

stroke(255);
strokeWeight(0.3);
noFill();
ellipse(125,125,120.3,120.3);

stroke(255);
strokeWeight(0.325);
noFill();
ellipse(125,125,126.5,126.5);

stroke(255);
strokeWeight(0.35);
noFill();
ellipse(125,125,132.75,132.75);

stroke(255);
strokeWeight(0.375);
noFill();
ellipse(125,125,138.9,138.9);

stroke(255);
strokeWeight(0.4);
noFill();
ellipse(125,125,145.16,145.16);

stroke(255);
strokeWeight(0.425);
noFill();
ellipse(125,125,151.4,151.4);

stroke(255);
strokeWeight(0.45);
noFill();
ellipse(125,125,157.58,157.58);

stroke(255);
strokeWeight(0.475);
noFill();
ellipse(125,125,163.8,163.8);





}
