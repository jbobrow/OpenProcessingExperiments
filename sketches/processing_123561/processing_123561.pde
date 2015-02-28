
float x = 10;
void setup(){
 size(700,700);
  background(random(255),random(255),random(255));
}
void draw(){
  fill(#FF6708);
  ellipse(mouseX - 40, mouseY - 15, 30,10);
  rect(mouseX + 5, mouseY +10, 5,20);
   rect(mouseX - 5, mouseY +10, 5,20);
  fill(random(x),random(x),random(x));
  ellipse(mouseX,mouseY,60, 30);
  ellipse(mouseX - 30, mouseY - 15, 40,30);
  ellipse(mouseX + 15, mouseY - 5, 40,20);
  fill(0);
  ellipse(mouseX - 30, mouseY - 15,5,5);
  
  if(mousePressed){
    fill(random(255),random(255),random(255));
    rect(0,0,width,height);
    x = x + 10;
  }
  if(x >=255){
    x = 0;
  }
 
   
} 


