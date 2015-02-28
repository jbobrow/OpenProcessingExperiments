
int count=100;
int plump=0;
int easy=0;




void setup(){
 size(400,800);

 background(32,167,242);
 smooth();
 
}


void draw(){
  
  fill(255,255,255);
  noStroke();
  rect(plump,plump,count,count);
  plump = plump+10;
  count = count+10;
  
  stroke(0,0,0);
  strokeWeight(10);
  line(easy,0,easy,height);
  easy = easy+30;
  
  
  
  fill(49,7,167);
  noStroke();
  triangle(0,800,800,800,400,400);
  
}




