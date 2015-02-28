
void setup() {
  size(600,600);
  smooth();
  background(238,174,238);
  img = loadImage("222222.jpg");
  img2 = loadImage("221313.jpg");
  img3 = loadImage("5555.jpg");
}

void draw() {
   
  r=random(255);
  g=random(255);
  b=random(255);
  noStroke();
  
  image(img3,0,0);
  
  fill(r,g,b);
  ellipse(300, 300, 750, 750);
   
  fill(b,g,b);
  ellipse(300, 300, 700, 700);
   
  fill(g,b,r);
  ellipse(300, 300, 650, 650);
  
  fill(r,g,255);
  ellipse(300, 300, 600, 600);
   
  fill(r,255,b);
  ellipse(300, 300, 550, 550);
   
  fill(r,g,255);
  ellipse(300, 300, 500, 500);
   
  fill(255,255,b);
  ellipse(300, 300, 450, 450);
   
  image(img2,100, 100, 400, 400,3, 6, 12, 18);
   
  image(img,175, 175, 350, 350, 3, 6, 12, 18);
   
  fill(255,g,255);
  ellipse(300, 300, 400, 400);
   
  fill(255,255,b);
  ellipse(300, 300, 350, 350);
   
  fill(255,g,255);
  ellipse(300, 300, 300, 300);
   
  fill(255,255,b);
  ellipse(300, 300, 250, 250);
   
  fill(255,g,255);
  ellipse(300, 300, 200, 200);
   
  fill(255,255,b);
  ellipse(300, 300, 150, 150);
   
  fill(255,g,255);
  ellipse(300, 300, 100, 100);
  
  image(img3,200,200,200,200);
  
  fill(b,g,34);
  ellipse(300, 300, 90, 90); 
 
  fill(34,r,g);
  ellipse(300, 300, 80, 80);
  
  fill(34,g,b);
  ellipse(300, 300, 70, 70);
  
  fill(r,34,b);
  ellipse(300, 300, 60, 60);
  
  fill(r,255,b);
  ellipse(300, 300, 50, 50);
   
  fill(b,255,b);
  ellipse(300, 300, 40, 40);
   
  fill(255,g,b);
  ellipse(300, 300, 30, 30);
   
  fill(255,r,b);
  ellipse(300, 300, 20, 20);
   
  fill(r,r,b);
  ellipse(300, 300, 15, 15);
  
  
  
 }
 




