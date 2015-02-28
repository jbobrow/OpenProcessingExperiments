
// Assignment # 2
// Name: Lucia Echegorri
// E-mail: lechegorri@brynmawr.edu
// Date: 16/Sep/2010


float x, y, w, h; 

void setup() {

	size(400,600);
        smooth();
        background(250,195,124);
        noStroke();


//Values for variables

	x = 100;

	y = 100;

	w = 400;

	h = 600;
}
void draw() {

	// draw the object so that its top left corner is at ,x, y> and is of size w x h

  fill(21,95,60);
  
        beginShape();
          curveVertex(w/2,50);
          curveVertex(w/2,50);
          curveVertex(w/2+15,50);
          curveVertex(w/2+15,350);
          curveVertex(w*0.75,420);
          curveVertex(w/2+100,h);
          curveVertex(w/2-100,h);
          curveVertex(w*0.25,420);
          curveVertex(w/2-15,350);
          curveVertex(w/2-15,50);
          curveVertex(w/2,50);
          curveVertex(w/2,50);
         endShape();
         
  fill(255,132,8,150);
    
        beginShape();
          curveVertex(w/2,2*h/3);
          curveVertex(w/2,2*h/3);
          curveVertex(w/4,3*h/4);
          curveVertex(w/4+30,h);
          curveVertex(w/4+160,h);
          curveVertex(3*w/4,3*h/4);
          curveVertex(w/2,2*h/3);
        endShape();
  
  fill(255,23,23,150);
  
         beginShape();
           curveVertex(0,h/2);
           curveVertex(0,h/2);
           curveVertex(50,h/2);
           curveVertex(50,2*h/3);
           curveVertex(150,h);
           curveVertex(0,h);
           curveVertex(0,h);
         endShape();
   
   
   fill(57,60,178,150);
  
         beginShape();
           curveVertex(w,h/2);
           curveVertex(w,h/2);
           curveVertex(w-50,h/2);
           curveVertex(w-50,2*h/3);
           curveVertex(w-150,h);
           curveVertex(w,h);
           curveVertex(w,h);
         endShape();      
}  


void mousePressed() {


	x = 200;

        y = 200;
        
        w = w/2;
        
        h = h/2;
        



}

