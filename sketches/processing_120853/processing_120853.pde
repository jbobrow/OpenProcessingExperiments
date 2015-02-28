
int num = 100;
int X[] = new int[num];
int Y[] = new int[num];
int VX[] = new int[num];
int VY[] = new int[num];
color C[] = new color[num];
int W[] = new int[num];



void setup(){
 size(300,300);
 frameRate(30); 
 noStroke();
 colorMode(HSB,255);

 for(int i=0; i<num; i++){
  X[i] = int(random(width));//整数にする
  Y[i] = int(random(height));
  VX[i] = int(random(-7,7));
  VY[i] = int(random(-7,7));
  C[i] = color(random(255),255,255,128);
  W[i] = int(random(10,50));
 }
}

void draw(){
 background(255);
 
 for(int i=0; i<num; i++){
   
  if(Y[i] > height-10){
    VY[i] = VY[i] * -1;
    Y[i] = height-10;
   }
  
   if(Y[i] < 0){
    VY[i] = VY[i] * -1;
    Y[i] = 0; 
   }
  
   if(X[i] > width-10){
    VX[i] = VX[i] * -1;
    X[i] = width-10;
   }
  
  if(X[i] < 0){
    VX[i] = VX[i] * -1;
    X[i] = 0; 
  }
}

 for(int i=0; i<num; i++){
   X[i] = X[i] + VX[i];
   Y[i] = Y[i] + VY[i];
 fill(C[i]);
   textSize(18);
   
 if( i%2 == 0 ) {
     text("★",X[i],Y[i]); 
    } else{
     text("❤",X[i],Y[i]); 
    }
 }
}




