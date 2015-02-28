
PImage object;
float x = 3;

void setup(){
  
  size(300, 300,P3D);
  object = loadImage("speek.png");
    
}
  
void draw(){
           
  background(255);
  
   
   if( x <= 10 ){
   
     x = x+0.01; 
     
     float fov = PI/x+0.01;
     float cameraZ = (height/2.0) / tan(fov/2.0);    
    
     object.resize(50 , 50);
     image(object, 125, 125); 
     perspective(fov, float(width)/float(height), cameraZ/10.0, cameraZ*10.0);}
      
   else{x=3;}
       
} 
 
 void keyPressed () {
   if (key=='s') {
     saveFrame("exports/img-####.jpg") ; // to save the frames you want
     
   }
}


