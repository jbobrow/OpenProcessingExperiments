
float x;
float y;
float easing = 0.05;
 
void setup() {
  size(640, 360);
  noStroke(); 
}
 
void draw() {
  noCursor();
  //starfield background
  background(2,30,59);
  fill(255);
    ellipse(30,30,3,3);
    ellipse(350,150,3,3);
    ellipse(300,300,5,5);
    ellipse(100,100,5,5);
    ellipse(150,200,3,3);
    ellipse(400,40,3,3);
    ellipse(330,320,3,3)
    ellipse(405,35,4,4);;
    ellipse(500,250,3,3);
    ellipse(580,150,3,3);
    ellipse(45,290,6,6);
  nyan();
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
 
 float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
    
// laser pointer dot
    fill (255,0,0);
    ellipse (mouseX, mouseY,6,6);

}
  
void nyan()
{
         
//Nyan Cat
 
stroke (0,0,0);
strokeWeight(2);
fill (150,150,150);
    ellipse(x+20,y+55,20,7); //tail
      
//feet
    ellipse(x+30,y+75,10,15); //foot1
    ellipse(x+39,y+75,10,15); //foot2
    ellipse(x+60,y+75,10,15); //foot3
    ellipse(x+69,y+75,10,15); //foot4
 
//body   
  fill(254,203,150);
    rect(x+25,y+25, 60, 50, 7); //poptart crust
noStroke();
fill (255,153,255);
    rect(x+30,y+30, 50, 40, 7); //poptart frosting
     
//Sprinkles on body
noStroke();
fill(255,50,154);
    ellipse(x+40,y+40,3.5,3.5);
    ellipse(x+50,y+50,3.5,3.5);
    ellipse(x+35,y+60,3.5,3.5);
    ellipse(x+55,y+35,3.5,3.5);
    ellipse(x+70,y+40,3.5,3.5);
 
//cathead//
  
//ears
stroke(0,0,0);
strokeWeight(2);
fill(150,150,150);
    triangle (x+58,y+55,x+63,y+40,x+71,y+50); //earl
    triangle (x+75,y+55,x+86,y+40,x+91,y+55); //earr
    
//head
stroke(0,0,0);
strokeWeight(2);  
fill (150,150,150);
    ellipse (x+75,y+63,40,30);
  
//catnose
noStroke();
fill (255,153,255);
    triangle(x+73,y+64,x+78,y+70,x+83,y+64);
 
//eyes
stroke(0,0,0);
strokeWeight(2);
 fill(0,0,0);
    ellipse(x+70,y+59,5,5);
    ellipse(x+85,y+59,5,5);
      
 //smile
 strokeWeight(2);
 fill(0,0,0);
    arc(x+75,y+72,5,5, 0, PI);    
 noStroke();
 fill(248,248,255);
    ellipse(x+69,y+58,3,3);
    ellipse(x+84,y+58,3,3); 
}
