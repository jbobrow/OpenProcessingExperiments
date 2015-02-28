


void setup(){
  
  size(600,600);
  background(255);
  frameRate(20);
  
}


void draw(){
  
   float posX = random(600);
    float posY = random(600);
    noStroke();
 
  for( int i=0; i<600; i+=30){
    for(int j=0; j<600; j+=30){
  fill( random(113,200), random(113,255), random(200,255));
    float v = map(posY, 0, height, 10, 50);
    ellipse(i, j, v,v);
}

}

}


