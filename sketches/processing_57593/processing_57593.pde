
String word= "DO TECHNOLOGICAL TOOLS (INTERNET, SMARTPHONE, TABLET) MAKE YOU LESS INTELLIGENT?";
String yes= "YES";
String no= "NO";
int[] answers;
int[] age;
int[] hours;
int barWidth;
int barHeight;
int mode=1;
PFont font;

void setup()
{
  size (800, 650);
  smooth();
  answers = int(loadStrings("answer.txt"));
  age = int(loadStrings("age.txt"));
  hours = int(loadStrings("hours.txt"));
  font = loadFont("Akkurat-24.vlw");
  
  
}

void draw()
{
  background(255);
  textFont(font);
  
  
  
  if(mode==1)
  {
    barGraph(answers, age, hours);
    textSize(20);
    text(word, 50, 450, 430, 200);
    textSize(16);
    text(yes, 50, 70);
    text(no, 50, 90);
    rect(90, 56, 14, 14);
    fill(80, 230, 100);
    rect(90, 77, 14, 14);
  }
  else if(mode==2)
  {
    circleGraph(answers,age);
    textSize(16);
    text(word, 40, 60, 200, 200);
    text(yes, 40, 400);
    text(no, 40, 420);
    noStroke();
    fill(255, 50, 75);
    rect(80, 387, 14, 14);
    fill(80, 230, 100);
    rect(80, 407, 14, 14);
  }
  else if (mode==3)
  {
    circleGraph2(answers, hours);
    textSize(16);
    text(word, 30, 20, 800, 80);
    text(yes, 30, 500);
    text(no, 30, 520);
    noStroke();
    fill(255, 50, 75);
    rect(70, 487, 14, 14);
    fill(80, 230, 100);
    rect(70, 507, 14, 14);
  }
  
}

void barGraph(int[] answers, int[] age, int[] hours)
{
  //set bar width
  barWidth= width/age.length;
    
  for (int i=0; i<age.length; i++)
  {
    //set bar color
   if(answers[i] == 1)
   {
     fill(255, 50, 75);
     stroke(255, 75);
     strokeWeight(1);
   }
   else 
   {
     fill(80, 230, 100);
     stroke(255, 75);
     strokeWeight(1);
   }
    
    //draw bar
    rect(i*barWidth, height/2, barWidth, -hours[i]*10);
  }
}

void circleGraph(int[] answers, int[] age)
{
  barWidth= width/age.length;
  
  for (int i=0; i<age.length; i++)
  {
    //ellipse color
    if(answers[i] == 1)
    {
      noFill();
      stroke(255, 50, 75, 95);
      strokeWeight(5);
    }
    else
    {
      noFill();
      stroke(80, 230, 100, 95);
      strokeWeight(5);
    }
 
  
  // draw graph
  ellipse(i*0+450, height/2, age[i]*9, age[i]*9);
  }
  
}

void circleGraph2(int[] answers, int[] hours)
{
  barWidth= width/hours.length;
  
  for (int i=0; i<hours.length; i++)
  {
    //ellipse color
    if(answers[i] == 1)
    {
      noFill();
      stroke(255, 50, 75, 95);
      strokeWeight(20);
    }
    else
    {
      noFill();
      stroke(80, 230, 100, 95);
      strokeWeight(20);
    }
 
  
  // draw graph
  ellipse(i*0+400, height/2, hours[i]*40, hours[i]*40);
  }
  
}

void keyPressed()
{
  if (key=='1')
    mode=1;
  else if (key=='2')
    mode=2;
  else if (key=='3')
    mode=3;
}



