
PImage yellowflower;
PImage purpleflower; 
 
 void setup () {
   size (1000,1000);
   yellowflower = loadImage ("YellowFlower.jpg"); 
   purpleflower = loadImage ("PurpleFlower.jpg");
 }
 
 void draw (){
 tint (random(0,200), random(0,200), random (50,255), 50);
 image (yellowflower,random(0,1000),random(500,1000), random (75,250), random (100,200));
 tint (random(0,255), random(0,255), random (0,255), 50);
 image (purpleflower,random(0,1000),random(0,550),random(75,250),random(100,200));
 tint (random(0,255), random(0,255), random (0,255), 1000);
 fill (255,0,0); 
 line (mouseX, mouseY, 450,100);
 fill (255,0,0);
 line (mouseX, mouseY, 800,700);

 }

