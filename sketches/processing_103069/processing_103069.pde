
// Day12 Q8
/*
問 5 のプログラムを変更して、沢山(100 個以上) の四角形が回転しながら上から下に移動するようなプログラムを作 成して下さい。
*/
int maxobj = 100;
float[] x = new float[maxobj]; 
float[] y = new float[maxobj];  
float[] rot = new float[maxobj]; // 正方形の回転角度(ラジアン)
float[] v = new float[maxobj]; // 正方形の移動速度
void setup(){
 size(400,400); smooth();
 for (int i=0; i<maxobj; i++) {
    x[i] = random(0,width);
    y[i] = 0;
    rot[i] = 0;
    v[i] = random(0.5,1.5); 
 }
}

void draw(){
 background(255);
 stroke(255,25,50); 
 fill(255,25,50); 
 for (int i=0; i<maxobj; i++) {
   rot[i] = rot[i] + PI/90;
   y[i] = y[i] + v[i]; // (a) 
   if(y[i]>height){ // (b) 
     y[i] = 0;
     v[i] = random(0,1.5);//(c) 
   }
   pushMatrix();
     translate(x[i],y[i]);// (d) , (e) 
     rotate(rot[i]); // (g) 
     rectMode(CENTER);  // (g) 
     rect(0,0,20,20);
   popMatrix();
 } //end for
}
