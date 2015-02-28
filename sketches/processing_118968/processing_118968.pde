
// Random Number Game
//author - group22

int left, right, answer, rectX, rectY;
float limit;
boolean drawn = false;
char letter;
String toCheck="";
int parse=0;
int mouseState=0;
int task=3; //to randomise the sign in example
int rand=0;
int check=0;//to check if answer contains 2 numbers or 1 
int keyState = 0; //to avoid "Wrong :(" display before full answer is written
int rectWidth = 284;   
int rectHeight= 83;
boolean rectOver = false;
color rectColor, baseColor;
color rectHighlight;
color currentColor;  




void setup()
{
  PImage img = loadImage("bg.png");

  size(600, 600);
  background(img);
  //rect button
  rectX = 160;
  rectY = 450;
  rectColor = color(0);
  rectHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
}

void draw()
{
  //load img
  PImage but0 = loadImage("but0.png");
  PImage but1 = loadImage("but1.png");

  update(mouseX, mouseY);
  //button

  if (rectOver) {
    image(but1, 160, 450);
  } 
  else {
    image(but0, 160, 450);
  }


  limit = 100;
  char[] task = { 
    '/', 'x', '+', '-'
  };
  rand = int(random(task.length));
  char op = task[rand];

  if (!drawn)
  {
    drawn = true;

    while (!numberGenerator (op));
    fill(150);

    fill(255, 0, 0);
    stroke(100);
    PFont font;
    font = loadFont("Monaco-48.vlw");
    textFont(font, 28);
    text("Please complete an example:", 75, 120);
    textFont(font, 44);
    text(str(left) + " " + op + " " + str(right) + " = ", 135, 275);
    textFont(font, 25);
    fill(0, 128, 0);
    text("..Educational Game by Group22..", 60, 40);
    textFont(font, 44);
  }  
  fill(244, 102, 6);
  text(toCheck, 380, 275); 
  //converting string to int
  parse = parseInt(toCheck);
  check = answer/10;

  if (mouseState ==1)
  {
    reset();
  }
  //checking answers

  if (parse == answer && check >=1 && check<10 && keyState==2) //check of there is 2 numbers in answer and keyboard 2 times pressed
  {
    correct();
  }
  else if (parse != answer && check >=1 && check<10 && keyState==2) //check of there is 2 numbers in answer and keyboard 2 times pressed
  {
    wrong();
  }  

  else if (check<1 && check>=0 && keyState==1 && answer>=0 ) //check of there is 1 number in answer and keyboard 1 time pressed
  {
    if (parse == answer)
    {
      correct();
    }  
    else if (parse != answer)
    {
      wrong();
    }
  }

  else if (parse == answer && check >=10 && check<100 && keyState==3) //check of there is 3 number in answer and keyboard 3 times pressed
  {
    correct();
  }
  else if (parse != answer && check >=10 && check<100 && keyState==3) //check of there is 3 numbers in answer and keyboard 3 times pressed
  {
    wrong();
  }     

  else if (parse == answer && check >=100 && keyState==4) //check of there is 4 numbers in answer and keyboard 4 times pressed
  {
    correct();
  }
  else if (parse != answer && check >=100 && keyState==4) //check of there is 4 numbers in answer and keyboard 4 times pressed
  {
    wrong();
  }        

  //now same, but for negative numbers:(

  if ((check <=-1) && (check>-10) && (keyState==3)) //check of there is 2 numbers and "-" sign in answer and keyboard 3 times pressed
  {
    if ( (answer<0) && (parse == answer))
    {
      correct();
    }
  }
  else if ((check <=-1) && (check>-10) && (keyState==3)) //check of there is 2 numbers and "-" sign in answer and keyboard 3 times pressed
  {
    if ((answer<0) &&(parse != answer))
    {
      wrong();
    }
  }  

  else if ((check<0) && (check>-1) && (keyState==2)) //check of there is 1 number and "-" sign in answer and keyboard 2 times pressed
  {
    if (parse == answer)
    {
      correct();
    }
    else if (parse != answer)
    {
      wrong();
    }
  }


  else if (check <=-10 && check>-100 && keyState==4) //check of there is 3 numbers and "-" sign in answer and keyboard 4 times pressed
  {
    if ((answer<0) && (parse == answer))
    {
      correct();
    }
  }
  else if (check <=-10 && check>-100 && keyState==4) //check of there is 3 number and "-" sign in answer and keyboard 4 times pressed
  {
    if ((answer<0) && (parse != answer))
    {
      wrong();
    }
  }     

  else if (check <=-100 && keyState==5) //check of there is 4 number and "-" sign in answer and keyboard 4 times pressed
  {
    if ((answer<0) && (parse == answer))
    {
      correct();
    }
  }
  else if (check <=-100 && keyState==5) //check of there is 4 number and "-" sign in answer and keyboard 4 times pressed
  {
    if ((answer<0) && (parse != answer))
    {
      wrong();
    }
  }
}   


void update(int x, int y) {
  if ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
    rectOver = true;
  } 
  else {
    rectOver = false;
  }
}


void mousePressed() {
  if (rectOver) {
    mouseState=1;
  }
}

void correct() //to save space on writing correct/wrong
{
  fill(43, 193, 27);   
  text("Correct! :)", 150, 345);
}

void wrong() //to save space on writing correct/wrong
{
  fill(245, 12, 5);  
  text("Wrong! :(", 150, 345);
}
boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}


boolean numberGenerator(char operator)
{
  boolean valid = true;
  left = (int)random(limit);
  right = (int)random(limit);

  switch (operator)
  {
  case '+':
    answer = left+right;
    break;

  case '-':


    if (((left-right)<0)&&((left-right)>-10))
    {
      valid=false;
    }  
    else 
      answer = left-right;        
    break;

  case 'x':
    answer = left*right;
    break;

  case '/':
    if (((float)left/(float)right)%1 != 0)
    {
      valid = false;
    }    
    else
      answer = left/right;
    break;
  }

  return valid;
}

void keyPressed() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= '0' && key <= '9') || (key == '-' )) {
    letter = key;
    toCheck = toCheck+ key;
    // Write the letter to the console
    println(key);
    keyState = keyState+1;
  }
}


void reset() //to add functionality to try again button
{
  toCheck="";
  parse=0;
  mouseState=0;
  rand=0;
  check=0; 
  keyState = 0; 
  drawn = false;
  setup();
  draw();
}



