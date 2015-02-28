
PImage monaLisa;
PImage moustache1;
PImage moustache2;
PImage moustache3;

float xBase;
float speed;
 
boolean clicked; 
 
 
//Actions
 
void setup () {
   size (1024, 768);
   monaLisa = loadImage ("monalisa.jpg");
   moustache1 = loadImage ("moustache1.png");
   moustache2= loadImage("moustache2.png");
   moustache3= loadImage("moustache3.png");
   xBase=-400;
   speed = 10;
   clicked=false;
}
 
void draw () {


//Draw Images from the center
   imageMode(CENTER);
   
   if(clicked==false){
   //Animate Images if no one has clicked
   image (monaLisa, width/2, height/2);
   image (moustache1,xBase, height/2);
   image(moustache2,xBase-400,height/2);
   image(moustache3,xBase  +400,height/2+40);
 
 //Move Base point with the speed var
 xBase = xBase+speed;

//Detect if moustaches are out of the screen
if (xBase>1624){
  //Reset Moustached position
xBase=-500;
}

   }
   
   if (clicked==true){
     //Draw moustaches at the mouseX point
     imageMode(CENTER);
   image (monaLisa, width/2, height/2);
  image (moustache1,mouseX, height/2);
   image(moustache2,mouseX-400,height/2);
   image(moustache3,mouseX+400,height/2+40);
   
   }
 
 //Detect clicks
}
 void mouseClicked() {
   clicked=!clicked;
  }


