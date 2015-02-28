
PImage l;  
PImage c;

void setup() {
  size(600,450);
   stroke(0);
  smooth();
  l = loadImage("dearGod.jpg"); 
  image(l,0,0); 
}
void draw(){
  
  fill(0);
   if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  delay(20);

  
if(key=='w')
stroke(#1a1d2b);
 line(mouseX, mouseY, pmouseX, pmouseY);
  
}
/*d to delete*/
if(key=='d'){
   l = loadImage("dearGod.jpg"); 
  image(l, 0, 0); 
} 

}


