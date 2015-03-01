
float busx = 200;
float busy  = 200;
float r = 0;
float backr = 0; 
void setup ()
{
  size (400, 400);
  rectMode (CENTER);
  frameRate = 0.001;
  noStroke();
  smooth();
}

void draw() {
  background (0);
  //sky
background (#3639B9);
//sun
fill (#FCFC03);
ellipse (50,50,100,100);

//cliff
fill (#A2611A);
//rect (150,260,400,250);
triangle (busx -10,busy+ 30,270,500,500,500);
fill (#714B38);
triangle (busx - 10,busy+ 30,500,280,500,500);
//dirt
strokeWeight ((random (2,7)));
stroke (0);
point (busx - 15,(random (220,300)));

//mountain
noStroke ();
fill (255);
triangle (350, 270, 500,290,500,30);

  //textbox
  stroke (0);
    strokeWeight (2);
  fill (255);
  rect (200, 380,400,60);
  
  translate(200, 200);
rotate (r);
noStroke ();
  //bus
  fill (255);
  rect (0, 0, 160, 60);

  //backdoor
  fill (255);
  rect( 0 - 100, 0, 40, 50);

  //stripe
  fill (#FA0D0D);
  rect (0, +15, 160, 5);

  //windows
  fill (#4A7D86);
  rect (0, 0 - 15, 15, 15);
  rect (0 + 25, 0 - 15, 15, 15);
  rect (0 + 50, 0 - 15, 15, 15);
  rect (0 - 25, 0 - 15, 15, 15);
  rect (0 - 50, 0 - 15, 15, 15);
  //rearwindow
  rect (0 - 95, 0 - 15, 20, 15);

  //drivers
  rect (0 +70, 0 -15, 15, 25);

  //fronttyre
  fill (0);
  ellipse (0 + 60, 0 +30, 30, 30);
  //hubcap
  fill (255);
  ellipse (0 + 60, 0 + 30, 20, 20);
  //axle
  fill (0);
  ellipse (0 + 60, 0 +30, 5, 5);

  //reartyre
  fill (0);
  ellipse (0 - 60, 0 +30, 30, 30);
  //hubcap
  fill (255);
  ellipse (0 - 60, 0 + 30, 20, 20);
  //axle
  fill (0);
  ellipse (0 - 60, 0 +30, 5, 5);

  rotate(r); 
  
    if (r  <  - 0.3)
  {
        r =  r + 0.5;
    }
     
  r = r - 0.001;
  
  resetMatrix ();
  textSize (15);
  fill (0);
  text ("Hang on a minute lads...", 40, 375);
  text ("I've got a great idea... Er.....", 40, 390);
  
 }

