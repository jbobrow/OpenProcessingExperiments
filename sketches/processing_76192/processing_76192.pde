
PImage img;
PImage img2;
PImage img3;
int dirY = 1;
int dirX = 0;
int ellipseY = 50;
int ellipseX = 250;
int counter = 0;
PFont font;

void setup() {
  size(500,326);
  img = loadImage("dolphinshow.jpg");
  img2 = loadImage("cryingbaby.jpg");
  img3 = loadImage("sardine.jpg");
  frameRate(30);
  font = loadFont("ArialMT-48.vlw");
  textFont(font, 32);
  fill(0,0,0);
  
  
}
void draw() {
  if (frameCount == 2) {
    delay(1000);
  }
  background(img);
  text(counter, 10,30);
  if (ellipseY>326) {
      image(img2,100,50);
    }

  if (ellipseY<0) {
    ellipseY = 0;
    dirY = dirY*-1;
  }
   if (ellipseX<0) {
    ellipseX = 0;
    dirX = dirX*-1;
  }
   if (ellipseX>500) {
    ellipseX = 500;
    dirX = dirX*-1;
  }
 
  
  if (ellipseY<326) {
    ellipseY = ellipseY + 32*dirY;
    fill(255,0,0);
    ellipse(ellipseX,ellipseY,60,60);
    ellipseX = ellipseX - 1*dirX;
  }
  
   if (ellipseY>250 && ellipseY<300 && ellipseX>mouseX-60 && ellipseX<mouseX-1) 
  {
    dirY = -1*dirY;
    ellipseX = ellipseX - 1*dirX;
    dirX = 15;
    fill(255,0,0);
    ellipse(ellipseX,ellipseY,60,60);
    ellipseY = 200;
    counter = counter + 1;
  }
  
  if (ellipseY>250 && ellipseY<300 && ellipseX<mouseX+60 && ellipseX>mouseX+1) 
  {
    dirY = -1*dirY;
    ellipseX = ellipseX + 1*dirX;
    dirX = -15;
    fill(255,0,0);
    ellipse(ellipseX,ellipseY,60,60);
    ellipseY = 200;
    counter = counter + 1;
  }
 
  if (ellipseY>200 && ellipseY < 300 && ellipseX>mouseX-1 && ellipseX<mouseX+1) 
  {
    ellipseY = 200;
    dirY = -1*dirY;
    counter = counter + 1;
    }
    
  if (counter >= 10) {
    dirX = 0;
    dirY = 0;
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
    image(img3, random(0,500),random(0,326), 50,30);
  }
  
    
   
      
    
    println(counter);
 
    
    
 
  if (mouseY>=260) {
  translate(0,0);
  strokeWeight(1);
  fill(75,75,75);
  triangle(mouseX-50,326,mouseX,250,mouseX+50,326);
  fill(0,0,0);
  ellipse(mouseX,255,20,20);
  fill(255,255,255);
  ellipse(mouseX+15,300,25,25);
  fill(255,255,255);
  ellipse(mouseX-15,300,25,25);
  fill(0,0,0);
  ellipse(mouseX+15,290,15,12);
  fill(0,0,0);
  ellipse(mouseX-15,290,15,12);
  strokeWeight(3);
  line(mouseX+10,265,mouseX+35,240);
  line(mouseX-10,265,mouseX-35,240);
  line(mouseX+10,265,mouseX+40,255);
  line(mouseX-10,265,mouseX-40,255);
  line(mouseX+10,265,mouseX+40,270);
  line(mouseX-10,265,mouseX-40,270);
  }
  
  
  if (mouseY<260) {
  translate(0,0);
  strokeWeight(1);
  fill(75,75,75);
  triangle(mouseX-45,326,mouseX,235,mouseX+45,326);
  fill(0,0,0);
  ellipse(mouseX,240,20,20);
  fill(255,255,255);
  ellipse(mouseX+15,285,25,25);
  fill(255,255,255);
  ellipse(mouseX-15,285,25,25);
  fill(0,0,0);
  ellipse(mouseX+15,275,15,12);
  fill(0,0,0);
  ellipse(mouseX-15,275,15,12);
  strokeWeight(3);
  line(mouseX+10,250,mouseX+35,240);
  line(mouseX-10,250,mouseX-35,240);
  line(mouseX+10,250,mouseX+40,255);
  line(mouseX-10,250,mouseX-40,255);
  line(mouseX+10,250,mouseX+40,270);
  line(mouseX-10,250,mouseX-40,270);
  }
  
  
}

