
/* @pjs font="Slackey.ttf"; */
int x = 0;
PFont myFont;
PImage myImage;



void setup() {
  size(500,500);
  
  myFont = createFont("Slackey.ttf", 40);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  
  myImage=loadImage("flowers.jpg");
}



void draw() {
  
  background(100);
  
  image(myImage, 0, 0, width, height);
  
fill(#89EEFF);
noStroke();
ellipse(random(width),random(height),random(15),random(30));

/*ellipse(10, x, 15, 30);*/


  fill(#FFFFFF);
  text("April Showers", x, height/3);
  
  fill(#FFFF00);
  text("Bring May Flowers", x, height/2);
 x+=2;
  
println (x);
  
 if (x > width){
    x = 0;
  }
  
  if (x > height){
    x = 0;
  }
  
/* if (x > 300) {
    x = 300;
  } */
  
 /* if (x < 300){
    x++;
  } */
}


