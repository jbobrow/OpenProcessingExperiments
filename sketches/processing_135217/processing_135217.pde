
void setup () {
background(6,150,214);
size(650,650);
fill(6,150,214);
stroke(255,255,255);
strokeWeight(6);
ellipse(260,100,160,160);
ellipse(300,100,30,60);
ellipse(310,120,10,10);
ellipse(350,130,30,30);
triangle(260,280,230,160,45,230);
line(90,240,90,450);
line(160,255,160,450);
line(430,295,430,450);
noFill();
ellipse(430,275,20,20);
ellipse(405,275,30,30);
ellipse(410,260,30,30);
ellipse(420,250,30,30);
ellipse(440,250,30,30);
ellipse(455,260,30,30);
ellipse(455,275,30,30);
ellipse(450,290,30,30);
ellipse(435,300,30,30);
ellipse(420,300,30,30);
ellipse(410,290,30,30);
fill(255,255,255);
rect(0,450,650,500);
}
void draw () {
  
  if(mouseY>450){
    strokeWeight(1);
  line (mouseX, mouseY, pmouseX, mouseY-100);
  stroke (4,175,10,200);
  noFill();
  }
}
