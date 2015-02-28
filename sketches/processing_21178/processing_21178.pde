

void setup() {
size(480,480);
strokeWeight(4);
smooth();
}

float x=30;//distance to left side
float y1=30;//placement of square 1 on y-axis
float y2=60;//square 2
float y3=90;//square 3
float s=20;//size of square

 void draw(){ //drawing and coloring the squares
      fill(255,0,0);//red
    rect( x, y1, s, s);
      fill(0,255,0);//green
    rect( x,y2, s, s);
      fill(0,0,255);//blue
    rect( x, y3, s, s);

   if (mousePressed == true) //drawing if mouse is pressed
      line(mouseX, mouseY, pmouseX, pmouseY);
   if (mousePressed == true){
      cursor(HAND);//showing hand if mouse is pressed
       } else {
      cursor(ARROW);//showing arrow if mouse not pressed
       }
}
 

void mouseClicked() {
  
  if ((mouseX > x) && (mouseX < x+s) //if clicked within square 1 color red
    && (mouseY > y1) && (mouseY < y1+s)){
  stroke(255,0,0);}
   
  if ((mouseX > x) && (mouseX < x+s) //if clicked within square 2 color red
    && (mouseY > y2) && (mouseY < y2+s)){
  stroke(0,255,0);}
  
    if ((mouseX > x) && (mouseX < x+s) //if clicked within square 3 color red
    && (mouseY > y3) && (mouseY < y3+s)){
  stroke(0,0,255);}
 }


