
float delta = 3;
float r = 200;
float X1, Y1=10;

void setup(){ 
  size(600,600,P3D);
  frameRate(60);
   
}
void draw(){
  
  background(0);
  stroke(255);
  strokeWeight(2);
  point(100,250);
  for(int i=0; i<200; i++)
  {
    point(random(0,600),random(0,600),random(0,600));
  }
  
   
  translate(width/2, height/2, 0);
  rotateY(Y1);
 
  Y1 += 0.001;
  
   
 
   
  stroke(#F51919);
 
  for(float deg2 =0 ;  deg2 < 360; deg2 += delta){
      float phi = radians(deg2);
     for(float deg = 0; deg < 360; deg +=delta){
        float theta = radians(deg);
        float x = r * sin(phi)*cos(theta);
        float y = r * sin(phi)*sin(theta);
        float z = r * cos(phi);
        point(x, y, z);
       
     }
  }
   
  
   
}

