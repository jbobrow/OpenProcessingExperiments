
float rmax, angle, x1, x2, y1, y2, anX, anY;
float rotx = PI/4;
float roty = PI/4;


void setup()
{
  size (700, 500, P3D);
  background(128);
  smooth();
}

void draw()
{
  background (0);
  rotateX(rotx);
  rotateY(roty);
  angle = ((2*PI/width)*(mouseX-width/2));
  smooth();    

  //Ejes Coordenados 
  stroke(255);
  line(300, 300, 0, 800, 400, 400);//x
  line(300, 300, 0, 0, 300, 500);//y
  line(300, 300, 0, 800, 400, 5000);//z

  anX=map(mouseX, 0, width, -PI, PI);
  anY=map(mouseY, 0, height, -PI, PI);

  pushMatrix();     
  translate(300, 300, 0);
  stroke(245, 17, 17);
  rotateY(anX);
  rotateZ(anY);
  strokeWeight(3);
  line (0, 0, 0, 180, 0, 0);

  lights();
  fill(128);
  stroke(245, 17, 17);  
  translate( 180, 0, 0 );
  rotateY(300);
  rotateZ( radians( frameCount ) );
  drawCylinder( 8, 50, 5, 100 );

  //translate(180, 0, 0);
  //sphere(38);
  //ellipse(180,0,50,50);
  popMatrix();
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
  float rate = 0.01;
  smooth();
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}



