

PImage bg;
int i= 200; ///start posY///
int x = 150; //start posX///
int y = 180;
float diam = 30; ///ballsize///
//float diamInc = 5;
int yspeed = 2;
int  distance = 35; ///spacebwtballsize///

void setup(){
  size (800, 534);
  frameRate(20);
  bg = loadImage("street.jpg");
}

void draw(){
  //defining first circle
  background(bg); 
  y = y + yspeed;
   for(int i = 0; i<30; i++) {
     ellipse(x, y+ distance*i ,diam, diam);
//     println(x + " "+ y);
   } 
   fill(255, 0, 0);
   if(y>=250){
     fill(255);
   }
   if(y>=350){
    fill(0,180,0);
   }
    if(y>=450){
     fill(0,0,150);
    }    
}



