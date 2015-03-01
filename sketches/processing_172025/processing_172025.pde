
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  
 
}

void draw() {  //draw function loops 
//counter++;
background(181, 179, 179);
 int xPos=10+counter; 
      counter++;

   noStroke();
    fill(255, 255, 255);
 rect(0, 100, 400, 200);
 
   


   
 
var ellipseRadius = 142;
fill(0, 26, 255);
ellipse( 305, 200, ellipseRadius, ellipseRadius);
fill(252, 252, 252);
ellipse(305, 200, ellipseRadius/1.3, ellipseRadius/1.3);
fill(255, 0, 0);
ellipse( 305, 200, ellipseRadius/2, ellipseRadius/2);
fill(255, 255, 255);
ellipse(305,200, ellipseRadius/3.8, ellipseRadius/3.8);
        fill(46, 43, 43);
        ellipse(xPos, 200, 40, 40);
        fill(255, 255, 0);
        ellipse(xPos, 200, 25,25);
        stroke(20, 20, 20);
        ellipse(xPos, 200, 20,10);
        //while (mouseX >xPos +20 && mouseY >150 && mouseX<xPos+80 && mouseY< 250) {
            
        
      //if (mousePressed== true) {
          
     
//}}
        fill(43, 40, 40);
        beginShape();
vertex(mouseX, mouseY-50);
vertex(mouseX+5, mouseY-50);
vertex(mouseX+5, mouseY+0);
vertex(mouseX+15, mouseY+0);
vertex(mouseX+15, mouseY+10);
vertex(mouseX, mouseY+10);
vertex(mouseX-10,mouseY+10);
vertex(mouseX-10, mouseY+0);
vertex(mouseX,mouseY+0);
endShape(CLOSE);
textSize(17);
fill(20, 18, 18);
text("Press the mouse in front of the rock to sweep", 39, 350);
  }
