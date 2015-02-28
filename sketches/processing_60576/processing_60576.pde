
void setup() {
  size(400,400) ;
  }

void draw() {

   
  if(mousePressed) {
    
    background(255);
    fill(0);
    
      
    ellipse(width/20, height/20,random(500),random(500));
    
  }else{
     
      background(0);
      fill(255);
      

  rect(width/2, height/2, 400,400);
  }

}
