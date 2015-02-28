
int [] k = {
  0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1
};

String [] note = { 
  "E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#"
};

int w = 547;
int h = 189;


void setup()
{
  size(547, 189);
  smooth();
  background(164);

  PFont font;
  font = loadFont("Aharoni-Bold-38.vlw");
  textFont (font, 24);
}


void draw()
{

  int x_trans = 42;
  int y_trans = 1;
  int y_step = 42;

  int num_strings = 4;
  int num_frets = 13;
  int step = (-width*2+(-mouseX/42-3))+((mouseY/42)*5+2);
  int pos = 0;



//Nut

  fill(164, 255);
  noStroke();
  rect(0, 0, w, h);
  strokeWeight(2);
  stroke(64);
  line (42,2,42,165);
  strokeWeight(1);
  
//

//Draw dots//

pushMatrix();
translate (0,164);
int fret = 42;
translate (fret,0);
Dot();
translate (fret*2,0);
Dot();
translate (fret*2,0);
Dot();
translate (fret*2,0);
Dot();
translate (fret*2,0);
Dot();
translate (fret*3,0);
Dot();
ellipse (30, 20, 7, 7);
popMatrix();

//

//Fretboard pattern

translate (-41, 126);

  for ( int j = 0; j < num_strings; ++j )
  {
    pushMatrix();
    translate( 0, y_trans );

    for (int i=0; i < num_frets; i++)
    {
      translate (42, 0);

      if (step%12 == 0)
      {
        fill(128*k[abs(step)%12]+128, 128);
        stroke(0, 128);
        rect(0, 0, 40, 40);
        fill(108, 128);
        noStroke();
        ellipse (30, 10, 10, 10);
        //Major();
      }
      else
      {
        fill(128*k[abs(step)%12]+128, 128);
        stroke(0, 128);
        rect(0, 0, 40, 40);
      }
      fill(184, 255*-k[abs(step)%12]+255);
      text (note[pos%12], 4, 34);

      step ++;
      pos++;
    }
    step += 4;
    pos +=4;
    y_trans -= y_step;
    popMatrix();
    
   //
    println (step);



  }

}

//Dot

void Dot() {
  noStroke();
  fill (192);
  ellipse (30, 10, 7, 7);
}

//

//Major

void Major()  {   
    int x = 210;
    int y = 42;
    int b = 42;
    strokeWeight(2);
    line(x,y, x-3*b, y);
    line(x-3*b, y, x-3*b, y+3*b);
    line(x-3*b, y+3*b, x+b, y+3*b);
    line(x+b, y+3*b, x+b, y+b);
    line(x+b, y+b, x, y+b);
    line(x, y+b, x, y);
    strokeWeight(1);
}

