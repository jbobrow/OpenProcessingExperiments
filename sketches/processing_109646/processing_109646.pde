
float seedX ;
float seedY ;
float i = 0;


float size;

float angle;
float xStart = random(10); 

float yStart = random(10); 

void setup(){

size(300,300);
 fill(0);
 

 
}




void draw(){
  background(255);
 
 // noStroke();
  
  seedX = xStart;

for (int x=0; x < width+10 ; x+=10){
  seedY = yStart;
  
  
  for (int y=0 ; y<height +10; y+=10){
    
   angle = noise(seedX,seedY,i);
   size = angle*10;
   strokeWeight(angle*4);
   
   angle*=TWO_PI*2;
   
   
   pushMatrix();    
    translate(x,y);
    rotate(angle);
    line(0,size,size,size);
    popMatrix();
    
   
  
  // ellipse(x,y, diameter,diameter);
   
   seedY+= 0.1;
   
  }
  
  seedX+= 0.1;
}

i+=0.012;
}
