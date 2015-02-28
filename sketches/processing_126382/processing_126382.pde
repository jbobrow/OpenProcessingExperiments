

void setup()
{
  size(600,300);
}

char keyholder;

void draw()
{
  int x=50;
  fill(0);
  for(int i=0; i<10; i++) //draw all blocks
  {
    if(keyholder == '1' && i==0)
      fill(255);
    else if(keyholder == '2' && i==1)
      fill(255);
    else if(keyholder == '3' && i==2)
      fill(255);
    else if(keyholder == '4' && i==3)
      fill(255);
    else if(keyholder == '5' && i==4)
      fill(255);
    else if(keyholder == '6' && i==5)
      fill(255);
    else if(keyholder == '7' && i==6)
      fill(255);
    else if(keyholder == '8' && i==7)
      fill(255);      
    else if(keyholder == '9' && i==8)
      fill(255);     
    else if(keyholder == '0' && i==9)
      fill(255);      
    else 
      fill(0);  
    rect(x,30,40,40);
    x += 50;
  } 
  x=75;
  for(int i=0; i<10; i++)
  {
    if(keyholder == 'q' && i==0)
      fill(255);
    else if(keyholder == 'w' && i==1)
      fill(255);
    else if(keyholder == 'e' && i==2)
      fill(255);
    else if(keyholder == 'r' && i==3)
      fill(255);
    else if(keyholder == 't' && i==4)
      fill(255);
    else if(keyholder == 'y' && i==5)
      fill(255);
    else if(keyholder == 'u' && i==6)
      fill(255);
    else if(keyholder == 'i' && i==7)
      fill(255);      
    else if(keyholder == 'o' && i==8)
      fill(255);     
    else if(keyholder == 'p' && i==9)
      fill(255);      
    else 
      fill(0);  
    rect(x,80,40,40);
    x += 50;
  } 
  x=90;
  for(int i=0; i<9; i++)
  {
    if(keyholder == 'a' && i==0)
      fill(255);
    else if(keyholder == 's' && i==1)
      fill(255);
    else if(keyholder == 'd' && i==2)
      fill(255);
    else if(keyholder == 'f' && i==3)
      fill(255);
    else if(keyholder == 'g' && i==4)
      fill(255);
    else if(keyholder == 'h' && i==5)
      fill(255);
    else if(keyholder == 'j' && i==6)
      fill(255);
    else if(keyholder == 'k' && i==7)
      fill(255);      
    else if(keyholder == 'l' && i==8)
      fill(255);         
    else 
      fill(0);
    rect(x,130,40,40);
    x += 50;
  } 
  x=115;
  for(int i=0; i<8; i++)
  {
    if(keyholder == 'z' && i==0)
      fill(255);
    else if(keyholder == 'x' && i==1)
      fill(255);
    else if(keyholder == 'c' && i==2)
      fill(255);
    else if(keyholder == 'v' && i==3)
      fill(255);
    else if(keyholder == 'b' && i==4)
      fill(255);
    else if(keyholder == 'n' && i==5)
      fill(255);
    else if(keyholder == 'm' && i==6)
      fill(255);
    else if(keyholder == ',' && i==7)
      fill(255);              
    else 
      fill(0);
    rect(x,180,40,40);
    x += 50;
  }                  
  if(keyholder == ' ')
    fill(255);
  else
    fill(0);
  rect(215,230,240,40);   //end the drawing of all blocks
  x=67;
  fill(0);
  for(int i=1;i<11;i++) //draw text for numbers
  {
    if (i>9)
    {
      text(0,x,55);
    }
    else
    {
      text(i,x,55); 
    }
    x += 50;
  }
  text("Q",90,105);
  text("W",140,105);
  text("E",190,105);
  text("R",240,105);
  text("T",290,105);
  text("Y",340,105);
  text("U",390,105);
  text("I",440,105);
  text("O",490,105);
  text("P",540,105);
  text("A",105,155);
  text("S",155,155);
  text("D",205,155);
  text("F",255,155);
  text("G",305,155);
  text("H",355,155);
  text("J",405,155);
  text("K",455,155);
  text("L",505,155);
  text("Z",130,205);
  text("X",180,205);
  text("C",230,205);
  text("V",280,205);
  text("B",330,205);
  text("N",380,205);
  text("M",430,205);
  text(",",483,200);
}

void keyPressed()
{
  keyholder=key; 
}

void keyReleased()
{
  keyholder=0;
}


