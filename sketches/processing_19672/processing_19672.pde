
float angle = 90;
 
void setup() {
  size(250,250);
  smooth();
  background(#799B6C);
    
}


void draw(){
  fill(255,5);
  stroke(255,100);
  angle = angle + 1; //how much the line will rotate
  translate(125,125); //centered on page
  rotate(angle);
  
  //initial line coordinates are determined by the following set
  line(10,100,100,100); //most outer ring of lines
  line(10,30,10,100); //2nd ring of lines
  line(10,100,10,20); //inner ring - shortest
  

}




