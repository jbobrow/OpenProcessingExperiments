
float counter = 0;
float counter2 = 0;
void setup()
{
  size(500, 500);
  smooth();
}

void draw()
{
  background(#C9EBFF);                 //Löschen

  pushMatrix();                                //Wassermatrix Start
  translate(0, 100);

  for (int j=height/4; j<height+100; j+=50)
  {
    translate(0, 40);
    int watercolor = j;
    stroke(0, 0, 255-(j/2));
    fill(0, 0, 244-(j/2));

    for (int i=0; i<width+150; i++) 
    {
      float amplitude = map(sin(counter)*2, -1, 1, 0, 20);
      ellipse(i, amplitude, 50, 50);
      if (mousePressed==true)
      {
        counter+= 0.01;
      }
    }
  }


  popMatrix();                                 //Wassermatrix Ende


  pushMatrix();
  translate (0, 1.5*height/2);

  for (int k=100; k<width; k+=150)              //k ist x-position der Blubbies
  {

    float blubbi_amp = map(sin(counter2)*2, -1, 1, 0, 20);
    fill(#FF8827);
    stroke(#FF8827);
    //ellipse(k, blubbi_amp, 20, 20);                        TEST
    ellipse(0+k, -100+blubbi_amp, 50, 50);                               //Körper
    ellipse(27+k, -105+blubbi_amp, 10, 10);                              //Oberlippe
    ellipse(27+k, -95+blubbi_amp, 10, 10);                               //Unterlippe
    triangle(-25+k, -100+blubbi_amp, -50+k, -75+blubbi_amp, -50+k, -125+blubbi_amp);               //Schwanzflosse
    triangle(-5+k, -125+blubbi_amp, -5+k, -135+blubbi_amp, 5+k, -125+blubbi_amp);                  //Rückenflosse

    fill(0);
    ellipse(10+k, -110+blubbi_amp, 7, 7);                                //Auge
    fill(255);
    stroke(255);
    ellipse(10+k, -112+blubbi_amp, 2, 2);                               //Augenrefexion


    if (mousePressed==true)
    {
      counter2+= 0.7;
    }
    else
    {counter2+= 0.1;}
  }
  popMatrix();
}

