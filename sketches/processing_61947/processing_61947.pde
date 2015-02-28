
ArrayList deck;
ArrayList type;
int clicks = 0;
Card card1;
Card card2;
int matchFound = 0;
int time = 1800;

void setup()
{
  
  size( 900 , 800 );
  background(0,100,0);
  frameRate(30);
  //initialize the 13 faces of the card
  initializeCardTypes();
  //get the 8 random pairs
  ArrayList rp = getRandomPairs();
  //randomize the pairs
  rp = shuffleCards(rp);
  //draw the cards with name label
  drawCards(rp);

  
}

void draw()
{
  
  fill(255);
  rect(665, 150 , 375 , 150);
  fill(0);
  textSize(20);
  text( "Time Left : " + time/30 , 700 , 180);
  
      if (clicks == 2) {
        clicks = 0;
        println("c1: "+card1.getCardValue()+" c2: "+card2.getCardValue());
        
       if (card1.getCardValue().equals(card2.getCardValue())) {
         println("FOUND MATCH");
         matchFound++;
         removeCard(card1);
         removeCard(card2);
         
         
       } else {
         println("NO MATCH FOUND");
         
         card1.flip();
         card2.flip();
         delay(1000);
       }
       
       if (matchFound == 8) {
         textSize(40);
         text("YOU WIN!" , 700 , 80);
         noLoop();
       }
       
      }
      
      if ( time == 0 ) {
        textSize(40);
        text("YOU LOSE" , 700 , 80);
        noLoop();
      
      }
      
      time -= 1;
}

void removeCard(Card c)
{
  
  for ( int i = 0 ; i < deck.size() ; i++)
  {
    Card temp = (Card)deck.get(i);
    if ( c.getCardValue().equals(temp.getCardValue()))
    {
      deck.remove(i);
    }  
  }
}

void initializeCardTypes()
{
 type = new ArrayList();
 type.add("ace");
 type.add("2");
 type.add("3");
 type.add("4"); 
 type.add("5"); 
 type.add("6");
 type.add("7");
 type.add("8"); 
 type.add("9");
 type.add("10");
 type.add("jack");
 type.add("queen");
 type.add("king");
}

void mousePressed() {
  if (mouseButton == LEFT) {
    for ( int i = 0 ; i < deck.size() ; i++)
    {
     Card temp = (Card)deck.get(i);
     int x = temp.getX();
     int y = temp.getY(); 
     int w = temp.getWidth();
     int h = temp.getHeight();
     
     if ( mouseX >= x && mouseX <= x + w &&
          mouseY >= y && mouseY <= y + h) {
        temp.flip();
        clicks++;
        if ( clicks == 1) {
        card1 = temp;
      } else if ( clicks == 2) {
        card2 = temp;
      }
     println(clicks);
      break;
     } 
    }
  }
}
void drawCards(ArrayList cards)
{
 int index=0;
 String name;
 //create and layout the cards
 deck = new ArrayList();
 //get the card name from the arraylist
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(100  , 20 , 100 , 150 , name));
 
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(250 , 20 , 100 , 150 , name));
 
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(400 , 20 , 100, 150, name));
 
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(550 , 20 , 100, 150, name));
 
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(100  , 200 , 100, 150, name));
 
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(250  , 200 , 100, 150, name));
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(400  , 200 , 100, 150, name));
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(550  , 200 , 100, 150, name));
 
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(100  , 375 , 100, 150, name));
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(250  , 375 , 100, 150, name));
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(400  , 375 , 100, 150, name));
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(550  , 375 , 100, 150, name));
 
 name = (String) cards.get(index);
 index++;
 deck.add( new Card(100  , 550 , 100, 150, name));
 
  name = (String) cards.get(index);
 index++;
 deck.add( new Card(250  , 550 , 100, 150, name));
 
  name = (String) cards.get(index);
 index++;
 deck.add( new Card(400  , 550 , 100, 150, name));
 
  name = (String) cards.get(index);
 index++;
 deck.add( new Card(550  , 550 , 100, 150, name));
 
 Card temp = (Card)deck.get(0);
 temp.flip();
 temp.flip();
}


public ArrayList getRandomPairs()
{
  ArrayList randPairs = new ArrayList();
   
  ArrayList getPair = getRandomCards();
  String [] shapes;// 
  
  for ( int i = 0 ; i < getPair.size() ; i++)
  {
      shapes = getRandomShapes();
    for (int j = 0; j < 2; j++)
     {
        randPairs.add(getPair.get(i)+" "+shapes[j]);
     }
  }
   return randPairs;
}
//return 8 random cards from the 13 different cards
public ArrayList getRandomCards()
{
  ArrayList randomPairs = new ArrayList();
  
  int index = 0;
  
  for (int i = 0 ; i < 8 ; i++)
  {
    index = (int)random(type.size());
    randomPairs.add(type.get(index));
    type.remove(index);
  }
  
  return randomPairs;
}
//return 2 random shapes
public String[] getRandomShapes()
{
  String[] shapes = { "club" , "diamond", "heart", "spade" };
  int index1 = (int)random(4);
  int index2 = 0;
  while ( true)
  {
   index2 = (int)random(4);
   
   if ( index2 != index1)
   {
     break;
   }
  }
  
  String[] randomShapes = new String[2];
  randomShapes[0] = shapes[index1];
  randomShapes[1] = shapes[index2];
  
  return randomShapes;
}
//take an arraylist and shuffle the cards
public ArrayList shuffleCards(ArrayList cards)
{
   ArrayList shuffled = new ArrayList();
   int index;
   while(cards.size() > 0)
   {
       index = (int) random(cards.size());
       shuffled.add( cards.get(index));
       cards.remove(index);
   }
   //println("END");
   return shuffled;
}

public class Card
{
  int _x;
  int _y;
  int _width;
  int _height; 
  String _name;
  boolean _state;
  String _face;
  
  Card ( int x , int y , int w , int h, String name)
  {
    //initialize the card's properties
    _x = x;
    _y = y;
    _width = w;
    _height = h;
    _name = name;
    _state = false;
    String[] value = split(name, ' ');
    _face = value[0];
    //draw the rectangle that represent the card
    fill(255 , 0, 0);
    rect( x , y , w , h);
    //load card image
    //setImage(value);
    
  }
  
  void setImage(String name)
  {
    String[] fileName =  split(name, ' ');
    String fN = fileName[1] + "_" + fileName[0] + ".jpg";
    PImage a = loadImage(fN);
    image(a , _x , _y, _width, _height);
  }
  
  public void flip()
  {
    _state = !_state; 
    if (_state == false)
    { 
     fill(255, 0 , 0);
     rect(_x, _y , _width, _height);
    } else {
      //setImage(_name);
      fill(255);
      rect( _x , _y , _width, _height);
      fill(0);
      textSize(15);
      text(_name, _x+5, _y+15);
    }
  }
  int getX()
  {
    return _x;
  }
  int getY()
  {
    return _y; 
  }
  int getWidth()
  {
    return _width; 
  }
  int getHeight()
  {
    return _height; 
  }
  String getName()
  {
    return _name; 
  }
  
  String getCardValue()
  {
    return _face;
  }
}

