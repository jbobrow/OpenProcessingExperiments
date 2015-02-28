
float ax, ay;
PGraphics pg;
//PGraphics pgrap;

void setup() {
  ax = 0;
  ay =0;
  pg = createGraphics(400, 200,P2D);
  pg.beginDraw();
  pg.lights();
  pg.background(255);
  pg.noStroke();
  pg.fill(255,255,0);
  
  pg.rect(0,pg.height/3.5,400,pg.height-(
  2.0*pg.height/3.5));
  //pg.rect(0,pg.height-(pg.height/3.0),100,pg.height/3.0*2.0);
  pg.fill(255);  pg.ellipse(pg.height/5.0,pg.height/2.0,pg.height/5.0,pg.height/5.0);
  pg.textSize(pg.height/7.0);
  pg.textAlign(CENTER);
  pg.fill(0);pg.stroke(0);pg.text("11",pg.height/5.0,pg.height/2.0+(pg.height/5.0/4.0));
  
  pg.endDraw();
  pg.lights();
  //pgrap = createGraphics(500, 500,P3D);
  size(500, 500, P3D);
    
}

void draw() {

  image(pg.get(), 10, 10); 
background(0);
  //image(pgra,0,0);
  ambientLight(200, 200, 200);
  translate(250, 250, -500);
  perspective();
  //(pmouseX-mouseX)
  ax += (250-mouseX)/float(width)*2.0*PI;
  ay += (250-mouseY)/float(height)*2.0*PI;
  rotateY(ax*2);
  rotateZ(ay*2);
  //
  //lights();
  pointLight(255,255,255,250,250,200);

  mysphere(200);
lights();
}

void mysphere(float mag) {
  float hd =15;
  float vd = 15;
  noStroke();
  float x1, x2, x3, x4, y1, y2, y3, y4, z1, z2, z3, z4;
  //pgrap.noStroke();
 beginShape(QUADS);
  texture(pg.get());
  for (int i = 0; i<2.0*vd;i++)
  
  { //fill(vd/i*255,255-(vd/i*255),0);
    
    for (int j = 0;j<hd;j++)
    {

      x1= cos(i/vd*PI*1.0);
      x1*=mag*sin(j/hd*PI);
      x2 = cos((i+1)/vd*PI*1.0);
      x2*=mag*sin(j/hd*PI);
      x3 = cos(i/vd*PI*1.0);
      x3*=mag*sin((j+1)/hd*PI);
      x4 = cos((i+1)/vd*PI*1.0);
      x4*=mag*sin((j+1)/hd*PI);
      y1= cos(j/hd*PI);
      y1*=mag;
      y2=cos(j/hd*PI);
      y2*=mag;
      y3=cos((j+1)/hd*PI);
      y3*=mag;
      y4=cos((j+1)/hd*PI);
      y4*=mag;
      z1= sin(i/vd*PI*1.0);
      z1*=mag*sin(j/hd*PI);
      z2 = sin((i+1)/vd*PI*1.0);
      z2*=mag*sin(j/hd*PI);
      z3 = sin(i/vd*PI*1.0);
      z3*=mag*sin((j+1)/hd*PI);
      z4 = sin((i+1)/vd*PI*1.0);
      z4*=mag*sin((j+1)/hd*PI);
      vertex(x1, y1, z1,i/vd*pg.height,j/(hd*2.0)*pg.width);
      
      
      vertex(x3, y3, z3,i/vd*pg.height,(j+1)/(hd*2.0)*pg.width);
      
      vertex(x4, y4, z4,(i+1)/vd*pg.height,(j+1)/(hd*2.0)*pg.width);
      vertex(x2, y2, z2,(i+1)/vd*pg.height,j/(hd*2.0)*pg.width);

    }
      
  } 
endShape();

}
