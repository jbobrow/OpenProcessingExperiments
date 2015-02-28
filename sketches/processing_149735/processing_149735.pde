












int yKoordinate=50;
int xKoordinate=50;
int y2Koordinate=580;
int x2Koordinate=560;

void setup(){
size(700,700);
}
void draw(){
background(180,150,0)
rect(xKoordinate,yKoordinate,80,80);
rect(x2Koordinate,y2Koordinate,80,80);
}
void keyPressed() {
        if (key == 'w') {
        yKoordinate-=10;
      } else if (key == 's'){
        yKoordinate+=10;
}
      if (key == 'i') {
        y2Koordinate-=10;
      } else if (key == 'k') {
        y2Koordinate+=10;
}
        if (key == 'f') {
        rect(585,y2Koordinate-40,30,30); 
 
 }
  }  
