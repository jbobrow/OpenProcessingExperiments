

void setup(){
  
size(400,200);
background(255);

triangle(30, 75, 58, 20, 86, 75);
strokeWeight(2);



}
void draw(){
  
  if(mousePressed){
  triangle(mouseX,mouseY,mouseX+28,mouseY-55,mouseX+56,mouseY);

}
}



