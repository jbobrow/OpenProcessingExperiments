
void setup(){ 
  size(600,600); 
  background(255); 
}
void draw(){
  if(mousePressed==true){
  
    noStroke();
    fill(0);
    ellipse(mouseX,mouseY,100,100);
    stroke(255); 
    for(int i=0;i<600;i++){ 
      for(int p=0;p<600;p++){ 
        int r=int(random(2000000)); 
        if(r==1){ 
          point(i,p); 
        } 
      } 
    } 
  }
}



