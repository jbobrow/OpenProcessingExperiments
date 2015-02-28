

//Assignment #1
//Name:Katie Shumaker
//E-mail:kshumaker@brynmawr.edu
//Date:9/7/10
void setup () {
  size (500,500);
  background (0,0,255);
  
}

void draw () {
 
 //Outline of objects 
 fill (0);
  strokeWeight (2);
  
//Sun
  fill (mouseX,0,mouseY);
  smooth ();
  ellipse (75,100,100,100);
  
  //Red house
  fill (255,0,0);
  rect (100,250,250,200);
  
  //Window
  fill (0);
  rect (120,275,50,50);
  
  //Window
  fill (0);
  rect (275,275,50,50);
  
  //Door
   fill (0);
   rect (175,350,100,100);
  
   //Roof
   beginShape ();
   fill (255,150,150);
   smooth ();
   vertex (100,250);
   vertex (225,50);
   vertex (350,250);
   vertex (100,250);
   endShape ();
  
   //Purple designs
    fill (142,10,252);
   curve (50,450,100,250,218,250,300,300);
   curve (180,250,218,250,350,250,400,450);
   
   //Grass
   fill (0,255,0);
   rect (0,450,499,65);
   
   //Flower steam
   fill (80,70,90);
   rect (400,400,10,50);
   
   //Flower Petal
   fill (255,0,0,255);
   ellipse (390,400,35,45);
   
   //Flower Petal
   fill (255,0,0,255);
   ellipse (415,390,35,45);
   
   //Flower Petal
   fill (255,0,255,150);
   ellipse (402,385,45,45);
   
   //Flower Petal
   fill (255,0,255,150);
   ellipse (405,410,45,45);
   
}

