
float loadAmount, startNum;
boolean loading;

void setup()
{
  size(300, 300);
}

void draw()
{
  background(0);
  if(loading){
  fillBar();
  }
  if(!loading)
  {
    doneScreen();
  }
}

void fillBar()
{
  loadAmount=map(frameCount-startNum, 0, 300, 0, 200);
  loadAmount= constrain(loadAmount, 0, 200);
  int loadPercent =int( map(loadAmount,0,200,0,100));

  noStroke();
  fill(255);
  rect(50, 150, loadAmount, 20);
  text("LOADING  "+ loadPercent + "%",50,145);
    stroke(255);
  noFill();
  rect(50, 150, 200, 20);
  
  if(loadPercent == 100)
  {
    loading =false;
  }
}

void mousePressed()
{
  startNum=frameCount;
  loading = true;
}


void doneScreen()
{
  text("DONE! CLICK TO RESET",75,150);
}
