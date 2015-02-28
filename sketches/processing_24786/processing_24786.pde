


///////////////////////////////////////////////
///          Edited by Sam Scheib           ///
///////////////////////////////////////////////


//Code for my first wallpaper design


void setup(){
  size(400,800);
  background(0);
  //the white box simply shows you the space your pattern gets drawn in
  
  smooth();
  scale(0.8);
  
  yourFunction();
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  int x = 250;
  int y = 500;
  int s = 200;
  int ez = 0;
  fill(0);
  rect(0,0,500,1000);
  color colour = color(150,0,255);
  stroke(colour);
  noFill();
  
  s = 200;
  for(int i=0;i<4;i++){
    noFill();
    Circles(x,y,s,colour);
    fill(0);
    noStroke();
    rect(x-s/10,y-s/2-2,s/5,s+4);
    s = s-30;
  }
  s = 200;
  x = 0;
  y = 750;
  for(int i=0;i<4;i++){
    noFill();
    Circles(x,y,s,colour);
    fill(0);
    noStroke();
    rect(x-s/2-2,y-s/10,s+4,s/5);
    s = s-30;
  }
  s = 200;
  x = 0;
  y = 250;
  for(int i=0;i<4;i++){
    noFill();
    Circles(x,y,s,colour);
    fill(0);
    noStroke();
    rect(x-s/2-2,y-s/10,s+4,s/5);
    s = s-30;
  }
  s = 200;
  x = 500;
  y = 750;
  for(int i=0;i<4;i++){
    noFill();
    Circles(x,y,s,colour);
    fill(0);
    noStroke();
    rect(x-s/2-2,y-s/10,s+4,s/5);
    s = s-30;
  }
  s = 200;
  x = 500;
  y = 250;
  for(int i=0;i<4;i++){
    noFill();
    Circles(x,y,s,colour);
    fill(0);
    noStroke();
    rect(x-s/2-2,y-s/10,s+4,s/5);
    s = s-30;
  }
  x = 230;
  y = 402;
  int z = 150;
  int ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,z,x,y);
    line(x+1,z,x+1,y);
    line(x-180+ex,0,x,z);
    line(x-181+ex,0,x+1,z);
    x = x+3;
    y = y+15;
    z = z-4;
    ex = ex+3;
    
  }
  x = 230;
  y = 598;
  z = 850;
  ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,z,x,y);
    line(x-1,z,x-1,y);
    line(x-180+ex,1000,x,z);
    line(x-179+ex,1000,x-1,z);
    x = x+3;
    y = y-15;
    z = z+4;
    ex = ex+3;
    
  }
  x = 270;
  y = 402;
  z = 150;
  ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,z,x,y);
    line(x+1,z,x+1,y);
    line(x+180-ex,0,x,z);
    line(x+181-ex,0,x+1,z);
    x = x-3;
    y = y+15;
    z = z-4;
    ex = ex+3;
    
  }
  x = 270;
  y = 598;
  z = 850;
  ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,z,x,y);
    line(x-1,z,x-1,y);
    line(x+180-ex,1000,x,z);
    line(x+179-ex,1000,x-1,z);
    x = x-3;
    y = y-15;
    z = z+4;
    ex = ex+3;
    
  }
  x = 53;
  y = 239;
  z = 220;
  ex = 0;
  ez = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x+1,y,z+1,y);
    line(z,y,z,y-78-ex);
    line(z+1,y,z+1,y-78-ex);
    line(z,y-78-ex,z-195+ez,0);
    line(z+1,y-78-ex,z-194+ez,0);
    x = x+15;
    y = y-3;
    z = z-4;
    ex = ex-7;
    ez = ez-3;
    
  }
  x = 53;
  y = 1000-239;
  z = 220;
  ex = 0;
  ez = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x-1,y,z-1,y);
    line(z,y,z,y+78-ex);
    line(z-1,y,z-1,y+78-ex);
    line(z,y+78-ex,z-195+ez,1000);
    line(z-1,y+78-ex,z-196+ez,1000);
    x = x+15;
    y = y+3;
    z = z-4;
    ex = ex+7;
    ez = ez-3;
    
  }
  x = 500-53;
  y = 239;
  z = 500-220;
  ex = 0;
  ez = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x+1,y,z+1,y);
    line(z,y,z,y-78-ex);
    line(z+1,y,z+1,y-78-ex);
    line(z,y-78-ex,z+195-ez,0);
    line(z+1,y-78-ex,z+194-ez,0);
    x = x-15;
    y = y-3;
    z = z+4;
    ex = ex-7;
    ez = ez-3;
    
  }
  x = 500-53;
  y = 1000-239;
  z = 500-220;
  ex = 0;
  ez = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x-1,y,z-1,y);
    line(z,y,z,y+78-ex);
    line(z-1,y,z-1,y+78-ex);
    line(z,y+78-ex,z+195+ez,1000);
    line(z-1,y+78-ex,z+196+ez,1000);
    x = x-15;
    y = y+3;
    z = z+4;
    ex = ex+7;
    ez = ez+3;
    
  }
  x = 53;
  y = 261;
  z = 220;
  ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x+1,y,z+1,y);
    line(z,y,z,y+78+ex);
    line(z+1,y,z+1,y+78+ex);
    x = x+15;
    y = y+3;
    z = z-4;
    ex = ex-7;
    
  }
  x = 53;
  y = 1000-261;
  z = 220;
  ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x-1,y,z-1,y);
    line(z,y,z,y-78-ex);
    line(z-1,y,z-1,y-78-ex);
    x = x+15;
    y = y-3;
    z = z-4;
    ex = ex-7;
    
  }
  x = 500-53;
  y = 261;
  z = 500-220;
  ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x+1,y,z+1,y);
    line(z,y,z,y+78+ex);
    line(z+1,y,z+1,y+78+ex);
    x = x-15;
    y = y+3;
    z = z+4;
    ex = ex-7;
    
  }
  x = 500-53;
  y = 1000-261;
  z = 500-220;
  ex = 0;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,z,y);
    line(x-1,y,z-1,y);
    line(z,y,z,y-78-ex);
    line(z-1,y,z-1,y-78-ex);
    x = x-15;
    y = y-3;
    z = z+4;
    ex = ex-7;
    
  }
  x = 207;
  y = 327;
  z = 460;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,0,z);
    line(x+1,y,0,z);
    x = x+4;
    y = y+4;
    z = z+6;
    
  }
  x = 500-207;
  y = 327;
  z = 460;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,500,z);
    line(x-1,y,500,z);
    x = x-4;
    y = y+4;
    z = z+6;
    
  }
  x = 207;
  y = 1000-327;
  z = 1000-460;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,0,z);
    line(x+1,y,0,z);
    x = x+4;
    y = y-4;
    z = z-6;
    
  }
  x = 500-207;
  y = 1000-327;
  z = 1000-460;
  for(int i=0;i<4;i++){
    stroke(colour);
    line(x,y,500,z);
    line(x-1,y,500,z);
    x = x-4;
    y = y-4;
    z = z-6;
    
  }
  line(245,0,245,1000);
  line(246,0,246,1000);
  line(255,0,255,1000);
  line(256,0,256,1000);
  Circles(250,500,30,colour);
  Circles(250,0,80,colour);
  Circles(250,1000,80,colour);
  fill(0);
  noStroke();
  rect(247,0,8,1000);
  
  
  
}

void Circles(int x,int y,int s,color c){
  stroke(c);
  ellipse(x,y,s,s);
  ellipse(x,y,s+1,s+1);
  ellipse(x,y,s-1,s-1);
}
/*void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}*/

