
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies




void setup()
{
  size(540, 480);
  
  background(0);
  rectMode(CENTER);

}

void draw()
{
//  
}

void mouseDragged()
{
  
  float green = map(mouseX, 50, width, 20, 255);
 
  float mouseangle = atan2(mouseY-height/2,mouseX-width/2);
  float blue = map(mouseangle,0,2*PI,0,255);
  float red = map(mouseangle,0,2*PI,255,0);
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  
  float lineWidth = map(speed, 0, 20, 10, 15);
  lineWidth = constrain(lineWidth, 0, 100);
  
  noStroke();
  fill(0, alpha);
  rect(width/2, height/8, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
 
 brush(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

 
}



//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies



 int rotatenum = int(random(5,16));
 void brush(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
 

 

  

  
  for (int i=0; i< rotatenum; i=i+1) {
    float theta = 2*PI*i/rotatenum;
    line(px*cos(theta)+(width/2)*(1-cos(theta))-height*sin(theta)/2+py*sin(theta),-px*sin(theta)+width*sin(theta)/2+(height/2)*(1-cos(theta))+py*cos(theta),
  x*cos(theta)+(width/2)*(1-cos(theta))-height*sin(theta)/2+y*sin(theta),-x*sin(theta)+width*sin(theta)/2+(height/2)*(1-cos(theta))+y*cos(theta));
  }
  for (int i=0; i<rotatenum; i=i+1) {
    float theta = PI/rotatenum*2+ 2*PI*i/rotatenum;
    line(px*cos(theta)/2+(width/2)*(1-cos(theta)/2)-height*sin(theta)/4+py*sin(theta)/2,-px*sin(theta)/2+width*sin(theta)/4+(height/2)*(1-cos(theta)/2)+py*cos(theta)/2,
  x*cos(theta)/2+(width/2)*(1-cos(theta)/2)-height*sin(theta)/4+y*sin(theta)/2,-x*sin(theta)/2+width*sin(theta)/4+(height/2)*(1-cos(theta)/2)+y*cos(theta)/2);
  }
  return;
 
}


