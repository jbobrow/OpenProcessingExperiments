
int redcentrewidth = 110;
int redcentreheight = 60;
void setup () {
size(400, 300); 

color opposite = color(23, 126, 36); 
color walkway = color(56, 62, 56); 
color redcentre = color(216, 9, 16); 
color oval = color(23, 126, 36); 
color walk = color(56, 62, 56);  
 
fill(redcentre); 
rect(160, 160, 110, 60); 
fill(walkway); 
rect(0, 100, 400, 60); 
fill(opposite); 
rect(160, 40, 90, 60); 
fill(oval); 
ellipse(65, 230, 90, 90);
fill(walk); 
rect(110, 160, 50, 140);

}

void draw() {
  fill(204, 34, 46);
  for (int y= 5; y<height; y += 30){  
    for (int x= 5; x<width; x += 30){  
      
      rect(160, 160, redcentrewidth, redcentreheight);
      
      if (mousePressed) {
        float redcentre = random(0, 100);
        stroke(0);
        fill(0);
        rect(160, 160, redcentrewidth, redcentreheight);
      }
      fill(204, 34, 46);
    }
  }
  }

