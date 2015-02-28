
void setup() { 
  size(400,400);
  noLoop(); // draw() will not loop
}


float x=0;

void draw(){
  background(80,230,200);
  
  if (x > 12) x = 0;
 x=x+0.08;
 
 
  
  for (int i=0; i<100; i++) {
    stroke(255,150,0);
    strokeWeight(.7);
    
    
    line(x*30, 30*x, x*0.2, x*i); 
    line(x*30, 55*x, x*0.4, x*i);
    line(x*50, 70*x, x*0.6, x*i);
    
    noStroke();
    fill(255,200,0,(255/2));
     
     pushMatrix(); {
        if (x>10 || X<300) {
      ellipse( 72*x, 210, 6*pow(x-1,2.5), 6*pow(x-1,2.5));
    }
        popMatrix();
  }
    
      stroke(255,150,0);
    strokeWeight(0.3);
     
    line(400, 2*(i/.2), x*0.2, x*i*40); 
  }
}
void mousePressed() {
  loop();
}
void mouseReleased(){
  noLoop();
  draw();
  fill(255,100);
  noStroke();
  rect(0,0,400,100*pow(.45*x,2));
  
}
