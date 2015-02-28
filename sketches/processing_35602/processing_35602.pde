
void setup() {
  size (300, 300);
  background(200);
  colorMode(HSB, width);
}
//size, background and color range chosen


/*
void draw() {
 
 background(200);
 
 //setup for rectangle
 strokeWeight(2);
 stroke(350-mouseY, mouseY, mouseX);
 fill(width-mouseY, mouseY, mouseY);
 rectMode(CENTER);
 rect(mouseX+10, mouseY+10, width-mouseX, width-mouseY);
 
 //setup for first ellipse, (rearranged order so that ellipse is on top layer)
 strokeWeight(1);
 stroke(mouseX, mouseY, mouseX);
 
 fill(mouseX-100, mouseX-150, mouseX-200);
 ellipse(mouseX-10, mouseY-10, 30, 30);
 }
 
 inpiration to create a parametric eye that changes color as you move your mouse.*/

/*void draw() {
 strokeWeight(2);
 stroke(0, 100, 0);
 fill(0,0,255);
 
 
 int x= mouseX;
 int y= mouseY;
 background(200);
 
 
 ellipseMode(CENTER);
 ellipse(x, y, 160, 75);
 
 //second ellipse
 
 strokeWeight(1);
 fill(x,y,x+y);
 ellipse(x,y,74,74);
 
 
 
 //pupil?
 
 fill(0,255,0);
 
 ellipse(x,y,30,30);
 
 }
 
 now it's time for two eyes*/

void draw() {
  strokeWeight(2);
  stroke(0, 100, 0);
  fill(0, 0, 255);


  int x= mouseX;
  int y= mouseY;
  background(200);


  ellipseMode(CENTER);
  ellipse(x-100, y, 160, 75);

  //second ellipse

  strokeWeight(1);
  fill(x, y, x+y);
  ellipse(x-100, y, 74, 74);



  //pupil?

  fill(0, 255, 0);

  ellipse(x-100, y, 30, 30);

  //eye number two
  strokeWeight(2);
  stroke(0, 100, 0);
  fill(0, 0, 255);



  ellipseMode(CENTER);
  ellipse(x+100, y, 160, 75);

  //other ellipse 2

  strokeWeight(1);
  fill(x, y, x+y);
  ellipse(x+100, y, 74, 74);



  //pupil2

  fill(0, 255, 0);

  ellipse(x+100, y, 30, 30);
  
  //add a mouth
  
  ellipse(width/2, 255,y,x-50);
  
}


