
//3d cube for infinite space
//used to map noise to create texture
float noiseVal;
float scale = 0.01;


void setup(){
  size(700,700);
  background(255);
  
}

void draw(){
  //noise(x,y);
//defining noise val here makes it different for each

for(int x=0; x<width; x++){
  noiseVal = noise((mouseX+x)*scale, frameCount*.02);
    
     stroke(noiseVal*100, noiseVal*100, noiseVal*40);
   line(x, mouseY+noiseVal*700, x, height);
 }
  
}


