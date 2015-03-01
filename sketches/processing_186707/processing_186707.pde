
void setup(){

size( 600, 600);
}
 void draw(){
    line( mouseX, mouseY, pmouseX,pmouseY);
  line( width-mouseX, mouseY, width-pmouseX,pmouseY);
  
}
