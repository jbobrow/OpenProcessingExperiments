

int brush;
int col;

void setup() {
  
  
  //Brush Variablers
  col=1;
  brush=1;
  
  //Setup
  size(500, 500);
  background(255);
  noStroke();
  fill(0);
  smooth();
  


}
 
 
void draw() {

  if(mousePressed == true && brush==1){
          ellipse(mouseX- random(0,5), mouseY+random(0,5), random(2,5), random(5,8));
          ellipse(mouseX- random(0,5), mouseY+random(0,5), random(2,5), random(5,8));

  }
  
    if(mousePressed == true && brush==2){
          ellipse(mouseX, mouseY, 20, 20);

  }
  
    if(mousePressed == true && brush==3){
          ellipse(mouseX, mouseY, 30, 30);


  }
}

 

 
void keyPressed() {
  
//Clear Canvas with e

if (key == 'e') {
     fill(255);
     rect(0,0,500,500);
     fill(0);
		}

//Change brushes with numbers 1-3

    if (key == '1') {
    brush=1;

}
    if (key == '2') {
  brush=2;

}
    if (key == '3') {
  brush=3;

}

    if (key == 'c') {
      
      if(col==1){
            fill(255,40,153);
      }
      
          if ( col==2) {
                        fill(255,215,40);

      }
                if (col==3) {
                              fill(40,196,255);

      }

                            if (col==4) {
           col=0;
           fill(0);
      }
      
      col++;

    }



}

