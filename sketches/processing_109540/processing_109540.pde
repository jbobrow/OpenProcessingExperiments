
int c,d;
float colorR, colorG, colorB, alpha;


void setup(){
  size(600,600);//size 600X600
  frameRate(30);//30 frames per sec
  background(0);//black background
  smooth();
}

void draw(){
  noStroke();
  fill(0,15);
  rect(0,0,width,height);
  
  c = int(random(width));//set the center of circle
  d = int(random(height));//set the center of circle
  colorR= random(150,230);//set the red color range in random mode
  colorG= random(150,230);//set the blue color range in random mode
  colorB= random(150,230);//set the green color range in random mode
  alpha= random(100,255);//set the transparency range in random mode
  fill(colorR,colorG,colorB,alpha);//set the color of the circle
  for (int a=20; a<=width-20; a=a+40){
    ellipse(c,d,a,a);}//set the circle location randomly as the background
    
  float x=mouseX;//set x as mouse position
  float y=mouseY;//set y as mouse position
  float ix= width-mouseX;//set ix as the opposite position of the mouse
  float iy= height-mouseY;//set iy as the opposite position of the mouse
 
 noFill();//the following triangles are not filled with color
int a;
 if (mousePressed == true){
   a=255;
 } else{
    a=0;
   }// if the mouse is pressed, line is in white. Unless, line is in black.
 stroke(a);//set the line color of the triangle
  triangle(x,y,x-10,y-30,x+10,y-30);//upper triangle1
  triangle(x,y,x-20,y+60,x+20,y+60);//lower trangele1
  triangle(ix,iy,ix-10,iy-30,ix+10,iy-30);//upper triangle2
  triangle(ix,iy,ix-20,iy+60,ix+20,iy+60);//lower trangele2
  triangle(x,iy,x-10,iy-30,x+10,iy-30);//upper triangle3
  triangle(x,iy,x-20,iy+60,x+20,iy+60);//lower trangele4
  triangle(ix,y,ix-10,y-30,ix+10,y-30);//upper triangle4
  triangle(ix,y,ix-20,y+60,ix+20,y+60);//lower trangele4
  triangle(ix,width/2,ix-10,width/2-30,ix+10,width/2-30);//upper triangle5
  triangle(ix,width/2,ix-20,width/2+60,ix+20,width/2+60);//lower trangele5
  triangle(x,width/2,x-10,width/2-30,x+10,width/2-30);//upper triangle6
  triangle(x,width/2,x-20,width/2+60,x+20,width/2+60);//lower trangele6
  triangle(height/2,iy,height/2-10,iy-30,height/2+10,iy-30);//upper triangle7
  triangle(height/2,iy,height/2-20,iy+60,height/2+20,iy+60);//lower trangele7
  triangle(height/2,y,height/2-10,y-30,height/2+10,y-30);//upper triangle8
  triangle(height/2,y,height/2-20,y+60,height/2+20,y+60);//lower trangele8    
 
}

