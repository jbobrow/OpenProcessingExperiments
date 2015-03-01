
int a = 100;
int b = 150;
int c = 130;

PFont f;
//sets variable for 

int theShape = 0;
//sets varaibale for theShape (which is the shape that you can change with the up and down arrow keys)
int theColor = 0;
//sets varaibale for theColor (which is the colors that you can shuffle through with the left and right arrow keys)
color[] colors = { color(0,0,0), color(255,255,255), color(215,228,232), color(102,115,117) };
//the differently shade of gray that you can change the colors to with the left and right arrows 

void setup (){
  // runs the code only once
frameRate (24);
//loops the image 24 times a frame
size(500,400);
//sets the size of the sketch to 500 px in width and 400 px in height


  f = createFont("Georgia", 16);
   //detemin fontface, and size
  textFont(f);
   // Create the font
}

void draw (){
// runs the code as a loop at the default frame rate, which is 24
 background(0,100,130);
  textAlign(RIGHT);
  //Aligns text to the right
  drawType(width * 0.25);
  fill( colors[theColor] );
  //fills colors
    noStroke();
    //set it so that there is no stroke 
  switch( theShape ){
    //The changing shape
    case 0:
    default:
      ellipse(370,150,160,160);
      //sets size and location of circle
      break;
    case 1:
      rect(290,70,160,160);
      //sets size and location of square
      break;
    case 2:
      beginShape(TRIANGLES);
      vertex(370, 70);
      vertex(290, 230);
      vertex(450, 230);
      //sets size and location of
      endShape();
      //closes shape
      break;
    case 3:
      rect(360,70,20,160);
       //sets size and location of plus sign 
      rect(290,140,160,20);
      //sets size and location of plus sign 
      break;
  }
}  

 void keyPressed(){
    if( key==CODED ){
     if( keyCode == UP ){theShape=(theShape+1)%4;}
     //changes shape when you press up arrouw
     if( keyCode == DOWN ){theShape=(theShape+3)%4;}
     //changes shape the other way when you press down arrow
     if( keyCode == LEFT ){theColor=(theColor+1)%4;}
     //changes color when you press left arrow
     if( keyCode == RIGHT ){theColor=(theColor+3)%4;}
     //changes color the other way when you press right arrow
    }
  }



void drawType(float x) {
  fill(0);
  //fills text black
  text("Instructions", 225, 95);
  //writes the text at that location
  fill(51);
  //fills text dark gray
  text("left/right arrows change shade", 250, 130);
   //writes the text at that location
  fill(204);
  //fills text light gray
  text("up/down arrows change shape", 250, 165);
   //writes the text at that location
  fill(255);
  //fills text white
  text("make a white triangle", 250, 210);
   //writes the text at that location
}

