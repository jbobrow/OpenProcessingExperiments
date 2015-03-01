
int accum = 0;   
int lastTime = 0;
int min_dt = 10; 
double Xmin = -2.25; 
double Xmax = 0.75;
double Ymin = -1.5;
double Ymax = 1.5;
int w = 400;      
int h = 400;


double [][][] Z = new double [w][h][2]; 
double [][][] C = new double [w][h][2]; 
boolean [][] M = new boolean [w][h];    
double MAX = 17;                        

int cur_iter = 0;  
int max_iter = 30; 
int min_iter_on_screen = 0; 
float factor = 1;    
color cur_iter_color;
int mag = 1;         

double map(double v, double x0, double y0, double x1, double y1){ 
 return (v-x0)*(y1-x1)/(y0-x0) + x1; 
}

void initVals(){ //set initial values for Z, C, M, etc
 cur_iter = 0;
 min_iter_on_screen = 0;
 for (int i=0; i<w; i++){
   for(int j=0; j<h; j++){      
     C[i][j][0] = map(i, 0, w, Xmin, Xmax);
     C[i][j][1] = map(j, h, 0, Ymin, Ymax);
     Z[i][j][0] = C[i][j][0];
     Z[i][j][1] = C[i][j][1]; 
     M[i][j] = false;
  }
 }
 background(0);
}


void setIterColor(){  
  float val = map(cur_iter, min_iter_on_screen, max_iter, 1, 0);
  val = pow(val, factor);
  val = map(val, 1, 0, 255, 16);
  cur_iter_color = color(val);
}

void iterate(){ 
  cur_iter++;
  setIterColor();
  double z1, z2;
  double MAX2 = MAX*MAX;
  boolean changed = false;
  for (int i=0; i<w; i++){    
  for (int j=0; j<h; j++){
    if (!M[i][j])
    {
      z1 = Z[i][j][0]*Z[i][j][0] - Z[i][j][1]*Z[i][j][1] + C[i][j][0];
      z2 = 2*Z[i][j][0]*Z[i][j][1] + C[i][j][1];
      Z[i][j][0] = z1;
      Z[i][j][1] = z2;
      if (z1*z1 + z2*z2 > MAX2)
      {
        M[i][j] = true;
        pixels[j*w + i] = cur_iter_color; 
        changed = true;
      }
    }    
  }
 } 
 if (!changed){
  min_iter_on_screen++; 
 }
}

void iterateAndUpdate(){ 
  loadPixels();
  iterate();
  updatePixels(); 
}

void setup(){ 
 size(w, h);   
 initVals();
}

void countTime(){ 
  int curTime = millis();  
  accum += curTime - lastTime;
  lastTime = curTime;
}

void draw(){
  countTime();
  if ((accum > min_dt) && (cur_iter < max_iter)){
    iterateAndUpdate();    
    accum -= min_dt;
  }  
}

void keyPressed(){ 
  iterateAndUpdate();
}

void mouseClicked(){ 
  int dir = 1; //zoom direction: 1 = zoom in, -1 = zoom out
  if (mouseButton == RIGHT) {dir = -1;}
  mag += dir;  
  double s = pow(2, -dir); 
  double ww = (Xmax - Xmin)*s;
  double wh = (Ymax - Ymin)*s;
  double cx = map(mouseX, 0, w, Xmin, Xmax);
  double cy = map(mouseY, h, 0, Ymin, Ymax);
  Xmin = cx - ww/2;
  Xmax = cx + ww/2;
  Ymin = cy - wh/2;
  Ymax = cy + wh/2;
 
  factor *= pow(1.5, dir); 
  max_iter *=pow(1.5,dir); 
  initVals(); 
}
