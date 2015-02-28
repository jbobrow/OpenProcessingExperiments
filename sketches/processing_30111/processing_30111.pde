
PFont texto;

void setup(){
  size (500, 500);
  background(#C5E5C8);
  texto = loadFont ("JawbreakerBRK-48.vlw");
  frameRate(1);
}

void draw(){
 noFill();
  
  stroke(random(255),random(255),random(255),50);stroke(random(255),random(255),random(255),50);
  quad(random(width), random(height), random(width), random(height),random(width), random(height),random(width), random(height));
  stroke(random(255),random(255),random(255),50);stroke(random(255),random(255),random(255),50);
  ellipse(random(width), random(height), random(width/2, width), random(height/2, height));
   stroke(random(255),random(255),random(255),50);stroke(random(255),random(255),random(255),50);
  triangle(random(width), random(height), random(width), random(height),random(width), random(height));
  fill(#5DA582);
  textAlign(CENTER);
  textFont(texto, 40);
  text("Oficina", width/2,100);
  text("Processing", width/2,150);
  //textAlign(RIGHT);
  textFont(texto, 20);
  text("Julho 2011", width/2,200);
  textAlign(LEFT);
  textFont(texto, 15);
  text("7 e 8 de julho", width/2,280);
  text("no Sesc Catanduva", width/2,310);
  textAlign(RIGHT);
  text("11 a 15 de julho", width/2,350);
   text("no Sesc Carmo", width/2,390);
    textAlign(CENTER);
  text("http://oficinaprocessing.blogspot.com", width/2,450);
  if (keyPressed){
    background(#C5E5C8);
  }
}
 

