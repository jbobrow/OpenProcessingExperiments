
  /* @pjs font='Bots_Droids.ttf'; */  
PFont  myfont;

void setup()
{
  size(400, 400);
  background(0);
  smooth();
myfont = loadFont("Bots_Droids.ttf");
textFont(myfont,30);
  textAlign(CENTER);


  noLoop();
}

void draw()
{
  background(0);
  fill(#DE5FE5);


  int margin = 6;
  int gap = 70;
  translate(margin*1.5, margin*2);


  int counter = 0;
  for (int i=0; i<margin; i++) {
    for (int j=0; j<margin; j++) {
      char letter;

    
      int count = 65+(i*margin)+j;
      if (count <= 90) {
        letter = char(65+counter);
      }
      else {
        fill(0);
        letter = char(65+counter);
      }


      text(letter, 15+j*gap, 20+i*gap);


      counter++;
    }
  }
}




