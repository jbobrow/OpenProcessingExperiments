
void setup(){
  frameRate(20); 
  size(800,400); 
  background(255);
  noStroke();
}
 
void draw(){
  a();
}
void a (){
  if (mousePressed){
  fill(30,100,200,random(255)); 
   ellipse(random(width),random(height),map(mouseX,0,width,0,50),
   map(mouseX,0,width,0,50));
  }
}
           
                                                
