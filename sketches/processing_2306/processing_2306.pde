
/**
 * based on the example "TexturedCube"
 * by Dave Bollinger.
 *
 * just added some animated texture
 * 
 * Drag mouse to rotate cube. 
*/

PGraphics[] ebene = new PGraphics[6];

float rotx = PI/4;
float roty = PI/4;
float rt = 0;
float sk = 0;
PShape house;

void setup() 
{
  size(600, 600, P3D);
  for(int i =0; i<6; i++){
    ebene[i] = createGraphics( 400, 400, P2D );
    ebene[i].background(0);
  }
  textureMode(NORMALIZED);
  shapeMode (CENTER);
  house = loadShape( "House.svg" );
  house.disableStyle(); 
  smooth();
}

void draw() 
{

  for(int i =0; i<6; i++){      //draw texture-layers
      draw_ebene(i);
  }
  rt += 0.8;
  sk += 0.02;
  
  background(0);
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(150);
  TexturedCube();              //draw a cube
  if(!mousePressed){
    roty+=0.01;
    rotx+=0.02;
  }
}



void TexturedCube() {      
  beginShape(QUADS);
    // +Z "front" face
    texture(ebene[0]);
    vertex(-1, -1,  1, 0, 0);
    vertex( 1, -1,  1, 1, 0);
    vertex( 1,  1,  1, 1, 1);
    vertex(-1,  1,  1, 0, 1);
  endShape();
  
  beginShape(QUADS);
    // -Z "back" face
    texture(ebene[1]);
    vertex( 1, -1, -1, 0, 0);
    vertex(-1, -1, -1, 1, 0);
    vertex(-1,  1, -1, 1, 1);
    vertex( 1,  1, -1, 0, 1);
  endShape();
  
  beginShape(QUADS);
    // +Y "bottom" face
    texture(ebene[2]);
    vertex(-1,  1,  1, 0, 0);
    vertex( 1,  1,  1, 1, 0);
    vertex( 1,  1, -1, 1, 1);
    vertex(-1,  1, -1, 0, 1);
  endShape();
  
  beginShape(QUADS);
    // -Y "top" face
    texture(ebene[3]);
    vertex(-1, -1, -1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, -1,  1, 1, 1);
    vertex(-1, -1,  1, 0, 1);
  endShape();
  
  beginShape(QUADS);
    // +X "right" face
    texture(ebene[4]);
    vertex( 1, -1,  1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1,  1, -1, 1, 1);
    vertex( 1,  1,  1, 0, 1);
  endShape();
  
  beginShape(QUADS);
    // -X "left" face
    texture(ebene[5]);
    vertex(-1, -1, -1, 0, 0);
    vertex(-1, -1,  1, 1, 0);
    vertex(-1,  1,  1, 1, 1);
    vertex(-1,  1, -1, 0, 1);
  endShape();
}

void mouseDragged() {            //rotation of cube
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}

void draw_ebene(int i){           
    ebene[i].beginDraw();
      ebene[i].colorMode(HSB, 60);
      ebene[i].fill(10*i+abs(20-(frameCount)%40),100, 100, 20);
      ebene[i].translate( width/(i+2), height/(i/2+2) );
      ebene[i].rotate( rt/(i+1) );
      ebene[i].scale( sk );
      ebene[i].shape(house , 0,0,width/4,height/4 ); 
    ebene[i].endDraw();
}

