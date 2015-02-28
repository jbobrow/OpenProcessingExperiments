
int totalSM = 100;
float[] xpos = new float[totalSM];
float[] ypos = new float[totalSM];
float[] squiggles = new float[totalSM];
int monkeysize = 5;
float x=0;
float y=0;
float a=0;
float b=0;
float O=random(TWO_PI);
float L=4;
int move = 0;
 
boolean moving = false;
 
void setup() {
  noStroke();
  size(400,700);
  background(0);
  for(int i = 0; i < totalSM; i++){
    xpos[i] = random(width);
    ypos[i] = random(height);
    squiggles[i] = random(TWO_PI);
  }
}
 
void draw() {
  
  if(dist(pmouseX, pmouseY, mouseX, mouseY) == 0){
    //moving = false;
    if(move>0){
      move = move - 1;
    }
    if(move <= 0){
      noCursor();
    }
 

  }
  
  
  if(move>0){
       
    cursor(HAND);

    for(int count = 0; count < totalSM; count++){
    xpos[count]= xpos[count] + (mouseX - xpos[count])/30;
    ypos[count]= ypos[count] + (mouseY - ypos[count])/30;
     
   fill(255,255,255,100);
   ellipse(xpos[count],ypos[count],monkeysize,monkeysize);
    }
 } 
  fill(0,0,0,30);
  rect(0,0,width,height);
  fill(255,255,255,80);
  for(int i = 0; i < totalSM; i++){
    ellipse(xpos[i], ypos[i], monkeysize, monkeysize);
    xpos[i]=xpos[i]+L*cos(squiggles[i]);
    ypos[i]=ypos[i]+L*sin(squiggles[i]);
    squiggles[i]=squiggles[i]+random(-PI/10.0,PI/10.0);
 
    if(x<0 || y<0 || y>height ||x>width) {
    squiggles[i]=random(TWO_PI);
  }
  }
   
//   
//  
//   
  //else if(moving == false){
//   
//  float x2=x+L*cos(O);
//  float y2=y+L*sin(O);
// 
//   
// 
//  strokeWeight(1);
//  noStroke();
//  fill(255,255,255,80);
// 
//  ellipse(x2,y2,monkeysize,monkeysize);
// 
//  x=x2;
//  y=y2;

//}
// 
}
 
void mouseMoved() {
 //moving = true;
 move = 40;
}
 
void mouseClicked(){
   
}

