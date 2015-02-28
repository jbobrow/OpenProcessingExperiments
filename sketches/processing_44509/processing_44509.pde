
float noiseScale = 0.05;


void setup(){
 size(1000,1000);
 background(0);
 //frameRate(30);
 smooth();
}

void draw(){
  translate(0, -height/2);
 
 for (int i=0; i<100;i++){
  float noiseVal = noise(i*noiseScale); 
  ellipse(width/2,height/2,noiseVal*1000,i);
  stroke(random(10));
  fill(random(255),0,127,random(255));
  translate(noiseVal, noiseVal*i); 
  
  }
 
}

