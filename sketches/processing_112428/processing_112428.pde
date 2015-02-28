
void setup(){
  size (600,600);
  background(0,0,0);
  
}


void draw(){  
  stroke(255,255,255);
 strokeWeight(3);
 noFill();
beginShape();
curveVertex(100,100);
curveVertex(100,100);
curveVertex(150,150);
curveVertex(300,280);
curveVertex(350,250);
curveVertex(300,200);
curveVertex(300,250);

endShape();


 stroke(255,255,255);
 strokeWeight(1);
 noFill();
beginShape();
curveVertex(400,200);
curveVertex(300,150);
curveVertex(175,175);
curveVertex(180,260);
curveVertex(440,320);
curveVertex(480,480);
curveVertex(300,500);
curveVertex(300,500);

endShape();
  
  
stroke(255,255,255);
 strokeWeight(3);
 noFill();
beginShape();
curveVertex(180,380);
curveVertex(180,380);
curveVertex(140,200);
curveVertex(250,220);
curveVertex(350,150);
curveVertex(425,240);
curveVertex(325,400);
curveVertex(325,400);
endShape();

stroke(255,255,255);
 strokeWeight(3);
 noFill();
beginShape();
curveVertex(100,250);
curveVertex(100,250);
curveVertex(280,330);
curveVertex(500,280);
curveVertex(500,280);
endShape();


  noStroke();
  fill(24,24,180);
  //stroke(100,32,15);
  //strokeWeight(1);
  rect(98,98,10,10);
  rect(298,198,10,10);

  
  //if(mousePressed == true){
    //fill(255,0,0);
  //}else{
   // fill(255);
   
   noStroke();
  fill(255,0,0);
  //stroke(100,32,15);
  //strokeWeight(1);
  rect(299,148,10,10);
  rect(298,498,10,10);
  
   noStroke();
  fill(255,255,0);
  //stroke(100,32,15);
  //strokeWeight(1);
  rect(179,382,10,10);
  rect(319,399,10,10);

noStroke();
  fill(255,5,255);
  //stroke(100,32,15);
  //strokeWeight(1);
  rect(97,248,10,10);
  rect(500,274,10,10);

println(mouseX+" "+mouseY);

  }
  


