
int angle;

void setup(){
  size(500, 500, P3D);
  angle = 0;
}

void draw(){
  background(240,192,190);
  angle += 1;  
  if(angle > 360) angle = 0;   
 
 
  directionalLight(180, 85, 118, 0, 0, -1);      //iro
 
  translate(width/2, height/2); 
  for(int i = 0; i < 5; i ++){
  rotateY(radians(angle));
  rotateX(radians(angle));
  rotateZ(radians(angle));  
  box(30, 30, 150);  
  }                                              //zukei
  
  directionalLight(238, 221, 224, -2, -3, -1);   //iro
  
  
 translate(width/2, height/2); 
  for(int i = 0; i < 5; i ++){
  rotateY(radians(angle));
  rotateX(radians(angle));
  rotateZ(radians(angle));  
  box(30, 30, 150);                              //zukei
  }

translate(width*2/3, height*2/3); 
  for(int i = 0; i < 5; i ++){
  rotateY(radians(angle));
  rotateX(radians(angle));
  rotateZ(radians(angle));  
  box(30, 30, 150);                              //zukei
  }
  
  
   translate(width/2, height/2); 
  for(int i = 0; i < 5; i ++){
  rotateY(radians(angle));
  rotateX(radians(angle));
  rotateZ(radians(angle));  
  box(30, 30, 150);  
  }                                               //zukei
  
}


