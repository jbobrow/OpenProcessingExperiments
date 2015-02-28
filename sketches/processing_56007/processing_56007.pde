


int radius = 10;

void setup(){
  size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

}

/*
//neck
stroke(102);
line(266, 257, 266, 162);
line(276, 257, 276, 162);
line(286, 257, 286, 162);

line(276, 155, 246, 112);
line(276, 155, 306, 56);
line(276, 155, 342, 170);

noStroke();
fill(102);
ellipse(264, 377, 33, 33);
fill(0);
rect(219, 257, 90, 120);
fill(102);
rect(219, 274, 90, 6);

fill(0);
ellipse(276, 155, 45, 45); 
fill(255); 
ellipse(288, 150, 14, 14); 
fill(0); 
ellipse(288, 150, 3, 3); 
fill(153); 
ellipse(263, 148, 5, 5); 
ellipse(296, 130, 4, 4); 
ellipse(305, 162, 3, 3);

*/
 

void draw(){
 
   float d = dist(mouseX, mouseY, width/2, 80); 
  if (d < radius) {
    radius++;
fill(0,0);
strokeWeight(2);
stroke(222, 31, 187, 90);
  }else{
    fill(255, 0);
  }
  ellipse(width/2, 80, radius, radius);
  

  
  
  //my head
  strokeWeight(2);
  stroke(100);
  line(width/2, 350, width/2, 360);
  stroke(0);
  fill(0);
  ellipse(width/2, 380, 20, 20);
  fill(100);
  ellipse(width/2, 380, 10, 10);
  

  
  noFill();
stroke(100, mouseY, mouseX);

ellipse(width/2, 80, 30, 30);

  noFill();
stroke(mouseY, 100, mouseX);
ellipse(width/2, 80, 50, 50);

  stroke(0);
  fill(0);
ellipse(width/2, 155, 50,50); //head


if (mousePressed == true){
  fill(0);
}else{
fill(mouseX, mouseY, 100);
}
ellipse(380, 145, 10, 10); //right eye
fill(mouseY, mouseX, 100);
ellipse(340, 145, 5, 5); //left eye
noFill();
stroke(100);
strokeWeight(2);
if(mousePressed){
  arc (width/2, 155, 40, 40, 0.7, 2.1);
}else{
arc(width/2, 155, 40, 40, 1, 2.1); //mouth
}

//antennea

fill(100);
stroke(mouseY, mouseX, 100);
ellipse(width/2, 80, 10, 10);

stroke(100);
strokeWeight(2);
line(width/2, 105, width/2, 90);

//body
noStroke();
fill(0);
triangle(width/2, 205, width/2-60, 350, width/2+60, 350);

//spots
fill(100, mouseX, mouseY);
ellipse(width/2, 230, 5, 5);
fill(mouseX, 100, mouseY);
ellipse(width/2, 245, 5, 5);
fill(mouseY, mouseX, 100);
ellipse(width/2, 260, 5, 5);


}


