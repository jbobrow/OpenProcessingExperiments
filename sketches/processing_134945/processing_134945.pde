
float a;

void setup(){
 size(500,500);
 background(84,84,84,3);
  a=height/2; 
}

void draw(){
  
 
 stroke(random(185),random(158),random(180),50);
 strokeWeight(10);
  line(0,a,width,a);
   a=a-0.5;
  if(a<0){
    a=height;
    
  }
}
