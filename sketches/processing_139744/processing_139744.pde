
void setup(){
  size(400,400);
  background(random(0,255),random(0,255),random(0,255));

}
 
void draw(){
    noCursor();

 noStroke();
 
 
 if(mousePressed){
 fill(random(0,255),random(0,255),random(0,100));

 }
 else{
  
 fill(random(0,100),random(0,100));
 }  
 
 triangle(random(0,mouseX), random(0,mouseY),mouseX,mouseY, random(mouseX,width), random(mouseY,height));
 
}


