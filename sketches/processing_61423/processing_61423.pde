
void setup () {
  size (400, 400);
  background (21, 2, 61);
}

void draw () {



  //Vierecke lila
  //oben
  stroke (79, 46, 218);
  fill (115, 10, 101);
  rect (150, 150, 50, 50);  
  //unten
  rect (200, 200, 50, 50);  
  //oben
  rect (50, 50, 50, 50);
  //unten
  rect (300, 300, 50, 50);
  //Diagonale
  rect (350,0,50,50);
  rect (0,350,50,50);
  rect (250,100,50,50);
  rect (100,250,50,50);
  

  //Vierecke weiß
  //oben
  stroke (79, 46, 218);
  fill (208, 166, 200);
  rect (200, 150, 50, 50);  
  //unten
  rect (150, 200, 50, 50);  
  //oben
  rect (300, 50, 50, 50);
  //unten
  rect (50, 300, 50, 50);
  //Diagonale
  rect (0, 0, 50, 50);
  rect (350, 350, 50, 50);
  rect (250,250,50,50);
  rect (100,100,50,50);


  //Rahmen 1  
  stroke (79, 46, 218);
  noFill ();
  rect (150, 150, 100, 100);
  //Rahmen 2
  stroke (79, 46, 218);
  noFill ();
  rect (100, 100, 200, 200);
  //Rahmen 3
  stroke (79, 46, 218);
  noFill ();
  rect (50, 50, 300, 300);
  
//Kreise Diagonale LinksO runter
stroke (79, 46, 218);
fill (255,255,255);
ellipse (150,150,25,25);
ellipse (250,250,25,25);
ellipse (100,100,25,25);
ellipse (300,300,25,25);
ellipse (50,50,25,25);
ellipse (350,350,25,25);
ellipse (0,0,25,25);
ellipse (400,400,25,25);

//Kreise Diagonale LinksU hoch
 stroke (79, 46, 218);
 fill (255,255,255);
 ellipse (width/2,height/2,25,25);
 ellipse (150,250,25,25);
 ellipse (250,150,25,25);
 ellipse (100,300,25,25);
 ellipse (300,100,25,25);
 ellipse (50,350,25,25);
 ellipse (350,50,25,25);
 ellipse (0,400,25,25);
 ellipse (400,0,25,25);
 
 //Kreise horizontal und vertikal
 stroke (79, 46, 218);
 fill (255,255,255);
 ellipse (200,125,50,50); ellipse(200,75,50,50); ellipse (200,25,50,50);
 ellipse (200,275,50,50); ellipse(200,325,50,50);ellipse(200,375,50,50);
 ellipse (125,200,50,50); ellipse (75,200,50,50);ellipse(25,200,50,50);
 ellipse (275,200,50,50); ellipse (325,200,50,50);ellipse(375,200,50,50);







}
