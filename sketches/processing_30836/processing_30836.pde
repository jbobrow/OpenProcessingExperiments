
final float C_SIZE   = 100;
final float C_MARGIN =   2;

void setup() {
  size(400, 300, P3D);
}

// 回転用パラメータ
long t;
int mode_RotAxis, mode_RotPos, mode_RotDir;
void draw() {
  background(0);
  fill(255);

  camera();
  lights();
  float cam_dist  = 500;
  float cam_angle = radians(t*0.1);
  camera(cam_dist*cos(cam_angle), -cam_dist, cam_dist*sin(cam_angle),
         0, 0, 0, 0, 1, 0);
  noStroke();
  
  pushMatrix();
  float offset = C_SIZE + C_MARGIN;
  translate(-offset, -offset, -offset);
  
  // ここで回転のモード切り替え
  if((t+=3) % 90 == 0) {
    mode_RotAxis = (int)(random(3));
    mode_RotPos  = (int)(random(3));
    mode_RotDir  = random(1) < 0.5 ? -1 : 1;
  }
  
  translate(offset, offset, offset);
  switch (mode_RotAxis) {
    case 0:
      rotateX(radians(90));
      break;
    case 1:
      rotateY(radians(90));
      break;
  }
  translate(-offset, -offset, -offset);
  
  for(int i = 0; i < 3; i++) {
    for(int j = 0; j < 3; j++) {
      for(int k = 0; k < 3; k++) {
        pushMatrix();
        translate(offset, offset, offset);
        if(k == mode_RotPos) rotateZ(mode_RotDir * radians(t));
        translate(-offset, -offset, -offset);
        translate(i * offset, j * offset, k * offset);
        box(C_SIZE);
        popMatrix();
      }
    }    
  }
  popMatrix();
}

