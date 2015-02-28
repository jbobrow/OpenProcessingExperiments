
float rmax, angle, x1, x2, y1, y2, anX, anY;
float rotx = PI;
float roty = 0;


void setup()
{
  size (700, 500, P3D);
  background(128);
  smooth();
  background(0);
}

void draw()
{
  background (0);
  translate(300, 300, 0);
  rotateX(rotx);
  rotateY(roty);
  angle = ((2*PI/width)*(mouseX-width/2));
  smooth();    

  marcoRef(200);

  anX=map(mouseX, 0, width, -PI, PI);
  anY=map(mouseY, 0, height, -PI, PI);

  pushMatrix();     
  stroke(245, 17, 17);
  rotateY(anX);
  rotateZ(anY);
  strokeWeight(3);
  line (0, 0, 0, 180, 0, 0);

  lights();
  fill(128);
  stroke(245, 17, 17);  
  translate( 180, 0, 0 );
  rotateY(-4.8);
  rotateZ( radians( frameCount ) );
  drawCylinder( 10, 20, 0, 60 );

  popMatrix();
}


void marcoRef (int l)
{
  //Ejes Coordenados 
  stroke(255);
  line(0, 0, 0, l, 0, 0);//x
  line(0, 0, 0, 0, l, 0);//y
  line(0, 0, 0, 0, 0, l);//z
}

void drawCylinder( int sides, float r1, float r2, float h)
{
  float angle = 360 / sides;
  float halfHeight = h / 2;

  // dibujar parte de arriba del cilindro
  beginShape();
  for (int i = 0; i < sides; i++) 
  {
    float x = cos( radians( i * angle ) ) * r1;
    float y = sin( radians( i * angle ) ) * r1;
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);

  // dibujar parte de abajo del cilindro
  beginShape();
  for (int i = 0; i < sides; i++) 
  {
    float x = cos( radians( i * angle ) ) * r2;
    float y = sin( radians( i * angle ) ) * r2;
    vertex( x, y, halfHeight);
  }
  endShape(CLOSE);

  // dibujar los lados del cilindro
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) 
  {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);
}  

void mouseDragged() 
{
  float rate = 0.001;
  smooth();
  // rotx += (pmouseY-mouseY) * rate;
  // roty += (mouseX-pmouseX) * rate;
  rotx = map(mouseX, 0, width, -PI, PI);
  roty = map(mouseY, 0, width, -PI, PI);
}


