

int patternSeperationX = 50;
int patternSeperationY = 50;

void setup(){
  size(300,600);
  smooth();
  background(247,236,102);
    fill(255,133,10);
    noStroke();
    ellipse(300,300,300,300);
    stroke(255,133,10);
    strokeWeight(5);
    //line(299,0,299,250);
    //line(100,0,260,200);
   // line(0,155,255,280);
   // line(0,300,250,300);
    //line(0,465,255,320);
    //line(260,400,100,600);
    //line(299,600,299,350);
   noFill();
   ellipse(300,300,350,350);
    strokeWeight(7);
    ellipse(300,300,450,450);
    strokeWeight(11);
    ellipse(300,300,600,600);
    strokeWeight(19);
    ellipse(300,300,800,800);
    strokeWeight(1);
    for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
   
}
 
 
 void draw()
 {
 }
 
 void yourFunction(){
   stroke(255,133,10);
   fill(247,236,102);
   ellipse (25,25,20,20);
   line(0,0,21,22);
   line(12.5,0,23,20);
   line(25,0,25,20);
   line(37.5,0,27,21);
   line(50,0,30,22);
   line(30,24,50,12.5);
   line(30,25,50,25);
   line(30,26,50,37.5);
   line(29,28,50,50);
   line(28,29,37.5,50);
   line(25,30,25,50);
   line(23,30,12.5,50);
   line(0,50,21,30);
   line(20,29,0,37.5);
   line(0,25,20,25);
   line(0,12.5,20,23);
   
   
   
 }
   

