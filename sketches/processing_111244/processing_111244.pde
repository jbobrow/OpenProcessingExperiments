
void setup() {
  size(600,600);
  smooth();
  background(238,174,238);
}
 
int r,g,b,t=0;
 
void draw() {
  
  r=random(255);
  g=random(255);
  b=random(255);
  noStroke();
  
  fill(r,g,b);// 001
  ellipse(300, 300, 750, 750);
   
  fill(b,r,g);// 002
  ellipse(300, 300, 700, 700);
   
  fill(g,b,r);// 003
  ellipse(300, 300, 650, 650);
  
  fill(r,g,255);// 004
  ellipse(300, 300, 600, 600);
   
  fill(r,255,b);// 005
  ellipse(300, 300, 550, 550);
   
  fill(r,g,255);// 004
  ellipse(300, 300, 500, 500);
   
  fill(255,255,b);// 006
  ellipse(300, 300, 450, 450);
   
  fill(255,g,255);// 008
  rect(100, 100, 400, 400,3, 6, 12, 18);
   
  fill(255,255,b);// 006
  rect(175, 175, 350, 350, 3, 6, 12, 18);
   
  fill(255,g,255);// 008
  ellipse(300, 300, 400, 400);
   
  fill(255,255,b);// 006
  ellipse(300, 300, 350, 350);
   
  fill(255,g,255);// 008
  ellipse(300, 300, 300, 300);
   
  fill(255,255,b);// 006
  ellipse(300, 300, 250, 250);
   
  fill(255,g,255);// 008
  ellipse(300, 300, 200, 200);
   
  fill(255,255,b);// 006
  ellipse(300, 300, 150, 150);
   
  fill(255,g,255);// 008
  ellipse(300, 300, 100, 100);
   
  fill(r,255,b);// 005
  ellipse(300, 300, 50, 50);
   
  fill(b,255,b);// 009
  ellipse(300, 300, 40, 40);
   
  fill(255,g,b);// 010
  ellipse(300, 300, 30, 30);
   
  fill(255,r,b);// 007
  ellipse(300, 300, 20, 20);
   
  fill(g,b,g);// 002
  ellipse(300, 300, 15, 15);
  
  stroke( random(255),random(255),random(255));
  noFill();
  for(int i = 750; i > 100; i -= 25){
    for(int u = 750; u > 100; u -= 25){
  ellipse(300, 300, i, u);
} 
  }
  stroke( random(255),random(255),r);
  noFill();
  for(int i = 700; i > 500; i -= 100){
  ellipse(300, 300, i, i);
}
  stroke(random(255),random(255),random(255));
  noFill();
  for(int i = 300; i > 100; i -= 50){
  ellipse(300, 300, i, i);
}
  stroke(g,random(255),random(255));
  noFill();
  for(int i = 350; i > 150; i -= 50){
  ellipse(300, 300, i, i);
}
  stroke( random(100,250),random(100,222),random(0,25));
  noFill();
  for(int i = 50; i > 20; i -= 10){
   ellipse(300, 300, i, i);
    
  }
}



