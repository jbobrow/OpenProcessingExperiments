
void setup(){
  size (500,130);
  smooth();
}

void draw(){
  background(255);
  
  if(mousePressed){
    fill(229,0,86);
    ellipse(mouseX,mouseY,10,10);
    
    line(250,10,mouseX,mouseY);
    line(250,120,mouseX,mouseY);
    line(10,65,mouseX,mouseY);
    line(490,65,mouseX,mouseY);
  }
  else{
     
    fill(0,171,81);
    ellipse(mouseX,mouseY,10,10);
  line(10,10,mouseX,mouseY);
  line(490,10,mouseX,mouseY);
  line(10,120,mouseX,mouseY);
  line(490,120,mouseX,mouseY);
} 
}


