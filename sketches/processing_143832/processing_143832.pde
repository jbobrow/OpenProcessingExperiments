
int numOfCards = 20;//número de cartão
int matchFound = 0;//correspondência encontrada
int numOfClicks = 0;//numero dos clickes 
 
Card card1;
Card card2;
 
ArrayList cardImages; //vetor
Boolean isFlipped;
String[] cards; //nome de arquivos de cartão
 
PFont font; //fonte
 
void setup()
{
    size( 560, 510 ); //tamanho da janela
    background(145,216,129 );  //fundo verde
    frameRate(30);
    font = createFont("Helvetica", 26);//fonte parabéns
     
    initializeCards(); //ordem: mix -> fazer um cartão -> exibição
    shuffleCards();
    initializeCardImages();
    displayBackCards();  //cartão volta
   text("Alessandra,Katielen,Thaís",400,500);
}
 
void draw()
{
    if( numOfClicks == 2 )
    {
        numOfClicks = 0;
         
        if( card1.getCardName().equals( card2.getCardName() ) )
        {
             matchFound++;
             println( matchFound ); //excluir cartão
             removeCard(card1);
             removeCard(card2);
        }
        else
        {
            card1.flip(); //se não é
            card2.flip();
            delay(500); //atraso de tempo de  500
        }
         
        if( matchFound == 10 ) //correspondente a 10 "Parabéns"
        {
            textFont( font );
            text( "Parabéns, você ganhou :D", 126, 478 );//texto
                   
        }
    }
}
 
void mousePressed()
{
    if( mouseButton == LEFT ) //quando você pressiona esquerdo do mouse
    {
         for( int i = 0; i < cardImages.size(); i++ )
         {
             Card c = (Card)cardImages.get(i); //vertical e horizontal linha-c
             int x = c.getX();
             int y = c.getY();
             int w = c.getWidth();
             int h = c.getHeight();
              
             if( ( mouseX >= x && mouseX <= x + w ) //clique do mouse deve estar no lugar de limite
               && ( mouseY >= y && mouseY <= y + h ) )
             {
                 c.flip();
                 numOfClicks++;
                 if( numOfClicks == 1 )  //primeiro cartão
                 {
                    card1 = c;
                 }
                 else if( numOfClicks == 2 )  //segundo cartão
                 {
                    card2 = c;
                 }
             }
         }
    }  
}
 
void initializeCards() //posição da imagem
{
    cards = new String[numOfCards];
    cards[0] = "ale.png";
    cards[1] = "yudi.png";
    cards[2] = "jamur.png";
    cards[3] = "jordy.png";
    cards[4] = "julia.png";
    cards[5] = "dennys.png";
    cards[6] = "gaucho.png";
    cards[7] = "piupiu.png";
    cards[8] = "katielen.png";
    cards[9] = "thais.png";
    cards[10] = "ale.png";
    cards[11] = "yudi.png";
    cards[12] = "jamur.png";
    cards[13] = "jordy.png";
    cards[14] = "julia.png";
    cards[15] = "dennys.png";
    cards[16] = "gaucho.png";
    cards[17] = "piupiu.png";
    cards[18] = "katielen.png";
    cards[19] = "thais.png";
}
 
void initializeCardImages()
{
    cardImages = new ArrayList();
    int initialPosition = 10;  //posição 10, precisamos de espaço 0 e0
    int wid = 100;
    int hei = 100;
    cardImages.add( new Card( initialPosition, initialPosition, wid, hei, cards[0] ) );
    for( int i = 1; i < numOfCards; i++ )
    {
        //first row
        if( i >= 1 && i < 5 ) //classe e matriz
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
 
void displayBackCards() 
{
    PImage backCard;
    for( int i = 0; i < numOfCards; i++ )
    {
        backCard = loadImage( "carta.png" );  
        Card c = (Card)cardImages.get(i);
        image( backCard, c.getX(), c.getY() );
    }
}
  
void shuffleCards() //numero vai swap e mix cartão
{
    int n = numOfCards;
    for( int i = 0; i < numOfCards; i++ )
    {
        int change = i + int(random(n-i));
        swap( cards, i, change );
    }
}
 
void swap( String[] listOfCards, int index, int changeVal ) 
{
    String var = listOfCards[index];
    listOfCards[index] = listOfCards[changeVal];
    listOfCards[changeVal] = var;
}
 
void removeCard( Card c ){ //se mesmo que o valor do cartão, em seguida, eliminado cartão, também pic 20 -> pic2 18 -> 16 pic2
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
    boolean flipped; //divisão frente e atrás da imagem
    String cardName; //checar se o cartão é o mesmo ou não
    PImage cardImage; 
     
    //construtor (incialiazar cartão)
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
     
    public void flip() //clipe falsa cartão média é virar outro lado, cortar imagem carga verdadeira =carregar imagem
    {
        flipped = !flipped;
        if( flipped == false )
        {
            PImage backImage = loadImage( "carta.png" ); //carregar imagem
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
    int getHeight() { return _height; } //novo cartão e nome para imagem
    boolean getFlipped() { return flipped; }
    String getCardName() { return cardName; }
    PImage getImage() { return cardImage; } //carregar a imagem
}


