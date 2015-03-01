

int gap = 20;
void setup(){
size(320,240);
background(255);
frameRate(5);

}

void draw(){
  strokeWeight(2);
 
  for(int i=20;i>=0;i--){
    fill(random(255),random(255),random(255));
   noStroke();
  ellipseMode(CENTER);
  ellipse(width/2,height/2,i*gap,i*gap);
 
  
  
}



}


