
//Homework #6, Jim Roberst's CFA-757
//Computing the Arts with Processing
//Zoe Lu copyright Spring 2012, Pittsburgh

//pressed the space key to bold the stroke




float r,g,b;
float stk;
float ix,iy,ix2,iy2,iDia;
float ixSpeed,iySpeed,ixSpeed2,iySpeed2;
void setup(){
  frameRate(30);
  size(400,400);
  noFill();
  smooth();
  stk=5;
  r=255;
  g=216;
  b=216;
  ix=10;
  iy=random(height);
  ix2=random(width);
  iy2=random(height);
  iDia=50;
  ixSpeed=4;
  iySpeed=4;
  iySpeed2=3;
  ixSpeed2=3;
}

void draw(){
  prepWindow();
  initials(ix,iy,iDia);
  bounceInitials();
  wrapInitials();
  initials(ix2,iy2,iDia);
}

//wrap the initials
void wrapInitials(){
  ix2+=(ixSpeed2);
  iy2+=(iySpeed2);
  if(ix2>width || ix2<0){
    ix2=0;
  }
  if(iy2<0 || iy2>height){
    iy2=0;
  }
}

//bounce the initials
void bounceInitials(){
  ix+=ixSpeed;
  iy+=iySpeed;
  if(ix>width){
    ixSpeed=-ixSpeed;
  }
  if(ix<0){
    ixSpeed=-ixSpeed;
  }
  if(iy>height){
    iySpeed=-iySpeed;
  }
  if(iy<0){
    iySpeed=-iySpeed;
  }
}

//key pressed
void keyPressed(){
  if(keyCode==' '){
    stk++;
    if(stk>15){
      stk=5;
    }
  }
  /*
  if(keyCode=='S'){
    save("hw6.jpg");
  }
  */
}

void prepWindow(){
  fill(random(10),20);
  rect(-10,-10,width+20,height+20);
}

void initials(float x, float y, float diam){
    strokeWeight(stk);
    stroke(r,g,b);
    //draw a circle
    ellipse(x,y,diam*2,diam*2);
    //draw a Z
    stroke(r-21,g-58,b+22);
    beginShape();
      curveVertex(x,y);
      curveVertex(x-0.87*diam, y-0.5*diam);
      curveVertex(x, y-0.875*diam);
      curveVertex(x-0.7*diam, y+0.7*diam); 
      curveVertex(x, y+0.125*diam);
      curveVertex(x,y);
    endShape();
    //draw a L
    beginShape();
      curveVertex(x,y);
      curveVertex(x, y-0.5*diam);
      curveVertex(x, y+0.875*diam);
      curveVertex(x+0.86*diam, y+0.5*diam); 
      curveVertex(x,y);
    endShape();
}
                
