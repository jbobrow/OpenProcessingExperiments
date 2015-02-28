
int[] a_numbers;
int[] h_numbers;
PFont font;

void setup()
{
  size(800, 800);
  noStroke();
  smooth();
  a_numbers = int(loadStrings("answer.txt"));
  h_numbers = int(loadStrings("age.txt"));
  font = loadFont("Regular-Bold-48.vlw");
  textFont(font,25);
  textAlign(CENTER,CENTER);
  noLoop();
}

void draw()
{
  background(0);
  fill(255);

  int yes = 0;
  int no = 0;
  int multi = 10;


  for (int i=0; i<a_numbers.length;i++)
  {
    if (a_numbers[i]==1)
    {
      yes++;
    }
    
    else if (a_numbers[i]==0)
    {
      no++;
    }
  }
  
 ellipse(width/2-100, height/2, yes*multi,yes*multi);
 ellipse(width/2+100, height/2, no*multi, no*multi);
 
 fill(0);
 text(yes,width/2-100,height/2);
 text(no,width/2+100,height/2);
 
}




