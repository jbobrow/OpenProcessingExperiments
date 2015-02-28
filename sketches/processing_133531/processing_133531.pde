
/**
 * using PShape 
 * Load 1 svg file 
 */

PShape layer01, layer02;
float zoom = 1;//var that works on scale 

void setup() {
  layer01 = loadShape("isometric_dots01.svg");
  layer02 = loadShape("isometric_dots01.svg");
 // size(isometric_dots01.width/8, isometric_dots01.height/8, P3D);
  size(512, 512, P2D);
 // println("width: " + isometric_dots01.width + "\t height: "+isometric_dots01.height);
}

void draw() 
{
  background(255);
  shape(layer01, 0, 0);
  translate(width/2, height/2);//center location

  
  pushMatrix();
 
  rotate(map(mouseX, 0, width/2, 0, PI*2));
  scale(constrain(zoom, 0.7, 4));
  shape(layer02, -512, -512);
  popMatrix();
  //println("Current zoom value is: "+ zoom);
  
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


