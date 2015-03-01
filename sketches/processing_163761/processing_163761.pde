
float delta = 5;
float r = 150;
 
void setup(){ 
  size(600,600,P3D);
  frameRate(60);
   
}
void draw(){
  
  background(#BCF8FF);
  
   
  translate(width/2, height/2, 0);
  rotateY(radians(mouseX));
  rotateX(radians(mouseY)); 
   
  stroke(#F51919);
  strokeWeight(8);
  for(float deg2 =0 ;  deg2 < 180; deg2 += delta){
      float theta = radians(deg2);
     for(float deg = 0; deg < 360; deg +=delta){
       if(deg<30 || deg>330){
         stroke(0);
       }
       else if(deg<45 || deg>315){
         stroke(#744609);
       }
       else
         stroke(255);
         
        float phi = radians(deg);
        float x = r * sin(phi)*cos(theta);
        float y = r * sin(phi)*sin(theta);
        float z = r * cos(phi);
        point(x, y, z);
       
     }
  }
   
  
   
}

