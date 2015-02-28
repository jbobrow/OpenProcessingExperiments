
// randgrid
// by steven kay, 5 may 2010

boolean[][] grid;
color[][] gridcol;
int[][] gotox;
int[][] gotoy;
boolean mode;
int SIZE=8;
int CELLSIZE=8;
color from;
color to;
color curr;
float fc;

void setup() {
  size(512,512,P3D);
  grid=new boolean[SIZE][SIZE];
  gridcol=new color[SIZE][SIZE];
  for (int i=0;i<SIZE;i++) {
    for (int j=0;j<SIZE;j++) {
      gridcol[i][j]=color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    }
  }

  gotox=new int[512][512];
  gotoy=new int[512][512];
  
  // set up projection/distortion map
  for (int y=0;y<512;y++) {
    for (int x=0;x<512;x++) {
      gotox[y][x]=(x+50+int(50.0*(sin(float(y)/100.0))))%512;
      gotoy[y][x]=(y+50+int(50.0*(cos(float(x)/100.0))))%512;
    }
  };
  fc=0.;
  from=color(0);
  to=color(255);
  curr=color(255);
}

void keyPressed() {
  if (key=='-' && CELLSIZE>1) CELLSIZE-=1;
  if (key=='=' && CELLSIZE<16) CELLSIZE+=1;
  if (key==' ') mode=!mode;
}

void mousePressed() {
  // set up projection/distortion map
  int my=mouseY;
  int mx=mouseX;
  for (int y=0;y<512;y++) {
    for (int x=0;x<512;x++) {
      gotox[y][x]=(x+mx+int(mx*(sin(float(y)/100.0))))%512;
      gotoy[y][x]=(y+my+int(my*(cos(float(x)/100.0))))%512;
      // these settings also interesting
      //gotox[y][x]=(x+50+int(50*(sin(float(y)/mx))))%512;
      //gotoy[y][x]=(y+50+int(50*(cos(float(x)/my))))%512;
    }
  };  
}

void draw() {
  int x=int(random(0,SIZE));
  int y=int(random(0,SIZE));
  int xm,xmo,xm2;
  int ym,ymo,ym2;
  grid[x][y]=!grid[x][y];
  gridcol[x][y]=color(random(0,255),random(0,255),random(0,255));
  loadPixels();
  for (int i=0;i<262144;i++) {
    xmo=(i%512);
    ymo=(i/512);
    xm=gotox[ymo][xmo];
    ym=gotoy[ymo][xmo];
    x=(xm/CELLSIZE);
    y=(ym/CELLSIZE);
    if (mode){
      if (grid[x%SIZE][y%SIZE]) {
        pixels[i]=to;
      } else {
        pixels[i]=from;
      }
    } else {
      pixels[i]=gridcol[x%SIZE][y%SIZE];
    }
  }
  
  updatePixels();
  //if (frameCount%40==0) print(frameRate+" fps\n");
}

