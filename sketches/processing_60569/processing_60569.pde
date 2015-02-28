
//interaktive Kreise

void setup(){
  size(800,600);
  smooth();
  background(255);
}
  
void draw(){
  //Variable definieren
  frameRate(15);
  float k=random(300);

if(mousePressed){
   stroke(random(255),mouseX/4,mouseY/1.5);
   ellipse(mouseX,mouseY,k,k);
}   
 
 else{
   fill(random(255),mouseX/4,mouseY/1.5);
   ellipse(mouseX,mouseY,k,k);

 }
   noStroke();
   fill(254,80);
   rect(0,0,800,600);
 }
