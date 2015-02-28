
//import processing.pdf.*;
int h=250;
int g=250;
int c=1000;
void setup(){
  size(400,800);
  //beginRecord(PDF,"balletshoe.pdf");
  background(0);
  smooth();
 
  
}
void draw(){
  fill(0);
  stroke(255);
  strokeWeight(3);
  triangle(500, 0, 250, 50, 300, 190);
  strokeWeight(3);
  line(500,0,255,60);
  line(500,0,255,70);
  line(500,0,255,80);
  line(500,0,255,90);
  line(500,0,255,100);
  line(500,0,255,110);
  line(500,0,255,120);
  line(500,0,255,130);
  line(500,0,255,140);
  line(500,0,255,150);
  line(500,0,255,160);
  line(500,0,255,170);
  line(500,0,255,180);
  line(500,0,255,190);
  line(500,0,255,200);
  
     strokeWeight(5);

    stroke(255);
    fill(0);
    bezier(h, 50, 90, 90, 250, 100, 100, c);
    fill(1);
    bezier(h, 50, 70, 90, 250, 100, 80, c);
    bezier(h,50,150,50,200,39,250,c);
    bezier(h,50,150,150,300,100,500,c);
    
    bezier(h,50,20,109,389,29,500,c);
    bezier(270,90,90,300,150,25,50,c);
    bezier(260,80,90,300,30,25,20,c);
    bezier(290,150,90,300,43,25,10,c);
    bezier(300,160,200,300,150,25,30,c);
    
    endRecord();
}


void keyPressed(){
  if(key=='s'||key=='S');
  {
    
  }
}

  

  


