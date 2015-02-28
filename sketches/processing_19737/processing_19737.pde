
PFont font;


void setup(){
size(250, 250);
smooth();
background(#E3BA6A);
font= loadFont("GillSans-Light-30.vlw");
noCursor();

}
 
void draw(){
  background(#E3BA6A);
    fill(#4D686F,250);
   text("L 5 N 3 S 6" ,mouseX, mouseY );
   textFont(font,random(5,50));

 } 
void mouseReleased(){
  fill(#6D756A);
  text("l5n3s6" ,random(mouseX-80,mouseX+80), random(mouseY-60,mouseY+60) );
   textFont(font,random(1,2000));
  fill(#364461);
    text("L5N3S6" ,random(300), random(300) );
   textFont(font,random(80,240));
   
     fill(255);
    text("L5N3S6" ,random(mouseX+100,mouseX-80), random(mouseY-80,mouseY+60) );
   textFont(font,random(80,140));
   
        fill(#BFA374);
    text("L5N3S6" ,random(255), random(255) );
   textFont(font,random(80,140));
   
   
 if(keyPressed){
   if (key == 'c'){
   background(255);
   }
 } 
  
}


