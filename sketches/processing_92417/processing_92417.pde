
void setup(){
  //setup
  size(400,400);
  background(255);
  strokeWeight(8);
  fill(175,214,135);
  stroke(92,138,45);
  rect(50,330,300,200,30);
}
void draw(){
  
  fill(175,214,135);
  stroke(92,138,45);
  //face
  ellipse(width/2,height/2,300,300);
  //eye
  fill(255);
  ellipse(width/2-70,150,70,70);
  ellipse(width/2+70,150,70,70);
  noStroke();
  fill(92,138,45);
  ellipse(width/2-70-(width/2-70-mouseX)/15,150-(150-mouseY)/15,35,35);
  ellipse(width/2+70-(width/2+70-mouseX)/15,150-(150-mouseY)/15,35,35);
  //mouth
  stroke(92,138,45);
  line(120,300,280,280);
  //nose
  noFill();
  curve(800,-600,180,180,220,180,0,-600);
  //glasses
  stroke(0,135,152);
  
  

}
