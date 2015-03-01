

void setup(){
  size (500,500);
  background( 30,144,255);
 
  frameRate (5);
}

int a=0;
int b=0;

int pet= 15;
float angolo = (360/15);
float diviso =(360/8);
int pal=8;
void draw(){
 translate(250,250);
 colorMode(HSB);
 for( a= 0; a<pet; a++){
    rotate(radians(angolo));
   fill (random (250),255,252);
    triangle (a, b, 58, 30, 76, 75);
 }
for( a= 0; a<pet; a++){
    rotate(radians(angolo));
   fill (random (250),random(255),252);
    triangle (a, b, 118, 130, 176, 175);
}
for( a= 0; a<pal; a++){
    rotate(radians(diviso));
   fill (random (250),random(255),252);
    ellipse( a,b,15,66);

}

fill(255,250,255);
ellipse(0,0,40,40);
 fill(110,20,236);
ellipse(0,0,20,20); 
  
}




