
int number=100; //domino's elements
float[]dx=new float[number];    //int[]arr;
float[]dy=new float[number];
float[]da=new float[number];

float constY=200;
float x=10;
float l=100;
float speed=0.01;

int unit_size=400; //actual unit width in centimeters 
int unit_num=int(34150/unit_size); //whole length is 341.5m 
int unit_spacing=int(unit_size*0.08); //for visualization in pixel scale

boolean freeze=false;

void setup() {
  size(2800, 600); 
  background(255);

  for(int i=0; i<number; i++) {      
    dx[i]=x*i*4;
    dy[i]=constY;
    da[i]=PI/2;
  }
}


void draw() {
for(int i=0; i<unit_num ;i++) {
  noFill();
  stroke(200);
     rect(20+i*unit_spacing,20, unit_spacing, unit_spacing*unit_num/10 );//grey grids
    }
   
   
 da[0]-=speed*da[0]*da[0];
  for(int i=1; i<number; i++) {  
    if(dx[i-1] +cos(da[i-1])*l>dx[i]){
         da[i]-=speed*da[i]*da[i];
         //da[i]-=speed; 
    }
  }
 
    for(int i=0; i<number; i++) {  
     if(da[i]<=0) {
      da[i]=0;
     }
   }

  
  domino();   
   }
 

  void domino() { 
    if(freeze==true) {
      
    }
    else {
      for(int i=0; i<unit_num; i++) {
        stroke(0); 
        if(i>70 && i<92) {
          rect((20+i*unit_spacing)+5, 40, 8, random(100,220));
          rect((20+i*unit_spacing)+5, 340, 8, random(100,220));
          stroke(200); 
          rect(20+i*unit_spacing,320, unit_spacing, unit_spacing*unit_num/10 );
        }
        else {
          for(int j=0; j<number; j++) {
            translate(dx[i], dy[i]);
            rotate(da[i]); 
            //line( dx[i],  dy[i], dx[i] +cos(da[i])*l, dy[i]+sin(da[i])*l);
            rect((20+j*unit_spacing)+5, 40, 20, random(10,50));
          }
        }
      }
    }
  }
  
    void keyPressed() {
      freeze=true;
    }


