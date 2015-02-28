
float angle=0.1;
float x;
  void setup() {
    size(250,250);
    smooth();
    noStroke();
  }// basic setup
  
   
   void draw() {
    
   for(int y=0;y<=height;y+=2) {
     fill(mouseX,random(100,200),30,mouseY);
     angle=angle+1;
     translate(50,100);
     rotate(angle-8);
     fill(random(mouseX,mouseY),random(8,90),mouseY,random(210,10));
     ellipse(random(30,100),30,y,5);
   }
   }
    
    void mousePressed()  { //when you click, whe pattern changed
      stroke(210,110);
      fill(random(30,mouseX));
      strokeWeight(random(10,19));// the new pattern seems like on a white background but actually I increased the stroke weights
      for(int y=0;y<=height;y+=2)
      rect(pmouseX,y*y,pmouseY,y+1);     
}
   
 
 void mouseDragged() {
  //background(204);
  int x=20;
int y=-30;
int diameter=100;
 ellipse(x+2,y+1,diameter+3,diameter);
}
  



