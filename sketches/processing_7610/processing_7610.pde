
void setup() {
  background (#2ea7c1);
  size (236,186);
}

void draw() {
  
  int s = second();   
  int m = minute();
  int h = hour();
  
  for (int i=5;i>=0;i--) {
    
    strokeWeight(2);
    noFill();
    stroke(255);
    rect(180-(i*30),48,24,24);
    
    noStroke();
    fill(255);
    if(h >= pow(2,i))h-=pow(2,i);
    else fill(#2ea7c1);
    rect(182-(i*30),50,20,20);
        
    strokeWeight(2);
    noFill();
    stroke(255);
    rect(180-(i*30),78,24,24);
    
    noStroke();
    fill(255);
    if(m >= pow(2,i)) m-=pow(2,i);
    else fill(#2ea7c1);
    rect(182-(i*30),80,20,20);
        
    strokeWeight(2);
    noFill();
    stroke(255);
    rect(180-(i*30),108,24,24);
    
    noStroke();
    fill(255);
    if(s >= pow(2,i)) s-=pow(2,i);
    else fill(#2ea7c1);
    rect(182-(i*30),110,20,20);
    
    
  }
}

