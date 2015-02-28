

float zoom = 30;
float[] ls, ns; //last segment, next segment

ArrayList seg = new ArrayList();

void setup(){
  size(400,300,P3D);
  frameRate(60);
  
  ls = new float[6];
  ls[0] = 0.0;
  ls[1] = 0.0;
  ls[2] = 0.0;
  ls[3] = random(4)-2;
  ls[4] = random(4)-2;
  ls[5] = random(4)-2;
  
  extendLine();
  extendLine();
  extendLine();
}

void draw(){
  extendLine();
  
  camera(sin(millis()*0.001)*zoom, 0.0, cos(millis()*0.001)*zoom, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, up
  
  background(0);
  stroke(255);
  
  float[] hs;
  for (int s=0; s<seg.size(); s++){
    hs = (float[])seg.get(s);
    stroke(map(sin(millis()*0.01+s*0.5),-1,1,50,255));
    line( hs[0],hs[1],hs[2], hs[3],hs[4],hs[5] );
  }
}

void extendLine(){
  float[] mv = new float[3]; //mv stands for movement vector
  ns = new float[6];
  
  mv[0] = (ls[3] - ls[0]);
  mv[1] = (ls[4] - ls[1]);
  mv[2] = (ls[5] - ls[2]);
  
  mv[0] += random(0.4)-0.2;
  mv[1] += random(0.4)-0.2;
  mv[2] += random(0.4)-0.2;
  
  ns[0] = ls[3];
  ns[1] = ls[4];
  ns[2] = ls[5];
  
  ns[3] = (ls[3] + mv[0])*0.99;
  ns[4] = (ls[4] + mv[1])*0.99;
  ns[5] = (ls[5] + mv[2])*0.99;
  
  seg.add(ns);
  ls = ns;
}

void keyPressed(){
  extendLine();
}

