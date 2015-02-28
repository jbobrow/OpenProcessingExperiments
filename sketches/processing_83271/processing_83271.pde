
PImage echo;
 
void setup(){
size (500, 500);
smooth();
echo= createImage(width, height, RGB);
imageMode(CENTER);
}
 
void draw() {
  //if this si first frame dont display image
  if (frameCount <= 1){
    // do nothing
  } else {
      //else display image but scale it
      pushMatrix();
      translate(-width*0.0025, -height*0.005);
      scale(1.05);
      image(echo, width/2, height/2);
      popMatrix();
  }
  // draw any aimation we want
  fill(random(255), random(255), 0);
  ellipse(mouseX, mouseY, 20, 20);
 
  //copy all pixels into echo
  echo= get();
  
}
 
void keyPressed(){
  save("images/myFirstProcessingSketch.jpg");
println("image saved");
}
