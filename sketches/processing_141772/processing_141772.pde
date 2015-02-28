
class Circle{
PVector location;
float ballr;
//Circle(){}

Circle(PVector loc,float ballr_){

  location = loc ;
  ballr = ballr_ ;
}


void display(){
  ellipse(location.x,location.y,ballr,ballr);

}
}


float angle =.0;
float angle2 = .0;
Circle[] planets;
PVector sunloc, earthloc, moonloc,marloc,moon2loc;

void setup() {
  size(1280*3/4, 960*3/4);

  sunloc = new PVector(0, 0);
  earthloc = new PVector(0, 0);
  moonloc = new PVector(0, 0);
  moon2loc = new PVector(0, 0);
  marloc = new PVector(0, 0);
  
  planets = new Circle[6];

  //for(int i=0 ; i<3 ; i++){
  planets[0] = new Circle(sunloc, 100);
  planets[1] = new Circle(earthloc, 40);
  planets[2] = new Circle(earthloc, 20);
  planets[3] = new Circle(marloc, 60);
  planets[4] = new Circle(moon2loc, 30);
  //}
}

void draw() {
  background(220);

  translate(width/2, height/2);
  fill(255, 150, 150);
  planets[0].display();

  pushMatrix();
  rotate(angle);
  translate(150, 0);
  rotate(angle);
  //ellipse(0,0,40,40);
  planets[1].display();
  pushMatrix();
  translate(50, 0);
  rotate(angle);
  planets[2].display();
  popMatrix();
  popMatrix();


  //
  pushMatrix();
  rotate(angle);
  translate(-250, 0);
  rotate(angle);
  //ellipse(0,0,40,40);
  planets[3].display();
  pushMatrix();
  translate(50, 0);
  rotate(angle);
  planets[4].display();
  popMatrix();
  popMatrix();
  angle +=.001;
  angle +=.009;
}


