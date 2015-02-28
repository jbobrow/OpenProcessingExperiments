
size (500,300);
smooth();
 
 
 //background
for (int y = 0; y <= height; y += 15) {
for (int x = 0; x <= width; x += 40) {
     fill(133, 176,209);
    ellipse(x, y, 60, 30);
    stroke(232, 232, 232);
  }
}
 
 

//To change colour scheme to HSB: colorMode(HSB
stroke(0,0,0);
fill(139,93,62);
ellipse(200,100,40,30);
ellipse(300,100,40,30);
 
//arms
 
fill(206,149,110);
rect(180,180,50,20);
rect(280,180,50,20);
 
//fingers
fill(139,93,62);
triangle(170,185,180,180,180,190);
triangle(170,195,180,190,180,200);
 
triangle(330,180,340,185,330,190);
triangle(330,190,340,195,330,200);
 
 
 
//feet
fill(139,93,62);
rect(220,220,20,50);
rect(270,220,20,50);
 
//body
fill(206,149,110);
ellipse(255,200,100,100);
 
//head
ellipse(250,125,100,100);
 
//eyes
fill(0,0,0);
ellipse(240,130,7,7);
ellipse(260,130,7,7);
 
//mouth
fill(255,242,242);
rect(230,140,40,20);
 
//teeth
fill(255,22,22);
triangle(240,140,250,140,245,160);
triangle(250,140,260,140,255,160);

 
//grass
noSmooth();
for (int i= 1; i <= 500; i += 5) {
   line(i+2,300, i-1,260);
        fill(133, 176,209);
        stroke(84,134,70);
        strokeWeight(1.5);
}
