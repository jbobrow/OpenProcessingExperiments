
/*
  Elastic Canvas
  created by Peter Lager (Quark)
  
  Display a picture on an 'elsatic' canvas and distort it by clicking
  and dragging the mouse on the image.
  
  This uses the traer.physics library
  
   You can get a link to the library from Processing website at
   http://processing.org/reference/libraries/#simulation_math
   
   To use your own image simply replace the image filename in setup()
   the program will take care of the rest.
 */
 
import traer.physics.*;

PImage img;
ParticleSystem physics;
Particle[][] particles;
final int MAX_GRIDSIZE = 30;
int gridSizeX, gridSizeY;
float gridStepX, gridStepY;
int cols, rows;

int picX, picY, picW, picH;
int gx, gy;
boolean gvalid;
float zrest = -10.0f;
float zmove = -1.0f;

float springStrength = 2.5;
float springDamping = 0.05f;

void setup(){
  size(600,400, P3D);
  noSmooth();
  // load image
  img = loadImage("daliclock1.jpg");
  // Determine where the image will appear on screen and ensure
  // if fills no more than 95% of the width or height but maintain
  // aspect ratio.
  float w = img.width;
  float h = img.height;
  while(w > 0.9f*width){
    w *= 0.95f;
    h *= 0.95f;
  }
  while(h > 0.9f*height){
    w *= 0.95f;
    h *= 0.95f;
  }
  picW = (int) w;
  picH = (int) h;
  picX = (width - picW)/2;
  picY = (height - picH)/2;

  // Calculate the horizontal and vertical grid size ensuring that
  // a grid location is roughly square and the maximum no of "strips"
  // horizontally or vertically does not exceed MAX_GRIDSIZE
  if(picW > picH){
    gridSizeX = MAX_GRIDSIZE;
    gridSizeY = (int) ((h/w)*MAX_GRIDSIZE);  
  }
  else {
    gridSizeY = MAX_GRIDSIZE;
    gridSizeX = (int) ((w/h)*MAX_GRIDSIZE);
  }

  // Calculate the size of the grid strips in pixels
  gridStepX = ((float) (picW)) / (gridSizeX - 1);
  gridStepY = ((float) (picH)) / (gridSizeY - 1);

  //		System.out.println(gridStepX + " " + gridStepY);

  physics = new ParticleSystem(0, 0.05f);
  particles = new Particle[gridSizeX][gridSizeY];  // [cols][rows]

    // Create the particles and vertical springs
  for (int i = 0; i < gridSizeX; i++){  // for each row
    for (int j = 0; j < gridSizeY; j++){ // for each col
      particles[i][j] = physics.makeParticle(0.2f, i * gridStepX + picX, j * gridStepY + picY, zrest);
    }
  }
  // Create the horizontal springs
  for (int j = 0; j < gridSizeY; j++){
    for (int i = 1; i < gridSizeX; i++){
      physics.makeSpring(particles[i - 1][j], particles[i][j], springStrength, springDamping, gridStepY);
    }
  }
  // Create the vertical springs
  for (int i = 0; i < gridSizeX; i++){  // for each row
    for (int j = 1; j < gridSizeY; j++){ // for each col
      // Spring -  (  particle 1, particle 2, sterngth, damping, restLength )
      physics.makeSpring(particles[i][j - 1], particles[i][j], springStrength, springDamping, gridStepX);			
    }
  }

  // Fix the particles on the picture edge
  for (int i = 0; i < gridSizeX; i++){
    particles[i][0].makeFixed();
    particles[i][gridSizeY-1].makeFixed();
  }
  for (int j = 0; j < gridSizeY; j++){
    particles[0][j].makeFixed();
    particles[gridSizeX-1][j].makeFixed();
  }
  noStroke();

  registerMouseEvent(this);
}

void draw()
{
//  camera();
//  physics.advanceTime(0.1f);
  physics.tick(0.1);
//  System.out.println(frameRate);

  background(220,220,255);
  render();
}

void render(){
  textureMode(NORMAL);

  float t,s;
  float deltaS = 1.0f/gridSizeX;
  float deltaT = 1.0f/gridSizeY;

  for(int row = 0; row < gridSizeY - 1; row++){
 
    beginShape(TRIANGLE_STRIP);
    texture(img);
  
    for (int col = 0; col < gridSizeX; col++){
    t = row * deltaT;
    s = col * deltaS;
      vertex(particles[col][row].position().x(), particles[col][row].position().y(),particles[col][row].position().z(),s,t);
      t += deltaT;
      vertex(particles[col][row+1].position().x(), particles[col][row+1].position().y(),particles[col][row+1].position().z(),s,t);
    }
    endShape();
  }
}

void mouseEvent(MouseEvent event){
  switch(event.getID()){
  case MouseEvent.MOUSE_PRESSED:
    gx = (int) ((mouseX - picX + gridStepX/2)/gridStepX);
    gy = (int) ((mouseY - picY + gridStepY/2)/gridStepY);
    if(gx >0 && gx < gridSizeX-1 && gy>0 && gy <gridSizeY-1){
      gvalid = true;
      particles[gx][gy].position().set(mouseX, mouseY, zmove);
      particles[gx][gy].velocity().clear();
    }
    break;
  case MouseEvent.MOUSE_MOVED:
    break;
  case MouseEvent.MOUSE_CLICKED:
    if(gvalid){
      particles[gx][gy].position().set(mouseX, mouseY, zrest);
    }
    gvalid = false;
    break;
  case MouseEvent.MOUSE_RELEASED:
    if(gvalid){
      particles[gx][gy].position().set(mouseX, mouseY, zrest);
    }
    gvalid = false;

    break;
  case MouseEvent.MOUSE_DRAGGED:
    if(gvalid){
      particles[gx][gy].position().set(mouseX, mouseY, zmove);
      particles[gx][gy].velocity().clear();
    }
    break;
  }
}


