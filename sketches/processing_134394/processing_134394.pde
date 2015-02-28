
Grass[] myGrass;
Poppy[] myPoppy;

void setup(){
  size(900,700);
  myGrass = new Grass[1000];
  for( int i=0; i<myGrass.length; i=i+1){
    myGrass[i] = new Grass( );
  }
    myPoppy = new Poppy[5];
    for( int i=0; i<myPoppy.length; i=i+1){
    myPoppy[i]=new Poppy();
  }
}

void draw(){
  background(255);
  
  //(#BBC1B2,5);
  noStroke();
  fill(#BBC1B2,80);
  rect(0,200,width,height-200);
  
  
  
  //fill(#0E8969);
  //rect(0,200,width,height);
  
  for( int i=0; i<myGrass.length; i=i+1){
    myGrass[i].swing();
    myGrass[i].display();
    myGrass[i].speed();
    myGrass[i].attraction();
    //myGrass[i].debug();
  }
  
    for( int i=0; i<myPoppy.length; i=i+1){
    myPoppy[i].swing();
    myPoppy[i].display();
    myPoppy[i].speed();
    myPoppy[i].attraction();
  }
}

class Grass {
  float endPointX;
  float endPointY;
  float xOffset;
  float x;
  float y;
  float x2;
  float y2;
  float xSpeed;

  Grass( ) {

    x=random(width);
    y=random(200, height);
    x2=x;
    y2=y-random(40, 100);
    endPointY = y-random(90, 120);
    endPointX = x;

    xOffset = random(5);
  }


  void swing() {

    xOffset = xOffset + random(0.08, 0.1);

    float myWind = map(sin(xOffset), -1, 1, -5, 50);
    endPointX = x + myWind;

    //float xWind = x+ random(0.001,00.5);
    //endPointX= x+ xWind;
  }

  void speed() {
    xOffset = xOffset + random(0,0.6);

    float myWindspeed= x+xOffset;
    endPointX= x+myWindspeed;
    //for ( int i=0; i<xOffset; i=i+1){
    
  }
  
  void attraction() {
    xOffset = xOffset - 0.15;
    
    float myWindspeed= x-xOffset;
    endPointX= x-myWindspeed;
  }
 

  void display() {
    noFill();
    strokeWeight(1);
    stroke(#0E8969);
    bezier(x, y, x2, y2, endPointX, endPointY, endPointX, endPointY);
  }
  
  class Poppy {
  float endPointX;
  float endPointY;
  float xOffset;
  float x;
  float y;
  float x2;
  float y2;
  float xSpeed;

  Poppy( ) {

    x=random(width);
    y=random(200, height);
    x2=x;
    y2=y-random(60, 120);
    endPointY = y-random(120,200);
    endPointX = x;

    xOffset = random(5);
  }


  void swing() {

    xOffset = xOffset + random(0, 0.3);

    float myWind = map(sin(xOffset), -1, 1, 0, 30);
    endPointX = x + myWind;

    //float xWind = x+ random(0.001,00.5);
    //endPointX= x+ xWind;
  }

  void speed() {
    xOffset = xOffset + random(0, 0.4);

    float myWindspeed= x+xOffset;
    endPointX= x+myWindspeed;
    //for ( int i=0; i<xOffset; i=i+1){
  }

  void attraction() {
    xOffset = xOffset - 0.15;

    float myWindspeed= x-xOffset;
    endPointX= x-myWindspeed;
  }


  void display() {
    noFill();
    strokeWeight(2);
    stroke(#456A0E);
    bezier(x, y, x2, y2, endPointX, endPointY, endPointX, endPointY);

    pushMatrix();
    noStroke();
    translate(endPointX, endPointY);
    translate(-2, 2);
    fill(#ED3939, 220);
    ellipseMode(CENTER);
    rotate(PI/30);
    ellipse(20, -5, 40, 20);

   

    fill(#ED3939, 220);
    beginShape();
    curveVertex(0, 0);
    curveVertex(40, 2);
    curveVertex(60,-22-random(-1,1));
    curveVertex(40, -44-random(-1,0));
    curveVertex(30, -36-random(0,1));
    curveVertex(20, -44-random(-1,0));
    curveVertex(-0, -50);
    curveVertex(-10, -40-random(0,1));
    curveVertex(-20, -34);
    curveVertex(-10, -10-random(-1,2));
    curveVertex(-8, -6);
    curveVertex(-2, -2-random(-1,1));
    curveVertex(0, 0);
    endShape(CLOSE);
    popMatrix();
  }
}
