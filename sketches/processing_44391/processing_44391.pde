
void setup(){
  size(600,600);
  smooth();
  noStroke();
}

void draw(){
  background(255);
  //hairs
  stroke(0);
  strokeWeight(5);
  line(251,60,257,30);
  line(299,49,290,25);
  line(379,80,370,30);
  
  //face
fill(0);
ellipse(300,300,400,500);
  float mx = constrain(mouseX,180,210);
  float my = constrain(mouseY,180,210);
  float mx2 = constrain(mouseX, 380,410);
  float my2 = constrain(mouseY, 180,210);
  float my3 = constrain(mouseY, 356,500);
  fill(255);
  //not moving
  ellipse(200,200,60,60);
  ellipse(400,200,60,60);
  fill(0);
  //moving eye
  ellipse(mx,my,30,30);
  ellipse(mx2,my2,20,20);
  stroke(255);
  line(158,356,429,356);
  fill(255);
    beginShape();
      vertex(215,356);
      vertex(230,my3);
      vertex(245,356);
    endShape();
 beginShape();
      vertex(360,356);
      vertex(375,my3);
      vertex(390,356);
    endShape();


  
  
  
  println("x: " + mouseX + " y: "+ mouseY); 
  
}



