
// x and y postions
int [] xpos = new int[50];
int [] ypos = new int[50];
float r;
float b;
float g;
float a;
float x= 100;//x gravity
float y= 0; //y gravity
float speed = 0;//gravity
float gravity = .5;//gravity

void setup(){
  size (800, 600);
  smooth();
  
  //initialize
  for (int i=0; i<xpos.length; i++){
  xpos [i]=0;
  ypos [i]=0;
}
}

void draw(){
  background(0);
  rectMode(RADIUS);
  
  //shift array values
  for (int i=0; i <xpos.length-1; i++){
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  //new location
  xpos [xpos.length-1] = mouseX;
  ypos [ypos.length-1] = mouseY;
  
  //draw everything
  for (int i = 0; i < xpos.length; i++) {
   noStroke ();
   fill (r, b, g, a);
   r=random(255-1*2);
   g=random(255-i*2);
   b=random(255-i*2);
   a=random(255-i*2);
   
   ellipse (width/2, y, y, x/2);
   rect (width, height/2, y/8, x/2);
   
   if (y> height){
    speed = speed*-.99;
  }
  if (y<width){
    speed = speed-.05;
  }
   
   //add speed to y location
  y =y +speed;
  //add to gravity to speed
  speed = speed +gravity;
 
    ellipse (xpos[i], ypos[i], i, i);
    ellipse (xpos[i]+50, ypos[i], i*.5, i);
  }
}


