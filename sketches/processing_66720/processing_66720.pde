
float sunY;
int sunSpeed;
int sunRadiance;
float xR; //this means x's radiance
float yR; //this means y's radiance


void setup(){
  size(400, 400);
  noStroke();
  smooth();
  
  sunY = 400;
  sunSpeed = 4;
  
  sunRadiance = 70;
}

            //FUNCTIONS

//Ocean
void horizonBrighter(float y){
  for(int i = 0; i < 100; i++){
    fill(0, 0+y/2, 255 - i);
    rect(0, 300 + i, width, 1);
  }
}

//Sky
void skyBrighter(float y){
  for(int i = 0; i < 400; i++){
    fill(150-y, 255-y, 3*(255-y));
    rect(0, i, width, 4);
  }
}


////THIS IS FOR THE SUN GLOW --- PROBLEM
////Sun Radiance Glowing
//void sunGlow(float xR, float yR){
//    noFill();
//    stroke(255, 255, 0);
//    ellipse(width/2, height/4, xR, yR);
//    xR = sunRadiance + 1;
//    yR = sunRadiance + 1;
//}

            //VOID DRAW

void draw(){
  skyBrighter(sunY);
  
  //the sun
  fill(255, 255, 0);
  ellipse(width/2, sunY, 70, 70);
  sunY -= sunSpeed;
  
  horizonBrighter(sunY);
  
  if(sunY == height/4){
    noLoop();
    //the sun's face
    fill(0);
    ellipse(190, 95, 5, 10);
    ellipse(210, 95, 5, 10);
    fill(255, 50, 50);
    arc(width/2, 110, 25, 25, 0, PI);
  }
  
  
////THIS PART IS FOR SUN GLOW ---PROBLEM
//  if(sunY == height/4){
//    sunGlow(xR, yR);
//  }
}

