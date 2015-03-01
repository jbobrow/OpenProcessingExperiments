
void setup(){ 
  size(600,600); 
  background(0); 
  stroke(255);
  for(int i=0;i<600;i++){ 
    for(int p=0;p<600;p++){ 
      int r=int(random(10000)); 
      if(r==1){
        point(i,p); 
      } 
    } 
  } 
}
void draw() {

  if (mousePressed == true) {

    int s=second(); 
    int r=int(random(256));
    int g=int(random(256));
    int b=int(random(256));
    noStroke();
    fill(r,g,b); 
    int radius=s*5;
    ellipse(mouseX,mouseY,radius,radius);
  }
  
}



