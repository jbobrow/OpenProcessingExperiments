

void setup(){
  size(500, 500) ;
  //background(255);
  rectMode(CENTER);
  
}

void draw() {
 println(mouseX, mouseY) ; 
 
 fill(255, 0, 0, random(100));
 rect(random(width), random(height), 100, 100);


}


