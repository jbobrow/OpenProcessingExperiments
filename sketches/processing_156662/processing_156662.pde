
int xPos, yPos; 
int xPos2, yPos2;
float dia1;
float dia2;
float opacity;
int divisor = 8;

void setup(){
  size(800, 800);
  background(0);
}

void draw(){
    xPos = pmouseX;
    yPos = pmouseY;
  //  xPos2 = (pmouseX + (width/4));
  //  yPos2 = (pmouseY + (height/4));
     for (int xPos = width/divisor; xPos < width; xPos += width/divisor) {
       for (int yPos = height/divisor; yPos < height; yPos+= height/divisor) {
        opacity = (int(map((random(5, 40)), 0, 5, 0, 25)));
         stroke(255, 255, 255,random (20, 45));
        if (mousePressed == true){
          ellipse(xPos, yPos, dia1, dia2);
          noStroke();
          fill (255, 255, 255, opacity/75);
          dia1 = (random (1, 220));
          dia2 = (random (1, 280));
        }
      }
    }
 //   if (mouseX > width/4 && pmouseX > width/4){
 //     ellipse(xPos2, yPos2, dia1, dia2);
 //     noStroke();
 //     fill (255, 255, 255, opacity);
 //  }
}    


