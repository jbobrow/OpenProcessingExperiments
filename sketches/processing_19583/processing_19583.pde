
float y = 50.0;	// y position variable 
float speed = 1.0;	// value for speed 
PFont font; //declare variable of Pfont class

void setup(){ 
  size(250,250); 
  smooth(); 
  font = loadFont ("Bodoni-Poster-40.vlw");
  textFont(font); 
} 

void draw(){
   fill(0, 10); // background colour, alpha for motion blur 
   rect(0,0,width+15,height+15); // background shape size of window 
   fill(255); 
   textSize(40);
   text("M2H",y,50);
   y += speed;	
   text("3J3",y+50,200);
   if (y>height){
   y=-30;
   
   fill(random(10,250),30,random(10,200));
   textSize(100);
   text("M",125,125);
   text("2",10,280);
   text("H",-20,60);
   text("3",200,80);
   text("J",190,240);
   }
}



