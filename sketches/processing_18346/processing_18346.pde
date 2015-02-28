
int numFrames = 30;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

import traer.physics.*;
 
//PImage img;
ParticleSystem physics;
Particle[][] particles;
final int MAX_GRIDSIZE = 30;
int gridSizeX, gridSizeY;
float gridStepX, gridStepY;
int cols, rows;
 float aumenta = 0.0;
int picX, picY, picW, picH;
int gx, gy;
boolean gvalid;
float zrest = -10.0f;
float zmove = -1.0f;
 
float springStrength = 2.5;
float springDamping = .05f;
 
void setup(){
  size(500,350, P3D);
  noSmooth();
  // load image
  //img = loadImage("conejo3.jpg");
  // Determine where the image will appear on screen and ensure
  // if fills no more than 95% of the width or height but maintain
  // aspect ratio.
///////////////////
   frameRate(30);
   //background(0);
  images[0]  = loadImage("1q.JPG");
    images[1]  = loadImage("2q.JPG");
  images[2]  = loadImage("3q.JPG"); 
  images[3]  = loadImage("4q.JPG");
   images[4]  = loadImage("5q.JPG");
  images[5]  = loadImage("6q.JPG"); 
  images[6]  = loadImage("7q.JPG");
    images[7]  = loadImage("8q.JPG");
  images[8]  = loadImage("9q.JPG"); 
  images[9]  = loadImage("10q.JPG");
   
    images[10]  = loadImage("11q.JPG");
  images[11]  = loadImage("12q.JPG"); 
  images[12]  = loadImage("13q.JPG");
    images[13]  = loadImage("14q.JPG");
  images[14]  = loadImage("15q.JPG"); 

  images[15]  = loadImage("16q.JPG");
   images[16]  = loadImage("17q.JPG");
  images[17]  = loadImage("18q.JPG"); 
  images[18]  = loadImage("19q.JPG");
    images[19]  = loadImage("20q.JPG");
  images[20]  = loadImage("21q.JPG"); 
  images[21]  = loadImage("22q.JPG");
   images[22]  = loadImage("23q.JPG");
  images[23]  = loadImage("24q.JPG"); 
  images[24]  = loadImage("25q.JPG");
    images[25]  = loadImage("26q.JPG");
  images[26]  = loadImage("27q.JPG"); 
  images[27]  = loadImage("28q.JPG");
   images[28]  = loadImage("29q.JPG"); 
  images[29]  = loadImage("30q.JPG");
 /////////////////////////// 
  for (int y = 0; y <numFrames; y++){
  float w = images[y].width;
  float h = images[y].height;
  
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
  

  }////////////
 
  // Calculate the size of the grid strips in pixels
  gridStepX = ((float) (picW)) / (gridSizeX - 1);
  gridStepY = ((float) (picH)) / (gridSizeY - 1);
 
  //        System.out.println(gridStepX + " " + gridStepY);
 
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
  //////////////[[[[[[
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
}}
 
void draw()
{ 
  
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 0, 0);
  
  
//  camera();
//  physics.advanceTime(0.1f);
  physics.tick(0.1);
//  System.out.println(frameRate);
 
 background(0);
  render();
}
 
void render(){
  textureMode(NORMAL);
 
  float t,s;
  float deltaS = 1.0f/gridSizeX;
  float deltaT = 1.0f/gridSizeY;
 
  for(int row = 0; row < gridSizeY - 1; row++){
  
    beginShape(QUAD_STRIP);
    //texture(images[int (random (30))]);
       texture(images[frame]);
    
    
    for (int col = 0; col < gridSizeX; col++){
    t = row * deltaT;//+(random (-1,1));
    s = col * deltaS;
      vertex(particles[col][row].position().x(), particles[col][row].position().y(),particles[col][row].position().z(),s,t);
      t += deltaT;//+(random (-1,1));
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



/////////////////////////////////////




