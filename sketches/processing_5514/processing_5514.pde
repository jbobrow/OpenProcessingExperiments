
//A work inspired by Bridget Riley's 'Hesitate'
//Coded by Christopher Hearn 2009

  int nx=30;
  int ny=22;
  int wid=400;
  int hei=400;
  color[] pixcol = new color[nx*ny];
  float[] posx = new float[nx*ny];
  float[] posy = new float[nx*ny];
  float[] colo = new float[nx*ny];
  float radius;
  float diamx;
  float arclen;
  float creasey;
  float shifty;
  float time;
  int speed=50;


void setup(){
  //size(wid,hei);
  size(400,400);
  noStroke();
  background(250);
  smooth();
  
  
  radius=height;
  diamx=0.8*width/(nx);
  arclen=radius*PI/(2*ny);
  creasey = 18*height/64;
  time=arclen;
  shifty=0;
}


void draw(){
  background(250);
  
  shapemove(shifty);
  colour(1);
  pushMatrix();  
  translate(width, height);
  rotate(PI);
  translate(0,-creasey);
  drawshapes();
  popMatrix();
  
  colour(2);
  pushMatrix();
  translate(0, -height+creasey);
  drawshapes();
  popMatrix();
  
    time-=0.3;
    if(time<0){time=speed;}
    shifty=radius*cos((arclen*time/speed)/radius);

}



