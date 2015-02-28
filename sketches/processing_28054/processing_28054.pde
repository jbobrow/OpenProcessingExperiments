


PImage tex = createImage(255, 255, RGB);
float rotx = PI/4;
float roty = PI/4;
float rotcolor = 0;
float linha,coluna;
float centx,centy,gradangle,thisangle,thiscolor,difcentrx,difcentry,thishipo,subangle;
int simcol,simlin;

void setup() 
{

  size(350, 350, P3D);

}

void draw() 
{
    background(0);
    noStroke();
    ortho(-width/2, width/2, -height/2, height/2, -10, 10);
    rotcolor=(rotcolor+1)%360;

    gradangle = radians(rotcolor);

    tex.loadPixels();  
    centx= tex.width/2;
    centy= tex.height/2; 
    

  for (int i = 0; i < tex.pixels.length; i++) {
    coluna = i/tex.height;
    linha = i%tex.width;
    simcol = floor(coluna/16);
    simlin = floor(linha/16);
       
    difcentrx = coluna-centx;
    difcentry = coluna-centy;
    thishipo = sqrt(difcentrx*difcentrx+difcentry+difcentry);


if (simcol >= 7 && simcol <= 8 && simlin >= 7 && simlin <= 8) {
    subangle=0;
  }else if
  (simcol >= 6 && simcol <= 9 && simlin >= 6 && simlin <= 9){
    subangle=HALF_PI;
  }else if
  (simcol >= 5 && simcol <= 10 && simlin >= 5 && simlin <= 10){
    subangle=PI;
  }else if
  (simcol >= 4 && simcol <= 11 && simlin >= 4 && simlin <= 11){
    subangle=HALF_PI*3;
  }else if
  (simcol >= 3 && simcol <= 12 && simlin >= 3 && simlin <= 12){
    subangle=0;
  }else if
  (simcol >= 2 && simcol <= 13 && simlin >= 2 && simlin <= 13){
   subangle=HALF_PI;
  }else if
  (simcol >= 1 && simcol <= 14 && simlin >= 1 && simlin <= 14){
    subangle=PI;
  }else if
  (simcol >= 0 && simcol <= 15 && simlin >= 0 && simlin <= 15){
    subangle=HALF_PI*3;
  }


    thisangle = atan2(linha-centx, coluna-centy);
    thiscolor = (cos((gradangle-thisangle+subangle))*100)+100;   
    tex.pixels[int(linha*tex.width+coluna)] = color(thiscolor);     
    }
  tex.updatePixels();
  textureMode(NORMALIZED);
  

  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);

 
  scale(80);
  TexturedCube(tex);
 
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);

  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}



