
//Built with Processing

ProCard[] proCards;
ArrayList selected;
int numberOfSets;
PFont f;

void setup()
{
  numberOfSets = 0;
  f = createFont("Arial", 16, true);
  size(800, 105);//700, 120
  smooth();
  boolean repeated = true;
  proCards = new ProCard[7];

  for(int y = 0; y < proCards.length; y++)
  {
    ProCard c;
    do {
      c = new ProCard();
      for(int k = 0; k < proCards.length; k++)
      {
        if(c.equals(proCards[k]))
          repeated = true;
      }
      repeated = false;
    }
    while(repeated == true);
    proCards[y] = c;
  }

  //proCards[card] = new ProCard();     

  selected = new ArrayList();
}

void draw()
{
  background(255);
  for(int card = 0; card < 7; card++)
  {
    proCards[card].show();
    translate(100, 0);
  }

  textFont(f, 15);
  fill(0);
  String grammar = "";
  if(numberOfSets == 1)
    grammar = " set";
  else
    grammar = " sets";

  String s = "You have \n" + numberOfSets + "" + grammar;
  text(s, 10, 50);
}

void mousePressed()
{
  int card = mouseX / 100;
  if(card >= proCards.length)
    return;
  
  ProCard clicked = proCards[card];

  if(clicked.isSelected())
  {
    clicked.deselect();
    selected.remove(clicked);
  }
  else
  {
    clicked.select();
    selected.add(clicked);
  }

  println(selected);
  println(isSet(selected));

  if(isSet(selected))
  {
    println("Good Job that is a set");

    for(int k = 0; k < proCards.length; k++)

      for(int c = 0; c < selected.size(); c++)

        if(selected.get(c).equals(proCards[k]))
        {
          selected.remove(c);
          proCards[k] = new ProCard();
        }
    numberOfSets++;
    //String s = "" + numberOfSets;
    //text(s, 600, 60);
    //for(int k = 0; k < selected.size(); k++)
    //selected.remove(k);
  }
}

boolean isSet(ArrayList cards)
{
  /*
  boolean[] sum = new boolean[6];
   for(int k = 0; k < 6; k++)
   sum[k] = false;
   
   for(int k = 0; k < cards.size(); k++)
   {
   ProCard card = (ProCard) cards.get(k);
   for(int d = 0; d < 6; d++)
   sum[d] = sum[d] ^ card.dots[d];
   }
   */

  int[] sum = new int[6];
  for(int k = 0; k < 6; k++)
    sum[k] = 0;

  for(int k = 0; k < cards.size(); k++)
  {
    ProCard card = (ProCard) cards.get(k);
    for(int d = 0; d < 6; d++)
      if(card.dots[d])
        sum[d] += 1;
  }

  if(arraySum(sum) == 0)
    return false;

  //int counter = 0;
  for(int k = 0; k < 6; k++)
  {
    if((sum[k] % 2) != 0)
    {
      String dotColor = "";
      if(k == 0)
        dotColor = "red";
      else if(k == 1)
        dotColor = "green";
      else if(k == 2)
        dotColor = "blue";
      else if(k == 3)
        dotColor = "yellow";
      else if(k == 4)
        dotColor = "green"; 
      else
        dotColor = "orange";
      println("False. You need an EVEN number of " + dotColor + " dots ");
      return false;
    }
  }
  
  return true;

  //sum[k] += counter;
}

public int arraySum(int[] sum)//never write "array sum"
{
  int counter = 0;
  for(int k = 0; k < sum.length; k++)
    counter += sum[k];
  return counter;
}

public void circle(int x, int y)
{
  ellipse(20 + x, 25 + y, 10, 10);
}


