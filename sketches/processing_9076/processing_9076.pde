
void setup(){
size (640,480);
smooth();
background(87,197,204);
noStroke();
}

// Define Variables 
int LeftEyeX = 205;
int LeftEyeY = 211;
int RightEyeX = 440;
int RightEyeY = 211;

float d = dist(mouseX, mouseY, LeftEyeX, LeftEyeY);
float rd = dist(mouseX, mouseY, RightEyeX, RightEyeY);

// Draw

void draw(){
 float b = dist(mouseX, mouseY, pmouseX, pmouseY);
float c= constrain(b,  0, 25);

//left eye
fill(255); //white
ellipse (LeftEyeX, LeftEyeY, 150,150);

fill(mouseX, mouseY, 0);  //colorful iris

d = constrain (d,0,30);
float a = atan2(mouseY-LeftEyeY, mouseX-LeftEyeX);
float x = LeftEyeX + cos(a)*d;
float y = LeftEyeY + sin(a)*d;
  ellipse(x,y, 90, 90);
  
  fill(0); //puplis
  ellipse(x, y, 30,30);
  
  fill(255); //light
  ellipse(x+3,y-9, 15, 15); 


//Right Eye

fill(255);
ellipse(RightEyeX, RightEyeY, 150, 150);

fill(mouseX, mouseY, 0);  //colorful iris
d = constrain (d, 0, 30);
float ra = atan2(mouseY-RightEyeY, mouseX-LeftEyeX);
float rx = RightEyeX + cos(a)*d;
float ry = RightEyeY + sin(a)*d;
ellipse (rx, ry, 90, 90);

fill (0);  //puplis
ellipse(rx, ry, 30,30);

fill(255); //light
ellipse(rx+3, ry-9, 15, 15);


//blink

if(mousePressed){
  fill(mouseX, mouseY, 0);
  ellipse(LeftEyeX, LeftEyeY, 152, 152);
  ellipse(RightEyeX, RightEyeY, 152,152);
 
 
 //left eye 
  fill(0, mouseX, mouseY);
  ellipse(x,y, 50, 90);
  
  fill(mouseY, mouseX, mouseX*2); //puplis
  ellipse(x, y, 40,80);
  
  fill(mouseX*3, mouseY-20, mouseY+8); //light
  ellipse(x,y, 30, 70); 
  
  fill(mouseX, mouseY*20, mouseY/2); //light
  ellipse(x,y, 20, 50); 
  
  fill(255); //light
  ellipse(x+3,y-9, 15, 15); 
  
  //right eye
  fill(0, mouseX, mouseY);
  ellipse(rx,ry, 50, 90);
  
  fill(mouseY, mouseX, mouseX*2); //puplis
  ellipse(rx, ry, 40,80);
  
  fill(mouseX*3, mouseY-20, mouseY+8); //light
  ellipse(rx,ry, 30, 70); 
  
  fill(mouseX, mouseY*20, mouseY/2); //light
  ellipse(rx,ry, 20, 50); 
  
  fill(255); //light
  ellipse(rx+3,ry-9, 15, 15); 
}

}



