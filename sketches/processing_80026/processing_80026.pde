
//Lluís Rebull Requena
void setup(){
  size(200,250);
  noStroke();
  smooth();
}
void draw(){
  background(245,0,0);
  int i=0;
  while(i<290){
  fill(random(200));
  rect(mouseY-i,mouseY-i,250,300);
  i=i+3;
  fill(i);
  rect(-i,0,250,300);
  i=i+20;
  }
  if (mousePressed == true){
  fill(random(0));
  rect(mouseX-1,mouseY-1,250,300);
  fill(random(200));
  while(i<0);
  fill(random(50));
  rect(mouseX-i,0,10,200);
  fill(random(200));
  stroke(0,0,0);
//cara
ellipse(100,100,170,195);  
//orelles
triangle(10,120,5,70,17,100);
triangle(190,120,195,70,183,100);
//ojeras
stroke(108,58,108);
ellipse(75,90,40,20);
ellipse(135,90,40,20);
//ulls
stroke(250,250,250);
ellipse(75,85,30,mouseY/10);
ellipse(135,85,30,mouseY/10);
//boca
stroke(0,0,0);
ellipse(100,160,120,20);
stroke(0,0,0);
arc(100,160,120,50,3.14,6.28);
//ulls
fill(245,0,0);
stroke(245,0,0);
ellipse(135,85,15,mouseY/10);
ellipse(75,85,15,mouseY/10);
fill(random(200));
//parpelles
stroke(0,0,0);
arc(75,80,35,mouseY/10,3.14,6.28);
arc(135,80,35,mouseY/10,3.14,6.28);
//nas
arc(95,110,15,mouseX/10,3.14,6.28);
arc(115,110,15,mouseX/10,3.14,6.28);
line(90,115,120,115);
stroke(0,0,0);
ellipse(95,110,5,mouseX/20);
ellipse(115,110,5,mouseX/20);
//arrugas
stroke(21,49,13);
line(101,70,109,70);
line(104,78,106,78);
line(102,75,108,75);
line(104,70,90,65);
line(106,70,120,65);
line(102,75,90,69);
line(108,75,120,69);
//barbilla
arc(101,185,25,15,3.14,6.28);


  if (mousePressed == true){
  noStroke();
 } else {
   fill(255,255,255);
}
 //dents
 stroke(255,255,255);
triangle(50,165,60,167,60,150);
triangle(140,167,150,165,150,150);
triangle(80,170,90,170,85,155);
triangle(110,170,120,170,115,155);
triangle(70,138,80,135,80,150);
triangle(130,138,140,140,130,150);
triangle(90,135,100,135,100,150);
triangle(110,135,120,136,110,150);
stroke(255,132,0);
ellipse(135,85,10,mouseY/20);
ellipse(75,85,10,mouseY/20);


  noStroke();
} else {
   fill(255,255,255);  
  }
}


