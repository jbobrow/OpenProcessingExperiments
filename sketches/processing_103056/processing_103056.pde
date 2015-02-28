
//kadai12 Q2
/*
 次のプログラムは、乱数で決めた 4 つの値と
 マウスの X 座標の値に応じて、5 つmeの四角形と、
 この 5 つの値の中で最小値を利用して描かれた
 四角形を描くプログラムです。
 つまり、一番下の四角形の長さが、
 常に一番短いものとなっています。空欄を埋めて、
 プログラムを完成させて下さい。
*/

float[] x = new float[5];// (a) 
void setup(){
 size(400,250);
 for(int i=0;i<x.length-1;i++){ // (b)
   x[i] = random(0.3*width,width); 
 }
}
void draw(){
 background(255);
 stroke(0); fill(128);
 x[x.length-1] = mouseX;  // (c), (d)
 float m = myMin(x);
 for(int i=0;i<x.length;i++) { // (e) 
   rect(0,40*i+10,x[i],25);
 }
 rect(0,40*x.length+10,m,25); // (f) 
}

float myMin(float[] x){ // (g) 
 float tentativeMin = x[0];
 for(int i=1;i<x.length;i++){// (h) 
   if(tentativeMin > x[i]){ // (i) 
     tentativeMin = x[i] ;  // (j)
   }
 }
 return tentativeMin; //(k)
}
