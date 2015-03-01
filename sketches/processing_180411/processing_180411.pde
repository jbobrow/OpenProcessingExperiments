
size(500,500);
int numberOfLines=20; //how many lines you want to draw in each scenario
//calculates how far the dots need to be from each other
float halfHeight = height/2;
float halfWidth = width/2;
float dotXDistance=halfWidth/(numberOfLines+1);
float dotYDistance=halfHeight/(numberOfLines+1);
//Draw axes
line(halfWidth, 0, halfWidth, height);
line(0, halfHeight, width, halfHeight);
//Draw lines
float currentRed = 128;
float currentBlue = 128;
float currentGreen = 128;
for (int i = 1; i<=numberOfLines; i++) {
  currentRed = random(255);
  currentBlue = random(255);
  currentGreen = random(255);
  stroke(currentRed, currentBlue, currentGreen);
  float topY = dotYDistance*(i-1);
  float bottomY = height - topY;
  float rightX = i * dotXDistance+halfWidth;
  float leftX = halfWidth - i*dotXDistance;
  line(rightX, halfHeight, halfWidth, topY);
  line(rightX, halfHeight, halfWidth, bottomY);
  line(leftX, halfHeight, halfWidth, topY);
  line(leftX, halfHeight, halfWidth, bottomY);
  line(rightX, 0, width, topY);
  //line(leftX, 0, halfWidth,halfHeight-dotYDistance*i);
  line(rightX, 0, halfWidth,halfHeight-dotYDistance*i);
}
