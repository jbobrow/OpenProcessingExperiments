
float mov = 100;
particles shadow;
particles shadow2;
particles shadow3;
particles shadow4;
particles shadow5;
particles particle;
particles particle2;
particles particle3;
particles particle4;
particles particle5;
particles particle6;
particles particle7;
boolean turn = false;
int alfa = 250;
int amtAlfa =1;
float amtRadio = 0.5;
float radio = 90;
float var = 22;
float amtVar = 0.1;

void setup() {
  size(640, 480);
 
  ellipseMode(CENTER);

  smooth();

}

void draw() {


  if (radio<=70||radio>=91) {
    amtRadio = amtRadio *(-1);
  }
  if (alfa<=240||alfa>=250) {
    amtAlfa = amtAlfa *(-1);
  }
  if (var<=20||var>=30) {
    amtVar = amtVar *(-1);
  }

  //value ++;
  var = var + amtVar;
  radio= radio + amtRadio;
  alfa = alfa + amtAlfa;
  fill(255, 10);
  rect(0, 0, width, height);
  
  mov = (mov+ 0.03);
  
    if (mousePressed) {
    turn = true;
  }
  else {
    turn = false;
  }
  for (int i =0; i< 100;i+=4) {

    particle = new particles(mouseX + int(sin(mov+i)*(var*3)), mouseY+ int(cos(mov+i)*(var*3)), radio, 0, 0, turn);
    particle.drawParticles();
    particle3 = new particles(particle.x + int(cos((mov*2)+i)*50), particle.y + int(sin((mov*2)+i)*50), radio/2, alfa, 0, turn);
    particle3.drawParticles();
    particle2 = new particles(particle3.x + int(sin((mov*3)+i)*50), particle3.y+ int(cos((mov*3)+i)*50), radio/3, 200, 0, turn);
    particle2.drawParticles();
    ////////////////////////////////////////
    shadow5 = new particles(particle.x + int(asin((mov*5)+i)*30), particle.y + int(sin((mov*5)+i)*30), radio -20, alfa, 0, turn);
    shadow5.drawParticles();
    shadow4 = new particles(shadow5.x + int(cos((mov*7)+i)*50), shadow5.y + int(asin((mov*7)+i)*50), radio -20, alfa, 0, turn);
    shadow4.drawParticles();
    /////////////////////////////////////////////////////////////
    particle4 = new particles(mouseX + int(sin(mov+i)*20), mouseY+ int(cos(mov+i)*20), radio, 150, 255, turn);
    particle4.drawParticles();
    particle5 = new particles(particle2.x + int(cos(mov*4+i/2)*70), particle2.y+ int(sin(mov*4+i/2)*70), radio/7, alfa/2, 0, turn);
    particle5.drawParticles();

  }
}

