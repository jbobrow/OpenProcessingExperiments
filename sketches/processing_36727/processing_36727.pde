

void setup() {
  size(600,600);
  background(0,0,100);
  
}

float count = 0; 
float num = 75;
float rndHeight;
float rndColor;



void draw() {
  
  if (count < num) {
    if(count % 2 == 0){
    fill(255,255,175);
     rndHeight = random(height);
    noStroke();
     
     rect(count * width/num, 0, width/num, rndHeight);
     


  rndColor = random(height^2);
  fill(rndColor,rndColor/10,rndColor/10);
  ellipse((count*width/num)+4, rndHeight, rndHeight/5,rndHeight/5);  
  }
    
  }
      
    else{
      fill(0);
    rect((count * width/num), 0, width/num, rndHeight);
  }
  count++; 
  
  
  
}



