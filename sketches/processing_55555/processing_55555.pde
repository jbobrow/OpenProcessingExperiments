
//Monissa Chakrabartty YSDN 2012
//Source code partially from Andreas Koller

void setup(){
  size(700,400);
  background(0, 0, 0);
  frameRate(15);
  smooth();
}
 
void draw(){
  noStroke();
  fill(40, 40, 40, 0.9);
  rect(0, 0, 700, 400);

  //Cirlces
  float durchmesser = random(100);
  fill(mouseY,mouseX,100, 50);
  stroke(mouseY,mouseX,100);
  strokeWeight(random(0.5,2));
  ellipse(mouseX, mouseY, durchmesser, durchmesser);
  
  //Lines
  if(mousePressed){
    stroke (random(200,255), random(20, 100));
    line (random(0,700),0, random(0,700),400);
    stroke (random(30,50), random(20, 100));
    line (0,random(0,400), 700,random(0,400));
  
  }
}

void keyPressed(){
  background (0);
}





