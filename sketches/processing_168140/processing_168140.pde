
void setup(){
  size(500, 500);
  background(20);
  frameRate(30);
}
  
void draw(){
 //float r = random(6,30);


 if (mousePressed){
    int r = 27;
 int g = 219;
 int b = 195;

 stroke(r,g,b);
 strokeWeight(4);
strokeCap(ELLIPSE);
if( keyPressed) {
   int r =255;
    int g = 0;
    int b = 0;}
  line(mouseX,mouseY,pmouseX,pmouseY);    // line vs ellipse?
  }else{
  stroke(20);
  strokeWeight(9);
 
  line(mouseX, mouseY, pmouseX, pmouseY);
 }
 }

 
 
