
//import processing.pdf.*;


void setup() {
  size (250,500); 
  noLoop();
 //  beginRecord(PDF, "filename.pdf"); 

}



void draw() {
   background (0); 
  smooth();
  int xTopRight= 0;
  int topRight=0;
  stroke (150,100);
  while (xTopRight <width){
    line(width/2,height/2,xTopRight,0);
    xTopRight=xTopRight +5; 
  }
  
  while (topRight < height){
    
    line(width/2, height/2, width, topRight);
    topRight=topRight+5;
  }
 
    
    int topLeft = 0;
    
    while (topLeft < width){
      stroke(150,100);
      
      line (width/2, height/2,topLeft,height);
      topLeft = topLeft +5;
      noStroke();
      
      int topBottom = 0;
      
      while(topBottom < height){
stroke(150,4);
        line(width/2,height/2, 0 , topBottom);
        topBottom = topBottom +5;
        
        noFill();
  ellipse (width/2, height/2, 40,40);

  stroke(200, 50, 3, 4);
  fill(200,50,5,1);
  ellipse (width/2,height/2,150,125);
  
  fill(0);
  noStroke();
  ellipse (width/2,height/2,30,30);
  
    stroke(200, 50, 3, 4);
  fill(200,50,5,1);
  ellipse (width/2,height/2,230,205);          
           
      } 
  }
//endRecord(); 
}


