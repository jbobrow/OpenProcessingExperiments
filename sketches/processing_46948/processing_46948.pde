
/* 20th Nov, 2011
Sierpinski Triangle by rolling a dice.
http://math.bu.edu/DYSYS/chaos-game/node1.html#SECTION00010000000000000000
*/

int seed_x=0;
int seed_y=0;
int count_mouse_click=0;
int right_mouse_click=0;
int on_mouse_click=0;
int random_direction=0;
int roll_100=0;
int roll_count=0;
int counter_300Moves=0;
PVector R, G, B, seed, locus;

void setup()
{
  // set canvas
  size(400,400);
  background(200);
  
  // set vertices of a triangle
  fill(255,0,0);
  ellipse(100,300,10,10);
  fill(0,255,0);
  ellipse(300,300,10,10);
  fill(0,0,255);
  ellipse(200,100,10,10);
  
  R = new PVector(100,300);
  G = new PVector(300,300);
  B = new PVector(200,100);
}

void draw()
{
  if(count_mouse_click>1 && on_mouse_click==1 && right_mouse_click>0) //ensure single shot
    {if (roll_100 ==1) //Automatic roll 'n' number of times, roll_100 means 500 dice roll
      {roll_count=0;
      while (roll_count<501) 
        {random_direction=(int(random(1,4)));
        if (random_direction == 1) {seed.add(R);}
        else if  (random_direction == 2) {seed.add(G);}
        else if  (random_direction == 3) {seed.add(B);}
        fill(255,255,255);
        point(seed.x/2,seed.y/2); //new location
        seed = new PVector(seed.x/2,seed.y/2);
        roll_count=roll_count+1;  
        }
     roll_100=0;
     text("Keep clicking and watch", 125, 35);
     text("the developing pattern", 125, 55);
     counter_300Moves = counter_300Moves + 1; //300 means 500 here
     if (counter_300Moves > 15) //Last message
       {
         PFont font;
         font = loadFont("ComicSansMS-15.vlw"); 
         textFont(font); 
         fill(0,0,0);
         text("Random moves generate", 230, 100);
         text("a pattern!!  This one is", 240, 125);
         text("Sierpinski Triangle,", 255, 150);
         text("which is a fractal", 255, 175);
       }
     }
  else
    { //Single roll
    if (random_direction == 1) {seed.add(R);} 
    else if  (random_direction == 2) {seed.add(G);} 
    else if  (random_direction == 3) {seed.add(B);}
    fill(255,255,255);  
    ellipse(seed.x/2,seed.y/2,2,2); //new location
    seed = new PVector(seed.x/2,seed.y/2);
    on_mouse_click=0;  //ensure single shot
    }
  }
  fill(100,100,100); //First message
  rect(0,325,400,100);
  PFont font;
  font = loadFont("ComicSansMS-20.vlw"); 
  textFont(font); 
  fill(0,0,0);
  if (count_mouse_click==0){
    text("Left click anywhere in the window", 35, 365);
    text("to initiate a point", 120, 385);
  }
  fill(200); //Overwite first message after first click
  if (count_mouse_click>0){
    fill(100,100,100);
    rect(0,325,400,100);
  }
  if (count_mouse_click>0){//Second message
    fill(0,0,0);
    text("Right click anywhere in the window", 35, 350);
    text("to randomly move halfway towards one of", 5, 370);
    text("the vertices", 40, 390);
    if (right_mouse_click>15){
      fill(200,200,200);
      text("or click '500 moves'", 160, 390);   
    }
  }  
} // Closing void draw()

// Initial point - seed point
void mousePressed(){
  on_mouse_click=1; //ensure single shot
  println("Mouse Click "+count_mouse_click);
  count_mouse_click = count_mouse_click +1;
  if (count_mouse_click<2)
    {seed_x=mouseX;
    seed_y=mouseY;
    seed = new PVector(seed_x,seed_y);
    fill(255,255,255);
    ellipse(seed.x,seed.y,2,2);
    }
  
// Choose a random direction
  if (mouseButton == RIGHT) {
   random_direction=(int(random(1,4)));
   right_mouse_click = right_mouse_click +1;
  }

  if (right_mouse_click>12){
    text("Do you see", 1, 25);
    text("random dots?", 1, 45);
    text("Continue...", 5, 65);
  }
  if (right_mouse_click>15) // Roll 100 times
    {fill(200);
    stroke(200);
    rect(0,0,130,100);
    stroke(0);
    fill(100,100,100);
    rect(0,0,100,100);
    fill(200,200,200);
    text("500", 15, 45);
    text("moves", 15, 65);
    }
  if (mouseX<100 && mouseY<100 && right_mouse_click >5)
    {roll_100=1;}
} //Closing mousePressed()

