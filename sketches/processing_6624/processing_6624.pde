
PImage back;
PImage tex;
void setup(){

  size(200,200,P3D);
  background(255); 
  back=loadImage("test.jpg");  
  //image(back,0,0);
  tex=loadImage("small.png");
  textureMode(NORMALIZED);

  noStroke();

}

float rotL;
float rotR;
boolean down=false;

void draw(){

  rotR=rotL*-1;
  println(rotR);





  background(255);

  // left side
rotateX(.7);

  pushMatrix();
  translate(width/2,height/2);
  rotateY(rotL);

  beginShape();
  texture(tex);
  vertex(-30,-30,0,0);
  vertex(0,-30,.5,0);
  vertex(0,30,.5,1);
  vertex(-30,30,0,1);
  endShape(CLOSE);
  
  popMatrix();

  //right side  

  pushMatrix();

  translate(width/2,height/2);
  rotateY(rotR);

  beginShape();
  texture(tex);
  vertex(0,-30,.5,0);
  vertex(30,-30,1,0);
  vertex(30,30,1,1);
  vertex(0,30,.5,1);
  endShape(CLOSE);
  popMatrix();
  //println(rotL);
  //println(down);


  //  Wings Use inacurate float numbers to give a slightly random look
  ////     Rotation left Wing
  if (rotL>1){
    down=true;
  }

  if(rotL<.3){
    down=false;
  }

  if (down==true){
    rotL-=.01;
  }

  if(down==false){
    rotL+=.01;
  }

}

































