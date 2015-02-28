
void setup (){
   size(350,500);
 background(0);
 smooth();
}

void draw () {
  noStroke();
  fill(255);
   translate(-9,0);
   
  for(float i=1; i<width;i=i+1){
     
      float v = 9.6;
      
      int y1 =1;
      int y2 =height;
      
     
      if ( i<12){
          v=v+i/2;
      
      float x1 =v*i;
      float x3 =x1+v ;
      float x2 =x3-(v/2);
      
      triangle(x1,y1,x2,y2,x3,y1);
      triangle(width+18-x1,y1,width+18-x2,y2,width+18-x3,y1);
     }
    }
}

