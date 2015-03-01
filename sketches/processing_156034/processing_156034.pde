
PImage ohoh;
PFont fonti;

float textPosY = 370;
float fontHeight = 20;
float cirPosX1 = 100;
float cirPosX2 = 500;




void setup(){
  size(600, 400);
     ohoh = loadImage("ohoh.jpg");

      fonti = createFont("Arial", 20);

}

void draw(){
  background(255);
  
    float speed = 5;
    float scale = map(sin(frameCount/speed), -1, 1, 1, 1.6);
    float news = map(cirPosX1, 270, 800, 5, 0);
  //image in back
  image(ohoh, 0 , 0, ohoh.width*news, ohoh.height*news);
  
  
  
  cirPosX1 = cirPosX1 + 1;
  cirPosX2 = cirPosX2 - 1;

fill(255, 0, 0);
ellipse(cirPosX1,200, 35*scale, 35*scale);
fill(0, 0, 255);
ellipse(cirPosX2, 200, 35*scale, 35*scale);

//text
  textPosY = textPosY - 5;
  fontHeight = map(textPosY, 0, height, 10, 100);
 
fill(random(255), random(255), random(255));
textAlign(CENTER);
textFont(fonti);
textSize(fontHeight);
text("Fight!", width/2, textPosY);


}


