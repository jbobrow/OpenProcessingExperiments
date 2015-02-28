
void setup(){
  size(600,600);
  smooth();
  background(189,0,193);
}

void draw(){
              //trip E lipi siees
  for(int i = 0; i < 1000; i+=20){
    noFill();
    stroke(26,237,126);
    strokeWeight(4);
    ellipse(width/2,height/2,i++,i);
  }
              //GRADIENT
              strokeWeight(0.5);
  for(int i = 0; i < width; i+=2){
    float colorValue;
    stroke(26,237,126);
    colorValue = map(i,0,width,0,255);
    stroke(colorValue, 50);
    line(i,0,i,height);
  }
  
for(int i = 0; i < 1000; i+=2){
  stroke(random(0,150),50);
  strokeWeight(2);
    ellipse(0,0,i++,i);
    ellipse(0,600,i++,i);
    ellipse(600,0,i++,i);
    ellipse(600,600,i++,i);
    
     ellipse(300,0,i++,i);
    ellipse(0,300,i++,i);
    ellipse(600,300,i++,i);
    ellipse(300,600,i++,i);
  }
}

