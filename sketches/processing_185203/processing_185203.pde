
//Keith Pomana
//Inspiration/Code Source:Hideaki Matsui 
//DMS 110

PImage echo;
 
void setup(){
size (500, 500);
smooth();
echo= createImage(width, height, RGB);
imageMode(CENTER);
frameRate(30);
}
 
void draw() {
  if (frameCount <= 1){
  } else {
      pushMatrix();
      translate(-width*0.0025, -height*0.005);
      scale(2.05);
      image(echo, width/2, height/2);
      popMatrix();
  }
  fill(random(255), random(255), 0);
  rect(10,10,10,10);
  rect(9,9,10,10);
  rect(8,8,10,10);
  rect(7,7,10,10);
  rect(6,6,10,10);
  rect(5,5,10,10);
  echo= get();
}
 
void keyPressed(){
  save("images/myFirstProcessingSketch.jpg");
println("image saved");
}



