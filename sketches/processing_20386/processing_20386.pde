
//fib numbers
int f0 = 0;
int f1 = 1;
int f2 = 1;

int nextFib()//fibonacci equation
{
  int result = f2;
  f0 = f1;
  f1 = f2;
  f2 = f0 + f1;
  return result;
}


boolean bStop; //this allows to pause with keyPressed 
void keyPressed()
{
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
}

boolean mStop; //this allows to pause with mousePressed 
void mousePressed()
{
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
}

void setup() {
  size(800,800);
  smooth();
  background(0);



  //ArrayList fibnums = new ArrayList(); //not sure this is necessary?
  //fibnums.add(nextFib());

  for (int f = 0; f < 20;  f++) //fibonacci for loop
  {
    println(nextFib());//shows chars
  }
}

void draw() {
  strokeWeight(10);

  for(int x = 0; x < 800; x+=40) {
    for(int y = 0; y < 800; y+=40) {

      color from = color(nextFib(), 0, 255);
      color to = color(255, 0, nextFib());
      fill(lerpColor(from, to, .33)); 


      rect(x,y,30,30);
    }
  }
}


