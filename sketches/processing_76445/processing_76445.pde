
int height = 800;
int width = 1000;

//sky variables
int weight = 4;
int yspace = 0;
int xspace = 0;
int minLen = 100;
int maxLen = 300;
int endYHeightOffset;
int minYOffset = -30;
int maxYOffset = 30;
int r = 20;
int g = 90;
int b = 150;
int colorFlex = 60;

//star variables
int starMaxRadius = 60;
int starMinRadius = 30;
int maxStars = 10;
int minStars = 3;
int starR = 244;
int starG = 229;
int starB = 134;
int starAlpha1 = 100;
int starAlpha2 = 100;

//hill variables
float hillOneX = 2*(width/3) - 20;
float hillTwoX = 0;
float hillOneWidth = 5*(width/6);
float hillOneHeight = height/2;
float hillTwoWidth = 7*(width/8);
float hillTwoHeight = (3*height)/4;
int hillOneXVariance = 50;
int hillTwoXVariance = 150;
int hillOneHeightVariance = 50;
int hillTwoHeightVariance = 50;
int hillOneWidthVariance = 50;
int hillTwoWidthVariance = 50;

//house variables
int numHouses = 3;
int houseMinWidth = 30;
int houseMaxWidth = 80;



void setup(){

  size(1000, 800);
  noLoop();
  
}

void draw(){

  drawSky();
  drawStars();
  drawHills();
  //drawHouses();
}

void drawSky(){

  strokeWeight(weight);
  
  int y = -50;
  int x = -50;
  int len = (int) random(minLen, maxLen);
  endYHeightOffset = (int) random(minYOffset, maxYOffset);
  int flex;
  while (x < width + 50){
    while(y < height + 50){
      flex = (int) random(-colorFlex, colorFlex);
      //stroke(r + random(-colorFlex, colorFlex), g + random(-colorFlex, colorFlex), b + random(-colorFlex, colorFlex));
      stroke(r + flex, g + flex, b + flex);
      line(x, y, x + len, y + endYHeightOffset);
      y += weight + yspace;
    }
    x = (x + len + xspace);
    y = -50;
    len = (int) random(minLen, maxLen);
    endYHeightOffset = (int) random(minYOffset, maxYOffset);
  }
  
}


void drawStars(){
  int numStars = (int) random(minStars, maxStars);
  int radius;
  int x;
  int y;
  for (int i = 0; i < numStars; i++){
    //stroke(0, starR, starG, starB);
    noStroke();
    fill(starR, starG, starB, starAlpha1);
    radius = (int) random(starMinRadius, starMaxRadius);
    x = (int) random(width);
    y = (int) random(height/2);
    
    ellipse((float) x, (float) y, (float) radius, (float) radius);
    
    //stroke(0, starR - 50, starG - 50, starB - 50);
    fill(starR - 50, starG - 50, starB - 50, starAlpha2);
    radius -= 10;
    
    ellipse((float) x, (float) y, (float) radius, (float) radius);
    
    fill(starR - 100, starG - 100, starB - 100, starAlpha2);
    radius -= 10;
    
    ellipse((float) x, (float) y, (float) radius, (float) radius);
  
  }
  

}

void drawHills(){
  fill(0, 0, 0);
  noStroke();
  float xVariance = random(-hillOneXVariance, hillOneXVariance);
  float heightVariance = random(-hillOneHeightVariance, hillOneHeightVariance);
  float widthVariance = random(-hillOneWidthVariance, hillOneWidthVariance);
  ellipse(hillOneX + xVariance, height, hillOneWidth + widthVariance, hillOneHeight + heightVariance);
  
  xVariance = random(-hillTwoXVariance, hillTwoXVariance);
  heightVariance = random(-hillTwoHeightVariance, hillTwoHeightVariance);
  widthVariance = random(-hillTwoWidthVariance, hillTwoWidthVariance);
  ellipse(hillTwoX + xVariance, height, hillTwoWidth + widthVariance, hillTwoHeight + heightVariance);
  
}

void drawHouses(){
  int houseWidth = (int) random(houseMinWidth, houseMaxWidth);
  int houseX = (int) random(width/3, width - houseWidth);
  fill(0,0,0);
  for (int i = 0; i < numHouses; i++){
    houseWidth = (int) random(houseMinWidth, houseMaxWidth);
    houseX = (int) random(width/3, width - houseWidth);
    rect(houseX, height -  (hillOneHeight - random(150, 180)), houseWidth, hillOneHeight);
  }

}



