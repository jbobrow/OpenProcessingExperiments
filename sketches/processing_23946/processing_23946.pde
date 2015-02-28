
void setup(){
  
size(400,400);
smooth();
 
frameRate(30);
}
 
void draw(){
    background(0,60,100);
    
  

     
ellipseMode(CENTER);
rectMode(CENTER);

//bob body
stroke(255);
fill(255);
rect(200,200,20,50);
 
 
//bob head
stroke(255);
fill(255);
ellipse(200,125,100,100);
 
 
//bobs ears
fill(234,159,159);
strokeWeight(2);
ellipse(180,60,20,50);
ellipse(220,60,20,50);
 
if((mouseY<199)&&(mouseY<300)){
    fill(234,159,159);
strokeWeight(2);
ellipse(180,60,35,75);
ellipse(220,60,35,75);
    } 
 
//bob eyes
fill(0,0,200);
stroke(0);
ellipse(180,150,16,16);
ellipse(220,150,16,16);
 
 
  
  if((mouseY<199)&&(mouseY<300)){
     fill(0,0,200);
stroke(0);
ellipse(180,150,35,35);
ellipse(220,150,35,35);
    }
 
 
//bob legs
stroke(255);
strokeWeight(3);
line(180,260,200,200);
line(220,260,200,200);
 
//bobs nose
stroke(234,159,159);
fill(234,159,159);
rect(200,160,6,3);
 
//bob arms
stroke(255);
strokeWeight(3);
line(160,160,200,200);
line(240,160,200,200);
 
fill(234,179,69);
  noStroke();
  triangle(mouseX+50,mouseY+20,mouseX+80,mouseY+70,mouseX+30,mouseY+75);
 
fill(167,234,69);
noStroke();
rect(mouseX+60,mouseY+78,10,20);//carrot top
rect(mouseX+57,mouseY+75,15,15);
   
   
}
 
void mousePressed(){
 background(167,230,60);
stroke(255);}
 
void keyPressed(){
   
  println("hop hop hop.");}

