
PImage lafoto;
  float[] x=new float[50464];
  float[] y=new float[50464];


void setup(){
 size (304,166);
 lafoto=loadImage("Unknown.jpeg");
  //image(lafoto,0,0);
  
for(int i=0; i<50464; i=i+1) {
 x[i] = random(width);
 y[i] = random(height); 
  }
  stroke(255,0,0);
}


void draw(){
  background(255);
  
  for(int i=0; i<50464; i=i+1){
    color col=lafoto.get(int(x[i]),int(y[i]));
    float brillo=brightness(col);
    float salto=brillo/255.0;
    salto=salto*salto;
    x[i]=x[i]+salto;
    if(x[i]>width){
        x[i] = random (width);
        y[i] = random (height);
    }
    
  point(x[i], y[i]);
  }
  //noLoop();
