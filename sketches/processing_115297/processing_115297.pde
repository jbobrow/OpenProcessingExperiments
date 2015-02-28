
//-----------------MOVING CICLES-----------------

//NORMMAL---
float a=0;
float b=0;
float c=0;
//REVERSE----
float d=500;
float e=0;
//MIDDLE-----
float f=0;
float g=255;
float h=0;

void setup() {
  size(500, 500);
}

void draw() {
  frameRate(10);

  //------------------CIRCLES-------------------  
  stroke(0);
  //r=3 circle 
 //GETTING bigger, 3 units per frame
  //stroke 0 turns red (5 units each time)
  noFill();
  a=a+6;   
  b=b+3;  
  c=c+3;   
  stroke(c, 0, 0);   
  ellipse(a, a, b, b);   
  println(a);

  //-------------end of circle red------------
  stroke(0);
  //r=3
   //GETTING bigger, 3 units per frame
  //stroke 0 turns yellow (5 units each time)
  noFill();   
  stroke(c, c, 0);    
  ellipse(100, a, b, b);


  //-------------end of circle yellow------------
  stroke(0);
  //r=3 circle 
  //GETTING bigger, 3 units per frame
  //stroke 0 turns purple (5 units each time)
  noFill();         
  stroke(c, 0, c);      
  ellipse(a, 100, b, b);

  //-------------end of circle purple------------

  //-------------REVERSE CIRCLES------------------

  stroke(0);
  //r=3 circle 
  //GETTING bigger, 3 units per frame
  //stroke 0 turns red (5 units each time)
  noFill();
  d=d-6;     
  stroke(0, 0, c);   
  ellipse(d, d, b, b);   
  println(d);
  //-------------end of circle blue------------
  stroke(0);
  //r=3 circle 
  //GETTING bigger, 3 units per frame
  //stroke 0 turns yellow (5 units each time)
  noFill();   
  stroke(c, c, 0);    
  ellipse(400, d, b, b);


  //-------------end of circle yellow------------
  stroke(0);
   //r=3 circle 
  //GETTING bigger, 3 units per frame
  //stroke 0 turns purple (5 units each time)
  noFill();         
  stroke(c, 0, c);      
  ellipse(d, 400, b, b);
    
  //-------------end of circle purple------------
  
    
//-------------SIZE 1 CIRCLE IN THE MIDDLE-------------
  // black to white
  e=e+22;
  stroke(0);
  stroke(e,e,e);
  ellipse(250,250, e,e);
  
  //-------------SIZE 2 CIRCLE IN THE MIDDLE-------------
  //white to purple
  f=f+75;
  g=g-20;
  stroke(255);
  stroke(g,0,g);
  ellipse(250,250, f,f);
//-------------SIZE 3 CIRCLE IN THE MIDDLE-------------
  //red to cyan
  h=h+6;
  stroke(255,0,0);
  stroke(g,h,h);
  ellipse(250,250, h,h);

//--------------------CREATED BY: TUNC KARKUTOGLU------------------------------
}
