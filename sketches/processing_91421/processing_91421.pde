
int[] x = {50,61,83,69,71,50,29,31,17,39};
int[] y = {18,37,43,60,82,73,82,60,43,37};

int[]x2=new int[5];
int[]y2=new int[5];

void setup(){
  
  size(400,400);
  background(255);
  smooth();
}
  
  
  void draw(){
    println(mouseX);
    println(mouseY);
    for(int i=0; i<400; i++){
      float percent=(float)i/400;
      stroke(255*percent,0,255);
      //draws 400 lines. 
      line(0,i,400,i);}
    //makes the line happen every 40 pixels.
    for(int i=0; i<400; i+=10){
      stroke(0);
     line(0,i,400,i); }
     for(int i=0; i<400; i+=10){
       stroke(0);
       line(i,0,i,400);}
    pushMatrix();
    drawShapes(0);
    popMatrix();
   
    pushMatrix();
    translate(-56,-56);
    rotate(radians(80));
    drawShapes(200);
    popMatrix();
    
    pushMatrix();
    translate(-53,-53);
    rotate(radians(30));
    drawShapes(300);
    popMatrix();
    
    pushMatrix();
    translate(-50,-50);
    rotate(radians(60));
    drawShapes(350);
    translate(100,100);
    drawShapes(300);
    popMatrix();
    
    pushMatrix();
    translate(50,50);
    rotate(radians(90));
    drawShapes(100); 
    popMatrix();
}
  
  void drawShapes(float offset){
    fill(255,247,0);
     beginShape(); 
     for(int i=0; i<x.length; i++){
      vertex(x[i]+offset, y[i]);}
      endShape();
     
     }
       /*fill(0,121,5);
       beginShape();
       vertex(200,160);
       vertex(160,200);
       vertex(240,200);
       vertex(180,180);
       endShape();*/
      
  
  
  
  
  


