
/**
 * using PShape 
 * Load a grid01 file twice
 */

PShape grating01;
float zoom = 1;//var that works on scale 

void setup() {
  grating01 = loadShape("grating01_1024.svg");
 // size(grid01.width/8, grid01.height/8, P3D);
  size(512, 512, P3D);
 // println("width: " + grid01.width + "\t height: "+grid01.height);
}

void draw() 
{
  background(255);
  shape(grating01, 0, 0);
  translate(width/2, height/2);//center location

  
  pushMatrix();
 
  rotateZ(map(mouseX, 0, width/2, 0, PI*2));
  scale(constrain(zoom, 0.7, 4));
  shape(grating01, -512, -512);
  popMatrix();
  println("Current zoom value is: "+ zoom);
  
}

//NOTE: the shapes stay the same, the SPACE CHANGES
void keyPressed() {
  if (key == CODED) {//coded ascii keys
    if ((keyCode == UP)&&(zoom<4)) {
      zoom += .004;
    } 
    else if ((keyCode == DOWN) &&(zoom<7)){
      zoom -= .004;
    } 
  }
}


