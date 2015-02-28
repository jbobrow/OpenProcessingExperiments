
void setup(){
  size(500,500);
  smooth();
}

void draw(){
 
 background(0);
 
 //head
 noStroke();
 fill(255);
 ellipse(250,250, 200, 300);
 
 //nose
 //triangle(150, 270, 160, 290, 120, 290);
  stroke(0);
  beginShape();
  curveVertex(148, 250); // the first control point
  curveVertex(148, 250); // is also the start point of curve
  curveVertex(120, 260);
  curveVertex(110, 260);
  curveVertex(130, 270);
  curveVertex(150, 280); // the last point of curve
  curveVertex(150, 280); // is also the last control point
  endShape();
 
 //eye brow
 stroke(0);
 strokeWeight(3);
 line(160, 200, 200, 190); 

  strokeWeight(1);
 //eye
 stroke(0);
 fill(255);
 ellipse(180,220, 40, 20);
 
 fill(76,88,188);
 ellipse(170,220,20, 15);
 
 fill(0);
 ellipse(170,220,10, 5);
 
 
 //mouth
 
 fill(245,79,112);
 ellipse(175, 350, 40, 10); 
 
 
 //hair top
  stroke(250,32,8);
  strokeWeight(2);
/*  
  curveVertex(190, 170); 
  curveVertex(190, 170);
  for(int i=0; i< 300; i+=50){
      curveVertex(190+i, 170);
      curveVertex(190+i, 170+i);
  }
  curveVertex(300, 110);
  curveVertex(300, 110);
 */
 
 
  for(int i =0; i < 300; i+=5){
   //line(190 +i, 170, 180, 110);
   line(190+i, 160+i,300, 110 );
  }
  for(int i =0; i < 170; i+=5){
   line(190 +i, 170, 160, 110);
   
  }

  
  
  //hat
  fill(8,228,250);
  ellipse(250,120, 300, 40);
  
  
  
}
