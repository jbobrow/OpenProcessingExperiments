
int gridSize = 50, h  = 50, height2, width2;
PImage ground, halfz, grassblades, clouds;
PGraphics[] bladesw, bladesh;
float xoff,zoff,ns=0.08,zs=130;
int[] randn;
float[][] z;

void setup() {
  ground = loadImage("m_grass_ground.png");
  halfz = loadImage("m_grass_halfz.png");
  grassblades = loadImage("m_grassblades.png");
  clouds = loadImage("clouds.png");
  size(900,500,P3D);
  height2 = ground.height;
  width2 = int(width*1.75);
  z = new float[width2/gridSize+2][height2/gridSize+2];
  //grassblades.resize(0,h);
  //colorMode(HSB, 360,100,100);
  ground = seam2(ground);
  halfz = seam2(halfz);
  bladesw = new PGraphics[11];
  bladesh = new PGraphics[11];
  for(int i=0; i<=10; i++) {
    bladesw[i] = seam(grassblades,width2);
    bladesh[i] = seam(grassblades,height2);
  }
  noStroke();
  randn = new int[100];
  for(int i=0; i<randn.length; i++) {
    randn[i] = round(random(10));
  }
  for(int x=0; x<=width2/gridSize; x++) {
    for(int y=0; y<=height2/gridSize; y++) {
      z[x][y] = noise(x*0.16,y*0.16)*400;
    }
  }
  frameRate(14);
}

void draw() {
  if ((mouseX == 0) && (mouseY == 0)) {
    camera(width2/2, height2/2+550+270/1.85, 720-270/50-(250-width2/2+300)/3.5, width2/2, height2/2, 0.0, -0.0, 1.0, 0.0);
  } 
  else {
    camera(width2/2, height2/2+350+mouseY, 320-mouseY/50-(mouseX/2.4-width2/2+400), // eyeX, eyeY, eyeZ
    width2/2, height2/2, 0.0, // centerX, centerY, centerZ
    -0.0, 1.0, 0.0); // upX, upY, upZ
  }
  float nx,ny=0,z1;
  //background(0xffaaeeff);
  background(clouds);
  for(int y=0; y<=height2; y+=gridSize) {
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<=width2; x+=gridSize) {
      texture(ground);
      vertex(x,y,z[x/gridSize][y/gridSize]-h,x,y);
      vertex(x,y+gridSize,z[x/gridSize][y/gridSize+1]-h,x,y+gridSize);
    }
    endShape();
  }
  
  for(int y=0; y<=height2; y+=gridSize) {
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<=width2; x+=gridSize) {
      texture(halfz);
      vertex(x,y,z[x/gridSize][y/gridSize]-h/2,x,y);
      vertex(x,y+gridSize,z[x/gridSize][y/gridSize+1]-h/2,x,y+gridSize);
    }
    endShape();
  }

  for(int y=0; y<=height2; y+=gridSize) {
    nx=xoff;
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<=width2; x+=gridSize) {
      z1=noise(nx,ny,zoff);
      texture(bladesw[randn[y/gridSize]]);
      vertex(x,y,-h+z[x/gridSize][y/gridSize],x,h);
      vertex(x,y+z1*zs-zs/2,z[x/gridSize][y/gridSize+1],x,0);
      nx+=ns;
    }
    endShape();
    ny+=ns;
  }

  nx = xoff;
  for(int x=0; x<=width2; x+=gridSize) {
    ny = 0;
    beginShape(TRIANGLE_STRIP);
    for(int y=0; y<=height2; y+=gridSize) {
      z1=noise(nx,ny,zoff);
      texture(bladesh[randn[x/gridSize]]);
      vertex(x,y,-h+z[x/gridSize][y/gridSize],y,h);
      vertex(x+z1*zs-zs/2,y,z[x/gridSize][y/gridSize+1],y,0);
      ny+=ns;
    }
    nx+=ns;
    endShape();
  }

  zoff+=0.045;
  xoff-=0.06;
}

PGraphics seam(PImage inp, int len) {
  PGraphics ret = createGraphics(len, h, P3D);
  ret.beginDraw();
  for(int i=-round(random(inp.width)); i<=len; i+=inp.width) {
    ret.copy(inp,0,0,inp.width,inp.height,i,0,inp.width,inp.height);
  }
  ret.endDraw();
  return ret;
}

PGraphics seam2(PImage inp) {
  PGraphics ret = createGraphics(3*width, 900, P3D);
  ret.beginDraw();
  for(int i=0; i<=3*width; i+=inp.width) {
    ret.copy(inp,0,0,inp.width,inp.height,i,0,inp.width,inp.height);
  }
  ret.endDraw();
  return ret;
}


