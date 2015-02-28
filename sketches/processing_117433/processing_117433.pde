

PImage img;
int x;
int y;
color pix;
float pointillize = 1.5;
 
void setup() {
  size(615, 409);
  img = loadImage("ronaldo.jpg");
  imageMode(CENTER);
  noStroke();
}
 
void draw() {
  
  background(0);
  for (y = 0; y < img.height; y+=5.5) {
    for (x = 0; x < img.width; x+=5.5) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(0);
 
 
        
        if (dist(pmouseX, pmouseY, x, y) <= 10) {
          pointillize=3;
          textSize(50);
          fill(255,255,255);
          text("-NO.7 Ronaldo", mouseX/6,150);
          fill(255,255,255);
          textSize(30);
          text("Along with ball, I move.", mouseX/12,50);
          fill(255,255,255);
           textSize(200);
          text("GOAL!!!", mouseX/10,400);
         
         
         
        }
        fill(pix);
        ellipseMode(CENTER);
        ellipse(x, y, pointillize, pointillize);
        
      }

  }
    
  }
}




