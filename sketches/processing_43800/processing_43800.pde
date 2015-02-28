
int x = 400;
int y = 400;
float w = 100;
float h = 100;

int x1 = 0;
int y1 = 0;
float w1 = 100;
float h1 = 100;

int x2 = 400;
int y2 = 0;
float w2 = 100;
float h2 = 100;

int x3 = 0;
int y3 = 400;
float w3 = 100;
float h3 = 100;




void setup () {  
  size (500, 500);
  noStroke ();
  smooth ();
}
  void draw (){
   
    noCursor();
  
   background (0, 108, 10);
  
  fill(0,0,0, 50);
  rect(mouseX-50,mouseY-50,100,100, 20, 30);
   
   boolean hit = false;
   
   if (mouseX > x && mouseX < x + w) {
      if (mouseY > y && mouseY < y + h) {
        
     hit=true;
   }
   }
   if (mouseX > x1 && mouseX < x1 + w1) {
      if (mouseY > y1 && mouseY < y1 + h1) {
        
     hit=true;
   }
   }
   if (mouseX > x2 && mouseX < x2 + w2) {
      if (mouseY > y2 && mouseY < y2 + h2) {
        
     hit=true;
   }
   }
   if (mouseX > x3 && mouseX < x3 + w3) {
      if (mouseY > y3 && mouseY < y3 + h3) {
        
     hit=true;
   }
    }

    if (hit == true) {
     fill (255, 0, 0, 90);
} 

// color change
else {
  fill (0,0,0, 80);
}

//corner's rect
rect (x, y, w , h, 20, 30 );
rect (x1, y1, w1 , h1,20, 30 );
rect (x2, y2, w2 , h2, 20, 30 );
rect (x3, y3, w3 , h3, 20, 30 );

  }

                
                
