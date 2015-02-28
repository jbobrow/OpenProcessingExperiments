
/** hello world

*/


PFont my_font; 
int wordX = -710 ;

void setup() {
  
size(300,300);
background( 80, 80, 80); 
my_font = loadFont("Times-Roman-48.vlw");
textFont(my_font, 54);
}

void draw() {
  
  background(80);
  
  textSize(250);
 text("hi", 25, 300);
 
 textSize(140); 
 text("hello world", wordX, 245);
 
 
 wordX = wordX + 1 ;
 if (wordX > width) {
   wordX = -710 ; 
 }
 
 textSize(200);
 text("lol", 80, 175);
 textSize(50);
 
 text("max was", 10, 45);
  textSize(75);
 text("here!", 1, 75);

}



