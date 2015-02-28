
int totalCrystals = 2;
float [] xposition = new float [totalCrystals];
float [] yposition = new float [totalCrystals];
float [] rotation   = new float [totalCrystals];
float xa  = 250;
float ya  = 200;
float xb  = 200;
float yb  = 300;
float xc  = 250;
float yc  = 450;
float xd  = 300;
float yd  = 300;
float boxSize = 50;
int move = 0;

void setup(){
  noStroke();
  size(500,500);
  background(255);
  for(int i = 0; i < totalCrystals; i++){
    xposition[i] = random(width);
    yposition[i] = random(460,490);
  }
}

void draw(){
  background(255);
  
  noFill();
  stroke(0);
  for(int i = 0; i < totalCrystals; i++){
    rect(xposition[i], yposition[i], boxSize,boxSize);
    //xposition[i] = xposition[i] + cos(50);
    yposition[i] = yposition[i] - 100; //sin(200);
    //rotation[i] = rotation[i] + random(-PI/10.0, PI/10.0);
  
  if(yposition[i] < 400){
    yposition[i] = 400;
  }
     for(int i2 = 0; i2 < totalCrystals; i2++){
    rect(xposition[i2], yposition[i2], boxSize,boxSize);
    xposition[i2] = xposition[i2] + cos(100);
     }
  
 if (move>0){ 
   
for (int count = 0; count < totalCrystals; count++){
      
      xposition[count]= xposition[count] + (mouseX - xposition[count])/100.0;//to do with the movement following the mouse.
      yposition[i]= yposition[count] + (mouseY - yposition[count])/100.0;// number on end to do with how fast the move into mouse  
      rect(xposition[count], yposition[count], boxSize,boxSize);
      
       
      
}  
 }
  }
}

void mouseMoved() {
  move = 10;//this makes the whole above code make sense
}

