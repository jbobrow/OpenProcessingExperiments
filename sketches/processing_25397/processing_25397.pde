
void setup() {
       size(500, 300);
       stroke(255);
       background(0);
     }
     
void draw() {
  background(0);
  fill(255);
  smooth();
  
  int x=mouseX;
  int y=120;
  int h= mouseY/20;
  int i=10;
  
  //star
  fill(255,255,100) ;
  beginShape();
vertex(h*20,h*5);
vertex(h*22.5,h*10);

vertex(h*27.5,h*10);
vertex(h*24,h*15);

vertex(h*26,h*20);
vertex(h*20,h*17.5);

vertex(h*15,h*20);
vertex(h*16,h*15);

vertex(h*12.5,h*10);
vertex(h*17.5,h*10);
endShape(CLOSE);
  

  
  
  
  strokeWeight(2);
  stroke(19,49,50);
  line(0,250,500,250);
  
 
  
 
/* rect(2*i,2*i,2*i,2*i);
  //rectMode(CENTER);
  noStroke();
  */
  
  

  fill(180,200,20);
  rect(x-22,y+90,10,0.2*mouseX); //legs
  rect(x+12,y+90,10,0.2*mouseX); //legs normally (x+12,y+90,10,40)
  
   //neck
  fill(180,200,20);
  beginShape();
  vertex(x+25,y+20);
  vertex(x+50,y+30);
  vertex(x+25,y+40);
  vertex(x+50,y+50);
  vertex(x+25,y+60);
 /* vertex(x+50,y+70);
  vertex(x+30,y+80);
  vertex(x+50,y+90);
  vertex(x+30,y+100);*/
  endShape();
  
  
  fill(255);
  
  rect(x+22,y,7,80); //neck
  ellipse(x,y,60,60); //head
  rect(x-25,y,40,35); //head
  ellipse(x,y+80,70,60); //body
  

  //legs
 // rect(50,50,10,50);
  
 /* beginShape();
  vertex(50,20);
  vertex(60,0);
  vertex(60,60);
  vertex(40,60);
  vertex(40,50);
  vertex(50,50);
  endShape(CLOSE);*/
  
  fill(180,200,20);
  beginShape();
  vertex(x+20,y+20);
  vertex(x-22,y+22);
  vertex(x-22,y+24);
  vertex(x-23,y+23);
  vertex(x-25,y+23);
  vertex(x-24,y+20);
  vertex(x-25,y-23);
  vertex(x-23,y-23);
  vertex(x-22,y-24);
  vertex(x-22,y-22);
  endShape(CLOSE);
  
 
  
  fill(0);
  ellipse(x-18,y,10,10); //eye
  ellipse(x+3,y,10,10); //eye
  triangle(x-8,y+5,x,y+15,x-15,y+15); //nose
  
  println(frameCount);
  
  
} //void draw end (dont delete)


