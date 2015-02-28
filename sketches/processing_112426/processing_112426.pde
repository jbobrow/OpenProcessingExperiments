
void setup(){
  size (600,600);
  background(0,0,0);
  
}


void draw(){
  background(0,0,0);
  noStroke();
  fill(93,93,93);
  rect(0,0,100,600);
  rect(600,0,-100,600);
  fill(93,mouseX,mouseX);
  ellipse(mouseX+50,300,10,10);
  ellipse(mouseX+10,330,10,10);
  ellipse(mouseX+30,270,10,10);
  ellipse(mouseX+20,315,10,10);
  ellipse(mouseX+40,250,10,10);
  
  stroke(0,25,255);
 strokeWeight(3);
 noFill();
beginShape();
curveVertex(100,100);
curveVertex(100,100);
curveVertex(150,150);
curveVertex(300,280);
curveVertex(350,250);
curveVertex(500,150);
curveVertex(500,150);

endShape();


 stroke(255,218,3);
 strokeWeight(3);
 noFill();
beginShape();
curveVertex(100,400);
curveVertex(100,400);
curveVertex(120,300);
curveVertex(180,260);
curveVertex(440,320);
curveVertex(480,480);
curveVertex(500,470);
curveVertex(500,470);

endShape();
  
  
stroke(255,15,3);
 strokeWeight(3);
 noFill();
beginShape();
curveVertex(100,380);
curveVertex(100,380);
curveVertex(160,220);
curveVertex(190,120);
curveVertex(350,100);
curveVertex(500,400);
curveVertex(500,400);
endShape();

stroke(34,126,9);
 strokeWeight(3);
 noFill();
beginShape();
curveVertex(100,250);
curveVertex(100,250);
curveVertex(280,330);
curveVertex(500,280);
curveVertex(500,280);
endShape();


  }


