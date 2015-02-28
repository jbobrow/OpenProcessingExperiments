
  float y = 0;
  float x = 0;
  float z = 0;
  float w = 0;
  int i = 0;





void setup(){
  

  size(600,600);
   background(10);

  
  y=250;
  x=0;
  z=360;
  w=0;
  
  noStroke();
   
  
}

void draw (){
  

  if (i<10){
   i++; 
  }
  else{
    stroke(102,255,102);
    strokeWeight(5);
    line(x,y,w,z);
    i = 0;
  }
  
  fill(0,10);
  rect(0,0,width,height);
  noStroke();
  fill (#E52525);
  ellipse(x,y,20,20);
  x +=5;
  y+=sin(radians(x))*5;
  draw2();
  
}
void draw2(){
  fill(0,10);
 rect(0,0,width,height);
 
   fill (#1F24FF);
   ellipse(w,z,20,20);
   w +=5;
   z+=sin(radians(-w))*5;
   
  if( x >width ) {
    x = 0;
    y = 250;
  }
  
    if( w >width ) {
    w = 0;
    z = 360;
  }
  
 
}









