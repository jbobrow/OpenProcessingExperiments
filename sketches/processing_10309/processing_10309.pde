
//Setup.
void setup(){  

size (640,480);  
smooth();  
background(0);  
noStroke();  

}  

   

// Variables....   

int LeftEyeX = 200;  
int LeftEyeY = 320;  
int RightEyeX = 380;  
int RightEyeY = 240;  

   

float d = dist(mouseX, mouseY, LeftEyeX, LeftEyeY);  
float rd = dist(mouseX, mouseY, RightEyeX, RightEyeY);  

   

// Draw  

   void draw(){  

      colorMode(HSB, 360, 100, 100);
     
 float b = dist(mouseX, mouseY, pmouseX, pmouseY);  
 float c= constrain(b,  0, 30);  

   

//left eye  
fill(255);   
ellipse (LeftEyeX, LeftEyeY, 100,100);  

fill(mouseX, mouseY, 160);  //Color Wheel.

d = constrain (d,0,30);  

float a = atan2(mouseY-LeftEyeY, mouseX-LeftEyeX);  
float x = LeftEyeX + cos(a)*d;  
float y = LeftEyeY + sin(a)*d;  

ellipse(x,y, 80, 80);  
fill(0); //puplis  
//stroke.
stroke(0);

ellipse(x, y, 30,30);  

fill(255); //light  

ellipse(x+3,y-9, 20, 20);//Glow Bubble.   

//Right Eye  
fill(255);  

ellipse(RightEyeX, RightEyeY, 100, 100);  
   
fill(mouseX, mouseY, 160);  //Color Wheel. 

d = constrain (d, 0, 30);  

float ra = atan2(mouseY-RightEyeY, mouseX-LeftEyeX);  
float rx = RightEyeX + cos(a)*d;  
float ry = RightEyeY + sin(a)*d;  
ellipse (rx, ry, 80, 80);  

   

fill (0);  //puplis  
ellipse(rx, ry, 30,30);  

   
fill(255); //Glow Bubble.   
ellipse(rx+3, ry-9, 20, 20);  

//Movement.   

if(mousePressed){  

  fill(mouseX, mouseY, 205);  

  ellipse(LeftEyeX, LeftEyeY, 140, 140);  
  ellipse(RightEyeX, RightEyeY, 140,140);  

   
 //left eye   

  fill(0, mouseX, mouseY);  


  //right eye  

  fill(0, mouseX, mouseY);  


}  

   

} 


