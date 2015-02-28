
PImage feather;
PImage claw;
PImage feather2;
PImage claw2;

void setup(){
  size(300,300);
  feather=loadImage ("feather.jpg");
  claw=loadImage ("claw.jpg");
  feather2=loadImage ("feather2.jpg");
  claw2=loadImage ("claw2.jpg");
}
 void draw(){ 
 
   image (feather, 0, 0);
  tint(250, 300);
   image (claw, 0, 0);
   tint (200, 150);
   image (feather2, 0, 0); 
   tint (250,180);
     image (claw2, mouseX, mouseY);
   
   
   }

