
//Green,Green Grass of Home
//Echo Chen ( puyce7244@yahoo.com.tw )
//i want to use sin & cos make a topography! 

void setup(){
  size(500,400);
  frameRate(1);
}
// mountain line
  void draw(){
  background(255);
  
  
 // ground colour
  fill(39,210,127);
  noStroke();
  rect(0,380,500,400);
  
  fill(39,210,127,90);
  noStroke();
  rect(0,370,500,400);
  
  fill(39,210,127,80);
  noStroke();
  rect(0,360,500,400);
  
  fill(39,210,127,70);
  noStroke();
  rect(0,350,500,400);
  
  fill(39,210,127,60);
  noStroke();
  rect(0,340,500,400);
  
  fill(39,210,127,50);
  noStroke();
  rect(0,330,500,400);
  
  fill(39,210,127,40);
  noStroke();
  rect(0,320,500,400);
  
  fill(39,210,127,30);
  noStroke();
  rect(0,310,500,400);
  
  fill(39,210,127,20);
  noStroke();
  rect(0,300,500,400);
  
  
  //house 1 & 2
  fill(213,213,213);
  noStroke();
  rect(351,260,40,40);
  
  fill(213,213,213);
  noStroke();
  triangle(351,260,371,250,391,260);
  
  fill(0,30);
  noStroke();
  rect(370,240,60,60);
  
  fill(0,30);
  noStroke();
  triangle(370,240,400,220,430,240);
  
  //sun
  fill(255,216,0);
  noStroke();
  ellipse (100,150,30,30);
  
  
  
   
  
  
   
  
 //the mountain line 
 float a = 0.0;
 float inc = TWO_PI/50.0;
 for(int i=0; i<500; i=i+5) {
 stroke(142,190,127);
 strokeWeight(1); 
 line(i, 400, i, 300+cos(a)*40.0);
 
 //the changable grass
 
 stroke(162,150,120);
 strokeWeight(2); 
 line(i, 400, i, 300+sin(a)*30.0);
 
 stroke(162,80,115);
 strokeWeight(2); 
 line(i, 400, i, 300+cos(a)*20.0);

 a = a + inc;
 }
 
 for(int i=0; i<500; i=i+5) {
    float ynoise=random(100,300);
    float rny= noise(ynoise)*200;
    
    stroke(0,30);
    strokeWeight(2); 
    line(i, 400+sin(a)*20.0, i, rny+200);
    line(i, 400+sin(a)*20.0, i, rny+150);
  }
}



