

int w = 700;//screen.height;
int h = 400;//screen.height;
int d = w;//600;
float sx,sy,sz;
int count = 0;
 
void setup() {
//  fs = new FullScreen(this);
//  fs.enter();
  size(w, h, P3D);
  frameRate(30);
}
 
void draw() {
  camera(w*3, h*3, d/2, 0, 0, 0, 0, 0,-1);
  if (count<10){
    count += 1;
  }else{
    background(255,100);
   
    count = 0;
  }
  rotateZ(TWO_PI-mouseX*PI/360);
  rotateX(mouseY*PI/360);
  sx= sin(PI/90*frameCount) *w;
  sy= sin(PI/90*frameCount) *h;
  sz= sin(PI/90*frameCount) *d;
  int m = 1;
  for(int k=-m;k<m+1;k++){
    for(int j=-m;j<m+1;j++){
      for(int i=-m;i<m+1;i++){
      fill(0);
        //pushMatrix();
        translate(w*i/m,h*j/m,d*k/m);
        //box(sx/m*2,sy/m*2,sz/m*2);
        fill(0,0,0,50);
        //line(mouseX,mouseY,mouseX,mouseY);
        sphere(1);
        
        box(mouseX/m,mouseX/m,mouseY/m);
        //popMatrix();
     }
    }
  }
}

