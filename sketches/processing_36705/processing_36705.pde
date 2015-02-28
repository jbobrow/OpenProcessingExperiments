
void setup() {
  size(300, 300);
  colorMode(RGB,width);
  frameRate(10);
}

int numOfcir=3000;
float rndRadius;
float x=0;
float count=0;
float num=300;

void draw() {
//creating a burberry tartan grid

  rndRadius= height/2; //divides into halve
  noStroke();
 if(numOfcir>0){
   fill(0,0,0,10);
   ellipse(random(width),rndRadius,rndRadius/8,rndRadius/8);
 }
 
 rndRadius= width/2; // divides into fourths
 if(numOfcir>0){
 fill(0,0,0,10);
 ellipse(rndRadius,random(height),rndRadius/8,rndRadius/8);
}
  rndRadius=height/4; //divides into eigths from top
  if (numOfcir>0) {
    noStroke();
    fill(255, 0, 0,10);
    ellipse(random(width), rndRadius, rndRadius/20, rndRadius/20);
  }
 
  rndRadius=width/4; // divides into eighths from left

  if (numOfcir>0) {
    fill(255,0,0,10);
    ellipse(rndRadius, random(height), rndRadius/20, rndRadius/20);
  }
 rndRadius=(height*.75); //divides into twelths from bottom
 if(numOfcir>0){
   fill(255,0,0,10);
   ellipse(random(width),rndRadius,rndRadius/40,rndRadius/40);
 }
 rndRadius=(width*.75); //divides into twelths from right
 if(numOfcir>0){
   fill(255,0,0,10);
   ellipse(rndRadius,random (height),rndRadius/40,rndRadius/40);
 }
  
  if(count < num){ //divides into sixths from on X axis
    if(count % 50 == 0){
      fill(255);
      rect(count * width/num,0,width/num,height);
    }
  }
  if(count<num){
    if(count % 50 == 0){ // divides into thrity-sixths on Y axis
      fill(255);
      rect(0,count * height/num,width,height/num);
    }
  }
  
  rndRadius= random (height); //creates a smokey neutral background
  x=width/2;
  
  if(numOfcir>0){
    fill(222,191,141,10);
    ellipse(rndRadius,random(height),rndRadius/2,rndRadius/2);
  }
  
 
count++;
numOfcir--;
}




