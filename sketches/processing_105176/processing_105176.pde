
float alphaRed = 0;
float alphaOrange = 0;
float alphaYellow = 0;
float alphaGreen = 0;
float alphaBlue = 0;
float alphaPurple = 0;

void setup(){
  size(720,480);
  
}

void draw(){
  background(255);
  noStroke();

//Closeted Russian Flag

  fill(255,255,255);
  rect(0,0,720,160);
  fill(0,0,255);
  rect(0,160,720,160);
  fill(255,0,0);
  rect(0,320,720,160);

//Gay Russian Flag  
  
  //Red
  fill(255,0,0,alphaRed);
  rect(0,0,720,80);
  //Orange
  fill(255,152,0,alphaOrange);
  rect(0,80,720,80);
  //Yellow
  fill(255,255,0,alphaYellow);
  rect(0,160,720,80);
  //Green
  fill(0,152,0,alphaGreen);
  rect(0,240,720,80);
  //Blue
  fill(0,0,255,alphaBlue);
  rect(0,320,720,80);
  //Purple
  fill(152,0,152,alphaPurple);
  rect(0,400,720,80);

//Coming out

//Red
if (mouseY > 0 && mouseY <80 && mouseX < 720){
  alphaRed = 255;
}

alphaRed= alphaRed-6;

//Orange
if (mouseY > 80 && mouseY <160 && mouseX < 720){
  alphaOrange = 255;
}

alphaOrange= alphaOrange-6;

//Yellow
if (mouseY > 160 && mouseY <240 && mouseX < 720){
  alphaYellow = 255;
}

alphaYellow= alphaYellow-6;
  
//Green
if (mouseY > 240 && mouseY <320 && mouseX < 720){
  alphaGreen = 255;
}

alphaGreen= alphaGreen-6;

//Blue
if (mouseY > 320 && mouseY <400 && mouseX < 720){
  alphaBlue = 255;
}

alphaBlue= alphaBlue-6;

//Purple
if (mouseY > 400 && mouseY <480 && mouseX < 720){
  alphaPurple = 255;
}

alphaPurple= alphaPurple-6;
}
