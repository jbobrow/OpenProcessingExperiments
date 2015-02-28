
size(550, 450);
background (37,33,55);
strokeWeight(8);
smooth();

fill(38,144,74);
noStroke();
rect (-10,255, 900,900);
fill (40, 136, 44, 80);
rect (20, 275, 400,200);
fill(32, 179, 43, 45);
rect(250, 260, 300, 200);
fill (45, 145, 53);
rect(50, 330, 300, 300);

fill(255);
for (int i=0; i<50; i++) {
  
  float rm = random (0,width);
  float rp = random (0,height);
  
  noStroke();
  ellipse (rm/2, rp/4.75, 5,5);
  ellipse (rm,rp/2.5, 9,9);
}
  
for (int i=0; i<=7; i++) {

  float rw = random (70,110);
  float rh =random (60,130);
  
  float rx =random (0,width-rw/2);
  float ry= random (250,350);

  float r = random(20, 224);
  float g = random(67, 150);
  float b = random(200, 250);
  
  stroke(b,b,r);
  fill (r, g, b);
  ellipse(rx+6, ry-1, rw, rh);
  
fill (r,r,g);
 bezier(rx-15, ry, rx-80,ry-80,rx-80,ry+80,rx+28,ry);
 bezier(rx-9, ry, rx+80,ry+80,rx+80,ry-80,rx+28,ry);

strokeWeight (6);
 fill(r-50, g, g);
 triangle (rx-15,ry, rx+28, ry, rx+7, ry+75);
 noStroke();
 fill(b,r,r);
 ellipse(rx+7, ry+71, 28,28);

noStroke(); 
fill(b,b,b);
ellipse (rx-15, ry, 20, 20);
ellipse (rx+28, ry, 20 , 20);
fill(0);
ellipse (rx-13, ry+4, 5, 5);
ellipse (rx+29, ry+4, 5, 5);


}
