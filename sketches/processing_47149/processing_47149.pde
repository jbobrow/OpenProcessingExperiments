
void setup(){
    size(900,900);
    background(0);
}    

void mouseMoved(){
  ellipseMode(CENTER);
  fill(random(200,255),0,random(200,255));
  ellipse(mouseX,mouseY,50,50);
  ellipseMode(CENTER);
  fill(random(200,255),random(200,255),0);
  ellipse(mouseY,mouseX,random(0,50),50);
}
  
void draw(){
  if(mousePressed){
    fill(0,random(200,255),random(200,255));
      ellipse(pmouseY,pmouseX,random(15,30),random(15,30));
  fill(random(200,255),random(200,255),random(200,255));
  ellipse(pmouseX,pmouseY,random(0,25),random(0,25));
  }
  line(mouseX,mouseY,450,100);
  line(mouseX,mouseY,100,750);
  line(mouseX,mouseY,800,750);
  line(mouseY,mouseX,450,100);
  line(mouseY,mouseX,100,750);
  line(mouseY,mouseX,800,750);
  
   if(mousePressed) {
    fill(0);
    stroke(255,255,255);
   }   else {
    stroke(random(255),random(255),random(255));
  } 

}
 
 


