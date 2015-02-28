
PImage img; 
PGraphics circleMask;
PGraphics circleHighlight; 

void setup() {
  size(500,500);
  smooth();

  img = loadImage("color.jpg"); //pallette is used from this image
  drawMask(); //build the image for masking the circle
  drawHighlights();//build the image used for highlights
  drawMarble(); //draw a marble to screen
}

void draw() {
}

void mousePressed(){
  drawMarble();
}

void drawMarble(){
   background(50,40,40); //Dark brown background

  noStroke(); //now draw a gradient circle background
  for (int i = 400;i>300;i-=5) {
    fill(i-280,i-300,i-300); //fill light brown circle
    ellipse(width/2,height/2,i,i);
  }
  noFill();

  //draw some random bezier splines and points at different widths. get the color from the pallette image.
  for (int x = 0; x < 35 ;x++) {
    color newcolor = img.get( int(random(img.width)), int(random (img.height)) ); 
    stroke(newcolor,random(255)); //color from image pallette with random transparency
    //stroke(newcolor); //opaque color from image pallette
    strokeWeight (random(50));
    bezier (mouseX,50, random(width),random(height), random(width),random(height), width -mouseX,height-50);
    point(random(width),random(random(height)));
  }

  ellipse(width/2,height/2,400,400); // outline the circle
  
  blend (circleHighlight,0,0,width,height,0,0,width,height,SCREEN); //add the highlight layer
  blend (circleMask,0,0,width,height,0,0,width,height,MULTIPLY); // mask out the final image 
}

void drawMask(){
  // This draws a white circle on black that is used to mask the image 
  circleMask = createGraphics(width,height,P2D);
  circleMask.beginDraw();
  circleMask.noStroke();
  circleMask.smooth();
  circleMask.background(0);
  circleMask.fill(255);
  circleMask.ellipse(width/2,height/2,400,400);
  circleMask.endDraw();
}

void drawHighlights(){
  //this creates a highlight layer that is added to the image
  circleHighlight = createGraphics(width,height,P2D);
  circleHighlight.beginDraw();
  circleHighlight.smooth();
  circleHighlight.fill(255,96);
  circleHighlight.stroke(255);
  circleHighlight.strokeWeight(10);
  circleHighlight.ellipse(175,150,450,300);
  circleHighlight.noStroke();
  circleHighlight.fill(255);
  for(int i = 0;i<25;i++) {
    float rad = random(35); 
    circleHighlight.ellipse(random(width),random(height/2)+20,rad,rad);
    circleHighlight.filter (BLUR,2);
  } 
  circleHighlight.endDraw();
}

