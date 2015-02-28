
float px=150;
float py=100;
float velx=5;
float vely=2;
float diametre=40;
boolean cercle =true;
void setup() {
  size(450,450);
diametre =random(5,25);
}
void draw() {
  
  fill(0, 8);
  if(px>400){
    fill(0,200,random(255));}
 
  rect(0, 0, 800, 600);
 
  
 stroke(random(220),random(0),random(150));
  ellipse(px,py,120,90);
  px=px+velx;
  py=py+vely;
  noStroke();
  

stroke(random(220),random(0),random(300));
  ellipse(px,py,80,140);  
  fill(0,random(299),random(20));
  line(px,py,px-100,py-100);
  line(px,py,px+100,py+100);
  line(px,py,px-100,py+100);
  line(px,py,px+100,py-100);
  
 
  
fill (random(200), random(10), 200);
ellipse(px,py,random(140),random(80));

  
  if (px+diametre/2>=width) {
    velx=-velx;
  }
  if (px-diametre/2<=0) {
    velx=-velx;
  }
  if (py+diametre/2>=height) {
    vely=-vely;
  }
  if (py-diametre/2<=0) {
    vely=-vely;
  }
  fill(random(30),255,222);
  noStroke();
  if (cercle==true) {
    ellipse(px, py, diametre+40, diametre+5);
  }
  else {
    ellipse(px, py, diametre+5, diametre+40);
  }
fill(0,10,random(300));
  ellipse(px,py,10,10);}
  

  
void mousePressed() {
  cercle=!cercle;
}



