
int[] xPosition = new int[70];
int[] yPosition = new int[70];

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  for ( int i=0; i<xPosition.length; i++) {
    fill(random(150),0,50,40);
    strokeWeight(1);
    stroke(0,random(100));
    line(200,200,xPosition[i],yPosition[i]);
    line(xPosition[i],yPosition[i],0,0);
     line(xPosition[i],yPosition[i],400,0);
      line(xPosition[i],yPosition[i],0,400);
       line(xPosition[i],yPosition[i],400,400);
       
    noStroke();
    ellipse(xPosition[i], yPosition[i],random(80),random(80));
    rectMode(CENTER);
    
  }
  
  for( int i=xPosition.length-1; i>0; i--){
    xPosition[i] = xPosition[i-1];
    yPosition[i] = yPosition[i-1];
    
 xPosition[0] = mouseX;
 yPosition[0] = mouseY;
}
}
