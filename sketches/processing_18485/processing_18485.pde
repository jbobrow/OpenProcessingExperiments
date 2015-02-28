
 Cog kolecko = new Cog(12,36,9,125,300,0.02,0);
 Cog kolecko2 = new Cog(12,36,9,197,372,-0.02,0.22);
 Cog bigWheel = new Cog(16,72,16,285,225,0.04,0);
 int cw = 1;
 PImage sword;

 void setup(){
   size(480,700);
   smooth();
   noFill();
   sword = loadImage("sword.png");
   frameRate(30);
 }
 
 void draw(){
   translate(0,30);
   if((mousePressed == true)&&(mouseButton == LEFT)&&(kolecko.getSpeed()>0)){
     cw = -1;
     kolecko.setSpeed(cw*kolecko.getSpeed());
     kolecko2.setSpeed(cw*kolecko2.getSpeed());
     bigWheel.setSpeed(cw*bigWheel.getSpeed());
   }
   if((mousePressed == true)&&(mouseButton == RIGHT)&&(kolecko.getSpeed()<0)){
     cw = 1;
     kolecko.setSpeed(-cw*kolecko.getSpeed());
     kolecko2.setSpeed(-cw*kolecko2.getSpeed());
     bigWheel.setSpeed(-cw*bigWheel.getSpeed());
   }
   
   background(0);
   strokeWeight(4);
   stroke(255,220);
   ellipse(240,275,368,368);
   ellipse(240,275,386,386);
   strokeWeight(1);
   stroke(255);
   pushMatrix();
   kolecko.rotateCog();
   kolecko.display();
   popMatrix();
   pushMatrix();
   kolecko2.rotateCog();
   kolecko2.display();
   popMatrix();
   pushMatrix();
   bigWheel.rotateCog();
   bigWheel.display();
   popMatrix();
   pushMatrix();
   image(sword,100,-40);
   popMatrix();
   
 }

