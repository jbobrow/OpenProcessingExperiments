
Car[][] myCar = new Car[10][6];
Man myMan = new Man();
boolean start_game = false;
PFont font;

//startscreen background
PImage start_background;

//power up variables
int nitro_amount = 100;
int slow_amount = 100;
float old_speed = 0;
boolean engage_nitro = false;
boolean engage_slow = false;


void setup()
{
  smooth();
  size(1000,480);
  font = loadFont("Aharoni-Bold-48.vlw");
  textFont(font);
  rectMode(CENTER);
  myMan = new Man();
  
  start_background = loadImage("JayWalkerBackground1.png");
  imageMode(CENTER);
  
}

void draw()
{
  if(start_game == true)
  {
  background(255);
  
  //randomly make cars
  if(int(random(-5,100)) < 0)
  makeCar();
  
  //remove cars that have run off
  removeCar();
  
  for(int i=1;i<9;i++)
    for(int x=1;x<5;x++)
    {
      if(myCar[i][x] != null)
      {
        myCar[i][x].display();
        myCar[i][x].drive();
        myCar[i][x].steering();
      }
    }
    
  myMan.display();
  myMan.drive();
  myMan.collision_detection();
  
  //all the other shit, static display
  nitroBar();
  slowBar();
  }
  
  else startScreen();
}

void keyPressed() //ENGAGE POWER UPS AND SHIT
{
  if(keyCode == SHIFT)
  {
  myMan.speed = 3;
  engage_nitro = true;
  }
  
  if(key == 't')
  {
    
    for(int i=1;i<10;i++)
      for(int x=1;x<5;x++)
      if(myCar[i][x] != null)
      {
      myCar[i][x].speed *= 0.3; //cars seem to be stopping???
      }
      
    engage_slow = true;
  }
}

void startScreen()
{
  background(255);
//  
//  textSize(50);
//  fill(0);
//  text("Jay Walker", width/2-150, height/2);
  textSize(30);
  fill(0,0,160,200);
  text("Press Any Key To Begin",width/2-170, height-50);
  textSize(20);
  text("Arrow keys to move, T to use slow-time, SHIFT to engage nitro", 200,height-20);
  noFill();
  
  //let's try the actual game start screen
  image(start_background, width/2,height/2);
  
  if(keyPressed)
  start_game = true;
}

void nitroBar()
{
  textSize(15);
  fill(0);
  text("Nitro", 60,height - 60);
  fill(255);
  rect(80, height-40,100,20);
  fill(0,0,200,100);
  rect(80,height-40,nitro_amount,20);
  noFill();
  if(engage_nitro == true)
  nitro_amount--;
  if(nitro_amount == 0 && engage_nitro == true) //prevent unnecessary execution
  {
  engage_nitro = false;
  myMan.speed = 1;
  }
}

void slowBar()
{
  textSize(15);
  fill(0);
  text("Adrenaline",180,height-60);
  fill(255);
  rect(220, height-40,100,20);
  fill(0,200,0,100);
  rect(220,height-40,slow_amount,20);
  noFill();
  if(engage_slow == true)
  slow_amount--;
  if(slow_amount == 0 && engage_slow == true) //prevent unnecessary execution
  {
  engage_slow = false;
  for(int i=1;i<10;i++)
      for(int x=1;x<5;x++)
      if(myCar[i][x] != null)
      {
      myCar[i][x].speed = myCar[i][x].old_speed; //cars seem to be stopping???
      }
  }
  
}
  
void makeCar()
{
     int lane = int(random(1,10)); //it'll be 1 to 9
     int count_empty = 0;
     boolean proximity_alert = false;
     
     for(int i=1;i<5;i++)     //first see if all are null, in which case make one!
     {
       if(myCar[lane][i] == null)
       count_empty++;
       
       if(count_empty == 4) //all are empty!
       {
         for(int x=1;x<4;x++) //loop through until find a free one.
         {
           if(myCar[lane][x] == null) //free!
           {
             myCar[lane][x] = new Car();
             myCar[lane][x].xpos = lane * 100;
             myCar[lane][x].car_number = x;
             myCar[lane][x].lane_number = lane;
             break;
           }
         }
         count_empty = 0;
       }
     }
     
     //are any of the other cars at that position?
     for(int i=1;i<5;i++)
     {
       if(myCar[lane][i] != null && myCar[lane][i].ypos < 100) //ie, if there is a car, and the car is at the top of the screen
       {
       proximity_alert = true;
       break;
       }
     }
     
     //if not, go through until find a free one.
     for(int i=1;i<5;i++)
     {
       if(myCar[lane][i] == null && proximity_alert == false)
       {
          myCar[lane][i] = new Car();
          myCar[lane][i].xpos = lane * 100;
          myCar[lane][i].car_number = i;
          myCar[lane][i].lane_number = lane;
          break;
       }
     }
     
     proximity_alert = false;
     
   
}

void removeCar()
{
  for(int i=1; i<10;i++)
    for(int x=1;x<5;x++)
    {
      if(myCar[i][x] != null && myCar[i][x].ypos > (height))
      myCar[i][x] = null;
    }
}
      
  

class Car
{
  float xpos;
  float ypos;
  float speed;
  float old_speed;
  int lane_number;
  int car_number;
  int count_animation;
  int free_slot;
  
  Car()
  {
    xpos = 0;
    ypos = 0;
    speed = int(random(1,4));
    old_speed = speed;
    count_animation = 0;
    free_slot = 0; //for the return function of checkRight
  }
  
  void display()
  {
    rect(xpos,ypos,40,40);
    fill(0);
    text(car_number, xpos, ypos);
    text(lane_number,xpos,ypos-20);
    noFill();
  }
  
  void drive()
  {
    ypos+=speed;
  }
  
  void steering()
  {
    for(int x=1;x<5;x++)
    {
      if(myCar[lane_number][x] != null) //wont look at itself
      {
        if(ypos - myCar[lane_number][x].ypos < 0 && ypos - myCar[lane_number][x].ypos > -100) //it checks if its within a distance. if it is, then THIS car is CATCHING UP AND SHOULD CHANGE
        {
          println("Lane " + lane_number + "Car " + car_number + "is going to collide with Car " + x);
          //space in left lane?
          free_slot = checkRight(x);
          if(free_slot > 0 && count_animation == 0) //we need to move it into next lane and change array, otherwise it'll mess up collision detection. put if count = 0 so saves check time
          {
            
            count_animation++;
            xpos++;
          }
          if(count_animation != 0)
          {
            count_animation++;
            xpos++;
          }
          if(count_animation > 100)
          {
            count_animation = 0;
            {
              myCar[lane_number+1][free_slot] = new Car(); //the free slot we found earlier will be used
              myCar[lane_number+1][free_slot].speed = speed;
              myCar[lane_number+1][free_slot].ypos = ypos;
              myCar[lane_number+1][free_slot].xpos = xpos;
              myCar[lane_number+1][free_slot].lane_number = lane_number+1;
              myCar[lane_number+1][free_slot].car_number = x;
              myCar[lane_number][car_number] = null;
              break;
            }
          }
        }  
      }
    }
  }
  
  int checkRight(int car_colliding_with)
  {
    boolean proximity_warning = false;
    
    for(int i=1;i<5;i++)
      if(myCar[lane_number+1][i] == null) //check that a free slot exists DONT FORGET TO BREAK
      {
        for(int x=1;x<5;x++)
        if(myCar[lane_number + 1][x] != null && (myCar[lane_number+1][x].ypos - ypos < 100 || myCar[lane_number+1][x].ypos - ypos > -100))
        { 
        proximity_warning = true;
        break;
        }
        
        if(proximity_warning == false) //we are free to move the car to the left
        {
          return i;
//          {
//          myCar[lane_number+1][i] = new Car(); //the free slot we found earlier will be used
//          myCar[lane_number+1][i].speed = speed;
//          myCar[lane_number+1][i].ypos = ypos;
//          //myCar[lane_number+1][i].xpos = xpos + 100;
//          myCar[lane_number+1][i].lane_number = lane_number+1;
//          myCar[lane_number+1][i].car_number = i;
//          myCar[lane_number][car_number] = null;
//          break;
//          }
        }
        else if(proximity_warning == true)
        {
        speed = myCar[lane_number][car_colliding_with].speed;
        }
       
        
      }
      return 0;
  }
}

class Man
{
  int xpos;
  int ypos;
  int speed; //we'll need this for nitro yo
  
  Man()
  {
    xpos = 5;
    ypos = 240;
    speed = 1;
    engage_nitro = false;
  }
  
  void display()
  {
    fill(0);
    ellipse(xpos, ypos,10,10);
    noFill();
  }
  
  void drive()
  {
    if(keyPressed)
      if(keyCode == RIGHT)
      xpos += speed;
      if(keyCode == LEFT)
      xpos -= speed;
      if(keyCode == UP)
      ypos -= speed;
      if(keyCode == DOWN)
      ypos += speed;
      
  }
  
  void collision_detection()
  {
    for(int i=1;i<10;i++)
      for(int x=1; x<5;x++)
        if(myCar[i][x] != null && dist(myCar[i][x].xpos, myCar[i][x].ypos, xpos, ypos) < 38)
        {
          fill(255,0,0);
          text("DEAD", xpos,ypos);
          noFill();
          //myMan = new Man();
        }
  }
  
}
    

