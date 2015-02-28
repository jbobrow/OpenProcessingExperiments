
/* 
 This example needs a folder named "data" 
 inside data, the name of the images are fy000.jpg 
 fy005.jpg
 if you change the code to work with your images
 you will have to change line 18 to make it work 
 
 
 */

PImage bg;


int frame = 0;

int opacity= 0;


int num = 100;                           //sets 100 variables
float[] x = new float[num];                    
float[] y = new float[num];
float[] speed = new float[num]; 

void setup() {
  size(640,480);
  bg = loadImage("sunset001.jpg");

 smooth();
  stroke(0);
  strokeWeight(0.3);
  for (int i=0; i < num;i++) {            //loops variables
    x[i] = random(0,300);
    y[i] = height/2;
    speed[i] = random(0.5, 1);  


  }

}
 
 
void draw()
{

   

  smooth();
  background(bg );
    for (int i=0; i < num; i++) {            //draws arc
    fill(0,0,205,5);
    arc(x[i], y[i],400,700,radians( x[i]),radians( y[i]+12));
    y[i] = y[i] + speed[i];

  }


}



