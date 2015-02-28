
String[] aliceText;
String[] words;
float counter=0.0;
int counterAlice;
float numberOfWords=0.0;
int counterBlock=0;
int noWords=5;
float[] xpos=new float[noWords];
float[] ypos=new float[noWords];
String[] searchWord;
int[] counterWord=new int[noWords];
color[] flowerColor=new color[noWords];
//have to declare the length of the array otherwise Null Point Exception error???
//why do I not have to declare the length of string array???

void setup()
{
  size(800,600);
  background(239,239,239);
  aliceText=loadStrings("alice.txt");
  String wholeBook=join(aliceText," ");//local variable
  words=splitTokens(wholeBook.toUpperCase()," ,.!;:?()-\"");
  numberOfWords=words.length;
  //words is an array, the length of words equals the number of items in the array
  for (int number=0;number<noWords;number++)
  {
    xpos[number]=width/6*(number+1);
    ypos[number]=height-20;
    String joinWords=("LEFT RIGHT UP DOWN ALICE");
    searchWord=split(joinWords," ");
  }
  flowerColor[0]=color(95,153,75);
  flowerColor[1]=color(235,187,6);
  flowerColor[2]=color(255,83,0);
  flowerColor[3]=color(232,24,12);
  flowerColor[4]=color(181,0,33);//don't know if there is a better way to declare colors
}

void draw()
{
  background(239,239,239);
  String singleWord=words[int(counter)].trim();//counter is a float so should use int()
  //the value of singleWord changes every loop. it is a local variable. not an array
  //trim gets rid of space
  float progress=counter/numberOfWords;//counter and numberOfWords should be float
  float barLength=progress*(width-50);
  fill(32,133,120);
  noStroke();
  rectMode(CORNER);
  rect(20,20,barLength,20,6);//display the progress of the search
  for (int number=0;number<noWords;number++)
  {
   if (singleWord.equals(searchWord[number])) //Look for words
  {
    counterWord[number]++;
  }
  for(int coun=0;coun<=counterWord[number]/5;coun=coun+1) //counterWord/5 to slow down the growth
    {
      rectMode(CENTER);
      fill(23,76,79);
      noStroke();
      rect(xpos[number],ypos[number]-coun*13,50,10,6);
    }
  int flowerY=height-counterWord[number]/5*13-50;
  drawFlower(xpos[number],flowerY,flowerColor[number]);
  counter=(counter+1)%numberOfWords;// words[int(counter)] counter won't exceed the length of the array
  }
}

void drawFlower(float x, float y, color c)
{
  pushMatrix();
  translate(x,y);
  rotate(radians(frameCount));
  stroke(0);
  strokeWeight(2);
  fill(c);
  ellipse(10,0,20,20);
  ellipse(-10,0,20,20);
  ellipse(0,10,20,20);
  ellipse(0,-10,20,20);
  ellipse(0,0,20,20);
  popMatrix(); 
}
  


