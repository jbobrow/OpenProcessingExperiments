
void setup(){
  size(525,300);
  background(255);
  stroke(255);
}
 
void draw(){
  strokeWeight(2);
  
  //green bases
 fill(4,137,14);
    triangle(0,0,0,25,50,0);
    triangle( 0,25,0,75,50,50);
    triangle(0,75,0,125,50,100);
    triangle(0,125,0,175,50,150);
    triangle(0,175,0,225,50,200);
    triangle(0,225,0,275,50,250);
    triangle(0,275,0,325,50,300);
    
 
   triangle(0,25,0,75,25,50);
   //orange bases
fill(255,158,0);
   triangle(0,0,0,25,25,0);
   triangle(0,25,0,72,25,50);
   triangle(0,75,0,125,25,100);
   triangle(0,125,0,175,25,150);
   triangle(0,175,0,225,25,200);
   triangle(0,225,0,275,25,250);
   triangle(0,275,0,325,25,300);
     
   //green//
fill(4,137,14);
 
        
   triangle(mouseX,-7,mouseX,25,mouseX+50,0);
        triangle(mouseX,25,mouseX,75,mouseX+50,50);
        triangle(mouseX,75,mouseX,125,mouseX+50,100);
        triangle(mouseX,125,mouseX,175,mouseX+50,150);
        triangle(mouseX,175,mouseX,225,mouseX+50,200);
        triangle(mouseX,225,mouseX,275,mouseX+50,250);
        triangle(mouseX,275,mouseX,325,mouseX+50,300);       

triangle(50,0,    0,25,     50,50);
triangle(mouseX,25, mouseX+50,0, mouseX+50,50);
 
triangle(50,50,   0,75,     50,100);
triangle(mouseX,75, mouseX+50,50,mouseX+50,100);

triangle(50,100,  0,125,    50,150);
triangle(mouseX,125, mouseX+50, 100, mouseX+50,150);

triangle(50,150,  0,175,    50,200);
triangle(mouseX,175,  mouseX+50,150,  mouseX+50,200);

triangle(50,200,  0,225,  50,250);
triangle(mouseX, 225,  mouseX+50,200,  mouseX+50,250);

triangle(50,250,  0,275,  50,300);
triangle(mouseX,275,  mouseX+50,250,  mouseX+50,300);

triangle(500,25,525,0,525,50);
triangle(500,25,550,0,550,50);
triangle(500,75,525,50,525,100);
triangle(500,75,550,50,550,100);
triangle(500,125,525,100,525,150);
triangle(500,125,550,100,550,150);
triangle(500,175,525,150,525,200);
triangle(500,175,550,150,550,200);
triangle(500,225,525,200,525,250);
triangle(500,225,550,200,550,250);
triangle(500,275,525,250,525,300);
triangle(500,275,550,250,550,300);

    

//yellow\\
fill(255,243,0);
  triangle(50,0,     50,50,   mouseX,25);
  triangle(mouseX+50,0,mouseX+50,50,500,25);
   
  triangle(50,50,    50,100,  mouseX,75);
  triangle(mouseX+50,50, mouseX+50,100, 500,75);
   
  triangle(50,100,   50,150,  mouseX,125);
  triangle(mouseX+50,100,mouseX+50,150,500,125);
  
  triangle(50,150,  50,200,  mouseX,175);
  triangle(mouseX+50,150, mouseX+50,200,500,175);
  
  triangle(50,200,  50,250,  mouseX,225);
  triangle(mouseX+50,200,  mouseX+50,250, 500,225);
  
  triangle(50,250,  50,300,  mouseX,275);
  triangle(mouseX+50,250,  mouseX+50,300,  500,275);

  triangle(50,0,25,25,50,50);
  triangle(mouseX+50,0,mouseX+25,25,mouseX+50,50);
  triangle(50,50,25,75,50,100);
  triangle(mouseX+50,50,mouseX+25,75,mouseX+50,100);
  triangle(50,100,25,125,50,150);
  triangle(mouseX+50,100,mouseX+25,125,mouseX+50,150);
  triangle(50,150,25,175,50,200);
  triangle(mouseX+50,150,mouseX+25,175,mouseX+50,200);
  triangle(50,200,25,225,50,250);
  triangle(mouseX+50,200,mouseX+25,225,mouseX+50,250);
  triangle(50,250,25,275,50,300);
  triangle(mouseX+50,250,mouseX+25,275,mouseX+50,300);
  
  
  //orange
        fill(255,158,0);
        
        triangle(50,0,   mouseX,-25,  mouseX,25);
        triangle(50,50,  mouseX,25,  mouseX,75);
        triangle(50,100, mouseX,75,  mouseX,125);
        triangle(50,150,  mouseX,125,  mouseX,175);
        triangle(50,200,  mouseX,175,  mouseX,225);
        triangle(50,250,  mouseX,225,  mouseX,275);
        triangle(50,300,  mouseX,275,  mouseX,325);
 
        
        triangle(mouseX,-25, mouseX,25,mouseX+25,0);
        triangle(mouseX,25, mouseX,75, mouseX+25,50);
        triangle(mouseX,75,mouseX,125, mouseX+25,100);
        triangle(mouseX,125,mouseX,175,mouseX+25,150);
        triangle(mouseX,175,mouseX,225,mouseX+25,200);
        triangle(mouseX,225,mouseX,275,mouseX+25,250); 
        triangle(mouseX,275,mouseX,325,mouseX+25,300);
 
  triangle(mouseX+50,0,500,0,500,25);
triangle(mouseX+50,50,500,25,500,75);
triangle(mouseX+50,100,500,75,500,125);
triangle(mouseX+50,150,500,125,500,175);
triangle(mouseX+50,200,500,175,500,225);
triangle(mouseX+50,250,500,225,500,275);
triangle(mouseX+50,300,500,275,500,325);
       
triangle(500,0,500,25,525,0);
triangle(500,25,500,75,525,50);
triangle(500,75,500,125,525,100);
triangle(500,125,500,175,525,150);
triangle(500,175,500,225,525,200);
triangle(500,225,500,275,525,250);
triangle(500,275,500,325,525,300);



 line(0,25,525,25);
 line(0,75,525,75);
 line(0,125,525,125);
 line(0,175,525,175);
 line(0,225,525,225);
 line(0,275,525,275);
 line (0,50,525,50);
 line (0,100,525,100);
 line(0,150,525,150);
 line(0,200,525,200);
 line(0,250,525,250);
 
}

