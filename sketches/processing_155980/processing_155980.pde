
void setup(){
  // runs once 
 size(600, 600, P3D); 
  background(255, 204, mouseX);

}
 
void draw(){
  // runs repeatedly

  stroke(255, 50);
  translate(300, 300, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 4);
  sphere(150);
  
  strokeWeight(10);
  stroke(250, mouseY, mouseY);
  line(300, 300, 90, 90);
  
  if(keyPressed == true && key == 's'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
}
}


