
int[] xPosition = new int[60];
int[] yPosition = new int[60];



void setup() {
  size(400,400);
}
  
  
void draw() {
  background(80,220,150); 
  strokeWeight(1);
  for (int i=0; i<xPosition.length; i++) {
    quad( xPosition[i], yPosition[i], 70, 50+yPosition[i], 40+xPosition[i], 30+yPosition[i], yPosition[i], 80 );
  }
  
  for(int i=xPosition.length-1; i>0; i--) {
    xPosition[i] = xPosition[i-1];
    yPosition[i] = yPosition[i-1];
   
  }
    
  
  xPosition[0] = mouseX;
  yPosition[0] = mouseY;
  
  
  
}
