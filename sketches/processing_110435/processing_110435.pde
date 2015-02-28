
//Meghna Raghunatha
//Copyright@Meghna Raghunathan
//If you press the mouse the size increases
 
//m
float w,h,r;

void setup()
{
  size(400,400);
  w= width;
  h= height;
  r= 100;

}
  
  void draw ()
  
 { 
background(0,0,0);
noStroke();




//M
fill(random(255),random(255),255); 
triangle(mouseX, mouseY, mouseX, mouseY + r, mouseX+ .5*r , mouseY + r);
triangle(mouseX+ .5*r, mouseY+r,mouseX +r, mouseY,mouseX+r, mouseY +r);
rect(mouseX, mouseY+r, r,.5*r);


fill(0,0,0);
triangle(mouseX+.25*r,mouseY+ .75*r,mouseX+.25*r,mouseY+1.5*r,mouseX+.5*r,mouseY+1.5*r);
triangle(mouseX+.5*r,mouseY+1.5*r,mouseX + .75*r,mouseY+ .75*r,mouseX + .75*r,mouseY+1.5*r);


//U
fill(random(255),random(255),255); 
triangle(mouseX+1.1*r, mouseY,mouseX+1.1*r, mouseY + .5*r,mouseX+1.6*r, mouseY +.5*r);
triangle(mouseX+1.6*r, mouseY +.5*r,mouseX+2.1*r,mouseY,mouseX+2.1*r,mouseY+.5*r);
rect(mouseX+1.1*r,mouseY+.5*r, r,r);

fill(0,0,0);
triangle(mouseX+1.1*r,mouseY+r,mouseX+1.1*r,mouseY+1.5*r,mouseX+1.35*r,mouseY+1.5*r);
triangle(mouseX+1.85*r,mouseY+1.5*r,mouseX+2.1*r,mouseY+r,mouseX+2.1*r,mouseY+1.5*r);

//R
fill(random(255),random(255),255);
triangle(mouseX+2.2*r,mouseY,mouseX+2.2*r,mouseY +1.5*r,mouseX + 3.2*r ,mouseY + 1.5*r);
rect(mouseX+2.2*r,mouseY,r,r);

fill(0,0,0);
rect(mouseX +1.35*r,mouseY+ .25*r, .5*r, .85*r);

fill(0,0,0);
triangle(mouseX+2.45*r,mouseY +r,mouseX+2.45*r,mouseY + 1.5*r,mouseX+2.85*r,mouseY + 1.5*r);
rect(mouseX+2.45*r,mouseY +.35*r,.5*r,.4*r);



 }
 // saveFrame( “hw5.jpg”);
 


 


