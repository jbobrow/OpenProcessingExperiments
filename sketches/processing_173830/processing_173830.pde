
// "Breathing Text" 2013 / Jaime Rodriguez

float grosor_air = 0;
float grosor_noAir = 0;
float vel_respiracion = 1.8;
float sentido_air = 1;
float sentido_noAir = 0;
float color_air = 255;
float alpha_air = 255;
float alpha_noAir = 0;
int inhalar = 0;
int exhalar = 0;


void setup() {
  size(600, 600);
  smooth();
  noFill();
}

void draw () {
  background(165, 230, 231);

  //movimiento 'AIR'
  //agrandarse
  if (grosor_air <= 1.8) {
    sentido_air = 1;
  }
  //reducirse
  if (grosor_air >= 450) {
    sentido_air = -1;
    inhalar += 1;
  }
  
  //alpha 'NO AIR'
  if ( grosor_air <= 5 && inhalar >= 1) {
    alpha_noAir = 40;
  }

  //movimiento 'NO AIR', color 'AIR', alpha 'AIR'  
  if (grosor_air <= 5) {
    sentido_noAir += 0.1;
    grosor_noAir += sentido_noAir * vel_respiracion;
    color_air -= 1;
    alpha_air -= 3;
  }

  grosor_air += sentido_air * vel_respiracion;

  noAir();
  air();
}

void air() {
  pushMatrix();
  translate(140, 225);
  stroke(color_air, alpha_air);
  strokeWeight(grosor_air);
  // 'A'
  line(0, 150, 70, 0);
  line(70, 0, 140, 150);
  line(21, 105, 119, 105);
  // 'I'
  line(170, 0, 170, 150);
  // 'R'
  line(210, 0, 210, 150);
  line(210, 0, 285, 0); 
  line(210, 85, 280, 85);
  line(278, 85, 320, 150); 
  ellipseMode(CENTER);
  arc(280, 43, 85, 85, radians(-90), radians(90));
  popMatrix();
}

void noAir() {
  stroke(0, alpha_noAir);
  strokeWeight(grosor_noAir);
  //'NO'
  // 'N'
  line(160, 120, 160, 270); 
  line(160, 120, 280, 270); 
  line(280, 120, 280, 270);
  // 'O'
  ellipseMode(CORNER);
  ellipse(300, 120, 140, 150);
  //'AIR'
  pushMatrix();
  translate(120, 240);
  // 'A'
  line(70, 50, 0, 200);
  line(70, 50, 140, 200);
  line(21, 155, 119, 155);
  // 'I'
  line(170, 50, 170, 200);
  // 'R'
  line(210, 50, 210, 200);
  line(210, 50, 285, 50); 
  line(210, 135, 280, 135);
  line(278, 135, 320, 200); 
  noFill();
  arc(238, 50, 85, 85, radians(-90), radians(90));
  popMatrix();
}



