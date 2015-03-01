
float delta = 2;
float pi = 100;
void setup()
{ 
  size(600, 600, P3D); 
  
}
void draw() 
{ 
 background(0);
 translate(width/2, height/2,0);
 rotateX(radians(mouseY));
 rotateY(radians(mouseX));
 
 if(mousePressed){
   if(pi>200)
     
   pi--;
 }
 
 for(int i = 0; i<200; i++){
   
  point(random(-600,600),random(-600,600),random(-600,600)); 
   
   
 }
 
 
 for(float omega = 0; omega<180; omega+=5) {
   
   for(float deg = 0; deg <360; deg += delta) {
     float theta = radians(deg);
     float x = pi * sin(omega) * cos(theta);
     float y = pi * sin(omega) * sin(theta);
     float z = pi * cos(omega);
     stroke(255);
     point(x, y, z);
   }
 }
 
     float omega = 80;
     for(float d = 0; d<50; d+=5){     
       for(float deg = 0; deg <360; deg += delta) {
       float theta = radians(deg);
       float x = (pi+100-d) * sin(omega) * cos(theta);
       float y = (pi+100-d) * sin(omega) * sin(theta);
       float z = pi * cos(omega);
       stroke(255);
       point(x, y, z);
       }
     }
     
}

