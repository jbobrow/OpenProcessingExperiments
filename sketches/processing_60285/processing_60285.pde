


class building{
  float x, y;float h ;
  variateur v;
  float[][] base;
 building(float a, float b){
   h=0;
   v=new variateur(0,600,random(100,600));
   base = new float[0][2];
   float[] ab1 = {a-500,b-5};
   float[] ab2 = {a+2000,b-25};
   float[] ab3 = {a+50,b+50000};
   float[] ab4 = {a-20000,b+25};
   base = (float[][]) append (base, ab1);
   base = (float[][]) append (base, ab2);
   base = (float[][]) append (base, ab3);
   base = (float[][]) append (base, ab4);
  buildingz = (building[]) append(buildingz, this);
 } 
 void dessine( ){ 
   h =v.avance();   
   fill(180 );
   quad(base[0][0],base[0][1], base[0][0],base[0][1]-h, base[3][0],base[3][1]-h,base[3][0],base[3][1]);
     fill(200 );
    quad(base[3][0],base[3][1], base[3][0],base[3][1]-h, base[2][0],base[2][1]-h,base[2][0],base[2][1]);
    fill(255 );
    quad(base[0][0],base[0][1]-h, base[1][0],base[1][1]-h,base[2][0],base[2][1]-h,base[3][0],base[3][1]-h);
    
 }
}

