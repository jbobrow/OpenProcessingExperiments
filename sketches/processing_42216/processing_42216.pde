
  PShape s;


void setup() {
size (300, 300);

smooth ();
noStroke();
noLoop();
}



void draw() {
background (207, 209,194);

 for(int i=0; i<70;i=i+1){
    
  
drawHeart(   ( loadShape("heart.svg") ), int ( random(width) ),int (random(height)), 100, 70    );

}


}


void drawHeart (PShape s, int x, int y, int largh, int alt){
 


smooth();

shape(s, x, y, largh, alt);
  
  
}

