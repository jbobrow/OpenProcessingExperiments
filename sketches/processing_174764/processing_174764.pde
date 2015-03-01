
import processing.pdf.*;
int n = 4;                          
float Point[][] = new float[n][2];  
int frame = 0;                       
boolean start = false;               
boolean sflag = false;              
color c = color(255,250,144);           
Painting Paint;                     
void setup(){
  size(500, 500);                 
  colorMode(RGB, 255);               
  frameRate(40);                    
  background(255, 200, 200);         
//  beginRecord(PDF, "Draw.pdf");      
  PGraphicsPDF pdf = (PGraphicsPDF)beginRecord(PDF, "Draw.pdf");      //PDFファイルオープン
  smooth();                         
  ellipseMode(CENTER);              
  strokeJoin(ROUND);                
  pdf.strokeJoin(ROUND);
  pdf.strokeCap(ROUND);
}
void keyPressed(){
  if(key == 's'){
   fill(92, 111, 144);
   rect(-20,-20,600,600);
    // endRecord();
  }
  switch(key){
  case 'h':
  fill(255, 200, 200);
  rect(-20,-20,600,600);
 }
}
class Painting{
  int n;
  float Point[][];        
  float norm[];             
  float deg;                
  float sWeight;
  boolean dist_flag;  
  Painting(int _n, float _P[][]){
    this.n = _n;
    this.Point = new float[n][2];
    this.norm  = new float[n-1];
    this.Point[0][0] = _P[0][0];     
    this.Point[0][1] = _P[0][1];       
    for(int i = 1; i < n; i++){
      this.Point[i][0] = _P[i][0];     
      this.Point[i][1] = _P[i][1];      
      this.norm[i-1] = this.calc_norm(this.Point[i-1], this.Point[i]);
    }
  }
  int drawing(float _cur[]){
    boolean dis;
    int i;
    float sW;
    float Dalpha;
    this.Point_update(_cur);       
    float preSW = this.sWeight;
    this.sWeight = calc_weight(this.norm[n-2], 15.0, 0.7, preSW);
    Dalpha = 1.0;
    if(deg < 0.1){
      this.paint_smeared(this.Point[n-1]);
      this.sWeight *= 3.0;
      Dalpha = 2.0;
    }
    if(int(random(1, 10)) == 1){
      this.paint_smeared(this.Point[n-1]);
    }
    if(this.norm[n-2] < this.norm[n-3]*0.1){
   }  
    strokeWeight(this.sWeight);
    this.draw_line(this.Point, this.norm[n-2], Dalpha);    
    return 0;
  }
  int paint_smeared(float _P[]){
    noStroke();
    fill(c);
    for(int i = 0; i < int(random(1, 6)); i++){
      float dripsize = random(1, 10);
      ellipse(_P[0]+random(-50, 50), _P[1]+random(-50, 50), dripsize, dripsize);
    }
    noFill();
    stroke(c);
    return 1;
  }
  float calc_weight(float _norm, float s_max, float walpha, float preSW){
    float weight;
    weight = s_max - _norm*0.2;
    if(weight <= 0.5){
      weight = 0.5;
    }
    return (walpha*weight + (1.0-walpha)*preSW);
  } 
  int draw_line(float _P[][], float _norm, float Dalpha){
    stroke(c);
    noFill();
    float direc_x, direc_y;
    direc_x = (_P[n-3][0]-_P[n-4][0])*Dalpha;
    direc_y = (_P[n-3][1]-_P[n-4][1])*Dalpha;
    bezier(_P[n-3][0], _P[n-3][1], direc_x+_P[n-3][0], direc_y+_P[n-3][1],
           _P[n-2][0], _P[n-2][1], _P[n-2][0], _P[n-2][1]);
    return 0;
  }
  int Point_update(float _cur[]){
    for(int i = 1; i < n-1; i++){
      this.Point[i-1][0] = this.Point[i][0];
      this.Point[i-1][1] = this.Point[i][1];
      this.norm[i-1] = this.norm[i];
    }
    this.Point[n-2][0] = this.Point[n-1][0];
    this.Point[n-2][1] = this.Point[n-1][1];
    this.Point[n-1][0] = _cur[0];
    this.Point[n-1][1] = _cur[1];
    this.norm[n-2] = this.calc_norm(this.Point[n-2], this.Point[n-1]);
    this.deg = this.calc_same(this.Point[n-1], this.Point[n-2], this.Point[n-3]);
    return 0;
  }
  float calc_norm(float _P1[], float _P2[]){
    return(sqrt((_P1[0]-_P2[0])*(_P1[0]-_P2[0]) + (_P1[1]-_P2[1])*(_P1[1]-_P2[1])));
  }
  float calc_same(float _P1[], float _P2[], float _P3[]){
    float theta;
    float product;
    float norm1, norm2;
    float v1[], v2[];
    v1 = new float[2];
    v2 = new float[2];
    v1[0] = _P1[0] - _P2[0]; v1[1] = _P1[1] - _P2[1];
    v2[0] = _P2[0] - _P3[0]; v2[1] = _P2[1] - _P3[1]; 
    product = v1[0]*v2[0] + v1[1]*v2[1];
    norm1 = sqrt(v1[0]*v1[0] + v1[1]*v1[1]);
    norm2 = sqrt(v2[0]*v2[0] + v2[1]*v2[1]);
    return product/(norm1*norm2);
  }
  float calc_degree(float _P1[], float _P2[]){
    float deg;
    float x = _P1[0] - _P2[0];
    float y = _P1[1] - _P2[1];
    deg = acos(x/sqrt(x*x+y*y));
    if(y < 0.0) deg = 360.0*(PI/180.0) - deg;
    if(y == 0 && x >= 0) deg = 0.0;
    return deg;
  } 
}
void draw(){
  float curP[] = new float[2];     
  boolean motion_flag;              
  curP[0] = mouseX;                
  curP[1] = mouseY;                 
  if(mouseX == pmouseX && mouseY == pmouseY){
    motion_flag = false;
  }else{
    motion_flag = true;
    start = true;
  }
//  background(255, 255, 255);
  if(motion_flag == true){
    if(sflag == true){
      Paint.drawing(curP);
    }else{
      Point[frame][0] = curP[0];
      Point[frame][1] = curP[1];
      frame++;
      if(frame >= n){
        sflag = true;                        
        Paint = new Painting(n, Point);     
      }
    }
  }
}



