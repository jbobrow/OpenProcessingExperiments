
//standard Letter class for making up name

class Letter{
 //variables coming in from Letter creation 
 color col;//color of letter
 float x, y; // origin point for letter
 float [] locx, locy, targetx, targety; //ongoing location (LOCationX) and final locations for objects making up the letter
 int l; //length of letter array
 //variables native to this class
 float diam;
 float big; //values of big and small objec diameters
 float small;
 float rate;
 
 Letter (float x_temp, float y_temp, color c_temp, int a, float[] x_array, float [] y_array){
   big = 20;
   small = 10;
   rate = 30;
    x = x_temp;
    y = y_temp;
    col = c_temp;
    l = a;
    locx = new float [l];
    locy = new float [l];
    targetx = new float [l];
    targety = new float [l];
    arrayCopy(x_array, targetx);
    arrayCopy(y_array, targety);
    initalizeRandom(locx);//generate random locations for objects at start
    initalizeRandom(locy);
 }
 
 void initalizeRandom( float [] a){
    for (int i = 0; i<l; i++)
     {
       a[i] = random(0, x);
     } 
  }
  
  void display(){
    pushMatrix();
      translate (x,y);
      fill (col);
      for (int i = 0; i<l; i++)
        {
          if (i == 0 || i%5 == 0)
           {diam = big;}
           else
           {diam = small;}
          ellipse(locx[i], locy[i], diam, diam);
        }
      popMatrix();
    }

  void go(){
    for (int i = 0; i<l; i++)
    {
      float dx = (targetx[i] - locx[i])/rate;
      float dy = (targety[i] - locy[i])/rate;
      
      if (locx[i]==targetx[i])
      {locx[i]=locx[i];}
      else
      {locx[i]+=dx;
       locy[i]+=dy;}
    }
  }
  
  void reset(color col_temp){
    col = col_temp;
    initalizeRandom(locx);//generate random locations for objects
    initalizeRandom(locy);
  }

}
    
    



