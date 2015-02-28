
// Day12 Q9
/*
問 8 のプログラムを変更して、描く正方形の色を乱 数で決めるように変更したものを作成してください。
*/
int maxobj = 100;
float[] x = new float[maxobj]; 
float[] y = new float[maxobj];  
float[] rot = new float[maxobj]; // 正方形の回転角度(ラジアン)
float[] v = new float[maxobj]; // 正方形の移動速度
color[] c = new color[maxobj];
void setup(){
 size(400,400); smooth();
 for (int i=0; i<maxobj; i++) {
    x[i] = random(0,width);
    y[i] = 0;
    rot[i] = 0;
    v[i] = random(0.5,1.5); 
    c[i] = color(random(255)); //monochrome :-p
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
   fill(c[i]); stroke(c[i]);
   pushMatrix();
     translate(x[i],y[i]);// (d) , (e) 
     rotate(rot[i]); // (g) 
     rectMode(CENTER);  // (g) 
     rect(0,0,20,20);
   popMatrix();
 } //end for
}
