
class Fish {
float mov = 0;
float mi = 0.1;
  
void display()
{
  
 mov =  mov + mi ;
 
  
  if (mov > .4 || mov < -.4) {mi = mi * -1; }

  xspeed = (((mouseX-circlex))/120);
  yspeed = (((mouseY-circley))/120);
  circlex += xspeed + mov/2;
  circley += yspeed + mov;

  if (circlex > width) {circlex=width;}
  if (circley >height) {circley=height;}

 
 
 for (int i = 0; i<xpos.length-1; i++){
 
 
   xpos[i] =  xpos[i+1];
   ypos[i] =  ypos[i+1];

}

  xpos[xpos.length-1] = circlex;
  ypos[ypos.length-1] = circley;

for (int i =0;i < xpos.length; i++)
{
noStroke();
fill(255-i*7,0,0,200);
ellipse(xpos[i],ypos[i],((xpos.length)/3)-i,((xpos.length)/2)-i);
}

}

}



