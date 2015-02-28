
float angle=0.1;// variable for angle
float x;
  void setup() {
    size(250,250);
    smooth();
    noStroke();
  }// basic setup
  
   
   void draw() {
    
   for(int y=0;y<=height;y+=2) {
     fill(206,random(200,250),100,200);
     angle=angle+1;
     translate(60,120); //offset
     rotate(angle-8); //rotate as angle-8 value
     fill(random(mouseX+100,mouseY-100),random(8,90),mouseY,random(110,x));
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
   
 
 void mouseDragged() { //when you dray your mouse, pattern appears
  //background(204);
  int x=20;
int y=-30;
int diameter=100;
 ellipse(x+2,y+1,diameter+3,diameter);
}
  



