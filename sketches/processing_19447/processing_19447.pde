
PFont font;
 
size (250, 250);
background(214,155,4); 
smooth ();
noStroke ();
 
for(int y=0; y<=height+20; y+=40) 
{
  for(int x=0; x<=width+20; x+=40) 
  {fill (random (x+50,y),random (x,y+100),random(x,y), random (10,70));
  //colours of text
     
    font=loadFont ("Caecilia-Bold-48.vlw");
    textFont (font);
    textSize (random (9,90));
    text ("L1C5K5", random (10,250), random (10,250));  
    //texts
   }
}

