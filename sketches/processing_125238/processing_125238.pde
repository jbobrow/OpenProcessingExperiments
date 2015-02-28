
float bob=0;
//int pat=0;
boolean gary;

void setup() {
  size(600, 600);
  gary = false;
}

void draw() {
  line(bob, bob, mouseX, mouseY);
  bob = bob+1.5;
  
  if(bob >= 500) {
    bob = bob-1.5;
  }
  
}
void mouseClicked() {

  if (gary==false) {
    loop();
    gary=true;
  }
  else {
    noLoop();
    gary=false;
  }
}

