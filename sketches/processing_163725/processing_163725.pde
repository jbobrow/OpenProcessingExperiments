
int feller = 0;
int sophie = 50;
int lake = 550;
int buckley = 50;
int dog = 0;
void setup () {
size(600, 600);
background (0);
}


void draw () {
  frameRate (15);
  background (0);  
  noStroke ();
    scale (.99);
    fill (44, 64, 121, 150);
    rect (feller, feller, sophie, sophie);
    feller += 10;
    sophie += 10;
    scale (.99);
    rect (lake, dog , buckley, buckley);
    dog += 10;
    lake -= 10;
    buckley += 10;
     if (sophie >600){
      sophie = 50;
    if (feller > 400) {
      feller = 0;
    if (buckley >400){
      buckley = 50;
    if (lake < 0) {
      lake = 550;
      dog = 0;
  
    }
    }
}
    }
}




