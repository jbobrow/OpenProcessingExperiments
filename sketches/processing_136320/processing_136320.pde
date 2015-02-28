
color sky = color(200, 170, 170);
color sun = color(255, 255, 212);
color buildingColor = color(5, 10, 70);
float sunX = -(width / 12), sunY = -(height / 8);

void setup(){
  size(1200, 800);
  background(255);
  smooth();
  //noLoop();
  noStroke();
  generateSkyline();
}

void drawSkyline(float groundLevel, float minLength, float maxLength, 
      float minHeight, float maxHeight, float swellX, float swellAmount,
      float layer){
  fill(buildingColor);
  float x = 0, y = groundLevel;
  rect(0, groundLevel, width, height - groundLevel);
  while(x < width){
    fill(buildingColor);
    float bLength = random(minLength, maxLength);
    
    float bHeight = (maxHeight - minHeight) * noise(x) + minHeight;
    
    float swellOffset = swellAmount - abs(x - swellX) / 4;
    bHeight += swellOffset;
    
    rect(x, groundLevel - bHeight, bLength + 1, bHeight + groundLevel);
    
    fill(sun);
    
    if(y < bHeight){
      float sideHeight = bHeight - y;
      
      rect(x - 2, groundLevel - bHeight, bLength / 10 + random(2), 
            sideHeight); 
    }
    
    x += bLength;
    y = bHeight;
  }
}

void drawBottomFade(float start, float end, float inc, float a){
  fill(sky, a);
  for(float i = start; i < end; i += inc){
    rect(0, i, width, height - i);
  }
} 

void distanceLayer(float skyAlpha){
  fill(sky, skyAlpha);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void drawSun(float x, float y){
  ellipseMode(CENTER);
  for(int i = 1; i < 70; i++){
    fill(sun, 3);
    ellipse(x, y, i * (height/16), i * (height/16));
  }
}

void mouseClicked(){
  generateSkyline();
}

void generateSkyline(){
  background(255);
  distanceLayer(80);
  
  for(int i = 0; i < 4; i++){
    float ground = height/3 + (i + 1) * i * (height/12);
    float wMin = 5 + i * 3;
    float wMax = (i + 1) * 20;
    float hMin = i * 10;
    float hMax = (i + 1) * (height/6);
    float sX = random(width / 2, width);
    float sA = height/6 + i * (height/12);
    drawBottomFade(ground - (height / 3) * i, ground, 10, 5);
    drawSkyline(ground, wMin, wMax, hMin, hMax, sX, sA, (i + 1)/2);
    distanceLayer(120);
  }
  drawSun(sunX, sunY);
}

void draw(){
  if(mousePressed && mouseButton == RIGHT){
    generateSkyline();
  }
  if(keyPressed){
    if(key == 's' || key == 'S'){
      save("cityscape_generator_result.png");
    }
  }
}


