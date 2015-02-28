
//import processing.opengl.*;
Star stars[] = new Star[1000];


void setup(){
  size(800,600, P3D); 
  for(int i=0; i< stars.length; i++){
    stars[i] = new Star(); 
  }
 // hint(ENABLE_OPENGL_4X_SMOOTH);
}

void draw(){
  background(0);
  for(int i=0; i< stars.length; i++){
    stars[i].update();
    stars[i].display();
  }
}

class Star{
  float x = random(width);
  float y= random(height);
  float z = random(600);
  float r,g,b;
  float d = 5;


  Star(){

  }

  void update(){
    z+= 15;

    /*
    if(z>0 && z<200){
     b = map(z, 0,200,0,255);
     }
     if(z>=200 && z<400){
     b = map(z, 200,400,255,0);
     g = map(z, 200,400,0,255);
     }
     if(z>=400 && z<600){
     g = map(z, 400,600,255,0);
     r = map(z, 400,600,0,255);
     }
     */

    if(z>0 && z<200){
      r=0;
      b = 255;
      g=0;
    }
    if(z>=200 && z<400){
      r=0;
      g = 255;
      b=0;
    }
    if(z>=400 && z<600){
      r = 255;
      g=0;
      b=0;
    }


    if(z>600) {
      z=0;
      x = random(width);
      y = random(height);
    }
  }

  void display(){
    fill(r,g,b);
    pushMatrix();
    translate(0,0,z-100);
    ellipse(x, y, d,d);
    popMatrix();
  }

}


