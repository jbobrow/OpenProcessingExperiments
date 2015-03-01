
int x = 0;
int y = 0;
int speedX = 3;
int speedY = 2;
float balloonX = x;
float balloonY = 120;  //balloon positioning
float bScaleX = 50;
float bScaleY = 60;
float stringX2 = x;          //string locations
float stringY2 = balloonY + 30;
float stringX1 = stringX2 + bScaleX/3;
float stringY1 = stringY2 + bScaleY/3;
float houseX = 50;        // house position for x
float houseY = 50;        // house position for y
float houseH = 100;        //house height
float houseW = 80;        //house width
float roof1X = houseX;          //roof positions
float roof1Y = houseY;
float roof2X = houseW + houseX;
float roof2Y = houseY;
float roof3X = houseX + houseW/2;
float roof3Y = houseY - houseH/3;
float randLocX1 = random(50,300);            //random variables for house position
float randLocY1 = random(50, 300);
float randLocX2 = random(50, 300);
float randLocY2 = random(50, 300);

void setup(){
  size(600,600);            //size of window
}

void drawHouse(float houseX, float houseY, float houseH, float houseW){
  fill(255, 215, 240);                          //sets color
  rect(houseX, houseY, houseW, houseH);              //sets random house
  triangle (houseX, houseY, houseX + houseW / 2, houseY - houseH / 3, houseX + houseW, houseY);
 triangle(houseX, houseY, houseX + houseW / 2, houseY - houseH / 3, houseX + houseW, houseY);

}
void drawBalloon( float r, float g, float b){
  fill(r,g,b);                      //sets color
  ellipse(x,y,bScaleX, bScaleY);          //makes balloon
  line(stringX1 + x, stringY1 + y - 100, stringX2, + y - 100);    //string to balloon
}
  void draw(){
    background(100);          //background color of gray
    x = x + speedX;                  //speed of balloon
    if ((x > width) || ( x < 0)) {        //balloon bounce
      speedX = speedX * -1;
      
    }
    y = y + speedY;
    
    if ((y > width) || (y < 0)) {
      speedY = speedY * -1;
    }
    
    drawHouse(randLocX1, randLocY1, 100, 80); //randomized house
    drawHouse(randLocX2, randLocY2, 100, 80);  //second random house
    drawBalloon(255, 0, 0);              //balloon programming
    
  }
