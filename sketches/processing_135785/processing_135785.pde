
float a;

void setup(){
 size(500,500);
  frameRate(10);
 background(84,84,84,3);
  a=height/2; 
  
}

void draw(){
  
 
 stroke(random(255),random(145),random(125));
 strokeWeight(a);
 line(0,a,width,a);
 a=a-0.5;
    
if(a<0){
    a=height/2;
    }
}
