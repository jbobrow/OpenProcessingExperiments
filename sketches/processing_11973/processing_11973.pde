
boolean stage1=true;

void setup(){
 size(640,480);
 background(100,10,10); 
}

void draw(){

int x=1; /*this is probably pointless but
i'm using it to make multiples of 20 for seconds*/
int s = second();
float randomX=random(width);
float randomY=random(height);
float randomSize=random(40);
//drawCircles(randomX, randomY, randomSize); 
if(stage1==true){
  drawCircles(randomX,randomY,randomSize);
 }else{
   drawCirclesOpposite(randomX,randomY,randomSize);
 }
 
}

void drawCircles(float randomX, float randomY, float randomSize){
  noStroke();
  fill(100,10,10,10);
  rect(0,0,width,height);
  noStroke();
  fill(255);
 ellipse(randomX, randomY, randomSize, randomSize);

}

void drawCirclesOpposite(float randomX, float randomY, float randomSize){
  fill(255,10);
  rect(0,0,width,height);
  noStroke();
  fill(100,10,10);
 ellipse(randomX, randomY, randomSize, randomSize);
 
}

void mouseClicked(){
  if(stage1==true){
    stage1=false;
    println("hi");
  } else {
    stage1=true;
    println("...");
  }
}

