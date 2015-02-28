
PImage bg;
int a; 
int b;
int c;
color circleColor1 = color(114,130,150);
color circleColor2 = color(0,202,189);
color circleColor3 = color(255,255,255);

void setup() {
  size(600,329);
  bg = loadImage("flowers.jpg");
}

void draw() 
{
  background(bg);

  a = (a + 1);
  b = (b + 2); 
  c = (c + 3);
  
  noStroke();
  fill (circleColor1);
  ellipse (40,a-6,20,35);

  fill (circleColor2);
  ellipse (90,b-150,60,65);
  
  fill (circleColor2);
  ellipse (140,a-80,30,40);  
  
  fill (circleColor3);
  ellipse (200,a+100,20,35);
  
  fill (circleColor1);
  ellipse (300,a,20,35);
  
  fill (circleColor2);
  ellipse (330,a-50,30,50); 
  
  fill (circleColor3);
  ellipse (500,c-500,80,100); 
  
  fill (circleColor1);
  ellipse (550,b-200,70,90);


  fill (circleColor3);
  rect (550,b-200,70,90);
    
  fill (circleColor1);       
  rect (20,c-400,20,30); 
    
  fill (circleColor3);   
  rect (100,b-600,20,70);
    
  fill (circleColor2);   
  rect (300,a+100,50,20);
  
  fill (circleColor1);   
  rect (200,a,80,90);  
    
  fill (circleColor3); 
  rect (400,c-300,70,90);

  fill (circleColor3);
  rect (200,a-200,40,40);
  
}

