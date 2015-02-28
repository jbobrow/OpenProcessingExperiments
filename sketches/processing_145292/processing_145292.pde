
//face size
float faceWidth;
float faceHeight;

//face position
float faceX;
float faceY;


void setup(){
  size(400, 400);
  background(255);
  smooth();
  
  faceWidth = 200;
  faceHeight= 200;
  
  faceX = width/2; //200
  faceY = height/2; //200
  
}

void draw(){
  background(255);
  
  strokeWeight(1);
  stroke(0);
  fill(245, 191, 133);
  //head
  ellipse(faceX, faceY, faceWidth, faceHeight);
  
  fill(255);

  //eyes
  ellipse(faceX - (faceWidth/4), faceY, faceWidth/5, faceHeight/5);//left eye
  ellipse(faceX + (faceWidth/4), faceY, faceWidth/5, faceHeight/5);
  
  //pupils
  fill(0);
  ellipse(faceX -(faceWidth/4), faceY, faceWidth/10, faceHeight/5);
  ellipse(faceX +(faceWidth/4), faceY, faceWidth/10, faceHeight/5);
 
 
 
 //nose
 fill(255, 0, 0);
 ellipse(faceWidth, faceHeight*1.1, faceWidth/6, faceHeight/6);
 
 //redlipse
 strokeWeight(18);
 stroke(255, 0, 0);
 line(faceX - (faceWidth/4), faceHeight *1.25, faceX +(faceWidth/4), faceHeight*1.3);
 //blacklips
 strokeWeight(3);
 stroke(0);
 line(faceX - (faceWidth/4), faceHeight *1.25, faceX +(faceWidth/4), faceHeight*1.3);
 
 //eyebrows
 line(faceX -(faceWidth/4), faceHeight/1.2, faceX - (faceWidth/8), faceHeight/1.3);
 line(faceX +(faceWidth/4), faceHeight/1.2, faceX +(faceWidth/8), faceHeight/1.3);
 
 strokeWeight(1);
 fill(12, 219, 245);
 //tear
 ellipse(faceX -(faceWidth/4), faceHeight *1.15, faceWidth/20, faceHeight/20);
 
}



