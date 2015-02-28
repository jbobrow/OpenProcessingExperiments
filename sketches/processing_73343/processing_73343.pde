
float mSecond;
int prev_mSecond;
float percent;
int dif = millis();

void setup()
{
  size(300,300);
  background(0);
  mSecond = 0;
}

void draw()
{
  mSecond = map(millis()-dif, 0, 5000, 0, 200);
  percent = int(round(100 * mSecond/200));
  
  stroke(255);
  background(0);
  fill(0);
  rect(50,130, 200, 20);
  fill(255);
  
  if(mSecond != prev_mSecond)
  {
    if(mSecond < 200){
      rect(50,130, mSecond, 20);
    }
    else{
      rect(50,130, 200, 20);
      percent = 100;
    } 
  }
  textSize(18);
  text("Loading " + percent + "%", 50, 120);
}

void mousePressed() {
  if(mSecond >= 200)
    {
      dif = millis();
    }
}
