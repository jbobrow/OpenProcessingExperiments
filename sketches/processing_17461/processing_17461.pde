
void setup () {
  size (200,200);
  background (79,229,80);
  smooth();
 }
 
void draw () {

//balloons
fill (255,mouseX,mouseY);
stroke (255,mouseX,mouseY);
ellipse (57,50,30,38);
triangle (57,70,60,73,54,73);
fill (173,141,149);
stroke (173,141,149);
line (57,73,57,113);

line (50,65,50,113);
fill (245,30,80);
fill (mouseX,mouseY,255);
stroke (mouseX,mouseY,255);
ellipse (50,40,32,38);
triangle (50,60,53,64,47,64);

  //head
fill (126,44,242);
stroke (126,44,242);
ellipse (100,35,60,35);
rect (70,40,60,30);
fill(0);
stroke(255);
ellipse (85,45,5,5);
ellipse (115,45,5,5);
fill(0);

 //body
fill(126,44,242);
stroke (126,44,242);
rect (67,80,66,70);

 //arms
quad (67,93,67,113,52,120,45,102);
quad (133,93,155,102,148,120,133,113);

 //feet
rect (70,150,20,20);
rect (110,150,20,20);
}
  
//background color shift
void mousePressed () {
  background (232,19,133);
} 
 void mouseReleased (){
  background (79,229,80);
  
}
   
                
