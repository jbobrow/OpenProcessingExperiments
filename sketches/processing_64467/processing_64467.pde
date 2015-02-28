
int amount=500;

int[] x=new int[amount];
int[] y=new int[amount];
int[] z=new int[amount];


void setup() {

  size(500, 500, P3D);
  background(0);

  noFill();
  stroke(255);
 
  strokeWeight(1);

  for (int i=0; i<amount; i++) {
    x[i] =int(random(-150, 150));
    y[i] =int(random(-150, 150));
    z[i] =int(random(-150, 150));
  }
}


void draw() {

  
  
  

background(0);
  translate(width/2, height/2);
  rotateX(frameCount/100.0);
    rotateY(frameCount/100.0);



  for(int i=0; i<amount; i++){
     
    line(0,0,0,x[i],y[i],z[i]);
}}


