
/***************************************************************
 * Wave Add Up  
 * Bin Wang & Glenna Xie - University of Colorado at Boulder
 * Used to help visualize the general solution of wave equation
 * Credits to Ira Greenberg: http://www.processing.org/learning/trig/
 ***************************************************************/

PFont myFont;
float pxf, pxr, pyf, pyr;
float radius = 20;
float anglef;
float angler;
int number = 0; //make it move
boolean mouse = true; // the flag to determine hold/resume
int cordy = 150; // the y cordinate of the center of these two small waves
int cordyt = 350; // the y cordinate of the center of the total waves 
float magni1=2; //magnitude of the small wave
float magni2=2; //magnitude of the total wave
int mode = 1; //mode 1: incident wave, mode 2: reflected wave

void setup()
{
  size(800 ,600);
  background(127);
  myFont = createFont("verdana", 20);
  textFont(myFont);
}

void draw()
{
  // clear the canvas and print the instructions
  background(127);
  text("Click mouse to hold/resume    Press ESC to leave", 220,30);
  text("[LEFT] Reflected Wave     [RIGHT] Incident Wave", width-580,height-60);
  text("[UP] Increase Magnitude  [DOWN] Decrease Magnitude", width-580,height-30);
  text("Total Wave", 5, cordyt);
  // plot the waves and lines
  anglef=number++;
  angler=(-number++);
  stroke(200);
  line(200,0,200,height);
  line(0,cordy,width,cordy);
  line(0,cordyt,width,cordyt);
  for(int i=0; i<width; i++){
  pxf = width/8 + cos(radians(anglef))*(radius); 
  pxr = width/8 + cos(radians(angler))*(radius);
  pyf = magni1*sin(radians(anglef))*(radius);
  pyr = magni2*sin(radians(angler))*(radius);
  //text("px="+px+"py="+py, 100,100);
  anglef -= 2;
  angler -= 2;
  stroke(5);
  point(i, cordy+pyf);
  point(i, cordy+pyr);
  point(i, cordyt+pyf+pyr);
  } 
}

void mousePressed(){
  if(mouse==true)
    frameRate(1);
  else
    frameRate(60);
   mouse=!mouse;
}  

//interaction with users change the magnitude of the incident/relfected wave
void keyPressed() {
  if (key == CODED)
  {
    if(keyCode==UP)
    {
      if(mode==1)
        magni1=magni1*1.2;
      if(mode==2)
        magni2=magni2*1.2;
    }else if(keyCode==DOWN){
      if(mode==1)
        magni1=magni1/1.2;
      if(mode==2)
        magni2=magni2/1.2;
    }else if(keyCode==LEFT){
    mode=2;
    }else if(keyCode==RIGHT){
    mode=1;}       
  }
}


/***************************************************************
 * Wave Add Up  
 * Bin Wang & Glenna Xie - University of Colorado at Boulder
 * Used to help visualize the general solution of wave equation
 * Credits to Ira Greenberg: http://www.processing.org/learning/trig/
 ***************************************************************/

PFont myFont;
float pxf, pxr, pyf, pyr;
float radius = 20;
float anglef;
float angler;
int number = 0; //make it move
boolean mouse = true; // the flag to determine hold/resume
int cordy = 150; // the y cordinate of the center of these two small waves
int cordyt = 350; // the y cordinate of the center of the total waves 
float magni1=2; //magnitude of the small wave
float magni2=2; //magnitude of the total wave
int mode = 1; //mode 1: incident wave, mode 2: reflected wave

void setup()
{
  size(800 ,600);
  background(127);
  myFont = createFont("verdana", 20);
  textFont(myFont);
}

void draw()
{
  // clear the canvas and print the instructions
  background(127);
  text("Click mouse to hold/resume    Press ESC to leave", 220,30);
  text("[LEFT] Reflected Wave     [RIGHT] Incident Wave", width-580,height-60);
  text("[UP] Increase Magnitude  [DOWN] Decrease Magnitude", width-580,height-30);
  text("Total Wave", 5, cordyt);
  // plot the waves and lines
  anglef=number++;
  angler=(-number++);
  stroke(200);
  line(200,0,200,height);
  line(0,cordy,width,cordy);
  line(0,cordyt,width,cordyt);
  for(int i=0; i<width; i++){
  pxf = width/8 + cos(radians(anglef))*(radius); 
  pxr = width/8 + cos(radians(angler))*(radius);
  pyf = magni1*sin(radians(anglef))*(radius);
  pyr = magni2*sin(radians(angler))*(radius);
  //text("px="+px+"py="+py, 100,100);
  anglef -= 2;
  angler -= 2;
  stroke(5);
  point(i, cordy+pyf);
  point(i, cordy+pyr);
  point(i, cordyt+pyf+pyr);
  } 
}

void mousePressed(){
  if(mouse==true)
    frameRate(1);
  else
    frameRate(60);
   mouse=!mouse;
}  

//interaction with users change the magnitude of the incident/relfected wave
void keyPressed() {
  if (key == CODED)
  {
    if(keyCode==UP)
    {
      if(mode==1)
        magni1=magni1*1.2;
      if(mode==2)
        magni2=magni2*1.2;
    }else if(keyCode==DOWN){
      if(mode==1)
        magni1=magni1/1.2;
      if(mode==2)
        magni2=magni2/1.2;
    }else if(keyCode==LEFT){
    mode=2;
    }else if(keyCode==RIGHT){
    mode=1;}       
  }
}




