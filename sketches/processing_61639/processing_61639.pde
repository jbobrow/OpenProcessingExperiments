
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/61639*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int mag = 100;
int r = 50;
byte mode = 0;

float[][] vrot = new float[8][3];
int[][] pts = new int[8][2];
float xtheta = 0, ytheta = 0, ztheta = 0;
float scale = 500;
int wid = 400, hgt = 400;

void setup() {
  size(wid, hgt);
  background(255);
  frameRate(60);
  rectMode(CENTER);
  textFont(loadFont("Tahoma.vlw"));
  textAlign(LEFT);
}

void mousePressed()
{
  mode = (byte)((mode + 1) % 2);
}

void draw() {
  background(255);
  xtheta += 0.01f;
  ytheta += 0.01f;
  ztheta += 0.01f;
  //vrotiply by matrix
  for (int i = 0; i < verts.length; i++)
  {
    vrot[i][0] = verts[i][0];
    vrot[i][1] = verts[i][1];
    vrot[i][2] = verts[i][2];
    
    float a,b;
    
    //xrot
    a = vrot[i][1] * cos(xtheta) - vrot[i][2] * sin(xtheta);
    b = vrot[i][1] * sin(xtheta) + vrot[i][2] * cos(xtheta);
    vrot[i][1] = a; 
    vrot[i][2] = b;
    
    //yrot
    a = vrot[i][2] * sin(ytheta) + vrot[i][0] * cos(ytheta);
    b = vrot[i][2] * cos(ytheta) - vrot[i][0] * sin(ytheta);
    vrot[i][0] = a; 
    vrot[i][2] = b;
    
    //zrot
    a = vrot[i][0] * cos(ztheta) - vrot[i][1] * sin(ztheta);
    b = vrot[i][0] * sin(ztheta) + vrot[i][1] * cos(ztheta);
    vrot[i][0] = a; 
    vrot[i][1] = b;

    if (mode == 1) //orthagonal
    {
      pts[i][0] = (int)vrot[i][0] + (wid >> 1);
      pts[i][1] = (int)vrot[i][1] + (hgt >> 1);
    }
    else //projectional
    {
      pts[i][0] = (int)((vrot[i][0] * wid) / (vrot[i][2] + scale)) + (wid >> 1);
      pts[i][1] = (int)((vrot[i][1] * hgt) / (vrot[i][2] + scale)) + (hgt >> 1);
    }
    
    rect(pts[i][0], pts[i][1], 2, 2);
    fill(0);
    //String coords = String.format(("x: %f y: %f z: %f"), vrot[i][0], vrot[i][1], vrot[i][2]);
    String coords = String.format(("x: %d y: %d z: %d"), (int)vrot[i][0], (int)vrot[i][1], (int)vrot[i][2]);
    //text(coords, pts[i][0] + 4, pts[i][1] + 4);
    text(coords, 2, 10 + i * 10);
  }
  line(pts[0][0], pts[0][1], pts[1][0], pts[1][1]);
  line(pts[0][0], pts[0][1], pts[3][0], pts[3][1]);
  line(pts[0][0], pts[0][1], pts[4][0], pts[4][1]);
  line(pts[1][0], pts[1][1], pts[5][0], pts[5][1]);
  line(pts[1][0], pts[1][1], pts[2][0], pts[2][1]);
  line(pts[2][0], pts[2][1], pts[6][0], pts[6][1]);
  line(pts[2][0], pts[2][1], pts[3][0], pts[3][1]);
  line(pts[3][0], pts[3][1], pts[7][0], pts[7][1]);
  line(pts[5][0], pts[5][1], pts[6][0], pts[6][1]);
  line(pts[5][0], pts[5][1], pts[4][0], pts[4][1]);
  line(pts[7][0], pts[7][1], pts[6][0], pts[6][1]);
  line(pts[7][0], pts[7][1], pts[4][0], pts[4][1]);
}

float[][] verts = {
  {
    -mag, -mag, -mag
  }
  , 
  {
    -mag, mag, -mag
  }
  , 
  {
    mag, mag, -mag
  }
  , 
  {
    mag, -mag, -mag
  }
  , 
  {
    -mag, -mag, mag
  }
  , 
  {
    -mag, mag, mag
  }
  , 
  {
    mag, mag, mag
  }
  , 
  {
    mag, -mag, mag
  }
};


