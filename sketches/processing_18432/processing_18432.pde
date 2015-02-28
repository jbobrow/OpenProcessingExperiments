
PImage img; 

void setup() {
  
  smooth();
  
  colorMode (RGB, 600);
  
  size(400,600);

  img = loadImage("http://i3.photobucket.com/albums/y53/Getitrightschmoo/Brianfinal.png");
}

void draw() {
     
  background(abs (mouseY-600), 0, mouseY);
  
  imageMode (CENTER);
  
  image(img, width/2, mouseY+150);
  
  noStroke ();
  
  fill(abs (mouseY-300), 0, mouseY);
  
  rect (0, height/2, width, height/2);
  
    //thermostat
  
  fill (600);
  
  rectMode(CORNER);
    rect (25, 25, 10, 135);
    
    ellipse (30, 170, 30, 30);
    
    fill(350, 0, 0);
    
    ellipse (30, 170, 15, 15);
    
    stroke(350, 0, 0);
    
    strokeWeight(3);
    
    
    line (29.5, 170, 29.5, (mouseY*.233) + 30);
 
  
}                               
