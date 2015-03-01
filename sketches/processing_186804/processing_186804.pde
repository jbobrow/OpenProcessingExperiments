


void setup (){
  size (500,500);
  background (94 , 134,  193);
}

int petalo= 8;
float angolo = (360/petalo);
int a = 0;
void draw() {
  translate (250,250);
 // noStroke();
  fill(255 , 153,  51);
  ellipse (0,-10,60,60);
for (a=0; a < petalo; a++){
 rotate(radians(angolo));
  fill (255  ,255,  102);
 ellipse(0,-50,60,60);
}
strokeWeight(2);
line(0,80,0,400);
fill (34 , 139 , 34);
ellipse (50,100,100,-10);
ellipse (50,150,100,-10);
ellipse (-50,115,100,-10);


}

