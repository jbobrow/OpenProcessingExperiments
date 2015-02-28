
void setup () { 
  size(800,600); 
  fill(126); 
  background (0); 
   
color uniwalk = color(234,234,234); 
color redcentre = color(232,92,21); 
color vg = color(5,170,25); 
color lawn = color(38,252,36); 
color web = color(147,147,147); 
 
 
fill(uniwalk); 
rect(0,360,800,50);
fill(redcentre); 
rect(350,420,350,75); 
fill(vg); 
ellipse(0,700,400,400);
fill(vg);
rect(350, 150, 200, 150); 
fill(web);
rect(600, 100, 500, 250);

} 
 
 
void draw () { 
  if(mousePressed){ 
    stroke(255); 
      }else{ 
    stroke(0); 
  } 
  ellipse(mouseX,mouseY,9,3); 
} 


