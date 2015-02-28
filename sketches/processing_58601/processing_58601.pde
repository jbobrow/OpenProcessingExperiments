
int i;

void setup(){
  size(700,700);
  smooth();
  background(255);

}

void draw(){
   for (int i = 0; i<width; i+=10){
    noFill();
    strokeWeight(1);
    
    
    stroke(234,i,35,50);
    ellipse(350,350, random(i*5), random(i*5));
    ellipse(250,250, random(i*5), random(i*5));
    ellipse(500,500, random(i*5), random(i*5));
    
    stroke(100,i,230,13);
    rect(200,400, random(i*2), random(i*2));
      rect(100,100, random(i*3), random(i*2));
   
}
}



