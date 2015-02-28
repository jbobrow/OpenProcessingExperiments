
//Alexxandra Basa
//Ex 1_PROJECT

void setup(){
  
  size(200,200);
 smooth();
 frameRate(30);
}


void draw(){
  
  background(250,179,91);
  
  noStroke();
  fill(115,214,252);
  ellipseMode(CENTER);
  ellipse(100,100,150,150);
  
  noStroke();
  fill(255);
  ellipse(110,80,70,70);
  ellipse(60,80,70,70);
  
  noStroke();
  fill(0);
  ellipse(mouseX,mouseY,20,20);
  ellipse(mouseX+60,mouseY,20,20);
  
  noStroke();
  fill(255);
  ellipse(100,150,90,10);
}

void mousePressed(){
  
  noStroke ();
  fill(117,7,178);
  ellipse(100,100,150,150);
  
}

void keyPressed(){
  stroke(0);
  println("I can't decide between purple and blue");
}

