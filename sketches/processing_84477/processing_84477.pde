



int W = 1200;
int H = 1200;

float R = 900;
float tras = 0;

Terrain terrain;

void setup() {
  size(800, 600, P3D);

  terrain = new Terrain();
 
}

void keyPressed() {
  noiseSeed((long)random(12222));
  terrain = new Terrain();
}

void draw() {

  background(0);
  
  R = noise(frameCount/5000.0)*1400+200;

  pointLight(255, 250, 200, 0, 0, 1000);
  ambientLight(50, 60, 90);


  camera(R*sin(frameCount/300.0), R*cos(frameCount/300.0), R,
  (noise(frameCount/200.0,0,0)-0.5)*tras, (noise(0,frameCount/200.0,0)-0.5)*tras,(noise(0,0,frameCount/1000.0)-0.5)*tras,
  0, 0, -1);


  translate(-W/2, -H/2, -terrain.elevation/2);


  terrain.drawVec();
}


class Terrain {
  int seed = 30;
  int grid = 24;
  float elevation = 400.0;
  float sc = 300.0;
  ArrayList vec;
  ArrayList normals;

  PImage ground;


  Terrain() {
    computeVertexes();
    computeNormals();
    ground = loadImage("ground.jpg");

    textureMode(NORMAL);
  }

  void computeNormals() {

    normals = new ArrayList();

    for (int i = 0 ; i < vec.size();i+=1) {

      PVector me = (PVector)vec.get(i);
      PVector a = new PVector(me.x, me.y, me.z);
      PVector b = new PVector(me.x, me.y, me.z);
      PVector c = new PVector(me.x, me.y, me.z);
      PVector d = new PVector(me.x, me.y, me.z);


      try {
        a = (PVector)vec.get(i+1);
        b = (PVector)vec.get(i+W/grid);
        c = (PVector)vec.get(i-1);
        d = (PVector)vec.get(i-W/grid);
      }
      catch(Exception e) {
        ;
      }


      PVector ca = new PVector(me.x, me.y, me.z);
      PVector cb = new PVector(me.x, me.y, me.z);
      PVector cc = new PVector(me.x, me.y, me.z);
      PVector cd = new PVector(me.x, me.y, me.z);


      PVector tmp = new PVector(me.x, me.y, me.z);
      me.cross(a, b, ca);
      tmp = new PVector(me.x, me.y, me.z);
      me.cross(b, c, cb);
      tmp = new PVector(me.x, me.y, me.z);
      me.cross(c, d, cc);
      tmp = new PVector(me.x, me.y, me.z);
      me.cross(d, a, cd);

      PVector result = new PVector();
 

      result.x = (ca.x+cb.x+cc.x+cd.x)/4.0;
      result.y = (ca.y+cb.y+cc.y+cd.y)/4.0;
      result.z = (ca.z+cb.z+cc.z+cd.z)/4.0;
 



      normals.add(result);
    }
  }

  void computeVertexes() {
    vec = new ArrayList();

    // noiseSeed(seed);
    for (int y=  0; y < W;y+=grid) {
      for (int x=  0; x < H;x+=grid) {
        vec.add(new PVector(x, y, (noise(x/sc, y/sc))*elevation));
      }
    }
  }

  void drawVec() {
    noStroke();
    for (int i = 0 ; i < vec.size()-W/grid-1;i+=1) {
      fill(255);
      if (i % (W/grid) != W/grid-1) {

        PVector v1 = (PVector)vec.get(i);
        PVector v2 = (PVector)vec.get(i+1);
        PVector v3 = (PVector)vec.get(1+i+(W/grid));
        PVector v4 = (PVector)vec.get(i+(W/grid));     


        PVector n1 = (PVector)normals.get(i);
        PVector n2 = (PVector)normals.get(i+1);
        PVector n3 = (PVector)normals.get(1+i+(W/grid));
        PVector n4 = (PVector)normals.get(i+(W/grid));     

        beginShape();
        tint(lerpColor(#ffffff, #000000, norm(v1.z, elevation, 0)));
        texture(ground);
        normal(n1.x, n1.y, n1.z);
        vertex(v1.x, v1.y, v1.z, norm(v1.x, 0, W), norm(v1.y, 0, H));
        normal(n2.x, n2.y, n2.z);
        vertex(v2.x, v2.y, v2.z, norm(v2.x, 0, W), norm(v2.y, 0, H));
        normal(n3.x, n3.y, n3.z);
        vertex(v3.x, v3.y, v3.z, norm(v3.x, 0, W), norm(v3.y, 0, H));
        normal(n4.x, n4.y, n4.z);
        vertex(v4.x, v4.y, v4.z, norm(v4.x, 0, W), norm(v4.y, 0, H));
        endShape(CLOSE);

        /*
        stroke(#00ff00);
         float mul = 30.0;
         
         line(v1.x,v1.y,v1.z,v1.x+n1.x*mul,v1.y+n1.y*mul,v1.z+n1.z*mul);
         
         line(v2.x,v2.y,v2.z,v2.x+n2.x*mul,v2.y+n2.y*mul,v2.z+n2.z*mul);
         
         line(v3.x,v3.y,v3.z,v3.x+n3.x*mul,v3.y+n3.y*mul,v3.z+n3.z*mul);
         
         line(v4.x,v4.y,v4.z,v4.x+n4.x*mul,v4.y+n4.y*mul,v4.z+n4.z*mul);
         
         noStroke();
         */
      }
    }
  }
}


