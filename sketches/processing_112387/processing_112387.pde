
/* @pjs font="Belleza-Regular.ttf" ; */
/* @pjs preload="tree800x600.jpg" ; */

PFont MyFont ;
PImage tree ;

//import ddf.minim.*;

//AudioPlayer player;
//Minim minim;


int y = 100;
int yx = 1000;

int y2 = 100;

int z = 0;

int q = 0;

void setup() {
  


MyFont = createFont("Belleza-Regular.ttf", 48) ;
textFont(MyFont) ;
  
//  minim = new Minim(this);
//  player = minim.loadFile("music.mp3", 2048) ;
//  player.play();
  
size(800, 600);

//PFont santina ;

tree = loadImage("tree800x600.jpg");
//santina = loadFont("Santina-48.vlw");

textFont(MyFont, 48);


image(tree, 0, 0, 800, 600);

}

void draw() {
 
  background(tree);
  
  q = q + 1 ;
  
  
  if (q > 60) {
    
  
 if (y != yx) { 
  fill(#2F49C4);
  text("The world is a          to most.", 10, 100);
  fill(#D5D9EA);
  text("blur", 317, 100);
  fill(#CDD4F5);
  text("blur", 290, y2);
  fill(#172B8E);
  text("blur", 300, 100);
  fill(#DEE3F7);
  text("blur", 300, y);
  
  y = y + 1;
  y2 = y2 - 1;
  
  if (y > 200) {
   y = yx ; 
   y2 = yx;
  }
 }
  if (y == yx) {
    
    z = z + 1;
    
    if (z > 30) {
   // PFont santina;
    //santina = loadFont("Santina-48.vlw");
    textFont(MyFont, 60);
    fill(#2F49C4);
    text("Most", 150, 230);
    
   if (z > 100){
     
     background(#FFFFFF);
     
     textFont(MyFont, 60);
     fill(#2F49C4);
     text("Most", 150, 230);
     
     textFont(MyFont, 25);
     fill(#000000);
     text("see a tree as a tree.", 550, 250);
     
     if (z > 200) {
      
       background(#FFFFFF);
       
     }
     
     if (z > 230) {
       
       //PFont simsun ;
      // simsun = loadFont("SimSun-48.vlw");
       
       background(#FFFFFF);
       textFont(MyFont, 20);
       text("The day you actually see", 30, 500);
       
       if (z > 300) {
        
         textFont(MyFont, 48);
         text("when the world is not the", 30, 300);
         textFont(MyFont, 75);
         text("same world", 430, 370);
         
         if (z > 425) {
          
          background(#000000);
          
          if (z > 475) {
           
           textFont(MyFont, 75);
           fill(#2F49C4);
           text("a tree is no longer a tree.", 25, 313 );
            
          }
          
           
         }
         
       }
       
     }
     
    
   }
   
   
  }
}
}

}


