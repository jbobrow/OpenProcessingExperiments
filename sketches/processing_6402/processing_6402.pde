
Cubedeer c;
float ax,ay;


    color brown = color(153,102,51);
    color red = color(255,0,0);
    color yellow = color( 238,221,130);
void setup(){
  size(250,250,P3D);
  frameRate(50);
  c = new Cubedeer();
}

float hs;
float h;

void draw(){
  background(200,200,250);
  
  if(mousePressed){
     hs += .3; 
  } else {
     hs -= .3; 
  }
  
  h += hs; 
  if(h < 0.0) {
    h = 0.0;
    hs *= -.5;
  }

  ay = (mouseX-125)/25.0;
  ax = (125 - mouseY)/100.0;

  
  c.draw(); 
}






class Cubedeer {
  void draw(){
    pushMatrix();
    translate(width/2,height/2);

    rotateY(ay);
    rotateX(ax);
    noStroke();



  noBorderBox(color(255),0,140+h,0,200,1,1,1);

  noBorderBox(color(200),0,40+h,0,80/((h/40)+1),1,.01,1);


    borderBox(brown,0,0,0,40);

    borderBox(brown,25,-25,0,20);
    noBorderBox(red,40,-25,0,10);


    borderBox(yellow,25,-40,20,15);
    borderBox(yellow,25,-40,-20,15);


    borderBox(brown,-25,0,0,10);

    borderBox(brown,-25,25,25,15);
    borderBox(brown,-25,25,-25,15);
    borderBox(brown,25,25,25,15);
    borderBox(brown,25,25,-25,15);


    popMatrix();
  }

  void borderBox(color c,  float tx, float ty, float tz,float baseSize ){
    pushMatrix();
    translate(tx,ty,tz);
    fill(0,128);
    box(baseSize+10);
    fill(c);
    box(baseSize);
    popMatrix();
  }

  void noBorderBox(color c,  float tx, float ty, float tz,float baseSize ){
    pushMatrix();
    translate(tx,ty,tz);
    fill(c);
    box(baseSize);
    popMatrix();
  }

  void noBorderBox(color c,  float tx, float ty, float tz,float baseSize, float rx,float ry, float rz ){
    pushMatrix();
    translate(tx,ty,tz);
    fill(c);
    box(baseSize*rx,baseSize*ry,baseSize*rz);
    popMatrix();
  }



}



