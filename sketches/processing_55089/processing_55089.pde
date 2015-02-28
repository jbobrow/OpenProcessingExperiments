
  float posX, posY;
  float radiusX, radiusY;
  float radiusZ, radiusA;
  float theta;
  float beta;
  float posZ,posA;
  
  void setup() {
  size(500,500);
  smooth();
  noStroke();
  
      posX = posY = 0;
      posZ = posA = 0;
      
      radiusX = 130;
      radiusY = 130;
      
      radiusZ = 170;
      radiusA = 170;
      theta = 0;
  }

  void draw(){
  background(#344152);

  theta += 0.1;
  beta += -0.05;

  posX = radiusX * cos( theta );
  posY = radiusY * sin( theta );
  
  posZ = radiusZ * cos( beta );
  posA = radiusA * sin( beta );
  
  translate(150,150);
  fill(#D1E231);
  ellipse(100,100,160,160);
  
  translate(100,100);
  fill(#66CCCC);
  ellipse(posX,posY,30,30);
  
  translate(0,0);
  fill(#E6E8FA);
  ellipse(posZ,posA,40,40);
  
    translate(145,100);
  fill(#000000);
  ellipse(-185,-100,15,15);
  
  fill(#000000);
  ellipse(-100,-100,15,15);
  
  arc(-143, -80, 40, 40, 0, PI/2);
  arc(-143, -80, 40, 40, PI/2, PI);
  }
