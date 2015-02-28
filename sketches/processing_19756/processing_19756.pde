
float x;
float i;

PFont font;
 
void setup(){
  size(250,250);
  font= createFont("Garamond",20);
background(random(x,225),206,260,9); 
stroke(255);
smooth(); }

void draw (){
  for(int i = 1/2; i < 250; i +=9){
   for(int x=0;x<=width;x+=70){
    strokeWeight(3);
   fill(x,i,i,i); 
     rect(x-40,i,i-103,7);
    fill(x,30,220,11); 
    strokeWeight(5);
    textSize(27);
   text("N6G4N5", mouseX*3,mouseY);
   
}
  }
}

