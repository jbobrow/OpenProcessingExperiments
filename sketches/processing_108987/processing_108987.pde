

//Declare some vars
float r;
float g;
float b;
float a;
float diam;
int count;
int state;

//Setup + set count and state variables
void setup() {
  count = 0;
  state = 0;

  size(500, 500);
  background(255);
  smooth();
}

void draw() {

//Picks random color variables on every update
r = random(100,255);
g = random(100,255);
b = random(100,255);
a = random(100,255);
  
//Draws random reds in state 0  
  if (state == 0 && mousePressed)
  {  
    count++;
    
    noStroke();
    fill(r, 0, 0, a);
    ellipse(mouseX, mouseY, 20, 20);    

    if (count > 120)
    {
      state = 1;
    }
  } 

//Draws random greens in state 1
  if (state == 1 && mousePressed)
  {  
    count++;

    noStroke();
    fill(0, g, 0, a);
    ellipse(mouseX, mouseY, 20, 20);    

    if (count > 240)
    {
      state = 2;
    }
  }

//Draws random blues in state 2 
  if (state == 2 && mousePressed)
  {  
    count++;

    noStroke();
    fill(0, 0, b, a);
    ellipse(mouseX, mouseY, 20, 20);    

    if (count > 360)
    {
      state = 3;
    }
  }

//Draws random yellows in state 3
  if (state == 3 && mousePressed)
  {  
    count++;
   
    noStroke();
    fill(r, g, 0, a);
    ellipse(mouseX, mouseY, 20, 20);    

    if (count > 480)
    {
      state = 4;
    }
  }
  
//Draws random cyans in state 4  
  if (state == 4 && mousePressed)
  {  
    count++;

    noStroke();
    fill(0, g, b, a);
    ellipse(mouseX, mouseY, 20, 20);    

    if (count > 600)
    {
      state = 5;
    }
  }
  
//Draws random violets in state 5  
  if (state == 5 && mousePressed)
  {  
    count++;

    noStroke();
    fill(r, 0, b, a);
    ellipse(mouseX, mouseY, 20, 20);    

    if (count > 720)
    {
      state = 0;
      count = 0;
    }
  }
}



