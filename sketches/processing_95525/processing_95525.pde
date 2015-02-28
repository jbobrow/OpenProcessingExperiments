
void setup(){
  size(600,400);
  background(255);
}
 
void draw(){
  background(199,131,17);
  smooth();
  stroke(0);
  if(mousePressed== false){
    fill(0);
    ellipse((mouseX/15)+125,(mouseY/23)+170,75,75);
    ellipse((mouseX/15)+435,(mouseY/23)+170,75,75);
  } else {
    stroke(0);
    strokeWeight(10);
    line(115,170,175,170);
    line(435,170,495,170);
  }
  //Draws the rest of the face
  noStroke();
  fill(255);
  ellipse(300, 225, 210, 160);
  stroke(0);
  strokeWeight(10);
  line(300,200,260,255);
  line(300,200,340,255);
  
  
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 50, 50);
  if(mouseX > (width/2-25) && mouseX < (width/2+25) && mouseY > (height/2-25) && mouseY < (height/2+25)) {
    stroke(232,73,73);
    strokeWeight(10);
    line(85,250,65,300);
    line(105,250,85,300);
    line(125,250,105,300);
    line(515,250,495,300);
    line(535,250,515,300);
    line(495,250,475,300);
    
  } 

  
  
  
}


