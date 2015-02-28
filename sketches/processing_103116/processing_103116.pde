
particles particle;
particles particle2;
particles particle3;
particles particle4;
particles particle5;
particles particle6;
particles particle7;
int alfa = 130;
int amtAlfa =1;
float amtRadio = 0.5;
float radio = 70;
boolean bol ;
int value = 200;
int amtValue =1;


void setup() {
  size(450, 450);
  frameRate(30);
  ellipseMode(CENTER);
  smooth();
  colorMode(HSB);
  background(0);
}
void draw() {
  if (mousePressed) {
    fill(0, 30);
    rect(0, 0, width, height);
  }
  if (radio<=30||radio>=90) {
    amtRadio = amtRadio *(-1);
  }
  if (alfa<=120||alfa>=201) {
    amtAlfa = amtAlfa *(-1);
  }

  if (value<=60||value>=200) {
    amtValue = amtValue *(-1);
  }
  if(mouseX >= width/2){
   bol = false; 
  }
  if(mouseX <= width/2) {
   bol = true; 
  }
  value = value + amtValue;

  radio= radio + amtRadio;
  alfa = alfa + amtAlfa;


  particle2 = new particles(width/2 + int(sin(alfa)*20), height/2+ int(cos(alfa)*20), radio, alfa, value/3,bol);
  particle2.drawParticles();
  particle3 = new particles(width/2 + int(cos(alfa)*90), height/2+ int(sin(alfa)*90), radio, alfa, value/2,bol);
  particle3.drawParticles();
  particle = new particles(width/2 + int(sin(alfa)*70), height/2+ int(cos(alfa)*70), radio, alfa*2, value,bol);
  particle.drawParticles();
  particle4 = new particles(width/2 + int(sin(radio/2)*90), height/2+ int(cos(radio/2)*90), radio/2, alfa, value/3,bol);
  particle4.drawParticles();
  particle5 = new particles(width/2 + int(sin(alfa/2)*170), height/2+ int(cos(alfa/2)*170), radio/2, alfa, value,bol);
  particle5.drawParticles();
  particle6 = new particles(width/2 + int(cos(value/2)*200), height/2+ int(sin(value/2)*200), radio/2, alfa, value/2,bol);
  
  particle7 = new particles(width/2 + int(sin(radio/2)*220), height/2+ int(cos(radio/2)*220), radio, alfa, value,bol);
  particle7.drawParticles();
  particle6.drawParticles();
}


