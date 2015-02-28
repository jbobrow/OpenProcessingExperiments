
boolean click= false;
int click2=1;
int horizon = 75;
int verti =100;
int state=1;

void setup() {
  size(500, 500);
}

void draw () {
  background(255);
  fill(255);
  rect(0, 100, 50, 50);
  rect(400, 100, 50, 50);
  rect(0, 400, 50, 50);
  rect(400, 400, 50, 50);

  if (click) {
    if (horizon<375 && state ==1)
    {
      ellipse(horizon, 125, 50, 50);
      horizon +=5;
     }

    else {
      fill(255, 0, 0);
      rect(400, 100, 50, 50);

      state=2;
    }
  }

    if (state==2)

    {
      if (horizon>75 && verti<425)
      {
        ellipse(horizon, verti, 50, 50);
        horizon-=5;
        verti += 5;
      }
      else {
        state=3;
        fill(255, 0, 0);
        rect(0, 400, 50, 50);
      }
    }
    if (state==3)
    {
      if (horizon<375)
      {
        if (horizon<375)
        {
          ellipse(horizon, verti, 50, 50);
          horizon +=5;
        }
        else {
          println("end");
          background(0);
        }
      }
    }
  }
  void mouseClicked()
  {
    click=true;
  }


