
float xpos =350;
float ypos =200;
 
float angle =10;
float offset=100;
float scalar =200;
float speed =2;
 

 
 
PImage img;
 
void setup(){
   
  size (500,400);
  img =loadImage ("space.jpg");
 // background (255);
  smooth();
  // frameRate(10);
}
 


 
 
void draw (){
   //image (img,0,0);
  background (0);
  
float clr = random(40,80);
float clr2 = random(80,150);
  fill(255);
  
  if (mouseY < height/2) { 
    stroke(clr,clr2,200);
  }
  else {
      stroke(clr,0,clr);
  }

 
  
 int y = height/10;
  int w = 30;
  int h = 50;
  int z = mouseX/2;
  int g = mouseY/2;
  background(z);
  
  for (int x=0; x<width; x+=10){
    fill(g,g/2,200);
    rect(x,y,w/4,h);

}



  noFill();








endShape();
  xpos = xpos + (mouseX - xpos) /30.0;
  ypos = ypos +(mouseY -ypos)/30.0;
 
  //line(mouseX,mouseY,xpos, ypos+60);
   
  float y1=tan(angle) * scalar;
  float y2=tan(-angle +0.4) *scalar;
  float y3=offset +tan(angle + 0.8) *scalar;
  float y4 =offset +tan (-angle+1.2)*scalar;
  float y5=offset +tan(angle+1.6) * scalar;
  float y6=offset +tan(-angle +2) *scalar;
  float y7=offset +tan(angle + 2.4) *scalar;
  float y8 =offset +tan (-angle+2.8)*scalar;
   
 // ellipse (80,y1,40,40);
 // ellipse (120,y2,40,40);
 // ellipse (160,y3,40,40);
  //translate (mouseX,mouseY);
 bezier(mouseX*2, mouseY, mouseX+10, mouseY+10, mouseX +0, mouseY+90, xpos+ 25, ypos+80+y1);
 bezier(mouseX, mouseY*2, mouseX+10, mouseY+30, mouseX+ 0, mouseY+90, xpos- 25, ypos+80+y2);
 bezier(mouseX*2, mouseY, mouseX+20, mouseY+20, mouseX+ 0, mouseY+80, xpos+ 15, ypos+60+y3);
 bezier(mouseX, mouseY*2, mouseX+20, mouseY+40, mouseX+ 0, mouseY+80, xpos- 15, ypos+60+y4);
  bezier(mouseX*2, mouseY, mouseX+30, mouseY+30, mouseX+ 0, mouseY+70, xpos+ 35, ypos+80+y5);
 bezier(mouseX, mouseY*2, mouseX+30, mouseY+50, mouseX+ 0, mouseY+70, xpos- 35, ypos+80+y6);
 bezier(mouseX*2, mouseY, mouseX+40, mouseY+40, mouseX+ 0, mouseY+60, xpos+ 45, ypos+60+y7);
 bezier(mouseX, mouseY*2, mouseX+40, mouseY+60, mouseX+ 0, mouseY+60, xpos- 45, ypos+60+y8);
 
 if (xpos<width/2) {
   ypos = -ypos;
 }
 angle +=speed*3;
  
  if (ypos>height/2){
    ypos=xpos;
  }

  }


// http://www.openprocessing.org/visuals/?visualID=35811 
// *spacial fluff

