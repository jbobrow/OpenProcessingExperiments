
int numOfCards = 20; //number of card
int matchFound = 0; //match found
int numOfClicks = 0; //number of clicks

Card card1;
Card card2;

ArrayList cardImages; //array
Boolean isFlipped;
String[] cards; //card file names

PFont font;  //font

void setup()
{
    size( 560, 510 ); //background size
    background( 0, 100, 0 );  //green background
    frameRate(30);
    font = createFont("Helvetica", 26); //font "Congratulations"
    
    initializeCards(); //order: mix -> make a card -> display
    shuffleCards();
    initializeCardImages();
    displayBackCards();  //backcard
}

void draw()
{
    if( numOfClicks == 2 ) 
    {
        numOfClicks = 0;
        
        if( card1.getCardName().equals( card2.getCardName() ) )
        {
             matchFound++;
             println( matchFound ); //delete container card
             removeCard(card1);
             removeCard(card2);
        }
        else
        {
            card1.flip(); //if it's not
            card2.flip();
            delay(500); // I chose delay time 500 cuz we need dealy time
        }
        
        if( matchFound == 10 )  //match 10 "Congratulation"
        {
            textFont( font );
            text( "Congratulations You Won!", 126, 478 );    //text        
        }
    }
}

void mousePressed()
{
    if( mouseButton == LEFT ) //when you press left mouse
    {
         for( int i = 0; i < cardImages.size(); i++ )
         {
             Card c = (Card)cardImages.get(i); //vertical and horizontal line - C
             int x = c.getX();
             int y = c.getY();
             int w = c.getWidth();
             int h = c.getHeight();
             
             if( ( mouseX >= x && mouseX <= x + w ) //mouse click place should be in boundary
               && ( mouseY >= y && mouseY <= y + h ) )
             {
                 c.flip();
                 numOfClicks++;
                 if( numOfClicks == 1 )  //first card
                 {
                    card1 = c;
                 } 
                 else if( numOfClicks == 2 )  //second card
                 {
                    card2 = c;
                 }
             }
         }
    }   
}

void initializeCards() //image position
{
    cards = new String[numOfCards];
    cards[0] = "a.jpg";
    cards[1] = "b.jpg";
    cards[2] = "c.jpg";
    cards[3] = "d.jpg";
    cards[4] = "m.jpg";
    cards[5] = "o.jpg";
    cards[6] = "o2.jpg";
    cards[7] = "p.jpg";
    cards[8] = "t.jpg";
    cards[9] = "t2.jpg";
    cards[10] = "a.jpg";
    cards[11] = "b.jpg";
    cards[12] = "c.jpg";
    cards[13] = "d.jpg";
    cards[14] = "m.jpg";
    cards[15] = "o.jpg";
    cards[16] = "o2.jpg";
    cards[17] = "p.jpg";
    cards[18] = "t.jpg";
    cards[19] = "t2.jpg";
}

void initializeCardImages()
{
    cardImages = new ArrayList();
    int initialPosition = 10;  //must write down 10 cuz we need space between 0 and 0
    int wid = 100;
    int hei = 100;
    cardImages.add( new Card( initialPosition, initialPosition, wid, hei, cards[0] ) );
    for( int i = 1; i < numOfCards; i++ )
    {
        //first row
        if( i >= 1 && i < 5 ) //class and arraylist
        {
            cardImages.add( new Card( ( i * 110 ) + 10, 10, wid, hei, cards[i] ) );
        } 
        else if( i >= 5 && i < 10 ) 
        {
            cardImages.add( new Card( ( ( i - 5 ) * 110 ) + 10, 120, wid, hei, cards[i] ) );
        }
        else if( i >= 10 && i < 15 )
        {
            cardImages.add( new Card( ( ( i - 10 ) * 110 ) + 10, 230, wid, hei, cards[i] ) );
        }
        else if( i >= 15 && i < 20 )
        {
            cardImages.add( new Card( ( ( i - 15 ) * 110 ) + 10, 340, wid, hei, cards[i] ) );
        }
    }
}

void displayBackCards() //red(back) color image
{
    PImage backCard;
    for( int i = 0; i < numOfCards; i++ )
    {
        backCard = loadImage( "back.jpg" );  //load background image
        Card c = (Card)cardImages.get(i);
        image( backCard, c.getX(), c.getY() );
    }
}

//bottom of things ( my friend CSS major) help me to understand how to use 
//void shufflecard, void swap, void removecard, public class, public void and etc.)
//you can contact him -516-640-2350

void shuffleCards() //number goes swap and mix card
{
    int n = numOfCards;
    for( int i = 0; i < numOfCards; i++ )
    {
        int change = i + int(random(n-i));
        swap( cards, i, change );
    }
}

void swap( String[] listOfCards, int index, int changeVal ) //mixed card
{
    String var = listOfCards[index];
    listOfCards[index] = listOfCards[changeVal];
    listOfCards[changeVal] = var;
}

void removeCard( Card c ) // if same as card value then deleted card , also pic 20 -> pic2 18 -> pic2 16
{
    for( int i = 0; i < cardImages.size(); i++ )
    {
        Card var = (Card)cardImages.get( i );
        if( c.getCardName().equals( var.getCardName() ) )
        {
            cardImages.remove( i );
        }
    }
}

public class Card
{
    int xPos;
    int yPos;
    int _width;
    int _height;
    boolean flipped; //division front and back image
    String cardName; //check if card is same or not
    PImage cardImage; //lad card
    
    //constructor (initializing card)
    Card( int x, int y, int w, int h, String cN )
    {
        xPos = x;
        yPos = y;
        _width = w;
        _height = h;
        cardName = cN;
        cardImage = loadImage( cN );
        flipped = false;
    }
    
    public void flip() //vlip false mean card is turn over other side, vlip true = load image
    {
        flipped = !flipped;
        if( flipped == false )
        {
            PImage backImage = loadImage( "back.jpg" ); //load image
            image( backImage, getX(), getY() );
        }
        else
        {
            image( getImage(), getX(), getY() );
        }
    }
    
    int getX() { return xPos; }
    int getY() { return yPos; }
    int getWidth() { return _width; }
    int getHeight() { return _height; } //new card road name of image
    boolean getFlipped() { return flipped; }
    String getCardName() { return cardName; }
    PImage getImage() { return cardImage; } //loade image
}


