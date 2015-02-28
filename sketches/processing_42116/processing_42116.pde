
PImage[] monkeys = new PImage[15];
int starNum=hour()*10;
int[][] stars= new int[starNum][3];
PImage mask;
int counter;
int oldSecond;
int newSecond;
int secondCounter;
boolean flipper;
float sunHeight;
float moonHeight;
int sunRadius;
float millistart;
int milliMod;
float oneMin;

void setup()
{
  millistart=second()*60000/6;
  sunRadius=200;
  flipper=true;
  secondCounter=0;
  newSecond=second();
  size(800, 800);
  counter=0;
  for (int i=0; i<starNum; i++)
  {
    stars[i][0]= int(random(0,width));
    stars[i][1]= int(random(0,height));
    stars[i][2]= int(random(0,3));
  }
  for (int i=0; i<15; i++)
  {
    monkeys[i]=loadImage("Monkey"+i+".png");
  }
}

void draw()
{
  oneMin=60000;
  background(map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin), 0, oneMin, 0, 60), 
             map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin), 0, oneMin, 0, 180), 
             map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin), 0, oneMin, 20, 255));
  smooth();
  sunHeight=map((millis()+millistart)%oneMin*2, 0, oneMin*2, -sunRadius, 2*height+3*sunRadius);

  for(int i=0; i<starNum; i++)
  {
   fill(255,map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin), 0, oneMin, 200, 0));
   ellipse(stars[i][0], stars[i][1],stars[i][2], stars[i][2]);
  }
  
  stroke(255, 0);
  
//moon + reflection
  fill(map(abs((millis()+millistart-oneMin/5)%oneMin/2-oneMin/4), 0, oneMin/4, 255, 0), 
       map(abs((millis()+millistart-oneMin/5)%oneMin/2-oneMin/4), 0, oneMin/4, 255, 0), 
       map(abs((millis()+millistart-oneMin/5)%oneMin/2-oneMin/4), 0, oneMin/4, 255, 100));
  ellipse(width/2, sunHeight-height-sunRadius*2, sunRadius*2, sunRadius*2);
  
//sun + reflection
  fill(255, 
      255-map(sunHeight, 0, height+sunRadius, 0, 255), 
      100-map(sunHeight, 0, height+sunRadius, 0, 100));
  ellipse(width/2, sunHeight, sunRadius*2, sunRadius*2);

//ground
  fill(map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin), 0, oneMin, 130, 240), 
       map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin), 0, oneMin, 110, 170), 
       map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin), 0, oneMin, 83, 50));
  rect(0, 3*height/4, width, height);

  newSecond=second();
  if (oldSecond!=newSecond)
  {
    secondCounter++;
    if (secondCounter%2==0) flipper=true;
    if (secondCounter%4==0) flipper=false;
  }
  tint(map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin-oneMin/6), 0, oneMin, 130, 240), 
       map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin-oneMin/6), 0, oneMin, 110, 170), 
       map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin-oneMin/6), 0, oneMin, 83, 50));
  image(monkeys[counter/4], height/2-410, width/2-400); 
  tint(255,
       map(abs((millis()+millistart-oneMin/5)%oneMin*2-oneMin/2-oneMin/6), 0, oneMin, 100, 255));
  image(monkeys[counter/4], height/2-410, width/2-400);
  if (counter<56 && flipper==true) counter++;
  if (counter>=0 && flipper==false) counter--;
  oldSecond=newSecond;
}


