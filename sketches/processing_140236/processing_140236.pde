
float a1=0;
float a2=0;
float a3=0;
float x=0;
float y=0;
float count=0;
float mapHeight;
 
 
  
void setup() {
  size(800, 800);
  mapHeight=height;
  
}
  
void draw() {
  strokeWeight(20);
  Colors();
  painting();
 
   
  count++;
  mapHeight=mapHeight-3;
}
  
  
  
void Colors() {
    
  a1 = sin(radians(count+100))+1;
  a2 = sin(radians(count+200))+1;
  a3 = sin(radians(count+200))+1;
  a1 = map(a1,0,1,100,150);
  a2 = map(a2,0,1,100,150);
  a3 = map(a3,0,1,100,150);
  stroke(a1,a2,220,10);
 
}
void painting() {
  for (int x=0; x<width; x=x+1) {
    myLine = noise(float(x)/400,count/400,10);
    float myY = map(myLine, 0, 1, 0, height-mapHeight);
    line(x,myY, x, height+30 );
   
  }
   
}
 
