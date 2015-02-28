
float rad;
float smallH, smallL,smallR;
boolean showable;

void setup(){
  size(600,400);
  rad = 100; //Size of top line
  smallH = height/2-rad-50;
  smallL = width/2-rad;
  smallR = width/2+rad;
  smooth();
  noLoop();
}

void draw(){
  background(255);
  
  fill(150);
  stroke(0);
  ellipse(width/2, height/2, 2*rad,2*rad); //Main Circle

  fill(0);
  ellipse(width/2, height/2, 10,10); //Center of Circle

  stroke(20,250,100);
  line(width/2-rad,height/2, width/2+rad, height/2); //Diameter of Circle
  
  stroke(0);
  line(smallL, smallH, smallR, smallH); //Top Line

  stroke(0);
  line(20, height - 20, width-20, height - 20); //Bottom Line
  triangle(20,height-20, 40,height-30, 40,height-10); //Left Arrow
  triangle(width-20,height-20, width-40,height-30, width-40,height-10); //Right Arrow

  if(mouseX<smallR && mouseX > smallL)
    {
      float dx = width/2 - mouseX;
      float dy = sqrt(rad*rad - dx*dx);
      float x = (height-20-height/2)/(dy/dx)+width/2;
      
      stroke(20,40,200);
      fill(20,40,200);
      line(mouseX,smallH,mouseX,height/2-dy); //Vertical Line to Circle
      ellipse(mouseX,smallH,5,5); //Point on Top Line
      

      stroke(255,0,200);
      fill(255,0,200);
      line(mouseX,height/2-dy,x,height-20); //Line though Circle

      ellipse(mouseX,height/2-dy,5,5); //Point on Circle
      ellipse(x,height-20,5,5); //Point on Bottom Line
    }
}

void mousePressed(){
  redraw();
}

