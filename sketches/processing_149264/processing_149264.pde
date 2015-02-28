
void setup() {
size(500,500);
smooth(); 
}

void draw() {
  //Gesicht
noStroke();
fill(232,179,138);
ellipse(width/2,height/2,300,300); 
  
  //Gesicht1
noStroke();
fill(240,12,58);
if (mousePressed) {
ellipse(width/2,height/2,300,300); 
}

  //Augen
stroke(0);
fill(255);
ellipse(190,220,50,30);
ellipse(285,220,50,30);
fill(0);
ellipse(map(mouseX,5,500,180,208),map(mouseY,5,500,217,222),10,10);
ellipse(map(mouseX,5,500,275,303),map(mouseY,5,500,217,222),10,10);

  //mund
noStroke();
fill(240,12,58);
ellipse(width/2,310,140,20);

  //mund1
fill(0);
if (mousePressed) {
  ellipse(width/2,310,90,100);
}
  

  
  
}
