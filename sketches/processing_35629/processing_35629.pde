
void setup(){
  size(300,300);
  background(0);
  

}
 

void draw(){ //makses the ship move left and right
  
  int block = 15;

  background(0);
  fill(255);
  rect(block,200,15,5);
  block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
    block +=25;
  rect(block,200,15,5);
  
  
  //Spaceship
  triangle(mouseX, height-50, mouseX-10, height-35, mouseX+10,height-35);
  strokeWeight(3);
  stroke(255);
  //Blasters
  line(mouseX-11,height-35,mouseX-11,height-45);  
  line(mouseX+11,height-35,mouseX+11,height-45);  
  
}




