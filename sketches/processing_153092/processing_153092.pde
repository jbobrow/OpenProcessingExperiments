

// Konkuk University 


 // Department of Dynamic Media 


 // SOS iDesign 


 // Name: SHIN seo i 


 // ID: 201420084


    


int x = 1; 


int y = 0; 


int x2 = 0; 


int y2 = 0; 


 int xSpeed = 1; 


 int xSpeed2 = 0; 


 int ySpeed = 2; 


 int ySpeed2 = 1; 


void setup() { 


  size(600,600); 


  smooth(); 


} 


void draw() { 


  background(#FAFF71); 


   x = x + xSpeed; 


   y = y + ySpeed; 


   x2 = x2 + xSpeed2; 


   y2 = y2 + ySpeed2; 


  if ((x > width/2) || (x < -1)) { 


    xSpeed = xSpeed * -1; 


  } 


    if ((y > height/2) || (y < 0)) { 


    ySpeed = ySpeed * -1; 


  } 


    if ((x2 > width/2) || (x2 < 0)) { 


    xSpeed2 = xSpeed2 * -1; 


  } 


    if ((y2 > height/2) || (y2 < 0)) { 


    ySpeed2 = ySpeed2 * -1; 


  } 


  stroke(255); 


  strokeWeight(0); 


    


  fill(115,216,y,255); 


  quad(x2,y,width-x2,x2,y,height+y,width-x,width+x); 


  strokeWeight(1); 


  fill(x2,245,y,173); 


  quad(x2,y,x2,width-x,x,height+y2,x2,x); 


  strokeWeight(1); 


  fill(x,240  ,y2,238); 


  quad(x,y2,y2,width-x2,x,width+x,y2,y); 


  strokeWeight(2); 


  fill(y2,244,x,0); 


  quad(x,y,width-x,width+x,height*0.2,width-x,width*0.6,y2); 


  strokeWeight(3); 


  fill(x,50,y,0); 


  quad(height-y,x2,y2,width+x,x,height-y,height*0.6,x); 


  strokeWeight(10); 


  fill(255,145,0,x); 


  quad(x,y,width-x,x2,y2,height+y,width-x2,width+x2); 


} 
