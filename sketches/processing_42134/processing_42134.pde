
int r = 150;
int g = 0;
int b = 0;


void setup () {
  size (500, 500);
//  background(r, g, b);
}

void draw (){ 
  //  rect(mouseX,450, 75,10);

  background(r,g,b);
  stroke(128);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  //Top Left Square
 if (mouseX < 0 && mouseX > 250 && mouseY < 0  && mouseY > 250) {
 } if (mousePressed){
       fill(200, 255, 10); 
        noStroke();
        rect(0, 0, width/2, height/2);
      } else {
        fill(200,0,120);
        rect(0, 0, width/2, height/2);
    }
   

  // Bottom Right Square    
 if (mouseX < 250 && mouseX > 500 && mouseY < 250 && mouseY > 500) {
    } if (mousePressed) {
       fill(0);
       rect(250, 250, width/2, height/2);
    }else{
      fill(255,0,0);
      rect(250, 250, width/2, height/2);
     }


  // Bottom Left Square
  if (mouseX < 0 && mouseX > 250 && mouseY < 250 && mouseY > 500) {
  } if (mousePressed) {
      fill(128);
      rect(0, 250, width/2 , height/2);
    }else{
      fill(0,255,0);
      rect(0,250, width/2, height/2);
 }

  //Top Right Square
  if (mouseX < 250  && mouseX > 500  && mouseY < 0 && mouseY > 250) {
   } if (mousePressed) {
      fill(255);
       rect(250, 0, width/2, height/2);
   }else{
     fill(10,10,200);
     rect(250, 0, width/2, height/2);
   }
  }


