
int radius = 200; 
int A =0; 
int B = 600;
int D = 460; 
int E = 500; 
int G = 300;
int H = 140;
int I = 280;


void setup() {
  size(600, 600); 
  ellipseMode(RADIUS); 
  background(255);
  
}
void draw() {
  

  
  //project 1
  
  
    smooth();
    
    line(440,600,140,0);
    line(440,600,0,0);
    line(440,600,0,160);
    line(440,600,0,220);
    
    fill(200);
    beginShape();
    vertex(0,160);
    vertex(0,220);
    vertex(440,600);
    endShape();
    noFill();


    fill(120);
    beginShape();
    vertex(0,0);
    vertex(0,160);
    vertex(440,600);
    endShape();
    noFill();
    
    fill(80);
    beginShape();
    vertex(0,0);
    vertex(140,0);
    vertex(440,600);
    endShape();
    noFill();


    fill(240);
    beginShape();
    vertex(0,220);
    vertex(0,300);
    vertex(440,600);
    endShape();
    noFill();
  
    fill(0);
    quad(200,260,240,260,240,300,200,340);
    noFill();
  
    fill(0);
    ellipse(100,300,70,70);
    beginShape();
    vertex(0,600);
    vertex(0,160);
    vertex(440,600);
    endShape();
    
    fill(255);
    triangle(240,200,260,240,220,240);
    noFill();

    fill(113,42,255);
    rect(260,300,120,80);
  
  //project 2
 
 

 
   noStroke();
 //bigger circle
  float C = dist(A, B, mouseX, mouseY);
  if (C < radius) {
    radius= radius+2;
    fill(26, 219, 160);
  }
  else {
    fill(158, 18, 255);
  }
  ellipse(0, 600, radius, radius);
  }
   void mousePressed(){
  radius = 200;
  
  
   //color reverse
  if(mousePressed == true) {
    background(255,255,140);}
 
 
  float mapR =map(mouseX, 0 ,0, 205, 225);
  float mapG = map(mouseY, 0, 600, 0, 255);
  fill(mapR, mapG, 0);
  rect(0,0,width, height);
 
  
  //change color cross  
  if(( mouseX > G )&&( mouseX < E )&&( mouseY > H)&&( mouseY < I )) {
    fill(26, 219, 160);
  }
  else if(( mouseX > E)&&(mouseY <D)) {
    fill(26, 219, 160);
  }
  else {
    fill(200);
  }
  beginShape();
  vertex(E,0);
  vertex(E,H);
  vertex(G,H);
  vertex(G,I);
  vertex(E,I);
  vertex(E,D);
  vertex(B,D);
  vertex(B,0);
  endShape();
  
 

}

