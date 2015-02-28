
void setup(){
  size(400, 400);

background(255, 204, 0);
}
void draw(){
  line(pmouseX, pmouseY, mouseX, mouseY)
;
  
  for(int i=0; i<30; i++){
  point(mouseX +random(30), mouseY + random(30));
  }  

  }
