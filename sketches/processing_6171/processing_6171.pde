
//interdimensional cube by Colin Leipelt
//simple controls for now, mouseY position controls zoom

//enjoy.


float r, r2;

int a=0, b=1300, c=25;

void setup(){
  size (600, 600, P3D);
  smooth();
}

void draw(){
  background(0);
  strokeWeight(1);
  stroke(0, 255, 255);
  r = r+.01;
  r2 = r2+.02;

  pushMatrix();
  translate(width/2, height/2, -(mouseY*4));
  rotateY(r);
  rotateX(r);
  rotateZ(r2);
  translate(-width/2, -height/2, -(b/2));


  for (int z=b; z>=a; z-=c){
    for (int i=a; i<=b; i+=c){
      for (int j=a; j<=b; j+=c){
        point (i,j, z);        

      }   
    }
  }


  popMatrix(); 
delay(2);
}









