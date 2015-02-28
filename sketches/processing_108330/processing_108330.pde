

float vel=0;


void setup() {
  size(400, 400);
}
int zero=0;
int quatre=400;
int uno=100;
int g=200;
int w=100;
int h=50;

void draw() {


  
  fill(random(255), quatre/2, 255, quatre/2);
  noStroke();


  noCursor();
  colorMode(HSB);


  fill(random(255), quatre/2, 255, quatre/2);
  rectMode(CENTER);
  int steps = 6;
  for (int i = 0; i <= steps; i++) {
    float t = i / float(steps);
    float x = curvePoint(5, 5, 73, 73, t);
    float y = curvePoint(26, 26, 24, 61, t);

    x = curvePoint(5, 73, 73, 15, t);
    y = curvePoint(26, 24, 61, 65, t);
  }

  vel= dist(mouseX, mouseY, pmouseX, pmouseY);
  fill(random(255), quatre/2, 255, quatre/2);
  rect(mouseX, mouseY, vel+10, vel+10);
  rect(mouseY, mouseX, vel+10, vel+10);







  if (mousePressed)
    fill(30, 40, 50);//meter cosas

  rect (zero+quatre/2, zero+200, quatre/2-20, quatre/2-20);

  //movimiento imagen




  int counter;// antes meter




    colorMode(HSB);   //colores
  counter = 0;



  counter++;
  noStroke();
  fill(random(255), 200, 255, 200);

  if (mousePressed == true) { //agregar interaccion
    rect(mouseX, mouseY, 20, 20);
  }
  else {
    fill(random(100), 10, 10, 200);
 ellipse(g,g,w,w);
 ellipse(g,g,h,h);
 h++;
   
  }
}



