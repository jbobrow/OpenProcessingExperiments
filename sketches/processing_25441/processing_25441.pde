
size(400, 400); 
background(127); 
smooth();
noStroke(); 
for (int y = 0; y <= height; y += 50) {

for (int x = 0; x <= width; x += 50) { 
  
  fill(255, 140); 
  
  ellipse(x, y, 60, 60);
 }
}

int x = 200;

int y = 200;
fill(0);
rect(x,y,100,130);

ellipse(x,y,100,100);

fill(255);
ellipse(x-10,y,20,20);
ellipse(x+10,y-10, 10,10);
ellipse(x+25,y-17,5,5);


//strokeWeight(8);
fill(255);
rect(x, y+100, 100, 5);
//line(x,y+50,x+100,y+50);

beginShape();
fill(127);
vertex(x+90, y);
vertex(x+100, y-40);
vertex(x+120, y-60);
vertex(x+105, y-40);
vertex(x+95, y);

endShape();

fill(127);
strokeWeight(5);
ellipse(x+20,y+140, 30, 30);
ellipse(x+80,y+140,30,30);


