
 float delta =5;
 int r;
 float R=0;
 float G=0;
 float B=0;
 
 
void setup(){
  size(600,600,P3D);
}
 
void draw(){
 
 background(222,224,222);
 frameRate(3);
 println();
 
 translate(width/2,height/2,0);
 rotateX(radians(mouseY));
 rotateY(radians(mouseX));
 
 
 
  if(mouseX<width){
   R= random(0,255);
   G= random(0,255);
   B= random(0,255);
    r = (int)random(200,300);
  }
  
noStroke();
pointLight(R,G,B,250,150,0);
 sphere(30);
  
     strokeWeight(5);
     stroke(R,G,B);
     
     for(float deg =0; deg <360; deg+= delta) {
       for(float z= -r; z<r; z+=20){    
     float theta = radians(deg);
     float x = sqrt(r*r-z*z) * cos(theta);
     float y = sqrt(r*r-z*z) * sin(theta);
     point(x,y,z);
    
      
 
}
 
     }
 
   }


