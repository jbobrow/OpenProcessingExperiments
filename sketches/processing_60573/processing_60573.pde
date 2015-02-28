
void setup() {
  size(400,400) ;
  noStroke();
  fill(55,11,3,10);
  
}

void draw() {

   
  if(mousePressed) {
    
    background(255);
      
    ellipse(width/2, height/2, random(400), random(400));

  }else{
     
      fill(255,11,3,10);

  ellipse(width/2, height/2, random(400), random(400));
   
}

}
