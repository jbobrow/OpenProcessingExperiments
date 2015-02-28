
int counter;      //The counter that calculates when and how far to move the turtle
int [][] coords = { {0, 150}, {46, 86}, {67, 98}, {83, 91}, {115, 150}, {155, 127},
                    {184, 76}, {253, 45}, {294, 57}, {312, 116}, {367, 108}, {433, 62},
                    {464, 74}, {556, 31}, {677, 150}};
PFont font;      //The font variable
boolean check_click;  //Check to see if the user has clicked a button to start the turtle moving
boolean check_start;  //Check to see if the user has clicked the start button
int food_var;         //The random food variable to load a random image

PImage straw;         //The variable to store the strawberry image
PImage mush;          //The variab/e to store the mushroom image
PImage let;           //The variable to store the lettuce image
PImage cat;           //The variable to store the cat-food image

//-----------------------------------------------------------------------------------------Setup
void setup()
{
  size(800, 600);
  background(102, 102, 102);
  smooth();
  rectMode(CENTER);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  counter = 0;
  check_click = false;
  check_start = false;
  font = loadFont("AmericanTypewriter-Condensed-48.vlw");
  food_var = int(random(4));
  println(food_var);
  straw = loadImage("strawberry.jpg");
  mush = loadImage("mushroom.jpg");
  let = loadImage("lettuce.jpg");      
  cat = loadImage("cat food.jpg");
  
}
//-----------------------------------------------------------------------------------------Draw
void draw()
{
  //println("(" + mouseX + "," + mouseY + ")");

  check_click = start_button();
  if((counter < 800) && (check_click == true))
  {
    background(102, 102, 102);
    scene(food_var);
    counter = turtleMove();
  }
  else
  {
    scene(food_var);
    translate(counter, 0);
    turtle();
    translate(-counter, 0);
  }
  
  if(check_start == false)
  {
    check_start = startScreen();
  }
  else
  {
    cursor(ARROW);
  }
}
//-----------------------------------------------------------------------------------------Start Screen
boolean startScreen()
{
  boolean check = false;
  stroke(0);
  strokeWeight(10);
  fill(131, 131, 131, 220);
  rect(400, 300, 700, 500);
  strokeWeight(5);
  rect(600, 500, 200, 50);
  fill(0);
  textFont(font, 48);
  text("Start", 540, 515);
  textFunction();
  
  if((mouseX >= 500 && mouseX <= 700) && (mouseY >= 475 && mouseY <= 525))
  {
    cursor(HAND);
    rect(600, 500, 200, 50);
    fill(255);
    textFont(font, 48);
    text("Start", 540, 515);
    
    if((mouseButton == LEFT)  && (mousePressed == true))
    {
      background(102, 102, 102);
      check = true;
    }
     
  }
  else
  {
    cursor(ARROW);
    check = false;
  }
  
  strokeWeight(3);
  return(check);
}
//-----------------------------------------------------------------------------------------Text Function
void textFunction()
{
  strokeWeight(10);
  line(50, 120, 750, 120);
  strokeWeight(5);
  fill(0, 0, 0, 63);
  rect(225, 300, 250, 300);
  rect(575, 300, 250, 300);
  fill(0);
  textFont(font, 32);
  text("Why did the tortoise cross the road?\n\n\n     Strawberries\n\n     Mushrooms\n\n     Lettuce\n\n     Cat-Food", 80, 100);
  textFont(font, 20);
  text("The object of the game\nis to cross the road.\nOnce across the road\nyou will come across\na food for the tortoise\nto eat.  If you click\nthe correct food name\non the input boxes,\nYou win. Shift + \nRight Click Will Drag \nThe Turtle..Good Luck!", 470, 200);
}
  
//-----------------------------------------------------------------------------------------Mountains,Road, Dirt, Etc
void scene(int food_var)
{ 
  fill(0);
  noStroke();
  rect(375, 50, 1200, 200);
 
  stroke(0);
  fill(0);
  triangle(190, 615, 560, 615, 375, 150);
  stroke(255);
  
  fill(255);
  noStroke();
  triangle(350, 615, 370, 615, 375, 150);
  quad(380, 615, 400, 615, 375, 150, 375, 150);
  stars();
  mountains();
  buttons();
  food_img(food_var);
}

//-----------------------------------------------------------------------------------------Mountains
void mountains()
{
  
  fill(51, 51, 51);
  beginShape();
    for(int n = 0; n < coords.length; n++)
    {
      vertex(coords[n][0], coords[n][1]);
    }
  endShape();
  
}

//-----------------------------------------------------------------------------------------Turtle Move Press
boolean start_button()
{
  
  if(keyPressed == true)
  {
    check_click = true;
  }
  else
  {
    check_click = false;
  }
  
  return(check_click);
}

//-----------------------------------------------------------------------------------------Turtle Move Function
int turtleMove()
{
  
  if(keyPressed == true)
  {
    if(keyCode == RIGHT)
    {
      counter++;
    }
    if(keyCode == LEFT)
    {
      counter--;
    }
    translate(counter, 0);
    turtle();
    translate(-counter, 0);
  }
  
  if(mousePressed == true && mouseButton == RIGHT && keyCode == SHIFT)
  {
    counter = mouseX - 100;
    translate(counter, 0);
    turtle();
  }

  return(counter);
}

//-----------------------------------------------------------------------------------------Turtle Draw Function
void turtle()
{
  head();
  shell();
  legs();
}

//-----------------------------------------------------------------------------------------Shell
void shell()
{
  stroke(51, 102, 0);
  strokeWeight(3);
  fill(51, 153, 0);
  arc(100, 500, 100, 100, (PI + .1), (2*PI - .1));
  noStroke();
  fill(0);
  //rect(100, 550, 105, 105);
  stroke(102, 51, 0);
  fill(153, 102, 0);
  ellipse(100, 495, 102, 10);
  stroke(102, 51, 0);
  
  noFill();
  stroke(14, 80, 8);
  bezier(75, 460, 80, 470, 120, 470 , 130, 460);
  stroke(102, 51, 0);
}
//-----------------------------------------------------------------------------------------Head
void head()
{
  stroke(153, 102, 0);
  fill(204, 153, 51);
  ellipse(150, 482, 60, 30);
  fill(0);
  stroke(0);
  ellipse(165, 477, 5, 5);
  line(161, 488, 173, 490);
}

//-----------------------------------------------------------------------------------------Legs
void legs()
{
  fill(51, 102, 0);
  ellipse(75, 510, 18, 20);
  ellipse(68, 513, 20, 30);
  
  ellipse(125, 510, 18, 20);
  ellipse(118, 513, 20, 30);
  
  //tail
  rotate(radians(45));
  ellipse(390, 320, 10, 20);
  rotate(radians(-45));
}
//-----------------------------------------------------------------------------------------Buttons
void buttons()
{
  stroke(4);
  noFill();
  rect(100, 200, 180, 50);
  rect(100, 260, 180, 50);
  rect(100, 320, 180, 50);
  rect(100, 380, 180, 50);
  
  noStroke();
  fill(0);
  textFont(font, 30);
  text("Strawberry", 17, 215);
  textFont(font, 30);
  text("Mushroom", 17, 275);
  textFont(font, 30);
  text("Lettuce", 38, 335);
  textFont(font, 30);
  text("Cat-Food", 35, 395);
  
  if(mousePressed == true && mouseButton == LEFT)
  {
    if((mouseX >= 40 && mouseX <= 165) && (mouseY >= 175 && mouseY <= 225))
    {
      strawberry_button(food_var);
    }
    else if((mouseX >= 40 && mouseX <= 165) && (mouseY >= 235 && mouseY <= 285))
    {
      mushroom_button(food_var);
    }
     else if((mouseX >= 40 && mouseX <= 165) && (mouseY >= 295 && mouseY <= 345))
    {
      lettuce_button(food_var);
    }
    else if((mouseX >= 40 && mouseX <= 165) && (mouseY >= 355 && mouseY <= 405))
    {
      catFood_button(food_var);
    }
  }
  food_var = resetButton(food_var);
}
//-----------------------------------------------------------------------------------------Strawyberry Button
void strawberry_button(int food_var)
{
  if(food_var != 0)
  {
    stroke(0);
    fill(255, 0, 0);
    rect(600, 200, 180, 50);
    fill(0);
    textFont(font, 30);
    text("Fail", 570, 213);
  }
  else
  {
    stroke(0);
    fill(0, 0, 250);
    rect(600, 200, 180, 50);

    fill(0);
    textFont(font, 30);
    text("Win", 570, 213);
  }
  
}
//-----------------------------------------------------------------------------------------Mushroom Button
void mushroom_button(int food_var)
{
  if(food_var != 1)
  {     
    stroke(0);
    fill(255, 0, 0);
    rect(600, 200, 180, 50);

    fill(0);
    textFont(font, 30);
    text("Fail", 570, 213);
  }
  else
  {
    
    stroke(0);
    fill(0, 0, 255);
    rect(600, 200, 180, 50);

    fill(0);
    textFont(font, 30);
    text("Win", 570, 213);
  }
  
}
//-----------------------------------------------------------------------------------------Lettuce Button
void lettuce_button(int food_var)
{
  if(food_var != 2)
  {   
    stroke(0);
    fill(255, 0, 0);
    rect(600, 200, 180, 50);

    fill(0);
    textFont(font, 30);
    text("Fail", 570, 213);
  }
  else
  {
    
    stroke(0);
    fill(0, 0, 255);
    rect(600, 200, 180, 50);

    fill(0);
    textFont(font, 30);
    text("Win", 570, 213);
  }
  
}
//-----------------------------------------------------------------------------------------Cat Food Button
void catFood_button(int food_var)
{
  if(food_var != 3)
  { 
    stroke(0);
    fill(255, 0, 0);
    rect(600, 200, 180, 50);

    fill(0);
    textFont(font, 30);
    text("Fail", 570, 213);
  }
  else
  {
    stroke(0);
    fill(0, 0, 255);
    rect(600, 200, 180, 50);

    fill(0);
    textFont(font, 30);
    text("Win", 570, 213);
  }
  
}
//-----------------------------------------------------------------------------------------Stars
void stars()
{
  int x;
  int y;
  
  for(int n = 0; n < 10; n++)
  {
    y = int(random(148));
    x = int(random(800));
    
    fill(255);
    stroke(255);
    point(x, y);
  }
  
  fill(240, 240, 240);
  ellipse(740, 30, 20, 20);
  noStroke();
}
//-----------------------------------------------------------------------------------------Case Switch to choose img
void food_img(int food_var)
{
  switch(food_var)
  {
    case 0:
      strawberry();
      break;
    case 1:
      mushroom();
      break;
    case 2:
      lettuce();
      break;
    case 3:
      catFood();
      break;  
  }
}
//-----------------------------------------------------------------------------------------Load Strawberry
void strawberry()
{
  image(straw, 625, 350, 150, 200);
}
//-----------------------------------------------------------------------------------------Load Mushroom
void mushroom()
{
  image(mush, 625, 350, 150, 200);
}
//-----------------------------------------------------------------------------------------Load Lettuce
void lettuce()
{
  image(let, 625, 350, 150, 200);
}
//-----------------------------------------------------------------------------------------Load Cat Food
void catFood()
{
  image(cat, 625, 350, 150, 200);
}
//-----------------------------------------------------------------------------------------Reset Button
int resetButton(int food_var)
{
  stroke(0);
  noFill();
  ellipse(600, 300, 180, 50);
  fill(0);
  textFont(font, 25);
  text("Cycle Food", 540, 310);
  
  if((mouseX >= 510 && mouseX <= 690) && (mouseY >= 275 && mouseY <= 325))
  {
    if(mousePressed == true && mouseButton == LEFT)
    {
      food_var = int(random(4));
    }
  }
  
  return(food_var);
}
  

