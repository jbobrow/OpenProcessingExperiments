
Car car;
Tile[] tiles =  new Tile[0];

// Build Map Array
int[][] mymap = {

  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
  { 1, 1, 0, 1, 1, 1, 0, 0, 0, 1 },
  { 1, 0, 0, 1, 0, 1, 0, 1, 0, 1 },
  { 1, 0, 1, 1, 0, 1, 1, 1, 0, 1 },
  { 1, 0, 1, 0, 0, 0, 1, 0, 0, 1 },
  { 1, 0, 1, 0, 1, 0, 1, 0, 1, 1 },
  { 1, 0, 1, 1, 1, 0, 1, 0, 0, 1 },
  { 1, 0, 0, 0, 0, 0, 1, 1, 0, 1 },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }

};

// Tile size
int tileW = 32;
int tileH = 32;

void setup()
{
  size(320, 320);
  smooth();

  // Create grid
  for (int i = 0; i <= 9; i++)
  {
    for (int j = 0; j <= 9; j++)
    {
      Tile a = new Tile(j*tileW, i*tileH, tileW, tileH, mymap[i][j]);
      tiles = (Tile[]) append(tiles, a);
    } 
  }

  // Create car object
  car = new Car(32, 32, 32, 32, color(255, 255, 255), 32);
}

void draw()
{
  // Set background
  background(255);

  // Create grid
  for(int i = 0; i < tiles.length; i++)
  {
    tiles[i].display();
  }

  // Display car
  car.display(); 

}

void keyPressed()
{

  if(keyCode == UP)    { 
    car.move("up"); 
  }
  if(keyCode == DOWN)  { 
    car.move("down"); 
  } 
  if(keyCode == LEFT)  { 
    car.move("left"); 
  } 
  if(keyCode == RIGHT) { 
    car.move("right"); 
  }
}

class Car
{
  float x, y, w, h;
  color c;
  float s;

  Car(float tempX, float tempY, float tempW, float tempH, color tempColor, float tempSpeed)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempColor;
    s = tempSpeed;
  }

  void display()
  {
    fill(c);
    noStroke();
    ellipseMode(CORNER);
    ellipse(x, y, w, h); 
  }

  void move(String direction)
  {
    if(keyPressed) 
    {
      // Directions
      if(direction == "up")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i-10].v == 0.0)
            {
              car.y = car.y - s;
              break;
            }
          }
        }
      }
      if(direction == "down")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i + 10].v == 0.0)
            {
              car.y = car.y + s;
              break;
            }
          }
        }
      }
      if(direction == "left")
      {

        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i-1].v == 0.0)
            {
              car.x = car.x - s;
              break;
            }
          }
        }
      }
      if(direction == "right")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i+1].v == 0.0)
            {
              car.x = car.x + s;
              break;
            }
          }
        }
      }
    }
  }
}


class Tile
{
  float x, y, w, h, v;

  Tile(float tempX, float tempY, float tempW, float tempH, int tempValue)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    v = tempValue;
  }

  void display()
  {
    noStroke();
    if(v == 0)
    {
      fill(100);
    }
    if(v == 1)
    {
      fill(0, 255, 0); 
    }
    rectMode(CORNER);
    rect(x, y, w, h); 
  }
}


