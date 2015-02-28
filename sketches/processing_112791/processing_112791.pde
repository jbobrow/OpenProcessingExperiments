
//Mondrian Composition
//Test 002 [Date:20130925] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

void setup(){
  size (800, 784);
  smooth();
  background(255, 255, 255);
}

void draw(){
  //color
  //Red
  fill(255, 0, 0);
  noStroke();
  rect(0, 0, 365, 320);
  
  //Yellow
  fill(245, 200, 82);
  noStroke();
  rect(0, 510, 80, 784);
  
  //Blue
  
  fill(12, 45, 100);
  noStroke();
  rectMode (CORNERS);
  rect(365, 510, 615, 745);
  
  
  //Y-line
  
  stroke(0, 0, 0);
  strokeWeight(10);
  line(80, 520, 80, 784);
  line(365, 0, 365, 784);
  line(615, 520, 615, 784);
  
  //X-line
  
  strokeWeight(18);
  line(0, 320, 800, 320);
  line(0, 510, 800, 510);
  line(369, 745, 610, 745);
  
  

  
  
  
}


