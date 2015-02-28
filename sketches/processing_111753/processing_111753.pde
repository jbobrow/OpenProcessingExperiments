
//Exercise - Mondrian composition III

void setup(){
  size(400,400);
  background(255,255,255);
}

void draw(){
 //red rect
  noStroke() ; 
  fill(255,0,0);
  rect(0,0,180,170);
  
  //yellow rect
  fill(252,217,78);
  rect(0,250,40,170);
  
  //blue rect
  fill(16,86,191);
  rect(180,250,130,120);
  
  stroke (0, 0, 0);
  strokeWeight(5);
  line(0,170,400,170);
  line(0,250,400,250);
  line(180,0,180,400);
  strokeWeight(4);
  line(40,250,40,400);
  line(310,250,310,400);
  line(180,370,310,370);


}



