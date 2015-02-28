
int counter;
float xv;
float x;
float y;
float yv;
float ya;
boolean falling;
 
void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode

    
  funct(width/2 + 3,height/2,50,7);
  funct1(width/2,height/2,50,7);
    
    
}


void funct(float x, float y, float len, int depth){
   
   if( depth > 0){
      line(x , y , x + len, y);
      line(x + len + 5,y, x + len + len*cos(2*PI/3), y - len*sin(2*PI/3));
      line(x + len + 5,y, x + len + len*cos(2*PI/3), y + len*sin(2*PI/3));
      
      funct(x + len + 10, y, (float)len/2,depth - 1);
      funct(x + len + 10, y - len*sin(2*PI/3) , (float)len/2,depth - 1);
      funct(x + len + 10, y + len*sin(2*PI/3) , (float)len/2,depth - 1);

      
   }
   
}


void funct1(float x, float y, float len, int depth){
   
   if( depth > 0){
      line(x , y , x - len, y);
      line(x - len - 5,y, x - len + abs(len)*cos(PI/3), y - len*sin(PI/3));
      line(x - len - 5,y, x - len + abs(len)*cos(PI/3), y + len*sin(PI/3));
      
      funct1(x - len - 10, y, (float)len/2,depth - 1);
      funct1(x - len - 10, y - len*sin(PI/3), (float)len/2,depth - 1);
      funct1(x - len - 10, y + len*sin(PI/3), (float)len/2,depth - 1);

      
   }
   
}


 
 

                
                                                                
