
void setup() {
  size (250, 250);
  smooth();
  background(255,255,255);
  
  //biggest diamond
  rectMode (CENTER);
  fill(89,232,231); //turquoise
  noStroke();
  translate (125,-51); // move from origin
  rotate (radians (45)); //rotate by 45 degrees
  rect(125,125,175,175);
  
  // second diamond
  fill(255,255,255); //white
  noStroke();
  rect (125,125,130,130);
  
  // third diamond
  fill (89,232,231); //turquoise
  noStroke();
  rect(125,125,100,100);
  
  fill (255,255,255); //white
  noStroke();
  rect (125,125,70,70);
  
  fill (89,232,231); //turquois
  noStroke();
  rect(125,125,40,40);
  
  //background circles
  float w= width;
  while (w > 0) { //starts from 250 and decreses by 20 at each cycle in loop
    noStroke();
    fill(255,0,0,30); //colour is red and has opacity of 25/255
    ellipse(width/2,height/2,w,w);
    w = w - 20;
  }
    
}

                
                                
