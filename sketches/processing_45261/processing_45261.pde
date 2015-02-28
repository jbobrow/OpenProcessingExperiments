
 int countX = 1;
int countY = 1;


void setup (){
  size (450,450);
  background (25);
}

void draw (){

 
if(mousePressed){
  strokeWeight(4.5);
    smooth ();
  background (250);
  countX = pmouseX;
  countY= pmouseY;
    ellipse (mouseX,pmouseY,50,50);
    ellipse (pmouseX+50,mouseY-20,50,50);
    fill (205,0,0);
    ellipse (pmouseX+45,pmouseY+40,70+mouseX-pmouseX,70); 
    fill (0);
    rect (0,650,700,250);
    
    fill(250);
    
    triangle (0,700,50,600,100,700); triangle (100,700,150,600,200,700); triangle (200,700,250,600,300,700);triangle (300,700,350,600,400,700); triangle (300,700,350,600,400,700); triangle (400,700,450,600,500,700); triangle (500,700,550,600,600,700); triangle (600,700,650,600,700,700);
  
    rect(mouseX+22,pmouseY+18,10,13);
    rect(pmouseX+48,mouseY+12,11,14);
    rect(pmouseX+31,mouseY+54,9,12);
    rect(mouseX+52,pmouseY+56,9,12);
    stroke(0);
    strokeWeight(11);
    point (pmouseX,pmouseY);
    point (pmouseX+50,pmouseY-20);
    

}
    
else {
  strokeWeight(4.5);
   smooth ();
  background (250);
  fill (0);
  rect (0,650,700,250);
  noFill ();
  triangle (0,700,50,600,100,700); triangle (100,700,150,600,200,700); triangle (200,700,250,600,300,700);triangle (300,700,350,600,400,700); triangle (300,700,350,600,400,700); triangle (400,700,450,600,500,700); triangle (500,700,550,600,600,700); triangle (600,700,650,600,700,700);
   fill (0);
  rect (0,650,700,250); 
 noFill(); 
  
  countX = countX+1;
  countY = countY+1;
    stroke(0);
    ellipse (countX,countY,50,50);
    ellipse (countX+50,countY-20,50,50);
    fill (205,0,0);
    ellipse (countX+45,countY+40,70,70);
    fill(250);
    rect(countX+22,countY+18,10,13);
    rect(countX+48,countY+12,11,14);
    rect(countX+31,countY+54,9,12);
    rect(countX+52,countY+56,9,12);
    noFill ();
    strokeWeight(11);
  point (countX,countY);
    point (countX+50,countY-20);
if (countX >= 380) {countX = countX-9;}
if (countY >= 400) {background (0); }
}
  






}
