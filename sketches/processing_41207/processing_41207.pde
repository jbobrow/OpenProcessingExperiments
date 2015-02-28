
float time = 0;
int w = 400;
int h = 400;
void setup(){

 
  size(400,400,P2D);
  smooth();
  stroke(1,111);
  fill(1,111);
}
float wave = 75;
void draw(){
 
  fill(255);
  float x =0;
  rect(0,0,w,h);
  while (x<w){
    PVector raw = noisek(x/100,time);
    
    float k =wave *raw.z;
   // wave*noise(x/100,time);
    noStroke();
    ellipse(x,200+(k),3,3);
    
    strokeWeight(1);
   
    stroke(0,0,255,164-(wave*raw.z));
     line(x,200+(k),x-2,h);
     
   // stroke(1,wave*raw.z);
   // line(x,200+(k),x,h);
    x++;
  }
  time = time+.02;
 
}

PVector noisek(float a,float b){
 PVector k = new PVector (a,b,0);
 float c = noise(a,b);
 PVector retval =new PVector (1,1,c); 
 return retval; 
}               
