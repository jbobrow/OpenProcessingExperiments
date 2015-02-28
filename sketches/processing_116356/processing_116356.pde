
//number of ciricle
int max = 70;
//array for position of circles
float[]bx=new float[max];
float[]by=new float[max];
int N = 0;
//array for colour
float []r=new float[max];
float []g=new float[max];
float []b=new float[max];
//array for size of the circle
float []s=new float[max];
boolean pressing=true;

//reposition of cicle after mousePressed
void mousePressed() {
  if (N < max ||mouseButton == LEFT) {
  bx[N]=mouseX;
  by[N]=mouseY;
  N++;    
  
  if (N == max){
  N = 0;}
  }
}

//create funtion of drawcirle
void drawcircle(int q){
  //no. of balls  
  for (int i=0; i<bx.length; i++){  
  noStroke();
  fill(r[i],g[i],b[i],q);
  ellipse(bx[i],by[i], s[i], s[i]);
  //movement
  by[i] = by[i] + 0.2;

  if (by[i] > height) {
    by[i] = 0;   
  }
  }}
  
void keyPressed() {
  for (int i=0 ;i<max ;i++) {
    if (keyCode == 49) {
      r[i]=255;
      g[i]=random(5,125);
      b[i]=random(5,125); 
    } 
    else if (keyCode == 50) {
      r[i]=random(5,125);
      g[i]=255;
      b[i]=random(5,125); 
    } 
    else if (keyCode == 51) {
      r[i]=random(5,125);
      g[i]=random(5,125);
      b[i]=255;
    } 
    else if (keyCode == UP){
      r[i]=random(5,125);
      g[i]=random(5,125);
      b[i]=random(5,125); 
    }
  }
  }


