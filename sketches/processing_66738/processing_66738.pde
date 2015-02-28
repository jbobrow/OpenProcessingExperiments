
void setup(){
  background(235,235,235);
  size(500,500);
  smooth();
  
}
void draw(){
  
    noStroke();
    if (mousePressed){
    fill(mouseX,mouseY,90);
    
 
   }else{
    stroke(1);
    fill(200,200,200);
  }
  ellipse(mouseX,mouseY,30,30);
}

void keyPressed(){
  
    if (key =='a'){
    background(random(255),random(255),random(255));
}
}
