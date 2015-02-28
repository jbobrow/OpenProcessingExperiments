

void setup()
{
  size(900, 200, P3D);
 
}
 
void draw()
{
 background(255);
  smooth();

  int i, j;
  
  float x = width;
  float y = height;
  float angle = 0.9019;
 
  angle *= angle;

  for( i = 1; i < 2048; i+=64){
      for(j = 1; j <= 17; j++){
      for(int k = i; k <= j; k++){      
        for(int w = 0; w <= width; w += 50){
          for(int h = 0; h <= height; h += 25){


            strokeWeight(0.1 * w/ i);

       
            point(w, j*h, k*w);
            point(w, w- h, h);
            point(40 + i*w + w*angle, j + h*angle, k*j);
       
            point(i + w*angle, j + h*angle, k*i);
       
          }
        }
        stroke(255, 23, 225, (j-k)*angle*0.8);
        rotate(2*PI/19.0);

      }
    }
  }
}
 
 

