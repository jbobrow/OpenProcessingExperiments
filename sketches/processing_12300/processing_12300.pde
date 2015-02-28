
// Assignment # 2
// Name: Emily Dayton
// E-mail: edayton@brynmawr.edu
// Date: 9/16/10


float x, y, z, w, h;


void setup() {

  size (500, 500);
  smooth();
  background (207, 222, 250);

	w = 400;
	h = 400;
        x = 50; 
	y = 50;
        z = 0.0;

}

void draw() {
  
 

 //Pinwheel stick
  noStroke();
  fill (0);
  rect(240, 250, 10, 370);
  

  
 //Pinwheel
 //Four seperate parts that make up a pinwheel
  
 //Part 1
   noStroke();
   fill (mouseX-100, mouseX-200, mouseY+100);
   triangle (x+195, y+200, x+195, y+50, x+250, y+100);
   fill (mouseY-100, mouseY-200, mouseX+100);
   triangle (x+195, y+200, x+250, y+100, x+250, y+200);
   
   
 //Part 2
   noStroke();
   fill (mouseX-100, mouseX-200, mouseY+100);
   triangle (x+195, y+200, x+345, y+200, x+295, y+255);
   fill (mouseY-100, mouseY-200, mouseX+100);
   triangle (x+195, y+200, x+295, y+255, x+195, y+255);
   
 //Part 3
   noStroke();
   fill (mouseX-100, mouseX-200, mouseY+100);
   triangle (x+195, y+200, x+195, y+350, x+140, y+300);
   fill (mouseY-100, mouseY-200, mouseX+100);
   triangle (x+195, y+200, x+140, y+300, x+145, y+200);
   
 //Part 4
   noStroke();
   fill (mouseX-100, mouseX-200, mouseY+100);
   triangle (x+195, y+200, x+45, y+200, x+95, y+145);
   fill (mouseY-100, mouseY-200, mouseX+100);
   triangle (x+195, y+200, x+95, y+145, x+195, y+145);

 
 //Pinwheel center
  noStroke();
  fill(0);
  ellipse(x+195, y+200, w-370, h-370);
  
 
 

  


 
  }

    
    


