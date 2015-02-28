

void draw() {

 
  if (mousePressed ==true) {
 
  point(mouseX, mouseY);
}





}

void keyPressed() {

 //saving
  if(key == 's') {
   print("save");
  save("processing_pic.png");
}

else{
  println("invalid key");
}
 //change background
 
 if(key == 'b') {
   
   background(random(255),random(255),random(255));
   stroke(random(255),random(255),random(255));
 strokeWeight(5); 
line(0,0,width,0);
strokeWeight(3);
println("changed background");
 }
 else{
  println("invalid key");
}
//changing colors
if(key == 'e') {
 stroke(random(255),random(255),random(255));
 strokeWeight(5); 
line(0,0,width,0);
strokeWeight(3);
}
else{
  println("invalid key");
}

  
}
 

