
// Grace Jun 02/08/2015
// Data Visualization HW.- Green Clocks


float alpha = 0; //first alpha value

void setup(){
size(700,700);
background(112,233,245);
alpha = 15;
}
 
void draw() {
frameRate(70);
smooth();

int hr = hour();    // out of 24 hrs, using 0 - 23
int min = minute();  // our of 60 mins in an hr 0 - 59
int sec = second();  // our of 60 mins in a min, using 0 - 59

stroke(0,147+sec*4,alpha);
noFill(); 
 
// draw my triangles
// seconds triangle
beginShape();
vertex(250,550+-sec*8);      
vertex(350+-sec*8,450);
vertex(350,50+sec*8);
endShape(CLOSE);

 
strokeWeight(1);
stroke(0,147+min*4,alpha);
fill(12,135,100,8);
 
// draw my triangles for mintues after the 59 sec
beginShape();
vertex(450,480+-min*4);    
vertex(350+-min*4,440);
vertex(450,400+min*4);
endShape(CLOSE);
 
strokeWeight(1);
stroke(0,255,116);
noFill();
fill(255,255,255,8);
 
// draw my triangles for hour
beginShape();
vertex(450,390+-hr*4);      
vertex(450,200+-hr*4);
vertex(600,300+-hr*4);
endShape(CLOSE);
 
}
