
float a = 125;
float b = 125;
float c = 0;

void setup(){
  size(250,250);
  smooth();
  background(#2F2933);
  frameRate(15);
}

void draw(){
  stroke(#BFDA71);
  strokeWeight(2);
  line(a,-5,a,25);
  line(b,-5,b,25);
  
  stroke(#FBF5A9);
  strokeWeight(1);
  line(a,38,a,44);
  line(b,38,b,44);
  
  stroke(#54C2B6);
  strokeWeight(3);
  line(a,50,a,110);
  line(b,50,b,110);  
  
  stroke(#BFDA71);
  strokeWeight(1);
  line(a,127,a,160);
  line(b,127,b,160);
  
  stroke(#FBF5A9);  
  strokeWeight(2);
  line(a,165,a,180);
  line(b,165,b,180);
  
  stroke(#00A2A6);  
  strokeWeight(1);
  line(a,197,a,222);
  line(b,197,b,222);
  
  stroke(#FBF5A9);
  strokeWeight(4);
  line(a,236,a,255);
  line(b,236,b,255);
  
  a -= 5;
  b += 5;
  
  if(a < 0){
    noStroke();
    fill(#2F2933);
    rectMode(CENTER);
    rect(125,125,c,255);
    c+=5;    
  }   
}


