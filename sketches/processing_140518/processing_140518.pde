
String[] words= {
  "apple", "banana", "coconut", "date", "eggplant", "grape", "lemon", "lime", "orange", "plum"
};
float move=0;
float x=100;
void setup()
{
  size(500, 500);
  fill(255);
}

void draw()
{
  background(0);
 
  x+=1;
    if (x>width)
    {
      x=0;
    }
  for (int i=0; i<words.length; i++)
  {
    text(words[i], x, 30+(i*30));
    
  }
}



