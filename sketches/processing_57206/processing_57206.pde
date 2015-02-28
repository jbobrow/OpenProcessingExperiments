
void setup(){
  size(500,500);
  stroke(255);
}
//fill colors
int f1=255;
int f2=255;
int f3=255;
// variables for following ellipse
 int x=10;
 int y=10;
 int locx=int(random(500));
 int locy=int(random(500));
//mouse ellipse
 int mh=40;
 int mw=40;
 
 void draw(){
 background(0);
 ellipse(mouseX,mouseY,mh,mw);
 
 //establishing the following ellipse and it's movement
  ellipse(locx, locy ,x,y);
  if(x<50){
  if(locx<mouseX){
    locx+=1;
  }if(locx>mouseX){
    locx-=1;}
     if(locy<mouseY){
    locy+=1;
  }if(locy>mouseY){
    locy-=1;}
    
//absorption
    if(abs(mouseX-locx)<mh && abs(mouseY-locy)<mw){
      mh-=1;
      mw-=1;
      x+=1;
      y+=1;}
  }
//post-absorption
      if(x==50){
        if(locx<width/2){
          locx+=1;}
          if(locx>width/2){
          locx-=1;}
          if(locy<height/2){
          locy+=1;}
          if(locy>height/2){
          locy-=1;}
      }
    //  if(x>40&&locx==width/2&&locy==height/2){
      //  fill(f1,f2,f3);
  //      f1 = int(random(255));
   //     f2 = int(random(255));
  //      f2 = int(random(255));
  //      x+=1;
  //      y+=1;
   //   }
 }
 void mousePressed(){
x=10;
y=10;
locx=int(random(500));
locy=int(random(500));
fill(255);
mh=40;
mw=40;}

