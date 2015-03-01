
void setup(){
noStroke();
  smooth();
  noCursor();
  size(500,500);}

  void draw(){
    tris();
  polkadots();
 println(mouseX,",",mouseY);
  }
  
  
  
  void tris(){
    strokeWeight(2);
    fill(160);
    triangle(0,0,width,0,250,250);
    fill(255);
    triangle(0,0,0,height,250,250);
    fill(0);
    triangle(0,height,width,height,250,250);
    fill(255);
    triangle(width,height,width,0,250,250);
 
}


void polkadots(){ 
  
  if((mouseX>width/2 && (mouseY)>height/2)){
  {
     fill(84,76,56);
  ellipse(mouseX,mouseY,10,10);
  }
 }
   if((mouseX<width/2 && (mouseY)<height/2)){
  {
     fill(84,76,56);
  ellipse(mouseX,mouseY,10,10);
  }
 }
   else  {
     fill(84,76,56);
  rect(mouseX,mouseY,10,10);
  }
 }

