
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
  int y=mouseY;
  
  fill(180,200,20);
  rect(x-22,y+90,10,40); //legs
  rect(x+12,y+90,10,40); //legs
  
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
  ellipse(x,y,60,60); //head
  rect(x-25,y,40,35); //head
  rect(x+22,y,7,80); //neck
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
  
  
     
     
     }


