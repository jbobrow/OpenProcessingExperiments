
int numCirX = 41;  //number of horizontal circles
int numCirY = 5;   //number of vertical circles
int dia = 20;      //diameter of every circles
int marginTop = 60;//margin top
int fat = 40;      //make circles fat
float v = 1.9;     //vibration of circles
int i=0;
int mousePosition;
void setup() {
  size(900, 220);
}
void draw() {
  mousePosition = mouseX;
  background(0);
  createCir();
  i++;
}
void createCir() {
  if (mousePosition >600) {//blue
    for (int i = 1; i < numCirX; i++) {
      fill(0, 0, 255/numCirX*i, 70);
      for (int j = 1; j < numCirY ; j++) {
        // stroke(i, 0, 0);
        noStroke();
        ellipse(i*dia+random(-i*v, i*v), j*dia+random(-i*v, i*v)+marginTop, dia+fat, dia+fat );
      }
    }
  }else if (mousePosition >=300 && mousePosition<=600) {//green
  for (int i = 1; i < numCirX; i++) {
    fill(0, 255/numCirX*i, 0, 70);
    for (int j = 1; j < numCirY ; j++) {
      // stroke(i, 0, 0);
      noStroke();
      ellipse(i*dia+random(-i*v, i*v), j*dia+random(-i*v, i*v)+marginTop, dia+fat, dia+fat );
    }
  }
}
else{//red
  for (int i = 1; i < numCirX; i++) {
    fill(255/numCirX*i, 0, 0, 70);
    for (int j = 1; j < numCirY ; j++) {
      // stroke(i, 0, 0);
      noStroke();
      ellipse(i*dia+random(-i*v, i*v), j*dia+random(-i*v, i*v)+marginTop, dia+fat, dia+fat );
    }
  }
}

}

                
                                
