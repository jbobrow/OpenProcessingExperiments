
/*
 Konkuk University
 SOS iDesign
 Name: AN Junyeong
 ID: 201420088
*/


void setup(){ 
  size(600, 600); 
  background(255);
  smooth();
  noLoop();
} 
void draw(){ 
  noStroke(); 
  fill(#90410C);
  rect(0, 0, width, height);

  strokeWeight(44);
  stroke(#B77543);
  line (0,450,150,600);
  line (0,300,300,600);
  line (0,150,450,600);
  line (0,0,600,600);
  line (150,0,600,450);
  line (300,0,600,300);
  line (450,0,600,150);
  line (0,150,150,0);
  line (0,300,300,0);
  line (0,450,450,0);
  line (0,600,600,0);
  line (150,600,600,150);
  line (300,600,600,300);
  line (450,600,600,450);
  
  strokeWeight(26);
  stroke(#BC8E52);
  line (0,450,150,600);
  line (0,300,300,600);
  line (0,150,450,600);
  line (0,0,600,600);
  line (150,0,600,450);
  line (300,0,600,300);
  line (450,0,600,150);
  line (0,150,150,0);
  line (0,300,300,0);
  line (0,450,450,0);
  line (0,600,600,0);
  line (150,600,600,150);
  line (300,600,600,300);
  line (450,600,600,450);
 
  for (int y = 75; y<=height; y += 150) {
  for (int x = 75; x<=height; x += 150) {
  noStroke();
  fill (#BC8E52);
  ellipse (x,y,42,42);   
}
}
  for (int y = 0; y<=height; y += 150) {
  for (int x = 0; x<=height; x += 150) {
  noStroke();
  fill(#A5912D);
  ellipse(x,y,150,150);
      
  fill(#EAB955);
  ellipse(x,y,120,120);
      
  fill(#E9F287);
  ellipse(x,y,90,90);
   
  fill (#C4CE5A);
  ellipse (x,y,60,60);
}
}
}

