
void setup(){
  size(600,600);
  //Ferris Bueller is a righteous dood
  background(#033B67);  
  
}

void draw(){
  background(#033B67);
  noStroke();
  ellipse(mouseX,mouseY,40,40);
   text("FUCK U",mouseX+50,mouseY+50);
  if(keyPressed){
    //fill();
    rect(random(0,600),random(0,600),50,50);
  }
  else{
  }
 
  
}
void mousePressed(){
fill(random(0,256),random(0,256),random(0,256));
}



