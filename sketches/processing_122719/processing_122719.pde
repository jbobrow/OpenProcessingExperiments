
int x, y;
int xsize=300;
int ysize=300;



void setup(){
  size(600, 600);
  background(255);
   frameRate(15);
}

void draw(){
   //line(mouseX, mouseY, pmouseX, pmouseY);
}

void mouseDragged(){
  line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(3);
}

void keyPressed(){
switch(key){
   case '0':
    background(255);    
    break;
   case '1':
    stroke(0);
    break;
   case 'w':
    stroke(255);
    break;
   case 'r':
    stroke(255, 0, 0);
    break;
   case 'g':
    stroke(0, 255, 0);
    break;
   case 'b':
    stroke(0, 0, 255);
    break;
   case 'y':
    stroke(255, 255, 0);
    break;
   case 'c':
    stroke(0, 255, 255);
    break;
   case 'm':
    stroke(255, 0, 255);
    break;
  }
   if (key == 'q') {
   
 
strokeWeight (2);
stroke(255,25);
line (0, 0, mouseX,mouseY);
stroke(255,0,0,25);
line (0, ysize, mouseX,mouseY);
stroke(0,255,0,25  );
line (xsize, 0, mouseX,mouseY);
stroke( 0,0, 255,25 );
line (xsize, ysize, mouseX,mouseY);
}
}







