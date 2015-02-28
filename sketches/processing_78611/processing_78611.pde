
PShape star;

void setup() { 
  size(470,442);
  smooth();
  star = loadShape("islamicstarBIG.svg");
  star.disableStyle();
  star.scale(0.2);  
}

void draw() {
  background(0);
  fill(100);
  stroke(150);
  strokeWeight(6);
  drawStar(star);
}

void drawStar (PShape star) {
  translate(62,0);
  for (int i = 0; i < 6 ; i++){
    translate(133, 10);
    rotate(radians(60));
    shape(star, 0, 0); 
    }
  translate(116,0);
  for (int i = 0; i < 6 ; i++){
    translate(133, 10);
    rotate(radians(60));
    shape(star, 0, 0); 
    }
  translate(116,0);
  for (int i = 0; i < 6 ; i++){
    translate(133, 10);
    rotate(radians(60));
    shape(star, 0, 0); 
    }
  translate(0,200);
  for (int i = 0; i < 6 ; i++){
    translate(133, 10);
    rotate(radians(60));
    shape(star, 0, 0); 
    }
  translate(-116,0);
  for (int i = 0; i < 6 ; i++){
    translate(133, 10);
    rotate(radians(60));
    shape(star, 0, 0); 
    }
  translate(-116,0);
  for (int i = 0; i < 6 ; i++){
    translate(133, 10);
    rotate(radians(60));
    shape(star, 0, 0); 
    }
}



