
void setup()
{
  size(400,400);
  background(242, 177, 100);
}

int mode = 1;

int xLength = 100;
int yLength = 100;

int[][] rValue = { {75,219,253,255,255}, {49,0,255,225,255}, {255,213,142,193,253}, {0,255,0,255,128} };
int[][] gValue = { {173,207,177,133,82}, {58,202,214,121,61}, {44,100,201,221,151}, {0,255,0,255,128} };
int[][] bValue = { {223,183,76,124,88}, {75,179,96,33,33}, {63,170,1,112,1}, {0,255,0,255,128} };

int cycle1 = 0;
int cycle2 = 0;

int increment = 10;

String code = "uuddlrlrba";
int i = 0;


void draw()
{
  
  if(i==code.length())
  {
    mode = 2;
  }
  
  if(cycle2 == 4)
  {
    cycle2 = 0;
  }
  
  strokeWeight(0);

  fill(rValue[cycle2][cycle1], gValue[cycle2][cycle1], bValue[cycle2][cycle1]);
  stroke(rValue[cycle2][cycle1], gValue[cycle2][cycle1], bValue[cycle2][cycle1]);
  
  
  if(mode == 1){
    ellipse(200,200,xLength,yLength);
  }
  if(mode == 2){
    ellipse(200,200,xLength,xLength);
  }
  
  if(mode == 1)
  {
    xLength += increment;
    yLength += increment;
  }
  if(mode == 2)
  {
    xLength -= increment;
    yLength -= increment;
    cycle2++;
      if(cycle2 == 4)
      {
        cycle2 = 0;
      }
  }
  
  if(mode == 1)
  {
    if(xLength >= 640)
    {
      xLength = 0;
      yLength = 0;
      
      cycle1 ++;
      if(cycle1 == 5)
      {
        cycle1 = 0;
      }    
    }
  }
  else if(mode == 2)
  {
    if(xLength <=0)
    {
      xLength = 600;
      
      cycle1 ++;
      if(cycle1 == 5)
      {
        cycle1 = 0;
      }
    }
  }
  
  if(increment == 160) {
    increment = 10;
  }

}


void keyPressed() {


  if(key == 'a')
  {
    if(mode == 1)
    {
      mode = 2;
    }
    else{
      mode = 1;
    }
  }

  
  if( i == code.length() ){
    i = 0;
  }
  if ( key == CODED ) {
    if (  (keyCode == UP && code.charAt(i) == 'u' )
      || (keyCode == DOWN && code.charAt(i) == 'd' )
      || (keyCode == LEFT && code.charAt(i) == 'l' )
      || (keyCode == RIGHT && code.charAt(i) == 'r' ) ) {
      i++;
    }
    else { 
      i = 0;
    }
  } 
  else {
    if ( ( (key == 'a' || key == 'A') && code.charAt(i) == 'a' ) 
      || ( (key == 'b' || key == 'B') && code.charAt(i) == 'b' ) ) {
        i++;
      } 
    else {
      i = 0;
    }
  }
}

void mousePressed() {
  
  if(mouseButton == RIGHT)
  {
    if(mode == 1)
    {
      mode = 2;
    }
    else
    {
      mode = 1;
    }
  }
  
  cycle2 ++;
  increment = increment * 2;
}

