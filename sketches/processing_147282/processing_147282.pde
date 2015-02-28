
void setup()
{
 
size(300,300);
smooth();
}
 
 
void draw(){
     if(mousePressed){
         fill(100,50);
         rect(0,0,300,300);
     }
  float weight=dist(mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(weight);
  line(mouseX,mouseY,pmouseX,pmouseY);

}

