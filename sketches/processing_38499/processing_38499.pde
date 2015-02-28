
PImage google; 
PFont font; 

void setup() {

  size(600,600);
  fill(255);

  font = createFont("arial", 24); 
  google = loadImage("google.png"); 
}

void draw() {

  tint(random(256),random(256),random(256)); // a new one
  image(google, random(width), random(height));
  
  textFont(font);
  text("do", random(width), random(height));
  text("no?", random(width), random(height));
  text("evil",random(width), random(height));
}

