
class Hanabi {
   int Num = int(random(40, 60));
   float Cx, Cy;
   float Sp;
   float R;
   float maxR;
   float C;
   float[] X = new float[Num];
   float[] Y = new float[Num];
  
 Hanabi(float Cx, float Cy, float R, float maxR, 
        float Sp, float C){
   this.Cx = Cx;
   this.Cy = Cy;
   this.R = R;
   this.maxR = maxR;
   this.Sp = Sp;
   this.C = C;
 }
  
 void explosion(){
   for(int i = 0; i < Num; i ++){
   for(int j = 0; j < 360; j += 360/Num){
    X[i] = Cx + (R*cos(radians(j)));
    Y[i] = Cy + (R*sin(radians(j)));
    R += Sp;
     
    noStroke();
    fill(C, 99, 69+i/4);
    ellipseMode(CENTER);
    ellipse(X[i], Y[i], 0.3, 0.3);
      
    if(R > maxR) {Cx = random(s, width-s); Cy = random(s, height-s); R = 0;}
   }
  }
 }
}


