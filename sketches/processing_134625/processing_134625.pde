
  void setup() { 
    size(700, 700); 
    
 background(100,300);
    
  } 
  void draw() { 
     
      
int stroke1;
int stroke2;
int stroke3;
int x;
int y;
int colour;
int colour1;
int colour2;


x= 100;
y= 100;
colour=int(random(0,255));
colour1=int(random(0,255));
colour2=int(random(0,255));
stroke1 = 50;
stroke2 = 100;


fill(colour, colour1, colour2, 200);
rect(mouseX-25, mouseY, 225, stroke1,0, 100, 0, 0);

fill(colour, colour1, colour2, 200);
rect(mouseX, mouseY+100, 200, stroke1,0, 0, 100, 0);


fill(colour, colour1, colour2, 200);
rect(mouseX-25, mouseY+200, 100, stroke1,0, 0, 0, 0);

fill(colour, colour1, colour2, 200);
rect(mouseX+150, mouseY+200, 75, stroke1,0, 0, 0, 0);

fill(colour, colour1, colour2, 200);
rect(mouseX, mouseY+50, 50, stroke1,0, 0, 0, 0);

fill(colour, colour1, colour2, 200);
rect(mouseX, mouseY+150, 50, stroke1,0, 0, 0, 0);

fill(colour, colour1, colour2, 200);
rect(mouseX+150, mouseY+150, 50, stroke1,0, 100, 0, 0);

fill(colour, colour1, colour2, 200);
rect(mouseX+150, mouseY+50, 50, stroke1,0, 0, 0, 0);



  } 


