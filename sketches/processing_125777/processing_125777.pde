
int[] xPosition = new int[10];
int[] yPosition = new int[10];
float x = random(1, 100);



void setup() {
  size(400, 400);
}

void draw() {
  noStroke();
  frameRate(30);
  background(0);
  for (int i=0; i<xPosition.length; i++) {
    fill(random(1, 255));
    
         
         fill(255);
        ellipse(xPosition[0], yPosition[0], 20, 20);
        fill(230);
        ellipse(xPosition[1], yPosition[1], 18, 18);
        fill(205);
        ellipse(xPosition[2], yPosition[2], 16, 16);
        fill(180);
        ellipse(xPosition[3], yPosition[3], 14, 14);
        fill(155);
        ellipse(xPosition[4], yPosition[4], 12, 12);
        fill(130);
        ellipse(xPosition[5], yPosition[5], 10, 10);
        fill(105);
        ellipse(xPosition[6], yPosition[6], 8, 8);
        fill(80);
        ellipse(xPosition[7], yPosition[6], 6, 6);
        fill(55);
        ellipse(xPosition[8], yPosition[8], 4, 4);
        fill(30);
        ellipse(xPosition[9], yPosition[9], 2, 2);
        
       
        
        noFill();
        strokeWeight(1);
        stroke(255);
        ellipse(xPosition[0], yPosition[0], 65, 65);
        stroke(230);
        ellipse(xPosition[1], yPosition[1], 60, 60);
        stroke(205);
        ellipse(xPosition[2], yPosition[2], 55, 55);
        stroke(180);
        ellipse(xPosition[3], yPosition[3], 50, 50);
        stroke(155);
        ellipse(xPosition[4], yPosition[4], 45, 45);
        stroke(105);
        ellipse(xPosition[5], yPosition[5], 40, 40);
        stroke(80);
        ellipse(xPosition[6], yPosition[6], 35, 35);
        stroke(55);
        ellipse(xPosition[7], yPosition[7], 30, 30);
        stroke(5);
        ellipse(xPosition[8], yPosition[8], 25, 25);
        stroke(0);
        ellipse(xPosition[9], yPosition[9], 20, 20);
  }

  for (int i=xPosition.length-1; i>0; i--) {
    xPosition[i] = xPosition[i-1];
    yPosition[i] = yPosition[i-1];
  }
  
  xPosition[0] = mouseX;
  yPosition[0] = mouseY;
}
