
 void setup(){
  size(600,400);
  smooth();
 background(50);
}

void draw(){
  
 if(mouseX>=200)
  {
    background(50);
    PFont font;
   font = createFont("Arial",16,true); 
    //book closed//
    rectMode(CORNER);
    fill(#87CEEB);
    rect(380,60,200,280);
    fill(#228B22);
    rect(380,280,200,60);
    fill(#A52A2A);
    rect(420,240,20,60);
    rect(480,260,20,60);
    rect(540,240,20,60);
    fill(#006400);
    ellipse(430,240,50,50);
    ellipse(490,260,50,50);
    ellipse(550,240,50,50);
    //clouds//
    fill(#F5F5F5);
    noStroke();
    ellipse(490,170,40,40);
    ellipse(510,160,40,40);
    ellipse(490,180,40,40);
    ellipse(510,180,40,40);
    ellipse(500,170,40,40);
    
    ellipse (470,100, 40, 40);
    ellipse (450,90, 40, 40);
    ellipse (470,110, 40, 40);
    ellipse (440,110, 40, 40);
    ellipse (430,100, 40, 40);
    textFont(font,16);
    fill(0);
    text("A Novel About Trees!",410,130);
  }
  else
  {
    //open book//
    fill(#BDB76B);
    stroke(0);
    rectMode(CORNER);
    rect(200,60,180,280);
    rect(400,60,180,280);
    fill(#808000);
    rect(380,60,20,280);
    fill(255);
    rect(390,70,180,260);
    rect(210,70,180,260);
    //lines//
    for(int x=80;x<=320;x+=10){
    stroke(0);
    strokeWeight(3);
    line(220,x,380,x);
    line(400,x,560,x);}
  }}
