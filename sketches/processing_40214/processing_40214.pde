
// Di fishah man cyan cross it! GRID ...
 
PImage JAsunset;
 
void setup(){
 size(300,300);
JAsunset = loadImage("Jamaica.JPG");
 
 
}
 
void draw(){
   
 //grid
 for ( int x =0; x<width; x = x+width/5){
  for ( int y = 0; y<height; y = y+height/5){
  image(JAsunset, x,y,width/5,width/5);
  }
 }
}


