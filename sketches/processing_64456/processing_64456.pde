
int amount=200;

int[] x=new int[amount];
int[] y=new int[amount];
int[] z=new int[amount];


void setup() {

  size(500, 500, P3D);


  noFill();

 
  strokeWeight(1);

  for (int i=0; i<amount; i++) {
    x[i] =int(random(-150, 150));
    y[i] =int(random(-150, 150));
    z[i] =int(random(-150, 150));
  }
}


void draw() {

  
  
  

background(230);
  translate(width/2, height/2);
  rotateY(frameCount/100.0);
   

  strokeWeight(1);
  stroke(0);
box(500);
  for(int i=0; i<amount; i++){
     strokeWeight(1);
       stroke(0,155,0);
    bezier(0,150,0,   0,-150,0,     x[i],y[i],z[i],   x[i],y[i],z[i]);
    stroke(255,0,0);
    strokeWeight(5);
    point(x[i],y[i],z[i]);
    
    
    
    
}}


