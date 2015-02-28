
particles orbit;
particles orbit1;
particles orbit2;
particles orbit3;
particles orbit4;
particles orbit5;

float mov = 0.1;

void setup() {

  size(300, 300);
  colorMode(HSB);
}
void draw() {
  mov = mov + 0.04;

fill(0,5);
rect(0,0,width,height);


  orbit5 = new particles(mouseX + (sin(mov)*1), mouseY + (cos(mov)*1), 10, 0, 150);
  orbit5.drawParticles();
  orbit4 = new particles(orbit5.x + (cos(mov*3)*30), orbit5.y + (sin(mov)*30), 15, 100, 200);
  orbit4.drawParticles();
  orbit3 = new particles(orbit4.x + (sin(mov*3)*25), orbit4.y + (cos(mov*3)*25), 15, 255, 255);
  orbit3.drawParticles();
  orbit2 = new particles(orbit3.x + (cos(mov*4)*20), orbit3.y + (sin(mov*4)*20),15, 255, 255);
  orbit2.drawParticles();
  orbit1 = new particles(orbit2.x + (sin(mov*5)*15), orbit2.y + (cos(mov*5)*15), 15, 255, 255);
  orbit1.drawParticles();
  orbit = new particles(orbit1.x + (cos(mov*6)*10), orbit1.y + (sin(mov*6)*10), 15, 255, 255);
  orbit.drawParticles();
  
  filter(INVERT);
}


