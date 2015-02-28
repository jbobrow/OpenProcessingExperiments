
float R = 0;

void setup() {
  size(250, 250);
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(60);
  background(0);
}

void draw() {
  fill(0,25);
  strokeWeight(0);
  rect(width/2, height/2,width,height);
  R+=.001;

  translate(width/2, height/2);
  rotate(R*10);
  
  translate(20,20);
  rotate(R);
  
stroke(255,200,random(250)); //sun
strokeWeight(20+R*10);
point(0,0);

  translate(0,0);
  rotate(R);
  
    translate(0,0);
  rotate(R*-.1);
  
   translate(50,0);
  rotate(R*-.1);

stroke(255,200,0,95); //mercury
strokeWeight(10);
point(0,0);

translate(50,0);
  rotate(R*-10);
  
stroke(random(255),100,100); //comet
strokeWeight(2);
point(-50,-50);
  
translate(50,0);
  rotate(R*-100);
  
stroke(255,random(100),0,95); //mars
strokeWeight(8);
point(0,0);

stroke(100,255,255,95); //mars' moon
strokeWeight(2);
point(10,10);
}

void keyPressed(){
  if (key=='s'){
    saveFrame("Solarsys.png");
  }
}


