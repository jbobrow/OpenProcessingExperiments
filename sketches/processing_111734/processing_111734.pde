
// work of monderian composition iii
// by chen-hsin chang

void setup(){
  //set window size
  size(500,500);
    //set background
  background(255);

}

void draw(){
  //draw verticle line
  strokeWeight (8);  
  line(232,0,232,500);
  //draw horizontal line
  strokeWeight (10);  
  line(0,210,500,210);
  line(0,330,500,330);
  //draw verticle line
  strokeWeight (7);  
  line(53,330,53,500);
  line(390,330,390,500);
    //draw horizontal line
  strokeWeight (7);  
  line(232,488,390,488);
  //draw rectangle
  noStroke();
  fill(187,39,11);
  rect(0,0,228,205);
  fill(5,47,133);
  rect(236,335,151,150);
  fill(245,207,24);
  rect(0,335,50,500);
  
  
}



