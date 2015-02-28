
float x, y;
int yDir = 1;
int xDir = 1;
int dim=150;
int counter=0;
color[] pallete = {#E30909,#0920E3,#46E309,#E37A09};
PImage bg;
int intense=0;

void setup(){
//  background(20);
  size(600,300);
  x=0;
  y=0;
//  bg=loadImage("NicCage.jpg");
}

void draw(){
  if(intense==0){
    intense=1;
  }
  else if(intense==1){
    intense=0;
  }
  background(20);
//  image(bg,0-intense*3,-280+intense*2);
  x=x+xDir*22;
  y=y+yDir*33;
/*  if(counter==0){
    circle(x,y,dim);
  }
  else if(counter >= 1){
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
  }
  */
//  else if(counter >= 2){
    fill(pallete[0]);
    circle(x+random(dim)-dim/2,y+random(dim)-dim/2,dim);
        fill(pallete[1]);
    circle(x+random(dim)-dim/2,y+random(dim)-dim/2,dim);
        fill(pallete[2]);
    circle(x+random(dim)-dim/2,y+random(dim)-dim/2,dim);
        fill(pallete[3]);
    circle(x+random(dim)-dim/2,y+random(dim)-dim/2,dim);
//  }
/*    else if(counter >= 4){
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
    circle(x+random(4)-2,y+random(4)-2,dim);
  }*/
  if(x<0 || x>600){
    xDir=-xDir;
    dim=dim-10;
    counter++;
  }
  if(y<0 || y>300){
    yDir=-yDir;
    dim=dim-10;
    counter++;
  }
  saveFrame("#####.jpeg");

}

void circle(float xInitial, float yInitial, float dimInitial){
  ellipse(xInitial,yInitial,dimInitial, dimInitial);
}
