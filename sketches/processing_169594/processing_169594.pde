
void setup()
{
  size(600, 600);
}

void draw() {


  background(255);

  rect(150, 0, 100, 200);
  fill(90, 20, 30);

  rect(390, 400, 100, 200);
  fill(90, 20, 30);

  rect (380, 0, 100, 200);
  fill(10, 20, 30);

  rect(270, 400, 110, 200);
  rect(260, 0, 110, 200);
  fill(10, 90, 50);
  rect(160, 400, 100, 200);
  {

    int sec= second()*1;
    fill(90, 20, 30);
    noStroke();

    textSize(100);
    text(sec, 370, 340);


    int min= minute()*1;


    fill(10, 20, 30);

    textSize(100);
    text(min, 250, 340);  

    int h= hour()*1;
    fill(10, 90, 50);
    noStroke();

    textSize(100);
    text(h, 140, 340);
  }
}

