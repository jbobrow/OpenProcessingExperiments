
//dana gloria
//trig hw
//16 November 2011 
PImage b;
float x,y,angle;
void setup() {
  size (800,730); 
  
  background (255);
   tint(360,360,360,80); 
  //x = 0;
  //y = 0;
  angle = 0;
  smooth();
  
 b = loadImage ("trip3.jpg"); 
}
void draw () {
  
  
  if(mouseX < 400) {
    cursor(HAND);
  } else {
    cursor(CROSS);}
   
     PImage b; 
b=loadImage ("trip3.jpg");  
   image (b,0,0); 

    
  
  stroke(240,229,174);
  fill(0,255,0);
  strokeWeight(22);
  strokeJoin(MITER);
strokeCap(PROJECT);

 
  x = cos (radians (angle)) * angle/20 + width/2;
  y = sin (radians (angle)) * angle/20 + height/2;
  

  
  
  ellipse (x,y,40,40); //ellipse (angle,y,5,5); - makles sound waves
  angle+=35; //change pace by decreasing angle > anngle +=.5;
  
  fill(x); // taking x and using that as variable to change the fill 
  //ellipse (width/2, height/2, 350,350); 
  
    
}

  



