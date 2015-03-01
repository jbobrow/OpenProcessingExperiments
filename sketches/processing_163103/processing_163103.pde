
float delta=5;
float r=150;

void setup(){
 size(600,600,P3D); 

}

void draw(){
  background(0);
   textSize(50);
 fill(255);
 textAlign(CENTER);
 text("Mac Pro",width/2,150);
  smooth();
  translate(width/2,2.1*height/2,0);
rotateX(radians(mouseY));
  
  for(float z=0; z<250 ; z+=20){
   for(float deg=0;deg<360;deg+=delta){
     float theta = radians(deg);
     float x = r*cos(theta);
     float y = r*sin(theta);

     stroke(255-y,255-y,255-y);

     strokeWeight(60);
     point(x,y,z);
   } 
    
  }
  
}
