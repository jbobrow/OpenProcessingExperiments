
void setup() {
  size(600, 600);
  smooth();
  stroke(0); 
}

void draw() {
  background(63,124,204);
 
 stroke(0);
 strokeWeight(4);
  
  fill(255,153, 0);
  beginShape(); // face 
  curveVertex(100, 140); 
  curveVertex(380, 220);
  curveVertex(460, 370);
  curveVertex(300, 420);
  curveVertex(200, 350); 
  endShape();
  
  beginShape();// face right
  curveVertex(500, 140); 
  curveVertex(220, 220);
  curveVertex(140, 370);
  curveVertex(300, 420);
  curveVertex(400, 350); 
  endShape();
  
  fill(255,153, 0); // fill triangle
  beginShape();
  triangle(300, 350, 250, 260, 350,260);
  endShape();

  
  
  beginShape(); // right ear top
  curveVertex(300, 200); 
  curveVertex(300, 200);
  curveVertex(280, 185);
  curveVertex(250, 177);
  curveVertex(230, 180);
  curveVertex(230, 180);
  endShape();
  
  beginShape(); // right ear
  curveVertex(300, 220); 
  curveVertex(300, 220);
  curveVertex(267, 195);
  curveVertex(230, 180);
  curveVertex(210, 200);
  curveVertex(250, 260);
  curveVertex(250, 260); 
  endShape();
 
 beginShape(); // left ear top
  curveVertex(300, 200); 
  curveVertex(300, 200);
  curveVertex(320, 185);
  curveVertex(350, 177);
  curveVertex(370, 180);
  curveVertex(370, 180);
  endShape();
  
  beginShape(); // left ear
  curveVertex(300, 220); 
  curveVertex(300, 220);
  curveVertex(333, 195);
  curveVertex(370, 180);
  curveVertex(390, 200);
  curveVertex(350, 260);
  curveVertex(350, 260); 
  endShape();
  
 noFill();
  beginShape(); // right whisker top
  curveVertex(206, 230); 
  curveVertex(206, 230);
  curveVertex(180, 207);
  curveVertex(150, 190);
  curveVertex(130, 200);
  endShape();
  
  noFill();
  beginShape(); // right whiskermiddle
  curveVertex(190, 245); 
  curveVertex(190, 245);
  curveVertex(170, 222);
  curveVertex(140, 205);
  curveVertex(120, 215);
  endShape();
  
  noFill();
  beginShape(); // right whisker lower
  curveVertex(175, 260); 
  curveVertex(175, 260);
  curveVertex(155, 237);
  curveVertex(125, 220);
  curveVertex(105, 230);
  endShape();
  
  
   noFill();
  beginShape(); // left whisker top
  curveVertex(396, 230); 
  curveVertex(396, 230);
  curveVertex(426, 207);
  curveVertex(456, 190);
  curveVertex(456, 200);
  endShape();
  
  noFill();
  beginShape(); // left whisker middle
  curveVertex(415, 245); 
  curveVertex(415, 245);
  curveVertex(441, 222);
  curveVertex(471, 205);
  curveVertex(471, 215);
  endShape();
  
  noFill();
  beginShape(); // left whisker lower
  curveVertex(426, 260); 
  curveVertex(426, 260);
  curveVertex(450, 237);
  curveVertex(480, 220);
  curveVertex(480, 230);
  endShape();
  
   
   
  fill(255,255,0);
  beginShape(); //left moustache
  curveVertex(350, 200);
  curveVertex(310, 380);
  curveVertex(384, 350);
  curveVertex(100, 100); 
  endShape(); 
  
  fill(255,255,0);
  beginShape(); //right side moustache
  curveVertex(500, 100);
  curveVertex(220, 350);
  curveVertex(300, 380);
  curveVertex(250, 200); 
  endShape();
  
  
  
  fill(255);
  beginShape(); // right eye
  curveVertex(300, 220); 
  curveVertex(300, 220);
  curveVertex(250, 230);
  curveVertex(220, 350);
  curveVertex(300, 340);
  curveVertex(250, 100); 
  endShape();
  
  fill(255);
  beginShape(); // left eye
  curveVertex(300, 220); 
  curveVertex(300, 220);
  curveVertex(350, 230);
  curveVertex(380, 350);
  curveVertex(300, 340);
  curveVertex(350, 100); 
  endShape();
  
  fill(255,204,204);
  ellipseMode (CORNERS); // nose
  ellipse(270,350,330,380); // nose
  
  fill(0);
  ellipse(250,300,280,350); // right eye
  ellipse(320,300,350,350); // left eye
  
  stroke(0);
  arc(200, 300, 50, 10, PI , 0); // line right eye
 
   
 
 fill(255,153, 0);
  beginShape(); // right eye
  curveVertex(300, 220); 
  curveVertex(300, 220);
  curveVertex(250, 230);
  curveVertex(220, 335); 
  curveVertex(220, 335);
  curveVertex(245, 340);
  curveVertex(270, 340);
  curveVertex(300, 335);
  curveVertex(300, 335);
  endShape();
  
  fill(255,153, 0);
  beginShape(); // left eye
  curveVertex(300, 220); 
  curveVertex(300, 220);
  curveVertex(350, 230);
  curveVertex(380, 335);
  curveVertex(380, 335);
  curveVertex(350, 340);
  curveVertex(325, 340); 
  curveVertex(300, 335);
  curveVertex(300, 335);
  endShape();  
 
 line(300,220,300,340); //line middle 
 

 
}


