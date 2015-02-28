
int[] age;
int[] gender;
int[] answers;

void setup()
{
  size(500,500);
  noStroke();
  smooth();
  age = int(loadStrings("age.txt"));
  gender = int(loadStrings("gender.txt"));
  answers = int(loadStrings("answers.txt"));
 
}

void draw()
{
  background(0);
  for(int i=0; i<answers.length; i++)
{
  fill(255,100);
  ellipse(i*width/age.length, height/2+50, 25, age[i]);
  
  fill(255,100);
  ellipse(i*width/gender.length, height/2, 25, gender[i]);
  
  fill(255,100);
  ellipse(i*width/answers.length, height/2-10, 25, answers[i]);
}
}

