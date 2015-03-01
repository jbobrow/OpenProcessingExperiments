
 int xPOS = 40;
  int yPOS = 70;
  int Bsize = 30;
   
  void setup() {
    size(800, 600);
    background(117, 117, 117);
    noStroke();
  
   
    //shape free
    fill(233, 233, 233);
    rect(100, 50, 650, 500);
    fill(117, 117, 117);
    rect(690, 50, 20, 25);
    rect(650, 50, 20, 25);
    rect(610, 50, 20, 25);
    rect(570, 50, 20, 25);
    rect(530, 50, 20, 25);
    rect(490, 50, 20, 25);
    rect(450, 50, 20, 25);
    rect(410, 50, 20, 25);
    rect(370, 50, 20, 25);
    rect(330, 50, 20, 25);
    rect(290, 50, 20, 25);
    rect(250, 50, 20, 25);
    rect(210, 50, 20, 25);
    rect(170, 50, 20, 25);
    rect(130, 50, 20, 25);
  
    
    //button
    fill(255, 250, 112);
    rect(xPOS, yPOS, Bsize, Bsize);
    fill(255, 228, 0);
    rect(xPOS, yPOS+Bsize, Bsize, Bsize);
    fill(255, 169, 112);
    rect(xPOS, yPOS+Bsize*2, Bsize, Bsize);
     fill(255, 81, 77);
    rect(xPOS, yPOS+Bsize*3, Bsize, Bsize);
     fill(255, 122, 175);
    rect(xPOS, yPOS+Bsize*4, Bsize, Bsize);
     fill(255, 197, 220);
    rect(xPOS, yPOS+Bsize*5, Bsize, Bsize);
    fill(230, 197, 255);
    rect(xPOS, yPOS+Bsize*6, Bsize, Bsize);
    fill(169, 169, 255);
    rect(xPOS, yPOS+Bsize*7, Bsize, Bsize);
    fill(142, 107, 255);
    rect(xPOS, yPOS+Bsize*8, Bsize, Bsize);
    fill(23, 116, 255);
    rect(xPOS, yPOS+Bsize*9, Bsize, Bsize);
    fill(158, 222, 255);
    rect(xPOS, yPOS+Bsize*10, Bsize, Bsize);
    fill(121, 255, 244);
    rect(xPOS, yPOS+Bsize*11, Bsize, Bsize);
    fill(105, 217, 96);
    rect(xPOS, yPOS+Bsize*12, Bsize, Bsize);
    fill(18, 111, 0);
    rect(xPOS, yPOS+Bsize*13, Bsize, Bsize);
    fill(233, 233, 233);
    rect(xPOS, yPOS+Bsize*15, Bsize, Bsize);
    
  }
   
   
  void draw() {
   
   
    if (mousePressed) { 
      if (730 > mouseX && mouseX > 100 && 580> mouseY && mouseY> 20 == true) {
       float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
       strokeWeight(weight);
        line(pmouseX, pmouseY, mouseX, mouseY);
       
      }
   
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS && mouseY < yPOS+Bsize) {
        stroke(255, 250, 112);
        
      }
   
   
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize && mouseY < yPOS+Bsize*2) {
        stroke(255, 228, 0);
    
      }
   
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*2 && mouseY < yPOS+Bsize*3) {
        stroke(255, 169, 112);
       
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*3 && mouseY < yPOS+Bsize*4) {
        stroke(255, 81, 77);
        
      }
  
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*4 && mouseY < yPOS+Bsize*5) {
        stroke(255, 122, 175);
      
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*5 && mouseY < yPOS+Bsize*6) {
        stroke(255, 197, 220);
       
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*6 && mouseY < yPOS+Bsize*7) {
        stroke(230, 197, 255);
        
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*7 && mouseY < yPOS+Bsize*8) {
        stroke(169, 169, 255);
       
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*8 && mouseY < yPOS+Bsize*9) {
        stroke(142, 107, 255);
        
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*9 && mouseY < yPOS+Bsize*10) {
        stroke(23, 116, 255);
        
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*10 && mouseY < yPOS+Bsize*11) {
        stroke(158, 222, 255);
      
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*11 && mouseY < yPOS+Bsize*12) {
        stroke(121, 255, 244);
      
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*12 && mouseY < yPOS+Bsize*13) {
        stroke(105, 217, 96);
       
      }
      
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*13 && mouseY < yPOS+Bsize*14) {
        stroke(18, 111, 0);
      
      }

 
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*15 && mouseY < yPOS+Bsize*16) {
        stroke(233, 233, 233);
      
      }

  }
}
