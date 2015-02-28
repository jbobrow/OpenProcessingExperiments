
float x;
float dx;
float y;
float dy;

void setup() {
  size(1100,1000);
  x=0;
  dx=6;
  y=800;
  dy=4;
  
}
void draw() {
  background(136,232,226);
  stroke(19,142,25);
  fill(19,142,25);
  rect(0,600,1100,400);
  //wolken
        fill(245,235,245);
    stroke(245,235,245);
    ellipse(y,200,350,150);
    stroke(255);
    fill(255);
    ellipse(x,150,500,200);
      x=x+dx;         //mit Kenntnissen aus TECH NAT GL
      y=y+dy;
         if(x>1250)
           { x=0; }
         if(y>1180)
           { y=0; }  
  //hinteres bein - vorn
  fill(209,209,209);
  stroke(209,209,209);
  rect(450,600,50,280);
  //vorderes bein - vorn
  fill(232,233,237);
  stroke(232,233,237);
  rect(490,600,60,300);
  //hinteres bein - hinten
  fill(209,209,209);
  stroke(209,209,209);
  rect(840,630,50,250);
  //vorderes bein - hinten
  fill(232,233,237);
  stroke(232,233,237);
  rect(880,600,60,300);
  //schwanz
  fill(255);
  stroke(255);
  ellipse(980,650,40,300);
  //körper
  ellipse(700,550,600,300);
  //gesicht
  stroke(212,213,216);
  fill(232,233,237);
  ellipse(400,425,160,250);
  //ohren
  fill(255);
  ellipse(315,450,40,200);
  ellipse(485,450,40,200);
  //kopfflausch
  fill(255);
  ellipse(400,350,200,100);
  //augen
  fill(255);
  ellipse(430,435,30,30);
  ellipse(370,435,30,30);
  //pupillen
  fill(0);
  ellipse(430,440,10,20);
  ellipse(370,440,10,20);
 /*   if(mousePressed && (mouseButton == LEFT))
    {
      fill(255);
      
      ellipse(430,435,30,30);
      ellipse(370,435,30,30);
      stroke(0);
      ellipse(430,435,24,24);     //Rausgenommen, weil durch neue Idee ersetzt (Zeile 98-108)
      ellipse(370,435,24,24);
      fill(0);
      ellipse(430,435,18,18);
      ellipse(370,435,18,18); } */ 
  //nasenlöcher
  fill(255,201,188);
  stroke(255,201,188);
  ellipse(395,520,10,20);
  ellipse(405,520,10,20);
  
  if ((mouseX>380) && (mouseX<420) && (mouseY>480) && (mouseY<550))
      {  fill(255);                 //gleicher Code wie von Zeile 68-77
      stroke(255);
      ellipse(430,435,30,30);
      ellipse(370,435,30,30);
      stroke(0);
      ellipse(430,435,24,24);
      ellipse(370,435,24,24);
      fill(0);
      ellipse(430,435,18,18);
      ellipse(370,435,18,18); }
  
  //schmetterling
  fill(59,11,9);
  stroke(59,11,9);
  ellipse(mouseX,mouseY,10,35);
  stroke(mouseX*255/1100,0,mouseY*255/1000);
  fill(mouseX*255/1100,0,mouseY*255/1000);
  quad(mouseX+5,mouseY-15,mouseX+30,mouseY-20,mouseX+15,mouseY-5,mouseX+5,mouseY);
  quad(mouseX+5,mouseY+15,mouseX+30,mouseY+20,mouseX+15,mouseY+5,mouseX+5,mouseY);
  
  quad(mouseX-5,mouseY+15,mouseX-30,mouseY+20,mouseX-15,mouseY+5,mouseX-5,mouseY);
  quad(mouseX-5,mouseY-15,mouseX-30,mouseY-20,mouseX-15,mouseY-5,mouseX-5,mouseY);
 

  
}


