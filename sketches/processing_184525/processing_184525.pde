
float rad;

void setup(){
size(500, 500);


}

void draw(){
  fill(random(255), random(255), random(255), random(100));
  //rad = random(255);
  //ellipse(random(width), random(height), rad, rad);
  
  for(int i = 0; i < 100; i++){
    for(int j = 0; j < 100; j++){
      
      rad = random(255);
      ellipse(random(width) * i, random(height) * j, rad, rad);
      
    }
  }
    

}


