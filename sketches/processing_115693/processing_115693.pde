
//PARAMETERIZED FORM: CHAIR
//VIIRJ.COM,2013

void setup() {
  size(1300, 200);
 
 noLoop();
}

void draw() {
scale(0.5); 
 translate(0,height/2);
  background(random(0,255), random(0,255),random(0,255));
  for (int i = 0; i<100; i++) {
    stroke(random(i),random(i),random(i));
    strokeWeight(2);
    fill(233);
  //shape1 
  beginShape();
  vertex(35, i);//75
  vertex(67, i);
  vertex(76, 87);
  vertex(27, 87);
  vertex(35, i);
  endShape();

  //thickness
  rectMode(CORNER);
  rect(36, 34, 5, 41);
  rect(63, 34, 5, 41);


//backing
  rectMode(CORNERS);
  rect(27, 87, 77, 92);
  rect(70,34,33,41);
  
  //legs
  rect(27,92,31,166);
  rect(75,92,71,166);  
  
  //backLegs
  rect(35, 147,40,92);
  rect(63,147, 68,92);
  
  i++;
  translate(50,0);
   
     }
}







