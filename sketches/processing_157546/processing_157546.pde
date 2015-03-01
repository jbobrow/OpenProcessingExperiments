
ArrayList<Customers> cust_dest;
ArrayList<Base> objects; 
MainMenu menu;
Score score;
Taxi taxi;
PoliceHelicopter police1;
PoliceHelicopter police2;
PoliceHelicopter police3;
Cars car1;
Cars car2;
Cars car3;
Cars car4;
Cars car5;
Cars car6;
Cars car7;
Cars car8;
Customers customer; 
Destination dest;
Buildings topLeft;
Buildings topRight;
Buildings bottomLeft;
Buildings bottomRight;
Header header;
Fuel fuel;
ReFuel rFuel;
int SIZE = 45;
Clouds clouds[] = new Clouds[SIZE];

void setup()
{
  size (1000, 650);
  background(180);

  //Menu
  menu = new MainMenu();
  for (int i = 0; i < SIZE; i ++)
  {
    clouds[i] = new Clouds();
  }
  
  //Customer / Destination
  cust_dest = new ArrayList<Customers>();
  customer = new Customers();
  dest = new Destination();
  cust_dest.add(customer);
  
  //Game Objects
  objects = new ArrayList<Base>();
  taxi = new Taxi();
  car1 = new Cars(260, 580, 445, 580, 445, 385, 70, 385, 71, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car2 = new Cars(261, 350, 445, 350, 445, 155, 70, 155, 71, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car3 = new Cars(661, 350, 555, 350, 555, 149, 931, 150, 931, 350, 25, random(0, 255), random(0, 255), random(0, 255));
  car4 = new Cars(661, 580, 555, 580, 555, 385, 931, 385, 931, 580, 20, random(0, 255), random(0, 255), random(0, 255));
  car5 = new Cars(445, 385, 70, 385, 71, 580, 260, 580, 445, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car6 = new Cars(445, 155, 70, 155, 71, 350, 261, 350, 445, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car7 = new Cars(555, 149, 931, 150, 931, 350, 661, 350, 555, 350, 25, random(0, 255), random(0, 255), random(0, 255)); 
  car8 = new Cars(555, 385, 931, 385, 931, 580, 661, 580, 555, 580, 20, random(0, 255), random(0, 255), random(0, 255)); 
  topLeft = new Buildings(width/4 + 5, height/4 + 70);
  bottomRight = new Buildings(width - width/4 - 15, height - height/4 - 30);   
  bottomLeft = new Buildings(width/4 + 5, height - height/4 - 30);
  topRight = new Buildings(width - width/4 - 15, height/4 + 70);
  fuel = new Fuel();
  rFuel = new ReFuel();
  police1 = new PoliceHelicopter(40, 960);
  police2 = new PoliceHelicopter(960, 620);
  police3 = new PoliceHelicopter(40, 620);
  
  objects.add(topLeft);
  objects.add(bottomRight);
  objects.add(bottomLeft);
  objects.add(topRight); 
  objects.add(taxi);
  objects.add(car1);
  objects.add(car2);
  objects.add(car3);
  objects.add(car4);
  objects.add(car5);
  objects.add(car6);
  objects.add(car7);
  objects.add(car8);
  objects.add(fuel);
  objects.add(police1);
  objects.add(police2);
  objects.add(police3);
  
  header = new Header();
  score = new Score();
}

void draw()
{ 
  if (menu.game == false)
  {
    background(#50afe5);
    for (int i = 0; i < SIZE; i ++)
    {
      clouds[i].draw();
      clouds[i].update();
      clouds[i].checkSides();
    }
    menu.logo();
    menu.instruction();
  }
  else if (menu.game == true)
  {
    if (customer.startGame == true)
    {
      customer.randomise();
      customer.startGame = false;
    }
    background(150);
    header.draw();
    
    for (Customers c : cust_dest)
    {
      c.draw();
      c.hitDetection();
      if (c.collected == true)
      {
        if (c.switch_beetween_cust_dest == true)
        {
          dest.randomise();
          cust_dest.add(dest);
        }
        else if (c.switch_beetween_cust_dest == false)
        {
          customer.randomise();
          cust_dest.add(customer);
          score.addScore();
        }
        cust_dest.remove(c);
        c.collected = false;
      }  
    }
    
    for (Base o : objects)
    {
      o.draw();
      o.update();
      o.checkSides();
      o.hitDetection();
      o.reFuel();
    }
    
    if (rFuel.remove == true)
    {
      rFuel.remove = false;
      objects.remove(rFuel);
    }  
    
    if (rFuel.place == false)
    {
      if (fuel.fuel < 85)
      {
        rFuel.place = true;
        if (rFuel.place == true)
        {
          rFuel.randomise();
          objects.add(rFuel);
        }
      }
    }
    score.draw();
  }
  if (taxi.alive == false)
  {
    //Getting error when put in for loop!!
    objects.remove(topLeft);
    objects.remove(bottomRight);
    objects.remove(bottomLeft);
    objects.remove(topRight); 
    objects.remove(taxi);
    objects.remove(car1);
    objects.remove(car2);
    objects.remove(car3);
    objects.remove(car4);
    objects.remove(car5);
    objects.remove(car6);
    objects.remove(car7);
    objects.remove(car8);
    objects.remove(fuel);
    objects.remove(police1);
    objects.remove(police2);
    objects.remove(police3);
    cust_dest.remove(customer);
    cust_dest.remove(dest);
    
    header.expandHeader();
    textSize(40);
    fill(32);
    text("Game Over!\nYou scored: " + score.score, width/2-125, height/2-100);
    text("Press the 'r' key \nto return to opening\nscreen! ", width/2-125, height/2+50);
    if (key == 'r' | key == 'R')
    {
      setup();
    }
  }
}
  
void keyPressed()
{
  //Menu Option
  if (key == 's' | key == 'S') 
  {
    if (menu.game == false)
    {
      menu.game = true;
    }
  }
  
  //Turning
  if (keyCode == LEFT || key == 'a' || key == 'A')
  {
    taxi.left = true;
  }
  if (keyCode == RIGHT || key == 'd' || key == 'D')
  {
    taxi.right = true;
  }
    
  //Speed
  if (keyCode == UP || key == 'w' || key == 'W')
  {
    if (taxi.fast == true)
      {    
        taxi.speed *= 1;
      }
      else
      {
        taxi.speed *= 1.5;
        taxi.fast = true;
      }
    }
    if (keyCode == DOWN || key == 's' || key == 'S')
    {
      if (taxi.fast == false)
      {    
        taxi.speed *= 1;
      }
      else
      {
        taxi.speed = 100;
        taxi.fast = false;
      }
    }
  }
  
  //Stopping Turning
  void keyReleased()
  {
    if (keyCode == LEFT || key == 'a' || key == 'A' )
    {
      taxi.left = false;
    }
    if (keyCode == RIGHT || key == 'd' || key == 'D')
    {
      taxi.right = false;
    }
  }


class Base
{
  PVector position;
  PVector velocity;
  PVector force;
  Boolean hitDetected = false;
  float look;
  float theta;
  float mass;
  float speed = 100;
  float timeDelta = 1.0f / 60.0f;   
  
  void draw()
  {
  }
  
  void reFuel()
  {
  }
  
  void update()
  {
  }
  
  void hitDetection()
  {
  }
  
  void randomise()
  {
    position.x = (random(4, 960));
    position.y = (random(4, 560));
    if (((position.y < 100) || position.x > topLeft.position.x- 168 && position.y < topLeft.position.y +100 && position.x < topLeft.position.x + 168 && position.y > topLeft.position.y - 68) || (position.x > topRight.position.x- 168 && position.y < topRight.position.y +100 && position.x < topRight.position.x + 168 && position.y > topRight.position.y - 68)|| (position.x > bottomRight.position.x- 168 && position.y < bottomRight.position.y +100 && position.x < bottomRight.position.x + 168 && position.y > bottomRight.position.y - 68)||(position.x > bottomLeft.position.x- 168 && position.y < bottomLeft.position.y +100 && position.x < bottomLeft.position.x + 168 && position.y > bottomLeft.position.y - 68))
    {
       randomise(); 
    }     
  }
  
  void checkSides()
  {
    if(position.y > height)
    {
      position.y = 110;
    }
    if(position.y < 110)
    {
      position.y = height;
    }
    if (position.x < 0)
    {
      position.x = width;
    }
    if (position.x > width)
    {
      position.x = 0;
    }
  }
}
class Buildings extends Base
{
  Buildings(int x, int y)
  {
    position = new PVector(x, y);
  }
  
  void draw()
  {
    fill(180);
    strokeWeight(0);
    //footpath
    rect (position.x, position.y + 23, 325, 150);
    stroke(100);
    fill(80);
    rect(position.x - 11, position.y + 16, 300, 130);
    strokeWeight(2);
    stroke(255);
    fill(#e7c687);
    rect(position.x, position.y, 300, 100);
    stroke(0);
    strokeWeight(2);
    fill(#9d8161);
    rect(position.x, position.y + 65, 300, 30);
    strokeWeight(0);
    rect(position.x+1, position.y - 47, 297, 3);
    fill(255);
    rect(position.x, position.y +50, 300, 3);
    stroke(150);
    fill(90);
    rect(position.x + 147, position.y + 1, 6, 96);
    stroke(0);
    fill(100);
    rect(position.x, position.y + 100, 324, 1);
    int x = 145, y = 58;
    for (int i = 0; i < 30; i ++)
    {
      strokeWeight(1);
      fill(255);
      rect(position.x - x, position.y + y, 4, 8);
      rect(position.x - x, position.y + y + 12, 3, 7);
      x -= 10;
    }
  } 
    
  void hitDetection()
  {
    if (taxi.position.x > position.x- 159 && taxi.position.y < position.y +93 && taxi.position.x < position.x + 159 && taxi.position.y > position.y - 59)
    {
      taxi.alive = false;
    }
  }
}
class Cars extends Base
{
  public WayPoints[] points = new WayPoints[5];
  PVector dest;
  int p = 0;
  int x, y;
  float r, g, b;
  float distance;
  
  boolean saveX = false, saveY = false;
  
  Cars(int d0x, int d0y, int d1x, int d1y, int d2x, int d2y, int d3x, int d3y, int d4x, int d4y,int s, float r, float g, float b) 
  {
    this.r = r;
    this.g = g;
    this.b = b;
    rectMode(CENTER);
    velocity = new PVector (0, 0);
    position = new PVector(d0x, d0y);
    theta = 0.0f;
    speed = s;
    points[0] = new WayPoints(d0x, d0y);
    points[1] = new WayPoints(d1x, d1y);
    points[2] = new WayPoints(d2x, d2y);
    points[3] = new WayPoints(d3x, d3y);
    points[4] = new WayPoints(d4x, d4y);
  }
  
  void draw()
  { 
    pushMatrix();
    theta = atan2(velocity.y, velocity.x);
    translate(position.x, position.y);
    rotate(-theta);
    fill(r, g, b);
    rect (0, 0, 30, 15);
    fill (0);
    rect (0 + 8, 0 + 8, 10, 3);
    rect (0 -8, 0 + 8, 10, 3);
    rect (0 -8, 0 - 8, 10, 3);
    rect (0 +8, 0 - 8, 10, 3);
    popMatrix();
  }
  
  void update()
  {
    dest = new PVector(points[p].points.x, points[p].points.y);
    velocity = PVector.sub(dest, position);
    velocity.normalize(); 
    position.add(PVector.mult(velocity, speed * timeDelta));
    
    position.x += velocity.x * timeDelta * speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);

    x = (int)position.x;
    y = (int)position.y;
    
    if (x == points[p].points.x)
    {
      saveX = true;
    }
    if (y == points[p].points.y)
    {
      saveY = true;
    }
    if (saveX == true && saveY == true)
    {
      if (p == 4)
      {
        p = 0;
      }
      else
      {
        p++;
      }
      saveX = false;
      saveY = false;
    } 
  }
  
  void hitDetection()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);
    if (distance < 23)
    {
     taxi.alive = false;
    }
  }
}

class Clouds
{
  PVector position = new PVector(random(width+200), random(height));
  PVector velocity = new PVector(-0.5, 0);
  
  Clouds()
  {
    stroke(255); 
    fill(255);
    ellipse (position.x, position.y, 50, 50);
    ellipse (position.x+20, position.y+10, 50, 50);
    ellipse (position.x, position.y+5, 50, 50);
    ellipse (position.x, position.y, 50, 50);
  }
  
  void draw()
  {
    stroke(255); 
    fill(255);
    ellipse (position.x, position.y, 50, 50);
    ellipse (position.x+20, position.y+10, 50, 50);
    ellipse (position.x-10, position.y+5, 50, 50);
    ellipse (position.x+30, position.y, 50, 50);
    ellipse (position.x-20, position.y+15, 50, 50);
    ellipse (position.x+20, position.y-15, 50, 50);
    ellipse (position.x-20, position.y-15, 50, 50);
    ellipse (position.x-25, position.y-15, 50, 50);
    stroke(0);
  }
  
  void update()
  {
    position.add(velocity);
  }
  
  void checkSides()
  {
    if (position.x < -80)
    {
       position.x = 1000;
    } 
  }
}
class Customers extends Base
{
  boolean collected = false, startGame = true;
  boolean switch_beetween_cust_dest = false;
  
  Customers()
  {
    position = new PVector(random(4, 960), random(4, 560));
  }
  
  void draw()
  {
    fill(255);
    ellipse(position.x+18, position.y-20, 40, 20);
    fill(#da5f1e);
    ellipse(position.x, position.y, 12, 14);
    fill(255);
    ellipse(position.x, position.y, 10, 10);
    fill(#34a6e0);
    rect (position.x, position.y+10, 8, 10);
    rect (position.x, position.y+10, 8, 10);
    rect (position.x+5, position.y+9, 3, 8);
    rect (position.x-5, position.y+4, 3, 8);
    fill(#da5f1e);
    rect (position.x+2, position.y+19, 4, 8);
    rect (position.x-2, position.y+19, 4, 8);
    fill(0);
    text("TAXI!", position.x+5, position.y -15, 30); 
  }
  
  void hitDetection()
  {
    if (taxi.position.x > position.x- 20 && taxi.position.y < position.y +38 && taxi.position.x < position.x + 23 && taxi.position.y > position.y - 21)
    {
      collected = true;
      if (switch_beetween_cust_dest == true)
      {
        switch_beetween_cust_dest = false;
        dest.switch_beetween_cust_dest = false;
      }
      else
      {
        switch_beetween_cust_dest = true;
        dest.switch_beetween_cust_dest = true;
      }
    }
  }  
  
  void menuVersion()
  {
    fill(#da5f1e);
    ellipse(width / 2 + 100, height / 2 + 25, 12, 14);
    fill(255);
    ellipse(width / 2 + 100, height / 2 + 25, 10, 10);
    fill(#34a6e0);
    rect (width / 2 + 100, height / 2 + 35, 8, 10);
    rect (width / 2 + 100, height / 2 + 35, 8, 10);
    rect (width / 2 + 105, height / 2 + 34, 3, 8);
    rect (width / 2 + 95, height / 2 + 29, 3, 8);
    fill(#da5f1e);
    rect (width / 2 + 102, height / 2 + 44, 4, 8);
    rect (width / 2 + 98, height / 2 + 44, 4, 8);
    fill(0); 
  }
}
class Destination extends Customers
{
  Destination()
  {
    position = new PVector(random(4, 960), random(4, 560));
  }
  
  void draw()
  {
    strokeWeight(0);
    fill(#e80e0e);
    ellipse(position.x, position.y, 50, 50);
    strokeWeight(1);
  }
  
  void hitDetection()
  {
    if (taxi.position.x > position.x- 20 && taxi.position.y < position.y +38 && taxi.position.x < position.x + 23 && taxi.position.y > position.y - 21)
    {
      collected = true;
      if (switch_beetween_cust_dest == true)
      {
        switch_beetween_cust_dest = false;
        customer.switch_beetween_cust_dest = false;
      }
      else
      {
        switch_beetween_cust_dest = true;
        customer.switch_beetween_cust_dest = true;
      }
    }
  }
  
  void menuVersion()
  {
    strokeWeight(0);
    fill(#e80e0e);
    ellipse(width/2 + 315, height/2 +90, 50, 50);
    strokeWeight(1);
  }
}
class Fuel extends Base
{
  float fuel = 190;
  float counter = 0;
  String s = "Fuel";
  float r = 0, g = 255, b = 0;
  boolean rf = false;
  
  Fuel()
  {
    position = new PVector (width/2 + 360, 65);
  }
  
  void draw()
  {
    fill(255);
    textSize(18);
    text (s, width / 2 + 340, 35);
    fill(r, g, b);
    rect(position.x, 65, fuel, 30);
    counter++;
    if (counter == 10)
    {
      r += 2;
      g -=1;
      fuel--;
      counter = 0;
    }
    if (fuel == 0)
    {
      taxi.alive = false;
    }
  }
 
}
class Header
{
  String header = "Taxi Run!";
  int x = 0, y = 50;
  
  void draw()
  {
    fill(#50afe5);
    strokeWeight(2);
    rect(500, y, y + 950, y + 50);
    strokeWeight(1);
    
    textSize(50);
    fill(255);
    text(header, 400, 65);
    textSize(10);
  }
  
  void expandHeader()
  {
    y += 4;
    if (y > 320)
    {
      y = 320;
    }
  }
}
class MainMenu
{ 
  Taxi t = new Taxi();
  Customers c = new Customers();
  Destination d = new Destination();
  ReFuel f = new ReFuel();
  
  boolean game = false;

  void logo()
  {
    fill(20);
    fill(40);
    textSize(66);
    text("Taxi Run", width/2 - 135, 170);
    textSize(15);
    text("Copyright Gary Healy 2014", width - 235, height - 15);
  }
  
  void instruction()
  {
    textSize(21);
    fill(0);
    text("Use the Direction pad or A, W, S, D to move", width/2 - 200, height/2 - 100);
    text("Tap up once to go fast and down once to go slow", width/2 - 200, height/2 - 50);
    text("You are the taxi => ", width/2 - 200, height/2);
    t.menuVersion();
    fill(0);
    text("Collect the customer => ", width/2 - 200, height/2 + 50); 
    c.menuVersion();
    text("Drop the Customer at the Destination => ", width/2 - 200, height/2 + 100); 
    d.menuVersion();
    fill(0);
    text("Collect this to Re-Fuel => ", width/2 - 200, height/2 + 150);
    f.menuVersion();
    fill(0);
    text("Dont crash into the cars or buildings,", width/2 - 200, height/2 + 200);
    text("And avoid the police helicopters!", width/2 - 200, height/2 + 220);
    text("Press \"s\" to start the game...  ", width/2 - 200, height/2 + 270);
  }
  
}
class PoliceHelicopter extends Base
{
  PVector dest;
  Boolean arrived = false, saveX = false, saveY = false;
  float v = 10, angle = 0, distance;
  int x, y, dest_x, dest_y;
  
  PoliceHelicopter(int a, int b)
  {
    rectMode(CENTER);
    position = new PVector (a, b);
    velocity = new PVector (0, 0);
    theta = 0.0f;
    speed = 30;
  }
  
  void draw()
  {
    pushMatrix();
    theta = atan2(velocity.y, velocity.x);
    translate(position.x, position.y);
    rotate(theta);
    fill(100);
    fill(#264ba0);
    rect(0 - 40, 0 + 5, 5, 5);
    fill(#FF0000);
    rect(0 - 40, 0 - 5, 5, 5);
    fill(255);
    rect(0 - 25, 0, 43, 5);
    fill(#264ba0);
    ellipse(0, 0, 45, 25);
    fill(220);
    rotate(angle);
    rectMode(CENTER);
    line(-50, 0,+50, 0);
    line(0, -50, 0, +50);
    popMatrix();
    
    angle += v;
  }
  
  void update()
  {
   if (arrived == false)
   {
     dest = new PVector (random(40, 960), random(120, 620));
     arrived = true;
   }
   dest_x = (int)dest.x;
   dest_y = (int)dest.y;
   velocity = PVector.sub(dest, position);
   velocity.normalize(); 
   position.add(PVector.mult(velocity, speed * timeDelta));
    
   position.x += velocity.x * timeDelta * speed;
   position.y += velocity.y * timeDelta * speed;
   velocity.limit(1.5);
   
   x = (int)position.x;
   y = (int)position.y;
   
   if (x == dest_x)
   { 
     saveX = true;
   } 
   if (y == dest_y)
   {
     saveY = true;
   }
   if (saveX == true && saveY == true)
   {
     arrived = false;
     saveX = false;
     saveY = false;
   }
  }
  
  void hitDetection()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);
    if (distance < 29)
    {
      taxi.alive = false;
    }
  }
}
class ReFuel extends Base
{
  String s = "F";
  boolean place = false, remove = false;
  float distance;
  
  ReFuel()
  {
     position = new PVector(random(4, 994), random(4, 560));
  }
  
  void draw()
  {
    fill(#ff0000);
    ellipse(position.x + 4, position.y - 5, 30, 30);
    fill(255);
    textSize(18);
    text (s, position.x, position.y);
  }
  
  void hitDetection()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);
    if (distance < 24)
    {
      score.subScore();
      fuel.fuel = 190;
      fuel.r = 0;
      fuel.g = 255;
      place = false;
      remove = true;
    }
  }
  
  void menuVersion()
  {
    fill(#ff0000);
    ellipse(width/2 + 130, height/2 + 140, 30, 30);
    fill(255);
    textSize(18);
    text (s, width/2 + 126, height/2 + 145);
  }
}
class Score
{
  String s = "Score: ";
  int score = 0;
  
  
  void draw()
  {
    textSize(32);
    fill(255);
    text (s, 10, 60);
    text(score, 120, 60);
    textSize(10);
  }
  
  void addScore()
  {
    score += 100;
  } 
  
  void subScore()
  {
    score -= 25;
  }

}

class Taxi extends Base
{
  boolean left = false, right = false, fast = false;
  boolean alive = true;
  
  Taxi()
  {
    rectMode(CENTER);
    velocity = new PVector (0, 0);
    position = new PVector (width/2, height - 20);
    theta = 0.0f;
  }
  
  void draw()
  { 
       pushMatrix();
       translate(position.x, position.y);
       rotate(-theta);
       fill(#f8e281);
       rect (0, 0, 30, 15);
       fill (0);
       rect (0 + 8, 0 + 8, 10, 3);
       rect (0 -8, 0 + 8, 10, 3);
       rect (0 -8, 0 - 8, 10, 3);
       rect (0 +8, 0 - 8, 10, 3);
       fill(200);
       rect (0, 0, 3, 10);
       popMatrix();
  }
  
  void update()
  {
    if (left == true)
    {
       theta += 0.04;
    }
    if (right == true)
    {
       theta -= 0.04;
    }
    velocity.x = cos(-theta);
    velocity.y = sin(-theta);
    position.x += velocity.x * timeDelta * speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);
  }
  
  void checkSides()
  {
    if(position.y > height)
    {
      position.y = 110;
    }
    if(position.y < 110)
    {
      position.y = height;
    }
    if (position.x < 0)
    {
      position.x = width;
    }
    if (position.x > width)
    {
      position.x = 0;
    }
  }
  
  void menuVersion()
  {
    fill(#f8e281);
    rect (width/2 + 50, height/2 - 8, 30, 15);
    fill (0);
    rect (width/2 + 58, height/2, 10, 3);
    rect (width/2 +42, height/2, 10, 3);
    rect (width/2 +42, height/2 - 16, 10, 3);
    rect (width/2 +58, height/2 - 16, 10, 3);
    fill(200);     
    rect (width/2 + 50, height/2 - 8, 3, 10);
  }
  
}


class WayPoints
{
  PVector points;
  Boolean Arrived = false;
  
  WayPoints(int x, int y)
  {
    points = new PVector(x, y);
  }
}


