

void setup(){
  size(500,500); 
  background(198);
}

void draw(){


  noStroke(); 

  fill(211,201,147); 
  rect(50,50,400,400); 


  noStroke(); 
  fill(240,214,68); 
  rect(85,100,330,330); 

  noStroke();
  fill(237,202,24);
  rect(118,150,260,260); 

  stroke(255);
  fill(237,202,24); 
  rect(150,205,186,186); 



  if (mousePressed == true) {
    fill(0);
  } 
  else {
    fill(random(0,255),random(0,255),random(0,255));  
  }
  rect(150,205,186,186);
}





