
// Pink Floyd's Dark side of the moon recreation using polygons 
// and shapes with Processing. Created by Guillermo Pereira M. www.guipereira.cl
// Total of used shapes and polygons: 30.

void setup(){
  size(700,700);
  background(#676767);
}

void draw(){
  
  //Poster canvas.
  noStroke();
  fill(#000000);
  rect(25,25,640,640);
  fill(#B2B2B2);
  beginShape();
  vertex(665,25);
  vertex(675,35);
  vertex(675,675);
  vertex(665,665);
  endShape();
  noStroke();
  fill(#898989);
  beginShape();
  vertex(25,665);
  vertex(35,675);
  vertex(675,675);
  vertex(665,665);
  endShape();
  
  //Screws with shadow and "X".
  fill(#585858);
  ellipse(46,46,23,23);
  ellipse(646,46,23,23);
  ellipse(46,646,23,23);
  ellipse(646,646,23,23);
  fill(#898989);
  ellipse(45,45,20,20);
  ellipse(645,45,20,20);
  ellipse(45,645,20,20);
  ellipse(645,645,20,20);
  stroke(#585858);
  strokeWeight(2);
  line(40,40,49,49);
  line(49,40,40,49);
  line(640,40,649,49);
  line(649,40,640,49);
  line(40,640,49,649);
  line(49,640,40,649);
  line(640,640,649,649);
  line(649,640,640,649);
  
  
  //Color rays: Red.
  fill(#fe0000);
  noStroke();
  beginShape();
  vertex(382,284);
  vertex(382,290);
  vertex(665,347);
  vertex(665,335);
  endShape();
     
  //Color rays: Orange.
  fill(#fc8727);
  noStroke();
  beginShape();
  vertex(383,288);
  vertex(383,294);
  vertex(665,360);
  vertex(665,347);
  endShape();
  
  //Color rays: Yellow.
  fill(#ffff01);
  noStroke();
  beginShape();
  vertex(384,294);
  vertex(384,298);
  vertex(665,372);
  vertex(665,360);
  endShape();
  
  //Color rays: Green.
  fill(#66cc00);
  noStroke();
  beginShape();
  vertex(385,298);
  vertex(385,302);
  vertex(665,384);
  vertex(665,372);
  endShape();
 
 //Color rays: Cyan.
  fill(#00ccff);
  noStroke();
  beginShape();
  vertex(386,302);
  vertex(386,308);
  vertex(665,396);
  vertex(665,384);
  endShape(); 
  
   //Color rays: Purple.
  fill(#993399);
  noStroke();
  beginShape();
  vertex(387,308);
  vertex(387,312);
  vertex(665,408);
  vertex(665,396);
  endShape(); 
    
 //Small triangle inside the big one (light projected inside).
 noStroke();
 fill(#747373);
 triangle(298,301,371,285,394,315);
  
  //Three main triangles.
  stroke(#C1C1C1);
  strokeWeight(3);
  noFill();
  triangle(254,400,446,400,350,230);
  stroke(#747373);
  strokeWeight(4);
  triangle(260,397,440,397,350,236);
  stroke(#4B4B4B);
  triangle(266,394,434,394,350,242);

  //Ray of light.
  stroke(#FFFFFF);
  strokeWeight(5);
  line(26,390,308,300);
 
 }
