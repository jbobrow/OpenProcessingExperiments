
//15/09/2013
//CMS 3
//Choi Chi Fung
//Ashely
//Student ID :53075411
 
void setup(){
  size(500,500);   ////the size of the display
  background(0);   //backgroud :black
   
}
 
int value = -150;
 
void draw() {
 noStroke();
  ellipse(250, 50, 70, 70);//1 start of drawing letter 'A' by circle
  
  ellipse(220, 100, 70, 70);//2
  ellipse(280, 100, 70, 70);//2
  
ellipse(200, 150, 70, 70);//3
ellipse(300, 150, 70, 70);//3

ellipse(170, 200, 70, 70);//4
ellipse(330, 200, 70, 70);//4

  
  ellipse(150, 250, 65, 65);//5
  ellipse(200, 250, 65, 65);//5
  ellipse(250, 250, 65, 65);//5
  ellipse(300, 250, 65, 65);//5
  ellipse(350, 250, 65, 65);//5
  
 
 ellipse(130, 300, 70, 70);//6
 ellipse(370, 300, 70, 70);//6
 
 ellipse(400, 350, 70, 70);//7
 ellipse(100, 350, 70, 70);//7
 
 ellipse(430, 400, 70, 70);//8
 ellipse(70, 400, 70, 70);//8
 
 ellipse(50, 450, 70, 70);//9
 ellipse(450, 450, 70, 70);//9 End of drawing the letter'A'
 
}
void mouseMoved() {       // Move the mouse to change its value
  value = value -3;
  if (value > 350) {
    value = 0;
    
  }
   
  noStroke();
  float w;
  float r;
  float g;
  float b;

  w=random(80);
  g=random(200);
  b=random(200);
  r=random(150);
    
  ellipse(pmouseX,pmouseY,w,w);
  fill(w,r,g,b); 
   
}
 
//End


