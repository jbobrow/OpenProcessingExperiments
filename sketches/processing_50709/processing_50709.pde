
int irisX = width/2;
int irisY = width/2;
int columns = 1;
int radius = (80);

// incorporated radial gradient code from:
// http://processing.org/learning/basics/radialgradient.html
// makes the iris follow slowly but looks cool...
  
void setup(){
  size(450,450);
  background(0);
  smooth();
}

void draw(){
  noStroke();
  fill(255);
  ellipse(width/2,width/2, 400,400);
// vary x
  if (mouseX > (width/2)+110){
    irisX = mouseX-110;
  }
  if (mouseX < (width/2)-110){
      irisX = mouseX+110;
  }
  if (mouseX > (width/2)-110 && mouseX < (width/2)+110){
      irisX = width/2;
  }
// vary y 
  if (mouseY > (height/2)+110){
    irisY = mouseY-110;
  }
  if (mouseY < (height/2)-110){
      irisY = mouseY+110;
  }
  if (mouseY > (height/2)-110 && mouseY < (height/2)+110){
      irisY = height/2;
  }
  drawIris();
}

void drawIris(){
    background(0);
    fill(255);
    ellipse(width/2,width/2, 400,400);
    fill(0,255,0);
    // old iris code, non-gradient
    // ellipse(irisX,irisY,160,160);
    
      // slightly altered gradient code from reference
  for (int i=radius; i< width; i+=radius*2){
    for (int j =radius; j< height; j+=radius*2){
      createGradient(irisX, irisY, radius, 
      color(int(random(255)), int(random(255)), int(random(255))), 
      color(int(random(255)), int(random(255)), int(random(255))));
    }
  }
// draw details on iris
    fill(0);
    ellipse(irisX,irisY,80,80);
    fill(255);
    ellipse(irisX-30,irisY-30,30,30);
    ellipse(irisX+40,irisY+40,10,10);
}


// create gradient code from reference library

void createGradient (float x, float y, float radius, color c1, color c2){
  float px = 0, py = 0, angle = 0;

  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  // hack to ensure there are no holes in gradient
  // needs to be increased, as radius increases
  float gapFiller = 8.0;

  for (int i=0; i< radius; i++){
    for (float j=0; j<360; j+=1.0/gapFiller){
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      color c = color(
      (red(c1)+(i)*(deltaR/radius)),
      (green(c1)+(i)*(deltaG/radius)),
      (blue(c1)+(i)*(deltaB/radius)) 
        );
      set(int(px), int(py), c);      
    }
  }
  // adds smooth edge 
  // hack anti-aliasing
  noFill();
  strokeWeight(3);
  ellipse(x, y, radius*2, radius*2);
}


