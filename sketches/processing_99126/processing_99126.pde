
float ellipseX;
float ellipseY;
PImage flower1, flower2, flower3, leafs, cloud, rain, rainbow;
float speedFlower1;
float speedFlower2;
float speedFlower3;
float op = 100;
int yPosCloud1 = 100;
int yPosCloud2 = 350;
int yPosRain = 100;
int rainbowHeight = 768;
int rainbowWidth = 1024;
int varInt = 0;
float varFloat = 1;
long timer;
long interval = 50;
float theta = 80;

void setup()
{
  size(1024, 768);
  background(0);
  
  //load all the images, that are saved in the same folder as the Processing file
  flower1 = loadImage("flower1.png");
  flower2 = loadImage("flower2.png");
  flower3 = loadImage("flower3.png");
  cloud = loadImage("cloud.png");
  leafs = loadImage("leafs.png");
  rain = loadImage("rain.png");
  rainbow = loadImage("rainbow.png");
  timer = millis() + interval;//put timer in the future
}

void draw (){    
  background(0);
  // set the imageMode to center, to start counting from the center, instead of the 
  // top left corner.
  imageMode(CENTER);
  // set up the timer
  if (timer < millis() ){
    varInt = varInt + 1;
    timer = millis() + interval;//put timer in the future
    theta += 100;
  }

// After 5 seconds, the sun appears. 
if (millis() > 5*1000) {
    fill(255,255,0);
    ellipse(670,yPosCloud2-50,120,120);
   }
   
// After 7 seceonds the rain is created behind the cloud and starts to fall down.
// All raindrops have a slightly different starting position and a different speed.
if (millis() > 7*1000) { 
image (rain, 750, (yPosRain*1.05)+40);
image (rain, 770, (yPosRain*0.95)+60);
image (rain, 790, (yPosRain*1)+70);
image (rain, 810, (yPosRain*0.98)+90);
image (rain, 830, (yPosRain*1.03)+110);
image (rain, 850, (yPosRain*0.99)+115);
image (rain, 870, (yPosRain*1)+130);
image (rain, 890, (yPosRain*1.1)+150);

image (rain, 750, (yPosRain*1.10)+40);
image (rain, 770, (yPosRain*1.06)+60);
image (rain, 790, (yPosRain*0.98)+70);
image (rain, 810, (yPosRain*0.92)+90);
image (rain, 830, (yPosRain*1.13)+110);
image (rain, 850, (yPosRain*1.02)+115);
image (rain, 870, (yPosRain*1.01)+130);
image (rain, 890, (yPosRain*0.95)+150);
yPosRain = yPosRain + 4;
}

// After 12 seconds, the rainbow is created just outside the screen at the bottom
// right corner. It slowly moves into the screen. 
imageMode(CORNER);
if (millis() > 12*1000) { 
image (rainbow, rainbowWidth, rainbowHeight);
if (rainbowWidth >= 700){
  rainbowWidth = rainbowWidth -3;
  rainbowHeight = rainbowHeight -2;
}
}



imageMode(CENTER);
// creating the clouds with a variable Y position.
image(cloud, 850, yPosCloud1);
image (cloud, 600, yPosCloud2);

// during even-numbered seconds (0, 2, 4, 6...), cloud1 moves up and cloud 2 moves 
// down.
  if (second() % 2 == 0) {  
    yPosCloud1 = yPosCloud1 - 1;
    yPosCloud2 = yPosCloud2 + 1;
  }
  //// during uneven-numbered seconds (1, 3, 5, 7...), cloud1 moves down and cloud 
  // 2 moves up. 
    if (second() % 2 == 1) {  
    yPosCloud1 = yPosCloud1 + 1;
    yPosCloud2 = yPosCloud2 - 1;
  }

// The flowers growing, the leafs are growing at half the speed of the flowers. 
// All the flowers are growing at a different speed. 
  noStroke();
  image(leafs,width/6, (height-(speedFlower1/2)));
  stroke(0,146,69);
  strokeWeight(4);
  line(width/6,height,width/6,(height-speedFlower1));
  noStroke();
  image(flower1,width/6,(height-speedFlower1));
  speedFlower1 = speedFlower1 + 8;
  
  noStroke();
  image(leafs,(width/6)*2, (height-(speedFlower2/2)));
  stroke(0,146,69);
  strokeWeight(4);
  line((width/6)*2,height,(width/6)*2,(height-speedFlower2));
  noStroke();
  image(flower2,(width/6)*2,(height-speedFlower2));
  speedFlower2 = speedFlower2 + 4;
  
  noStroke();
  image(leafs,(width/6)*3, (height-(speedFlower3/2)));
  stroke(0,146,69);
  strokeWeight(4);
  line((width/6)*3,height,(width/6)*3,(height-speedFlower3));
  noStroke();
  image(flower3,(width/6)*3,(height-speedFlower3));
  speedFlower3 = speedFlower3 + 10;


// When the flowers have reached their highest point, the flower starts rotating. 
if (speedFlower1 > (height-170)){
  speedFlower1 = height-170;
  fill(0);
  rect((width/6)-75,90,150,150);
  pushMatrix(); 
  rotate( radians ( 75 ) ); // 360 = 2 * PI
  popMatrix();
  pushMatrix();
  translate((width/6), 170);
  rotate(radians(theta));
  translate(-flower1.width/2, -flower1.height/2);
  imageMode(CORNER);
  image(flower1,0,0);
  popMatrix();//sort of boundaries for a rotation translation
}

if (speedFlower2 > (height-220)){
  speedFlower2 = height-220;
  fill(0);
  rect(((width/6)*2)-75,146,150,150);
  pushMatrix(); 
  rotate( radians ( 75 ) ); // 360 = 2 * PI
  popMatrix();
  pushMatrix();
  translate((width/6)*2, 220);
  rotate(radians(theta));
  translate(-flower2.width/2, -flower1.height/2);
  imageMode(CORNER);
  image(flower2,0,0);
  popMatrix();//sort of boundaries for a rotation translation
}

if (speedFlower3 > (height-130)){
   speedFlower3 = height-130;
    fill(0);
  rect(((width/6)*3)-75,50,150,150);
  pushMatrix(); 
  rotate( radians ( 75 ) ); // 360 = 2 * PI
  popMatrix();
  pushMatrix();
  translate((width/6)*3, 130);
  rotate(radians(theta));
  translate(-flower2.width/2, -flower1.height/2);
  imageMode(CORNER);
  image(flower3,0,0);
  popMatrix();//sort of boundaries for a rotation translation
}  
}


