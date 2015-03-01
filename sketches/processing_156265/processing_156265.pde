
int seedVal = 1;
float bgR = 20;
float bgG = 20;
float bgB = 100;

float starPosX;
float starPosY;
float starSize;

void setup (){
  size(1000,1000);

}


void draw() {
    
  //update blue of sky
  bgB = 100 + sin(frameCount*0.01)*100;
  
  background(bgR, bgG, bgB);

  //stars

  fill(255);
  noStroke();
  
  randomSeed(seedVal);

  starPosY = 10;
  ellipseMode(CENTER);
  
  while (starPosY <= height) {
    starPosX = random(0, width);
    starSize = 3 + (sin(frameCount * 0.1)*1.5);

    ellipse(starPosX, starPosY, starSize, starSize);
    starPosY += 10;
    
    if ((dist(mouseX,mouseY,starPosX,starPosY))<=20){
      println("starred");
      
      background(bgR, bgG, bgB);
      
      randomSeed(frameCount);
      starPosY = 10;
    }

  }
}
