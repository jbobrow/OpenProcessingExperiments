
void setup(){
  size(400,400);
  background(52,57,191);
  
}


void draw(){

  fill(52,57,191,200);
  stroke(228,245,124);
  strokeWeight(2);
  
  ellipse(width/4,height/6,25,40);
  ellipse(width/6,height/4,40,25);
  ellipse(width/3,height/4,40,25);
  ellipse(width/4,height/3,25,40);
  
  ellipse(3*width/4,5*height/6,25,40);
  ellipse(5*width/6,3*height/4,40,25);
  ellipse(2*width/3,3*height/4,40,25);
  ellipse(3*width/4,2*height/3,25,40);
  
  if(mousePressed==true){
    background(52,57,191);
    ellipse(width/4,height/6,30,80);
    ellipse(width/6,height/4,80,30);
    ellipse(width/3,height/4,80,30);
    ellipse(width/4,height/3,30,80);
    
    ellipse(3*width/4,5*height/6,30,80);
    ellipse(5*width/6,3*height/4,80,30);
    ellipse(2*width/3,3*height/4,80,30);
    ellipse(3*width/4,2*height/3,30,80);
 
  }else{
    background(52,57,191);
  
  ellipse(width/4,height/6,25,40);
  ellipse(width/6,height/4,40,25);
  ellipse(width/3,height/4,40,25);
  ellipse(width/4,height/3,25,40);
  
 ellipse(3*width/4,5*height/6,25,40);
  ellipse(5*width/6,3*height/4,40,25);
  ellipse(2*width/3,3*height/4,40,25);
  ellipse(3*width/4,2*height/3,25,40);
  }

}


