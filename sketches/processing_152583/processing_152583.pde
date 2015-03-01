
int num;
float[] X;
float[] Y;
float[] InX;
float[] InY;
int radius;
void setup(){
   size(400,300);
   num = 15;
   X = new float[num];
   Y = new float[num];
   InX = new float[num];
   InY = new float[num];
   for(int i = 0; i < num; i++){
      X[i] = random(width);
      Y[i] = random(height);
      InX[i] = random(-1,1);
      InY[i] = random(-1,1);
   }   
   radius = 100 ;

}
void draw(){
     background(255);
     for(int i = 0; i < num;i++){
        X[i]+=InX[i];
        Y[i]+=InY[i];
         if(X[i]>width || X[i]<0){
           InX[i]  = InX[i] > 0? -random(1):random(1);
         }
         if(Y[i]>height || Y[i]<0){
            InY[i]  = InY[i] > 0? -random(1):random(1);
         }       
         drawCircle(X[i],Y[i],InX[i],InY[i]);
     }      
     for(int i = 0;i < num;i++){
       for(int j = 0; j < i;j++){
         float distance = dist(X[i],Y[i],X[j],Y[j]);
          if(distance < radius){
            if(i%2 ==0 ||j%2 ==0){
               stroke(0,0,255);
            }
            else{
               stroke(255,0,0);
            }
          line(X[i],Y[i],X[j],Y[j]);
          }
       }
     }
     
}
void drawCircle(float x,float y,float dx,float dy){
   //point
   stroke(0,0,255);
   stroke(2);
   point(x,y);
   float endX = x + (dx*20);
   float endY = y + (dy*20);
   float atX = x + (dx*15);
   float atY = y + (dy*15); 
   
   line(x,y,endX,endY);
   line(endX,endY,atX + (dy*5),atY-(dx*5));
   line(endX,endY,atX - (dy*5),atY+(dx*5));
   noFill();
   stroke(#51DE24);
   ellipse(x,y,radius,radius);
}
