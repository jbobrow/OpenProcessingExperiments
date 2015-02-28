
PFont f;                          // STEP 2 Declare PFont variable

void setup() { 
    size(700, 700); 
    background(0);
    smooth(); 
    stroke(0, 0); 
    f = createFont("Arial",16,true);
  } 
  
  void draw() { 
     textFont(f,16);                 // STEP 4 Specify font to be used
    
      
int stroke1;
int stroke2;
int stroke3;
int x;
int y;
int colour;
int colour1;
int colour2;


x= 250;
y= 100;
colour=int(random(0,255));
colour1=int(random(0,255));
colour2=int(random(0,255));
stroke1 = 50;
stroke2 = 100;

{
    if ( mouseX > 450 && mouseX < 550 && mouseY > 550 && mouseY < 650 ) {
      fill( 200);
rect(x-25, y, 225, stroke1,0, 100, 0, 0);
rect(x, y+100, 200, stroke1,0, 0, 100, 0);
rect(x-25, y+200, 100, stroke1,0, 0, 0, 0);
rect(x+150, y+200, 75, stroke1,0, 0, 0, 0);
rect(x, y+50, 50, stroke1,0, 0, 0, 0);
rect(x, y+150, 50, stroke1,0, 0, 0, 0);
rect(x+150, y+150, 50, stroke1,0, 100, 0, 0);
rect(x+150, y+50, 50, stroke1,0, 0, 0, 0);
  fill(255);                        // STEP 5 Specify font color 
  text("Serif",330,450);

    } else {
      background(0);
    }
   rect(450,550,100,100);
rect(150,550,100,100);
  }

{
    if ( mouseX > 150 && mouseX < 250 && mouseY > 550 && mouseY < 650 ) {
      fill( 200);
rect(x, y, 200, stroke1,0, 100, 0, 0);
rect(x, y+100, 200, stroke1,0, 0, 100, 0);
rect(x, y+200, 50, stroke1,0, 0, 0, 0);
rect(x+150, y+200, 50, stroke1,0, 0, 0, 0);
rect(x, y+50, 50, stroke1,0, 0, 0, 0);
rect(x, y+150, 50, stroke1,0, 0, 0, 0);
rect(x+150, y+150, 50, stroke1,0, 100, 0, 0);
rect(x+150, y+50, 50, stroke1,0, 0, 0, 0);

  fill(255);                        // STEP 5 Specify font color 
  text("Sans-Serif",310,450);
    }
   rect(450,550,100,100);
rect(150,550,100,100);
  }






  } 


