
int[] h_numbers;
PFont font;

void setup()
{
  size(800, 800);
  colorMode(HSB,360,100,100);
  noStroke();
  smooth();
  h_numbers = int(loadStrings("age.txt"));
  font = loadFont("Regular-Bold-48.vlw");
  textFont(font,25);
  textAlign(CENTER,CENTER);
  noLoop();
}

void draw()
{
  background(0);
  barGraph(h_numbers,height/2);
//  for (int j = 0; j<h_numbers.length;j++)
//  {
//    fill(255);
//    text(j,width/2-j*15,height/2);
//  }
}

void barGraph( int[] nums, float y )
{
  int[] counter = new int[100];

  for (int i=0; i<counter.length; i++)
  {
    counter[i] = 0;
  }

  for (int i=0; i<nums.length; i++)
  {
    counter[nums[i]]++;
  }
  
  fill(255);
  for (int i=0; i<counter.length; i++)
  {
    fill(map(counter[i],0,5,140,0),100,100,30);
    ellipse(width/2,y,-counter[i]*100,-counter[i]*100);
//    fill(255);
//    text(counter[i],width/2-counter[i]*40,height/2);
  }
}

