
int tall = 400;
int wide = 750;

void setup(){
  size(wide, tall);
  background(0);
}

void draw(){
 
 //Code for letter 'N'
 stroke(#B9B9B9);
 fill(#B9B9B9);
 rect(300, 100, 99, 199);
 noStroke();
  
 //Code for letter 'B'
 stroke(#42A5BC);
 fill(#42A5BC);
 arc(400, 150, 100, 100, -HALF_PI, HALF_PI);
  stroke(#42A5BC);
 fill(#42A5BC);
 arc(400, 250, 110, 100, -HALF_PI, HALF_PI);
//  stroke(255);
 //fill(255);
 //rect(400, 100, 25, 200);
 noStroke();
  
 //Code for letter 'S'
stroke(#42A5BC);
fill(#42A5BC);
 arc(300, 155, 100, 110, HALF_PI, PI + HALF_PI);
 noStroke();
fill(#42A5BC);
 arc(300, 245, 80, 90, -HALF_PI, HALF_PI);
 
 if(mousePressed){
  noStroke();
 fill(0);
 triangle(320, 100, 380, 100, 380, 260);
 noStroke();
 fill (0);
 triangle(320, 301, 380, 301, 320, 140);
   
   noStroke();
 //needs to be black fill
 fill(0);
 arc(400, 150, 50, 50, -HALF_PI, HALF_PI);
 noStroke();
 //needs to be black fill
 fill(0);
 arc(400, 250, 50, 50, -HALF_PI, HALF_PI); 
   
  noStroke();
 fill(0);
 arc(300, 245, 100, 110, -HALF_PI, HALF_PI);
   noStroke();
 fill(0);
arc(300, 155, 80, 90, HALF_PI, PI + HALF_PI);
noStroke();
fill(#42A5BC);
 arc(300, 245, 80, 90, -HALF_PI, HALF_PI);
}
}
