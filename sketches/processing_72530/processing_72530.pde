
void setup(){
 size(400, 400);
background(0); 
}

void draw(){
 fill(255, 0, 0);
 rectMode(CENTER);
 
 if(mouseX > 150 && mouseX < 250 && mouseY > 150 && mouseY <250) {
  fill(0, 255, 0);   
 }
 

noStroke();
rect(width/2, height/2, 100, 100);




}
