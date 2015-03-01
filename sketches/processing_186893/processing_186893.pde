

void setup(){
  size (500,500);
  background( 30,144,255);
  frameRate (5);
}

int a=0;
int b=0;
int pet= 15;
float angolo = (360/15);

void draw (){
 translate(mouseX, mouseY);
 for( a= 0; a<pet; a++){
    rotate(radians(angolo));
   if(mousePressed==true){
   fill (random (250),255,252);
    triangle (a, b, 58, 30, 76, 75);
 }
 }
}
