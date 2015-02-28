
void setup(){
  size(500,500);
    background(255);
    smooth();
 
}
 
    void draw() {
      if (mousePressed==true) {
      
      float r=random(50,255);
      float g=random(50,255);
float b=random(50,255);


  stroke(10);
  strokeWeight(18);
  line(mouseX, mouseY, pmouseX, pmouseY);
    stroke(r,g,b);
  strokeWeight(15);
  line(mouseX, mouseY, pmouseX, pmouseY);
      stroke(r+50,g+50,b+50);
  strokeWeight(10);
  line(mouseX, mouseY, pmouseX, pmouseY);
      stroke(r+100,g+100,b+100);
  strokeWeight(5);
  line(mouseX, mouseY, pmouseX, pmouseY);
  
  }
   

}
