
int xPOS = 50;
int yPOS = 70;
int Bsize = 30;

void setup() {
  size(800, 600);
  background(220);

  //drawing board
  noStroke();
  fill(255);
  ellipse(400, 300, 600, 600);


  //button
    fill(#ffeded);
    ellipse(xPOS, yPOS, Bsize, Bsize);
    fill(#ffd6d6);
    ellipse(xPOS, yPOS+Bsize, Bsize, Bsize);
    fill(#ffa5ba);
    ellipse(xPOS, yPOS+Bsize*2, Bsize, Bsize);
    fill(#ff7c8c);
    ellipse(xPOS, yPOS+Bsize*3, Bsize, Bsize);
    fill(#ff4158);
    ellipse(xPOS, yPOS+Bsize*4, Bsize, Bsize);
    fill(#c40058);
    ellipse(xPOS, yPOS+Bsize*5, Bsize, Bsize);
    fill(#880058);
    ellipse(xPOS, yPOS+Bsize*6, Bsize, Bsize);
    fill(#610058);
    ellipse(xPOS, yPOS+Bsize*7, Bsize, Bsize);
    fill(#430058);
    ellipse(xPOS, yPOS+Bsize*8, Bsize, Bsize);
    fill(#4342a0);
    ellipse(xPOS, yPOS+Bsize*9, Bsize, Bsize);
    fill(#5578b9);
    ellipse(xPOS, yPOS+Bsize*10, Bsize, Bsize);
    fill(#82afa1);
    ellipse(xPOS, yPOS+Bsize*11, Bsize, Bsize);
    fill(#589664);
    ellipse(xPOS, yPOS+Bsize*12, Bsize, Bsize);
    fill(#22722e);
    ellipse(xPOS, yPOS+Bsize*13, Bsize, Bsize);
    fill(255);
    ellipse(xPOS, yPOS+Bsize*15, Bsize*2, Bsize*2);

}
void draw() {
 
  if (mousePressed) {
 
     //brush
    if (790 > pmouseX && 790 > mouseX && pmouseX > 110 && mouseX > 110 &&
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }


    
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS && mouseY < yPOS+Bsize) {
        stroke(#ffeded);
        strokeWeight(5);
      }
    
    
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize && mouseY < yPOS+Bsize*2) {
        stroke(#ffd6d6);
        strokeWeight(5);
      }
    
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*2 && mouseY < yPOS+Bsize*3) {
        stroke(#ffa5ba);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*3 && mouseY < yPOS+Bsize*4) {
        stroke(#ff7c8c);
        strokeWeight(5);
      }
   
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*4 && mouseY < yPOS+Bsize*5) {
        stroke(#ff4158);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*5 && mouseY < yPOS+Bsize*6) {
        stroke(#c40058);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*6 && mouseY < yPOS+Bsize*7) {
        stroke(#880058);
         strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*7 && mouseY < yPOS+Bsize*8) {
        stroke(#610058);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*8 && mouseY < yPOS+Bsize*9) {
        stroke(#430058);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*9 && mouseY < yPOS+Bsize*10) {
        stroke(#4342a0);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*10 && mouseY < yPOS+Bsize*11) {
        stroke(#5578b9);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*11 && mouseY < yPOS+Bsize*12) {
        stroke(#82afa1);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*12 && mouseY < yPOS+Bsize*13) {
        stroke(#589664);
        strokeWeight(5);
      }
       
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*13 && mouseY < yPOS+Bsize*14) {
        stroke(#22722e);
        strokeWeight(5);
      }
 
  
      if ( mouseX >xPOS && mouseX < xPOS+Bsize && mouseY > yPOS+Bsize*15 && mouseY < yPOS+Bsize*16) {
        stroke(255);
        strokeWeight(20);
      }
 
  }
}

