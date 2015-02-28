
int B1=0;

void setup(){
size(400,400);
background(255);

}

void draw(){
  fill(mouseX,mouseY,mouseX);

  ellipse(mouseX,mouseY, B1,B1);
  
  if(mousePressed){
  
  B1=B1+1;
  stroke(0);
    
  }else{stroke(255);}
  
  
}

void mouseReleased(){

B1=0;
  
}

