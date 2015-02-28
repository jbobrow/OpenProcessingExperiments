
int cx;
int cy;

void setup() {
size(700,700);
background(165,150,135);

}

void draw() {
  
}

void mousePressed() {
  
  cx = mouseX;
  cy = mouseY;
  
  stroke(255,0);
  strokeWeight(random(2,3));
  point(cx,cy,mouseX,mouseY);
}

void mouseDragged() {
  
  stroke(255,alpha);
  strokeWeight(random(0,4));
  line(cx,cy,mouseX,mouseY);
  
  alpha =int(random(10,90));
  
  /*stroke(126,97,89);
  strokeWeight(random(2,3));
  point(mouseX,mouseY); */
  
}

void keyPressed() {
  if (keyCode =='s' || keyCode == 'S'){
    saveDrawing();
  }
  if(keyCode == 'r' || keyCode=='R'){ //reset drawing function
    resetDrawing();
  }
  if(keyCode == 'o' || keyCode == 'O') {
    strokeOrange();   
  }
  else{
    }
  }



void saveDrawing() {
  saveFrame("images/dandelion-###.png"); //when running on the web it will put the PNG in a new browser tab
}


void resetDrawing() { //resets the drawing, start over.
  noStroke();
  fill(165,150,135);
  rect(0,0,700,700);
 
}


void strokeOrange() {
  
 stroke(232,210,176,alpha);
 strokeWeight(random(0,4));
 line(cx,cy,mouseX,mouseY);


}





