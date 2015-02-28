


 //declarations///////////////////////
float x = 400; 
float y = 200; 
float xx = 200; 
float yy = 200; 
float easing = .07;  
float red;





 //////////////////////////////////////////////////////
void setup() {
size(640, 480);
smooth();
background(0);
cursor(CROSS);




}
///////////////////////////////////////////////////////



void draw(){ 
  
////////////////////////////////////
 if(mousePressed) { red = 255;
 } 
 
  else{ 
         red =255;
  }
////////////////////////////////////


  
  
fill(10, 20, 10);
ellipse(155, 200, 310, 200);

fill(mouseX, 24, 30, 30);
ellipse(155, 200, 300, 200);

fill(10, 20, 10);
ellipse(485, 200, 310, 200);

fill(mouseY, 24,  30, 30);
ellipse(485, 200, 300, 200);


////////////////////////////////////////////////////

fill(0);
ellipse(170, 230, 180, 180);

fill(0);
ellipse(475, 230, 180, 180);


           


////////////////////////////////////////////////////    
//pupils////////////////////////////////////////////

fill(255, 255, 255, red);

//ellipse(170, 230, 40, 40);
//ellipse(475, 230, 40, 40);


///////////////////////////////////////////////////



  //right pupil
float mx = constrain (mouseX, 445, 505); 
float my = constrain (mouseY, 220, 240);
x += (mx-x) * easing; 
y += (my-y) * easing; 
fill (red, red, red, 150); 

ellipse (x, y, 30, 30); 

fill(25, 25, 10, 150);
ellipse (x, y, 90, 90);
  
    //left pupil 
    
  float mxx = constrain (mouseX, 140, 200); 
  float myy = constrain (mouseY, 220, 240); 
  xx += (mxx-xx) * easing; 
  yy += (myy-yy) * easing; 
fill (red, red, red, 150);  
  ellipse (xx, yy, 30, 30); 
  
  fill(25, 25, 10, 150);
  ellipse (xx, yy, 90, 90);
     

     
  /////////////////////////////////////
  if (mousePressed){ 
  fill(0);
  ellipse(300, 300, 800, 800);
}
  /////////////////////////////////////


}

