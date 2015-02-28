
float y;
  void setup() {
    size(250,250);
    smooth();
    background(#FAE7A2+10);
    noStroke();
  }// basic background
  
   void draw() {
    y=y+5;
   
    fill(mouseX,random(100,200),30,mouseY);
    
    translate(50,100);
    rotate(y-8);
    fill(random(mouseX+10,mouseY),random(8,90),mouseY,random(50,0));
    ellipse(random(30,100),random(15,30),y,5); 
  }


