
/* oscillation by Ira Greenberg's Sine Console */
float px, py;
float angle;
float angle2;
float frequency = 4;/////////////////////////////////////
float frequency2 = 5;////////////////////////////////////
float radius = 90;
float pangle1;
float pangle2;

void setup() {
  size(200, 200);
}

void draw() {
  background(190.20);
  smooth();
  stroke(0);
  for (float meg = 0.0; meg < 360.0; meg+=0.2) {//////////////////////
    float angle = frequency*radians(meg);/////////////////////////////
    float angle2 = frequency2*radians(meg);///////////////////////////
    float w = 50 + cos (angle) *radius/2;/////////////////////////////
    float z = height/2 + sin (angle2) * radius/2;/////////////////////
    strokeWeight(1);//////////////////////////////////////////////////
    point(50+w, z);///////////////////////////////////////////////////
  }///////////////////////////////////////////////////////////////////
  px = width/2 + cos(-radians(angle))*(radius/2);/////////////////////
  py = height/2 + sin(-radians(angle2))*(radius/2);///////////////////
  angle -= 0.5*frequency;/////////////////////////////////////////////
  angle2 -= 0.5*frequency2;///////////////////////////////////////////
  line(51, py, 150, py);  //stecca1
  line(px, 51, px, 150); //stecca2
  stroke(255);
  strokeWeight(7);
  point(45, 35);   //occhio1
  point(35, 45);   //occhio2
  point(px, py);   //ONDA PUNTO
  strokeWeight(3);
  stroke(0);
  point(46, 36);   //iride
  point(36, 46);   //iride
  strokeWeight(20);
  point(40, py);   //mano
  point(px, 40);   //mano
  stroke(250, 100);
  stroke(150, 50, 60, 60);
  line(10, 50, 50, 10); // spalle
  line(100, 10, 50, 10); 
  line(100, 10, px, 40); //braccio
  line(10, 100, 10, 50); 
  line(10, 100, 40, py); //braccio
  line(40, 120, 70, 190); 
  line(70, 190, 10, 175); 
  line(10, 175, 10, 190); 
  line(60, 110, 130, 120); 
  line(130, 120, 120, 190); 
  line(120, 190, 135, 190); 
  strokeWeight(40);
  point(30, 30);  //testa
  line(25, 40, 50, 110);
}
