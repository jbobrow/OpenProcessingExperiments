
background(8,49,155);
size(525,525);

for (int i=1; i<=5000; i++){
  stroke(0,187,221,70);
  line(random(width), random(height),
         random(width), random(height));
         
 }
 noStroke();
 fill(244,238,238);
 
 for (int i=0; i<=6; i++){
 for (int s=0; s<=6; s++){
  arc(25+75*i, 25+75*s, 25, 25, PI, PI*2);
 arc(50+75*i, 25+75*s, 25, 25, PI, PI*2);
 triangle(12+75*i, 25+75*s, 63+75*i, 25+75*s,  36+75*i, 50+75*s);
 }
 }
  
 fill(244,0,0, 245); 
 arc(175, 180, 150, 150, PI, PI*2);
 arc(325, 180, 150, 150, PI, PI*2);
 triangle(250, 350, 100, 180,  400, 180);
 fill(8,49,155);
 textSize(79);
 text("Love",160,225);
 
 textSize(51);
  text("SJf",210,280);
