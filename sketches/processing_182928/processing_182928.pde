
int Xposition = 50;
int Yposition = 50;
int Xsize =100;
int Ysize =100;
boolean thereXspace = true; 
boolean thereYspace = true;
boolean thereXXspace = true;
boolean thereYYspace = true;
int rightwall = 500;
int topwall = 500;
int leftwall = 0;
int bottomwall = 0;


void setup () {
  size (500, 500);
  ellipseMode (CENTER);
}

void draw () {

  background (200, 100, 100);
  ellipse(Xposition, Yposition, Xsize, Ysize);


  if (thereXspace) 
  {
    Yposition = 50;
    fill (100);

    if (Xposition < rightwall-50) 
    {
      //move right
      Xposition = Xposition + 5;
    } else 
    {
      //dont move
      thereXspace = false;
    }
  } else 
  {
    if (thereYspace) {
      Xposition = 450;
      fill (150);
      if (Yposition < topwall-50) {
        //move down
        Yposition = Yposition + 5;
      } else 
      {
        //dont move
        thereYspace = false;
      }
    } else 
    {
      if (thereXXspace) 
      {
        Yposition = 450;
        fill (200);
        if (Xposition > leftwall+50) {
          //move left
          Xposition = Xposition - 5;
        } else 
        {
          //dont move
          thereXXspace = false;
        }
      } else 
      {
        if (thereYYspace) 
        {
          Xposition = 50;
          fill (250);
          if (Yposition > bottomwall+50) 
          {
            //move up
            Yposition = Yposition - 5;
          } else 
          {
            //dont move
            thereXspace=true;
            thereYspace=true;
            thereXXspace=true;
            thereYYspace=true;
          }
        }
      }
    }
  }
}



