


void setup(){
  size(500,500);
  background(255,255,255);
}

void draw(){

//this is the pink left rectangle.  
  fill(247, 135, 169);
  stroke(247, 135, 169);
  rect(0, 0, 35, 300);
  
//this is the grey right rectangle.   
  fill(173,169,170);
  stroke(173,169,170);
  rect(465, 0, 35, 300);
  
//this is the big pink rectangle.
  fill(250,45,86);
  stroke(250,45,86);
  rect(70, 0, 394, 235);
  
//this is the grey left rectangle.  
  fill(173,169,170);
  stroke(173,169,170);
  rect(36, 0, 35, 300);
  
//this is the grey bottom rectangle.  
  fill(173,169,170);
  stroke(173,169,170);
  rect(70, 235, 394, 35);
  
//this is the pink bootom rectangle.  
  fill(247, 135, 169);
  stroke(247, 135, 169);
  rect(0, 270, 500, 35);
  
  fill(82,82,81);
  stroke(82,82,81);
  ellipse(400,300,200,63);
  
  fill(160, 19, 46);
  stroke(160, 19, 46);
  triangle(57, 30, 58, 150, 200, 30);
  
 //this is the red bottom thin rectangle. 
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(57, 147, 143, 3);
  
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(57, 132, 130, 3);
  
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(57, 117, 117, 3);
  
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(57, 102, 104, 3);
  
  //this is the red right thin rectangle. 
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(197, 30, 3, 120);
  
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(185, 30, 3, 105);
  
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(173, 30, 3, 90);
  
  fill(160, 19, 46);
  stroke(160, 19, 46);
  rect(161, 30, 3, 75);
  
  fill(82,82,81);
  stroke(82,82,81);
  arc(500,305, 400, 400, PI/2, PI);
  
//this is the pink right rectangle.  
  fill(247, 135, 169);
  stroke(247, 135, 169);
  rect(429, 0, 35, 235);
  
  stroke(160, 19, 46);
  line(255,450,335,450);
  
  stroke(160, 19, 46);
  line(155,450,235,450);
 
  stroke(160, 19, 46);
  line(55,450,135,450);
  
  stroke(160, 19, 46);
  line(-45,450,35,450);
  
  stroke(random(160),19,46);
  line(250, 250, random(500), random(500) );
  
}


