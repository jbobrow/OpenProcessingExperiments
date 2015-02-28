
// copyright 2014 Jacklynn pham
// ICE #14

final int MAX = 16;
String [] stringArray = { 
  "work", "work", "work", "work", "eat", "work", "work", "work", "work", "work", "eat", "work", "work", "work", "sleep?", "work"
};
String [] days = { "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY"};

int [] xPos = new int [MAX];
int [] yPos = new int [MAX];
int [] xSpeed = new int [MAX];
int [] ySpeed = new int [MAX];

int x = 0;
void setup()
{
  size(500, 550);
  textSize(15);
  textAlign(CENTER, CENTER);

  background( 255);
  fill(0);

  for (int i = 0; i < MAX; i++) {
    xPos[i] = int (40);
    yPos[i] = int (40+i*30);

    xSpeed[i] = int (5);
    ySpeed[i] = int (0);
  }
}

void draw() {
  printArray (stringArray);
  moveArray();
  days();
}

void days()
{
  fill(0);
  for ( int i = 0; i < days.length; i++)
  {
   textAlign(LEFT);
    text ( days[i], i*100+20, 30);
  }
}

void moveArray ( )
{
  fill(255,0,0);
  background (255);
   x++;
  for ( int i = 0; i < MAX; i++)
  {
    text( stringArray[i], x, i *30 + 70 ); 
    
    if ( x > width + 30) {
      x= 0;
    }
   line ( x, 485, x+40, 485); 
  
    }
  }

void printArray( String [ ] anyArray)
{
  for ( int i = 0; i < anyArray.length; i++ )
  {
    //text( anyArray[i], width/2, 30 + i*30 ); 
    //text( anyArray[i], xPos[i], yPos[i] ); 
    //noLoop( );
  }
}



