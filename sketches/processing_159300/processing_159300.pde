
void setup(){
  size(500,500);
  background(8,228,250);
}
 
void draw(){
  if(mousePressed){
    fill(0);
  }
  else{
    fill(8,250,236);
  }
     rect(mouseY,mouseX,69,24);
    
    line(mouseY,mouseX,69,24);
  
  float k=0;
 
    
    k= dist(mouseY,mouseX,pmouseY,pmouseX); 
    stroke(40,45);
    fill( 8,250,147);
    ellipse(mouseX,mouseY,k,k);
    fill(192,250,8);
    triangle (mouseX, mouseY, 58, 20, 86, 75);
 
  }
