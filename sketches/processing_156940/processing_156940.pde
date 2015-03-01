
int xPos, yPos; 
int xPos2, yPos2;
float dia1;
float dia2;
float opacity;
int divisor = 8;
float x;
float y;
float i;
float cos;

void setup(){
  size(800, 800);
  background(0);
}

void draw(){
    xPos = pmouseX;
    yPos = pmouseY;
    x = mouseX;
    y = mouseY;
  //  xPos2 = (pmouseX + (width/4));
  //  yPos2 = (pmouseY + (height/4));
     for (int xPos = width/divisor; xPos < width; xPos += width/divisor) {
       for (int yPos = height/divisor; yPos < height; yPos+= height/divisor) {
        opacity = (int(map((random(5, 40)), 0, 5, 0, 25)));
         stroke(255, 255, 255,random (20, 45));
        if (mousePressed == true){
          ellipse(xPos, yPos, dia1, dia2);
          noStroke();
          fill (255, 255, 255, opacity/125);
          cos = cos(millis() * .3);
          dia1 = map(cos, -1.0, 1.0, x, y);
          dia2 = map(cos, -1.0, 1.0, x*2, y*2);
        }
      }
    }
 //   if (mouseX > width/4 && pmouseX > width/4){
 //     ellipse(xPos2, yPos2, dia1, dia2);
 //     noStroke();
 //     fill (255, 255, 255, opacity);
 //  }
}    


