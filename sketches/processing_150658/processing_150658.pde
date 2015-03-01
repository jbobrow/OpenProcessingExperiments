
int counter;

void setup()  {
 size(500, 500);

}


void draw()   {
  
  if(mousePressed)  {
    background(#3CFF08);
    
    fill(#FFF303);
  triangle(50, 50, 75, 50, 110, 180); 
  
  fill(#FF7403);
  triangle(140, 40, 150, 35, 150, 170); 
  
  fill(#E131F5);
  triangle(195, 60, 215, 50, 170, 180); 
  
  fill(#2C4DFF);
  triangle(270, 65, 295, 70, 310, 160); 
  
  fill(#A31CFF);
  triangle(330, 30, 350, 20, 350, 180); 
  
  fill(#F5021F);
  triangle(400, 45, 420, 50, 390, 170); 
  
  
  
  fill(#DE1D61);
  ellipse(250, 420, 105, 140); 
 
  fill(#8E4058);
  ellipse(250, 420, 90, 95); 
  
  
  fill(#FCBFD5);
  ellipse(250, 435, 75, 50);
  
  
 stroke(0);
  fill(255);
  ellipse(150, 250, 150, 85);

stroke(0);
  fill(255);
  ellipse(350, 250, 150, 85);
  
  
 stroke(0); 
  fill(0, 191, 255);
  ellipse(150, 250, 85, 85);

stroke(0);
  fill(0, 191, 255);
  ellipse(350, 250, 85, 85);
  
  fill(0);
  ellipse(150, 250, 40, 40);
  
  fill(0);
  ellipse(350, 250, 40, 40);
  
 
  }  else  {
    background(0);
    
    stroke(0);
  fill(#F5A874);
  ellipse(150, 250, 150, 85);

stroke(0);
  fill(#F5A874);
  ellipse(350, 250, 150, 85);
   
}

}

