
//week 3 assignment 4

//setting up the background
size(1000,400);
background(100,150,255);
noStroke();
fill(0,255,0);
rect(0,250,width,150);

//the variables that change are "houseD", "posX"
float houseD = 50; //side dimension (w and h) of the house body
float posX = width/16; //X position of the house
float posY = 200; //Y position of the house
int counter = 1;

//loop
while (posX < (width-(width/9))) {
    
    //defining size of house
    if((counter % 2) > 0) {
    houseD = houseD * 1.5;
    }
    
    //dependent positions
    float posR1X = posX - (houseD/10);
    float posR1Y = posY;
    float posR2X = posX + houseD + (houseD/10);
    float posR2Y = posY;
    float posR3X = posX + (houseD/2);
    float posR3Y = posY - (houseD/1.5);
  
    //defining color of house
    if((counter % 2) > 0) {
    fill(255,220,180); //house color is beige
    } else {
    fill(180,221,255);
    }
    
    //continue building house
    rect(posX,posY,houseD,houseD);
    fill(150,0,0); //roof color
    triangle(posR1X,posR1Y,posR2X,posR2Y,posR3X,posR3Y);
    
    //variables
    posX = posX + (width/9);
    counter = counter + 1;
    houseD = 50;
}
