
void setup(){
  background(157,230,255);
  size(600,600);
}

void draw(){
  

   
    for(int j = 0; j < 630; j = j+24){
    for(int i = 0; i < 630; i = i+24){
      for(int r = 12; r < 600; r = r+24){
        for(int s = 12; s < 600; s = s+24){
     
     noStroke();
    
     fill(255);
    ellipse(j, i, 28, 28);
    
    fill(217,241,255);
      rect(r, 0, 1, 600);
      rect(0, s, 600, 1);
      
    } 
  }
    }
    }
  
}
