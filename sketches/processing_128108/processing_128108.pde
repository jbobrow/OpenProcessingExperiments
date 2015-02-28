
//game about making decisions or staying true to you

//variables
int x, y; //position of player
int h, w, col, pref, sides; //player's height, width, colour,
                            //preference and # of sides
                            //These can change based on the player
int iH, iW, iCol, iPref, iSides; //the initial values the player sets
//PShape cShape;
boolean s1,s2,s3,s4; //switches
boolean d00,d01,d02,d03,d04,d05,d06,d07,d08,d09,d10,d11,d12,d13,d14,d15; //dialog switches
boolean moveOK = false; //allow movement
boolean moveEntry = false; //switch to allow choices
int moveChoice = 0; //1 = left, 2 = right
int m = 0; //counter to see if you can move or not
int moveSwitch = 0; //increases after every choice
PImage hetero,homo,bi,asex,unknown; //sexuality flags
PImage Q_sides,Q_col,Q_size,Q_pref; //question screens

void setup()
{
  size(800,600);
  background(255);
  fill(0);
  strokeWeight(1); //create border for player character
  stroke(0);
  //shapeMode(CENTER); //shape(name,x,y,w,h)
  
  //choice switches
  s1 = false;
  s2 = false;
  s3 = false;
  s4 = false;
  
  //dialog switches
  d00 = true;
  d01 = false;
  d02 = false;
  d03 = false;
  d04 = false;
  d05 = false;
  d06 = false;
  d07 = false;
  d08 = false;
  d09 = false;
  d10 = false;
  d11 = false;
  d12 = false;
  d13 = false;
  d14 = false;
  d15 = false;
  
  //set images  
  hetero = loadImage("heterosexual.jpg");
  homo = loadImage("homosexual.jpg");
  bi = loadImage("bisexual.png");
  asex = loadImage("asexual.jpg");
  unknown = loadImage("Unknown.jpg");
  
  Q_sides = loadImage("sides.jpg");
  Q_col = loadImage("colours.jpg");
  Q_size = loadImage("sizes.jpg");
  Q_pref = loadImage("preferences.jpg");
  
  hetero.resize(80,60);
  homo.resize(80,60);
  bi.resize(80,60);
  asex.resize(80,60);
  unknown.resize(80,60);
  
  Q_sides.resize(800,600);
  Q_col.resize(800,600);
  Q_size.resize(800,600);
  Q_pref.resize(800,600);
  
  //set positions
  //x = 10;
  y = 100;
}

void createPlayer()
{
  //get player to determine stats
  //sides
  if (s1 == false)
  {
    image(Q_sides,0,0);
    //text("How many sides will you have?",50,50);
    //text("Enter a value between 4-8",50,75);
    
    if (keyPressed == true)
    {
      if (key == '4')
      {
        sides = 4;
        s1 = true;
      }
      
      if (key == '5')
      {
        sides = 5;
        s1 = true;
      }
      
      if (key == '6')
      {
        sides = 6;
        s1 = true;
      }
      
      if (key == '7')
      {
        sides = 7;
        s1 = true;
      }
      
      if (key == '8')
      {
        sides = 8;
        s1 = true;
      }
    }
    
    iSides = sides; //set iSides to the initial value
  }
  
  //size
  if ((s1 == true) && (s2 == false))
  {
    image(Q_size,0,0);
    //text("How big are you?",50,50);
    //text("Tiny (t), Small (s), Normal (n), Big (b), Huge (h)",50,70);
    
    if (keyPressed == true)
    {
      if (key == 't')
      {
        h = 1;
        s2 = true;
        x = 390;
      }
      
      if (key == 's')
      {
        h = 2;
        s2 = true;
        x = 375;
      }
      
      if (key == 'n')
      {
        h = 3;
        s2 = true;
        x = 365;
      }
      
      if (key == 'b')
      {
        h = 4;
        s2 = true;
        x = 360;
      }
      
      if (key == 'h')
      {
        h = 5;
        s2 = true;
        x = 345;
      }
    }
    
    iH = h; //set iH to the initial value
  }
  
  //colour
  if ((s2 == true) && (s3 == false))
  {
    image(Q_col,0,0);
    //text("What colour are you?",50,50);
    //text("r = Red, y = yellow, w = White, o = Brown, l = Black",50,70);
    //colour order (red, yellow, white, brown, black (1-5))
    
    if (keyPressed == true)
    {
      if (key == 'r')
      {
        col = 1;
        s3 = true;
      }
      
      if (key == 'y')
      {
        col = 2;
        s3 = true;
      }
      
      if (key == 'w')
      {
        col = 3;
        s3 = true;
      }
      
      if (key == 'o')
      {
        col = 4;
        s3 = true;
      }
      
      if (key == 'l')
      {
        col = 5;
        s3 = true;
      }
    }
    
    iCol = col; //set iCol to the initial value
  }
  
  //preference
  if ((s3 == true) && (s4 == false))
  {
    image(Q_pref,0,0);
    //text("What do you prefer?",50,50);
    //text("The same as you (s); Different than you (d); Both (b); None (n); Unsure (u)",50,70);
    //order (1-5) s, b, d, u, n
    
    if (keyPressed == true)
    {
      if (key == 's')
      {
        pref = 1;
        s4 = true;
      }
      
      if (key == 'b')
      {
        pref = 2;
        s4 = true;
      }
      
      if (key == 'd')
      {
        pref = 3;
        s4 = true;
      }
      
      if (key == 'u')
      {
        pref = 4;
        s4 = true;
      }
      
      if (key == 'n')
      {
        pref = 5;
        s4 = true;
      }
    }
    
    iPref = pref; //set iPref to the initial value
  }
}

//this draws the shape of the player
void charShape()
{
  //what colour? red, yellow, white, brown, black (1-5)
  switch(col)
  {
    case 1:
      fill(255,0,0);
      break;
    case 2:
      fill(255,255,0);
      break;
    case 3:
      fill(255,255,255);
      break;
    case 4:
      fill(137,106,46);
      break;
    case 5:
      fill(0,0,0);
      break;
  }
  
  //size of the character determines centre point (x)
  switch(h)
  {
    case 1:
      x = 390;
      break;
    case 2:
      x = 375;
      break;
    case 3:
      x = 365;
      break;
    case 4:
      x = 360;
      break;
    case 5:
      x = 345;
      break;
  }
  
  //draw shapes for 4-8 sides (max length = 20)
  beginShape();
  
  if (sides == 4)
  {
    vertex(x+0,100+0);
    vertex(x+0,100+h*20);
    vertex(x+h*20,100+h*20);
    vertex(x+h*20,100+0);
  }
  
  if (sides == 5)
  {
    vertex(x+(h*20/2),100+0);
    vertex(x+h*20,100+(h*20/2));
    vertex(x+(3*(h*20/4)),100+h*20);
    vertex(x+(h*20/4),100+h*20);
    vertex(x+0,100+(h*20/2));
  }
  
  if (sides == 6)
  {
    vertex(x+(h*20/4),100+0);
    vertex(x+(3*(h*20/4)),100+0);
    vertex(x+h*20,100+(h*20/2));
    vertex(x+(3*(h*20/4)),100+h*20);
    vertex(x+(h*20/4),100+h*20);
    vertex(x+0,100+(h*20/2));
  }
  
  if (sides == 7)
  {
    vertex(x+((h*20)/2),100+0);
    vertex(x+((h*20)-(h*20/7)),100+(h*20/3));
    vertex(x+h*20,100+(2*(h*20/3)));
    vertex(x+(3*(h*20/4)),100+h*20);
    vertex(x+(h*20/4),100+h*20);
    vertex(x+0,100+(2*(h*20/3)));
    vertex(x+(h*20/8),100+(h*20/3));
  }
  
  if (sides == 8)
  {
    vertex(x+(h*20/4),100+0);
    vertex(x+(3*(h*20/4)),100+0);
    vertex(x+h*20,100+(h*20/4));
    vertex(x+h*20,100+(3*(h*20/4)));
    vertex(x+(3*(h*20/4)),100+h*20);
    vertex(x+(h*20/4),100+h*20);
    vertex(x+0,100+(3*(h*20/4)));
    vertex(x+0,100+(h*20/4));
  }
  
  endShape(CLOSE);
  
  //draw sexuality flag in top left
  switch(pref)
  {
    case 1: //homo
      image(homo,50,50);
      break;
    case 2: //bi
      image(bi,50,50);
      break;
    case 3: //hetero
      image(hetero,50,50);
      break;
    case 4: //unknown
      image(unknown,50,50);
      break;
    case 5: //a
      image(asex,50,50);
      break;
  }
}

//this draws the shape of the player, originally
void origShape()
{
  //what colour? red, yellow, white, brown, black (1-5)
  switch(iCol)
  {
    case 1:
      fill(255,0,0);
      break;
    case 2:
      fill(255,255,0);
      break;
    case 3:
      fill(255,255,255);
      break;
    case 4:
      fill(137,106,46);
      break;
    case 5:
      fill(0,0,0);
      break;
  }
  
  //size of the character determines centre point (x)
  switch(iH)
  {
    case 1:
      x = 390;
      break;
    case 2:
      x = 375;
      break;
    case 3:
      x = 365;
      break;
    case 4:
      x = 360;
      break;
    case 5:
      x = 345;
      break;
  }
  
  //draws at y = y + 6400
  //draw shapes for 4-8 sides (max length = 20)
  beginShape();
  
  if (iSides == 4)
  {
    vertex(x+0,y + 6300+0);
    vertex(x+0,y + 6300+iH*20);
    vertex(x+iH*20,y + 6300+iH*20);
    vertex(x+iH*20,y + 6300+0);
  }
  
  if (iSides == 5)
  {
    vertex(x+(iH*20/2),y + 6300+0);
    vertex(x+iH*20,y + 6300+(iH*20/2));
    vertex(x+(3*(iH*20/4)),y + 6300+iH*20);
    vertex(x+(iH*20/4),y + 6300+iH*20);
    vertex(x+0,y + 6300+(iH*20/2));
  }
  
  if (iSides == 6)
  {
    vertex(x+(iH*20/4),y + 6300+0);
    vertex(x+(3*(iH*20/4)),y + 6300+0);
    vertex(x+iH*20,y + 6300+(iH*20/2));
    vertex(x+(3*(iH*20/4)),y + 6300+iH*20);
    vertex(x+(iH*20/4),y + 6300+iH*20);
    vertex(x+0,y + 6300+(iH*20/2));
  }
  
  if (iSides == 7)
  {
    vertex(x+((iH*20)/2),y + 6300+0);
    vertex(x+((iH*20)-(iH*20/7)),y + 6300+(iH*20/3));
    vertex(x+iH*20,y + 6300+(2*(iH*20/3)));
    vertex(x+(3*(iH*20/4)),y + 6300+iH*20);
    vertex(x+(iH*20/4),y + 6300+iH*20);
    vertex(x+0,y + 6300+(2*(iH*20/3)));
    vertex(x+(iH*20/8),y + 6300+(iH*20/3));
  }
  
  if (iSides == 8)
  {
    vertex(x+(iH*20/4),y + 6300+0);
    vertex(x+(3*(iH*20/4)),y + 6300+0);
    vertex(x+iH*20,y + 6300+(iH*20/4));
    vertex(x+iH*20,y + 6300+(3*(iH*20/4)));
    vertex(x+(3*(iH*20/4)),y + 6300+iH*20);
    vertex(x+(iH*20/4),y + 6300+iH*20);
    vertex(x+0,y + 6300+(3*(iH*20/4)));
    vertex(x+0,y + 6300+(iH*20/4));
  }
  
  endShape(CLOSE);
  
  //draw sexuality flag in bottom left
  switch(iPref)
  {
    case 1: //homo
      image(homo,50,y+6400);
      break;
    case 2: //bi
      image(bi,50,y+6400);
      break;
    case 3: //hetero
      image(hetero,50,y+6400);
      break;
    case 4: //unknown
      image(unknown,50,y+6400);
      break;
    case 5: //a
      image(asex,50,y+6400);
      break;
  }
}

void movementChoice()
{
  //you can move up/down when allowed
  //left/right determine choices made
  if (moveOK == true)
  {
    fill(0);
    text("<Press Up or Down to Move>",320,550);
  }
  
  if (keyPressed == true)
  {
    if (key == CODED)
    {
      if (moveOK == true)
      {        
        if (keyCode == DOWN) //move down
        {
          y = y - 10;
          //y = y - 20;
          m = m + 10;
          //m = m + 20;
        }
        
        if ((keyCode == UP) && (y < 100)) //move up and restrict movement off top of screen
        {
          y = y + 10;
          m = m - 10;
        }
        
        if (m >= 1000) //counter to see if you can move or not
        {
          moveOK = false;
          
          switch (moveSwitch)
          {
            case 0: //sides
              d02 = true;
              m = 0;
              break;
            case 1: //size
              d05 = true;
              m = 0;
              break;
            case 2: //colour
              d08 = true;
              m = 0;
              break;
            case 3: //preference
              d11 = true;
              m = 0;
              break;
            case 4: //all choices made
              d14 = true;
              m = 0;
              break;
            case 5: //mirror
              d15 = true;
              m = 0;
              break;
          }
        }
      }

      if (moveEntry == true)
      {
        if (keyCode == LEFT) //move left
        {
          moveChoice = 1;
        }
        
        if (keyCode == RIGHT) //move right
        {
          moveChoice = 2;
        }
        
        //println("move choice " + moveChoice);
      }
    }
  }
}

void drawBG()
{
  //draw the level
  //first box
  fill(75);
  rect(0,y-100,200,1000); //x.y.w.h
  rect(600,y-100,200,1000);
  
  //second box
  fill(215);
  rect(0,y+900,200,1000); //x.y.w.h
  rect(600,y+900,200,1000);
  
  //square asking about sides
  fill(125);
  rect(width/2 + 120,y + 1070,40,40);
  
  //third box
  fill(75);
  rect(0,y+1900,200,1000); //x.y.w.h
  rect(600,y+1900,200,1000);
  
  //average sized square asking about size
  fill(125);
  rect(width/2 + 100,y + 2050,60,60);
  
  //fourth box
  fill(215);
  rect(0,y+2900,200,1000); //x.y.w.h
  rect(600,y+2900,200,1000);
  
  //average sized white square asking about colour
  fill(255);
  rect(width/2 + 100,y + 3050,60,60);
  
  //fifth box
  fill(75);
  rect(0,y+3900,200,1000); //x.y.w.h
  rect(600,y+3900,200,1000);
  
  //average sized white hetero square asking about preference
  fill(255);
  rect(width/2 + 100,y + 4050,60,60);
  
  image(hetero,670,y + 4050);
  
  //sixth box
  fill(215);
  rect(0,y+4900,200,1000); //x.y.w.h
  rect(600,y+4900,200,1000);
  
  //average sized white hetero square designating if you got the job or not
  fill(255);
  rect(width/2 + 100,y + 5050,60,60);
  fill(0);
  rect(width/2 + 100,y + 5080,60,30);
  
  //seventh box
  fill(75);
  rect(0,y+5900,200,1000); //x.y.w.h
  rect(600,y+5900,200,1000);
  
  //look at yourself in the mirror. Did you change?
  origShape();
}

void dialog() //displays dialog
{
  //println(moveSwitch);
  
  fill(0); //set text colour

  //introduction sentence
  if (d00 == true)
  {
    text("This is You. You are what you are.",305,50);
    text("<Press n to continue>",335,80);
    
    if (keyPressed == true)
    {
      if (key == 'n')
      {
        d00 = false;
        d01 = true;
      }
    }
  }
  
  if (d01 == true)
  {
    text("You must try and get a job.",320,50);
    text("<Press f to continue>",335,80);
    
    if (keyPressed == true)
    {
      if (key == 'f')
      {
        d01 = false;
        moveOK = true; //allow movement
      }
    }
  }
  
  ////////////////////////////////////////////////
  //first choice (sides)
  if (d02 == true)
  {
    text("You seem like a good candidate but....",290,50);
    text("<Press n to continue>",335,80);
    
    if (keyPressed == true)
    {
      if (key == 'n')
      {
        d02 = false;
        d03 = true;
      }
    }
  }
  
  if (d03 == true)
  {
    if (sides == 4) //square
    {
      text("Wait, no actually, you are fine.",312,20);
      text("Please go to the next question.",310,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d03 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      text("You are too rounded. You should be less rounded.",265,20);
      text("Can you do that?",350,50);
      text("LEFT = Yes / RIGHT = No",328,80);
      moveEntry = true;
      
      if (moveChoice == 1)
      {
        sides = 4;
        moveEntry = false;
        d03 = false;
        d04 = true;
        moveChoice = 0;
      }
      else if (moveChoice == 2)
           {
             moveEntry = false;
             d03 = false;
             d04 = true;
             moveChoice = 0;
           }
    }
  }
  
  //only appears if sides changed/wasn't changed
  if (d04 == true)
  {
    if (sides == 4)
    {
      text("Perfect! You can continue on now!",300,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d04 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      text("That's unfortunate.",342,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d04 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
  }
  
  ////////////////////////////////////////////////
  //second choice (size)
  if (d05 == true)
  {
    text("You seem like a good candidate but....",290,50);
    text("<Press n to continue>",335,80);
    
    if (keyPressed == true)
    {
      if (key == 'n')
      {
        d05 = false;
        d06 = true;
      }
    }
  }
  
  if (d06 == true)
  {
    if (h == 3) //normal size
    {
      text("Wait, no actually, you are fine.",312,20);
      text("Please go to the next question.",310,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d06 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      if (h < 3)
      {
        text("You are too small. You should be bigger.",285,20);
      }
      else if (h > 3)
           {
             text("You are too big. You should be smaller.",285,20);
           }
           
      text("Can you do that?",350,50);
      text("LEFT = Yes / RIGHT = No",328,80);
      moveEntry = true;
      
      if (moveChoice == 1)
      {
        h = 3;
        moveEntry = false;
        d06 = false;
        d07 = true;
        moveChoice = 0;
      }
      else if (moveChoice == 2)
           {
             moveEntry = false;
             d06 = false;
             d07 = true;
             moveChoice = 0;
           }
    }
  }
  
  //only appears if h changed/wasn't changed
  if (d07 == true)
  {
    if (h == 3)
    {
      text("Perfect! You can continue on now!",300,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d07 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      text("That's unfortunate.",342,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d07 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
  }
  
  ////////////////////////////////////////////////
  //third choice (colour)
  if (d08 == true)
  {
    text("You seem like a good candidate but....",290,50);
    text("<Press n to continue>",335,80);
    
    if (keyPressed == true)
    {
      if (key == 'n')
      {
        d08 = false;
        d09 = true;
      }
    }
  }
  
  if (d09 == true)
  {
    if (col == 3) //white
    {
      text("Wait, no actually, you are fine.",312,20);
      text("Please go to the next question.",310,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d09 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      text("You aren't pale enough. You should be more pale.",260,20);
      text("Can you do that?",350,50);
      text("LEFT = Yes / RIGHT = No",328,80);
      moveEntry = true;
      
      if (moveChoice == 1)
      {
        col = 3;
        moveEntry = false;
        d09 = false;
        d10 = true;
        moveChoice = 0;
      }
      else if (moveChoice == 2)
           {
             moveEntry = false;
             d09 = false;
             d10 = true;
             moveChoice = 0;
           }
    }
  }
  
  //only appears if col changed/wasn't changed
  if (d10 == true)
  {
    if (col == 3)
    {
      text("Perfect! You can continue on now!",300,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d10 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      text("That's unfortunate.",342,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d10 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
  }
  
  ////////////////////////////////////////////////
  //fourth choice (preference)
  if (d11 == true)
  {
    text("You seem like a good candidate but....",290,50);
    text("<Press n to continue>",335,80);
    
    if (keyPressed == true)
    {
      if (key == 'n')
      {
        d11 = false;
        d12 = true;
      }
    }
  }
  
  if (d12 == true)
  {
    if (pref == 3) //hetero
    {
      text("Wait, no actually, you are fine.",312,20);
      text("Please continue onwards.",320,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d12 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      text("Your preference is immoral and wrong. You should change.",240,20);
      text("Can you do that?",350,50);
      text("LEFT = Yes / RIGHT = No",328,80);
      moveEntry = true;
      
      if (moveChoice == 1)
      {
        pref = 3;
        moveEntry = false;
        d12 = false;
        d13 = true;
        moveChoice = 0;
      }
      else if (moveChoice == 2)
           {
             moveEntry = false;
             d12 = false;
             d13 = true;
             moveChoice = 0;
           }
    }
  }
  
  //only appears if h changed/wasn't changed
  if (d13 == true)
  {
    if (pref == 3)
    {
      text("Perfect! You can continue on now!",300,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d13 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
    else
    {
      text("That's unfortunate.",342,50);
      text("<Press f to continue>",335,80);
      
      if (keyPressed == true)
      {
        if (key == 'f')
        {
          d13 = false;
          moveOK = true;
          moveSwitch++;
        }
      }
    }
  }
  
  ////////////////////////////////////////////////
  //all choices made
  if (d14 == true)
  {
    if ((sides == 4) && (h == 3) && (col == 3) && (pref == 3)) //white, square, average sized and hetero
    {
      text("You are the perfect candidate! You match all the qualities we want!",220,20);
      text("Congratulations on the job!",320,50);
    }
    else if ((sides == 4) || (h == 3) || (col == 3) || (pref == 3)) //have at least one quality that's societal normal
         {
           text("You are an okay candidate. You might want to change some things.",220,20);
           text("You can be hired on probation.",310,50);
         }
         else if ((sides != 4) && (h != 3) && (col != 3) && (pref != 3)) //fuck the man
              {
                text("You are not what we are looking for.",300,20);
                text("Please leave now.",345,50);                
              }
    
    text("<Press n to continue>",335,80);
    
    if (keyPressed == true)
    {
      if (key == 'n')
      {
        d14 = false;
        moveOK = true;
        moveSwitch++;
      }
    }
  }
  
  ////////////////////////////////////////////////
  //look in the mirror, was it worth it?
  if (d15 == true)
  {
    text("This is who you were.",340,250);
    
    if ((sides != iSides) || (h != iH) || (col != iCol) || (pref != iPref))
    {
      //if you made a change
      text("Was it worth it to change yourself just for a better chance at a job?",223,270);  
    }
    else if ((sides == iSides) && (h == iH) && (col == iCol) && (pref == iPref))
         {
           //didn't change anything
           text("And you didn't change yourself for anyone. Kudos!",260,270);
         }
         
    //delay(500);
    fill(120);
    text("Press Esc to close",342,570);
  }
}


void draw()
{
  background(255);
  
  //create the player's shape
  if (s4 == false)
  {
    createPlayer();
  }
  else
  {
    drawBG();
    charShape(); //draw player
    movementChoice();
    dialog();
  }
}


