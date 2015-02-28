
//homework1&2 by gerald anekwe
// january whatever 2011


//sky
float x;
float y;
float directionX;
float directionY;


void setup(){
  size(800,600);
  smooth();
  background(85,220,225);
  x = 0;
  directionX = 3;


//grass
beginShape();
strokeWeight(2);
fill(0,190,0);
vertex(0,275);
vertex(800,275);
vertex(800,800);
vertex(0,800);
endShape();


//road
beginShape();
strokeWeight(1);
fill(0,0,0);
vertex(425,275);
vertex(800,600);
vertex(0,600);
vertex(400,275);
endShape();

//yellow line
beginShape();
strokeWeight(1);
fill(255,255,0);
vertex(415,275);
vertex(475,600);
vertex(350,600);
vertex(408,275);
endShape();

//1st black out
beginShape();
strokeWeight(1);
fill(0,0,0);
vertex(450,405);
vertex(475,500);
vertex(350,500);
vertex(380,405);
endShape();


//2nd black out
beginShape();
strokeWeight(1);
fill(0,0,0);
vertex(450,355);
vertex(475,330);
vertex(350,330);
vertex(380,355);
endShape();

//3rd black out
beginShape();
strokeWeight(1);
fill(0,0,0);
vertex(450,310);
vertex(425,300);
vertex(375,300);
vertex(380,310);
endShape();

//4th black out
beginShape();
strokeWeight(1);
fill(0,0,0);
vertex(410,290);
vertex(393,280);
vertex(432,280);
vertex(420,290);
endShape();




}

void draw(){
  x += directionX;
  y += directionY;
  
ellipseMode(CORNER);
ellipse(x, 35, 50, 50);
fill(255);
 

if (x > width){
  directionX = -5;
  }
if (x < 0){
  directionX = 5;
  }  
  


         
  
  
}  


