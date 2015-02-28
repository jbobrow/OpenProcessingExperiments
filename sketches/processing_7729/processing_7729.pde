
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PFont font;

void setup()
{
  size(600,600);
  background(255);
  smooth();
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
  img7 = loadImage("7.jpg");
  img8 = loadImage("8.jpg");
  img9 = loadImage("9.jpg");
  img10 = loadImage("10.jpg");
  img11 = loadImage("11.jpg");
  img12 = loadImage("12.jpg");
  img13 = loadImage("13.jpg");
  img14 = loadImage("14.jpg");
  img15 = loadImage("15.jpg");
  font = createFont("ArialNarrow-48.vlw",24);
  textFont(font);
  background(0);
}

//PImage[] images = new PImage[15];
boolean showMenu = true;
boolean showMenu2 = false;
boolean strokeEnabled = true;
boolean drawComplete = false;
boolean pause = false;
int x=width/2, y=height/2, selectedImg = 0, row, col, diameter = 14;
float mx, my, xDir, yDir, xVel = 7, yVel = 7;
color c;


void draw()
{
  if(!pause)
  {
    if(showMenu)
    { menu(); }
    else if(showMenu2)
    { menu2(); }
    else if(drawComplete)
    {
      for(int i = 0; i < width/2 + diameter; i += xVel)
      {
        for(int j = 0; j < height/2 + diameter; j += yVel)
        {
          x = i;
          y = j;
          update();
          display();
        }
      }
    }
    else
    {
      update();
      display();
    }
  }
}

void menu()
{
  image(img1,0,0,150,150);
  image(img2,150,0,150,150);
  image(img3,300,0,150,150);
  image(img4,450,0,150,150);
  image(img5,0,150,150,150);
  image(img6,150,150,150,150);
  image(img7,300,150,150,150);
  image(img8,450,150,150,150);
  image(img9,0,300,150,150);
  image(img10,150,300,150,150);
  image(img11,300,300,150,150);
  image(img12,450,300,150,150);
  image(img13,0,450,150,150);
  image(img14,150,450,150,150);
  image(img15,300,450,150,150);
  mx = map(mouseX,0,width,0,4);
  col = (int)mx;
  my = map(mouseY,0,height,0,4);
  row = (int)my;
  println(mx);
  noStroke();
  fill(0,127);
  rect(0,0,width,height);
  noFill();
  stroke(255,196,0);
  strokeWeight(5);
  selectedImg = col + 4*row;
  switch(selectedImg)
  {
    case 0 : 
      image(img1,0,0,150,150);
      rect(0,0,150,150);
      break;
    case 1:
      image(img2,150,0,150,150);
      rect(150,0,150,150);
      break;
    case 2:
      image(img3,300,0,150,150);
      rect(300,0,150,150);
      break;
    case 3:
      image(img4,450,0,150,150);
      rect(450,0,150,150);
      break;
    case 4:
      image(img5,0,150,150,150);
      rect(0,150,150,150);
      break;
    case 5:
      image(img6,150,150,150,150);
      rect(150,150,150,150);
      break;
    case 6:
      image(img7,300,150,150,150);
      rect(300,150,150,150);
      break;
    case 7:
      image(img8,450,150,150,150);
      rect(450,150,150,150);
      break;
    case 8:
      image(img9,0,300,150,150);
      rect(0,300,150,150);
      break;
    case 9:
      image(img10,150,300,150,150);
      rect(150,300,150,150);
      break;
    case 10:
      image(img11,300,300,150,150);
      rect(300,300,150,150);
      break;
    case 11:
      image(img12,450,300,150,150);
      rect(450,300,150,150);
      break;
    case 12:
      image(img13,0,450,150,150);
      rect(0,450,150,150);
      break;
    case 13:
      image(img14,150,450,150,150);
      rect(150,450,150,150);
      break;
    case 14:
      image(img15,300,450,150,150);
      rect(300,450,150,150);
      break;
    default:
      break;
  }
  stroke(255);
  fill(50,115,220);
  text("Select\nan image",470,500);
}

void menu2()
{
    image(img,0,0,width,height);
  strokeWeight(1);
  stroke(0);
  fill(0,200);
  rect(0,0,width,height);

    xDir = random(-1,1);
    yDir = random(-1,1);
    x += xVel * xDir; 
    y += yVel * yDir;
    if(x < 0 || x > width)
    { x = width/2; }
    if(y < 0 || y > height)
    { y = height/2;}
    
    fill(120);
    stroke(0);
    if(strokeEnabled)
    strokeWeight(1);
    else
    noStroke();
    ellipse(x,y,diameter,diameter);

  fill(50,115,220);
  text("Use the UP (↑) and DOWN (↓) keys \n to change the size of the brush", 80,80);
  
  text("Use the LEFT (←) and RIGHT (→) keys \n to change the speed of the brush",80,220);
  
  text("Press the SPACEBAR to toggle brush stroke",80, 360);
  
  fill(150);
  text("current brush size = " + diameter, 120, 160);
  
  text("current speed = " + xVel, 120, 300);

  text("stroke enabled = " + strokeEnabled, 120, 400);
  
  stroke(255);
  fill(127);
  line(0,450,width,450);
  
  if(mouseY < 450)
  {
    fill(0,150);
    rect(0,450,width,150);
    fill(50,115,220);
  }
  else
  {
    fill(127,150);
    rect(0,450,width,150);
    fill(0);
  }
  text("Click here to continue",180,535);
}

void showImg()
{
  image(img,0,0,width,height);
}

void update()
{
    xDir = random(-1,1);
    yDir = random(-1,1);
  
    y += yVel * yDir;
    if(y < diameter/2 || y > height-diameter/2)
    {
      y = height/2;
    }
    
    x += xVel * xDir;
    if(x < diameter/2 || x > width-diameter/2)
    {
      x = width/2;
    }
}

void updateComplete()
{
    xDir = random(-1,1);
    yDir = random(-1,1);
  
    y += yVel * yDir;    
    x += xVel * xDir;
}

void display()
{
    if(strokeEnabled)
    { stroke(0); }
    else
    { noStroke(); }
    
    c = img.get(x,y);
    fill(c);
    ellipse(x,y,diameter,diameter);
    c = img.get(x,height-y);
    fill(c);
    ellipse(x,height-y,diameter,diameter);
    c = img.get(width-x,y);
    fill(c);
    ellipse(width-x,y,diameter,diameter);
    c = img.get(width-x,height-y);
    fill(c);
    ellipse(width-x,height-y,diameter,diameter);
}

void displayComplete()
{
    if(strokeEnabled)
    { stroke(0); }
    else
    { noStroke(); }
    
    c = img.get(x,y);
    fill(c);
    ellipse(x,y,diameter,diameter);
}

void mousePressed()
{
  if(showMenu)
  {
    switch(selectedImg)
    {
      case 0 :
          img = img1;
          break;
      case 1 :
          img = img2;
          break;
      case 2 :
          img = img3;
          break;
      case 3 :
          img = img4;
          break;
      case 4 :
          img = img5;
          break;
      case 5 :
          img = img6;
          break;
      case 6 :
          img = img7;
          break;
      case 7 :
          img = img8;
          break;
      case 8 :
          img = img9;
          break;
      case 9 :
          img = img10;
          break;
      case 10 :
          img = img11;
          break;
      case 11 :
          img = img12;
          break;
      case 12 :
          img = img13;
          break;
      case 13 :
          img = img14;
          break;
      case 14 :
          img = img15;
          break;
      default :
          img = img15;
          break;
      }
      showMenu = false;
      showMenu2 = true;
  }
  else if(showMenu2)
  {
    if(mouseY > 450)
    {
      showMenu2 = false;
      image(img,0,0,width,height);
    }
  }
  else
  {
    showMenu = true;
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
      { diameter++; }
    else if(keyCode == DOWN)
    { 
      if(diameter>1)
        { diameter--; }
    }
    else if(keyCode == LEFT)
    {
      if(xVel > 1 && yVel >1)
        { xVel--; yVel--; }
    }
    else if(keyCode == RIGHT)
    { xVel++; yVel++; }
  }
  else if(key == ' ')
  {
    if(strokeEnabled)
    { strokeEnabled = false; }
    else
    { strokeEnabled = true; }
  }
  
  else if((key == ENTER || key == RETURN) && !showMenu && !showMenu2)
  {
    if(drawComplete)
    { drawComplete = false; }
    else
    { drawComplete = true; }
  }
  
  else if(key == 'p' || key == 'P')
  {
    if(pause)
    {pause = false;}
    else
    {pause = true;}
  }
}

