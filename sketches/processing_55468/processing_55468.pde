
float y = 0.1;
float x = 15;
float x2 = 15;
float x3 = 15;
float y2 = 0.1;
float posX = 320; 
float posY = 240; 


void setup(){ 
  size(640, 480); 
  ellipseMode(CENTER); 
  background(0); 
  smooth();
} 

void draw(){ 
  background(0);
  noFill();
  
    noFill();
  strokeWeight(1);
  x += 20;
  x2 += 20;
  x3 += 4;
  y2+=-4;
  
  stroke(#78EBF4);
  ellipse(mouseX,mouseY, 40, 40); 
 
  stroke(#78EBF4,y);
  ellipse(pmouseX, pmouseY, x, x);
     
  ellipse(pmouseX, pmouseY, x2, x2);
    
  ellipse(pmouseX, pmouseY, x3, x);

if (mousePressed) {
      float x = dist (width/8,height/8,mouseX,mouseY);
      stroke(#78EBF4);
      ellipse(mouseX,mouseY,random(x),random(x));
    }

if (mousePressed) {
      float x = dist (width/4,height/4,mouseX,mouseY);
      stroke(#78EBF4);
      ellipse(mouseX,mouseY,random(x),random(x));
    }

for (int c=10; c<1500; c+=25) {
  fill(000000,0);
  stroke(#D74700,c*250);
  ellipse(82,48,c,c);
}


}

void mouseMoved(){
  y=random(15,250);
 
  x = 2;
  x2 = 2;
  x3 = 2;
  
}

