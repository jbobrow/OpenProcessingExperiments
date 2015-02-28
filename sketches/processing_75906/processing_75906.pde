
float x,y,angle,glow,glow2,dir,dir2,worms,worms2;
PImage space;


void setup(){
  size(800,800);
  x=0;
  y=0;
  angle=0;
  smooth();
  glow=500;
  glow2=1;
  dir=1;
  dir2=1;
  worms=1;
  worms2=1;
  space=loadImage("space.jpg");
  image(space,0,0);

}

/*void myFun(float posX, float posY){
  worms+=worms2;
  stroke(0);
  fill(255);
  ellipse(posX,posY,worms*2,worms*2);
    if(worms>10){
      worms2=-1;}
    if(worms<0){
      worms2=1;}
}*/

void draw(){
  glow+=glow;
  dir+=5;
  dir2+=-5;
  angle+=1;
  fill(0,glow/3,glow/4,5);
  stroke(glow/3,glow/6,0,5);
 for(int i=0;i<90;i+=30){
    x=200*cos(radians(angle));
    y=200*sin(radians(angle));
  pushMatrix();
    translate(400,400);
    rotate(radians(angle));
    triangle(x+i,y+i,400,400,x+i+10,y+i+10);
  popMatrix();}
  if(mouseX>370 && mouseX<430 && mouseY>250 && mouseY<310){
    noFill();
    stroke(dir,0,0,40);
    quad(dir+400,280,400,dir+280,dir2+400,280,400,dir2+280);
    if(dir>1000){
       dir=0;
       dir2=0;}
    }else{dir=0;
        dir2=0;
      noStroke();}
     if(mousePressed && mouseX>375 && mouseX<425 && mouseY>750 && mouseY<800){
        image(space,0,0);
        fill(255,0,0);
        stroke(255,100,0,50);
        triangle(375,795,400,750,425,795);}
     fill(255,0,0,50);
        stroke(255,100,0,50);
        triangle(375,795,400,750,425,795);
          
}




