
PImage gear1;
PImage gear2;
PImage gear3;
float speed;
float counter;

void setup() {
colorMode(HSB, 255);
 size (500,500);

 background(40,255,100);
 colorMode(HSB, 255);
gear1 = loadImage("gear1.png");
gear2 = loadImage("gear2.png");
gear3 = loadImage("gear3.png");
}

void draw() {
 background(40,255,100);
 counter++;
 //gear 1
  translate(800/2-gear1.width/2, 800/2-gear1.height/2); //it adds 800 to x and y values on the box
  rotate(second()*TWO_PI/360); ///translates 45 degrees to radians so rotates the gear
   translate(-gear1.width/2 , -gear1.height/2 );
   image(gear1, 0, 0);
   
//gear 2
translate(800/2-gear1.width/2, 800/2-gear1.height/2); //it adds 800 to x and y values on the box
  rotate(minute()*TWO_PI/360); ///translates 45 degrees to radians so rotates the gear
   translate(-gear1.width/2, -gear1.height/2);
   image(gear2, 0, 0);
   
//gear 3
translate(width/3-gear3.width/2, height/3-gear3.height/2); //it adds 800 to x and y values on the box
  rotate(hour()*TWO_PI/360); ///translates 45 degrees to radians so rotates the gear
   translate(-gear3.width/2, -gear3.height/2);
   image(gear3, 0, 0);
   
  
}


