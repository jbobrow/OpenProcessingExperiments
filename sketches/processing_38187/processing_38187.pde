
size (300, 300);
background(255);
colorMode(RGB);
smooth();


translate(width/3, height/5); //change origin of all the commands
for (int x = height; x>=0; x-=10) { 
  for (int y=width; y>=200; y-=60) {
    stroke(random(40, 240));
    strokeWeight(5); 
  }
  rotate(radians(50));
  line(50, 20, x, 75);
  ellipse(50, 50, x, 30);}
  
//greyscale pattern made with two elements, a nested loop and 
//rotation transform.  
//I'm taking this pattern and manually repeating it, and changing it slightly 
//for experimentation and composition purposes.  

for (int x = height; x>=0; x-=10) { 
  for (int y =width; y>=200; y-=60) {
    stroke(142,52,101);
    strokeWeight(1); 
  }
  rotate(radians(25));
  line(50, 20, x, 300);
  rotate(radians(10));
  ellipseMode(CENTER);
  ellipse(x,Y ,10, 10);
}//changing things to x and y makes them dependant on the statements above
//that declare them.  I just typed around random things to see what was 
//happening




