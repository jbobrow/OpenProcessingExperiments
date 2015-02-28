
     void setup(){
   size(500,500);
   background(98,11,14);
   
}

void draw() {
  line(250,250,mouseX,mouseY);
  
  fill(188,180,random(25), 100);
  rect(150,150,mouseX, mouseY);

}                
