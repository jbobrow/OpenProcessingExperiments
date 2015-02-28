
SpriteObject soccer;

float easing = 0.037;
float easing1 = 0.1;
float x = 250;
float y = 100;
float q = 200;
float w = 450;
float h = 250;
float j = 450;
float kick = 0;
float start = 0;
float endlessTimer =0;
float wL = 0;
int save = 0;
int goal = 0;
PImage field;
PImage ronaldo;
PImage goalie;
PImage goalieL;
PImage goalieR;
PImage win;
PImage lose;
boolean up, down, left, right;


void setup()
{
  size(500, 500);

  soccer = new SpriteObject("soccer.png");
  field = loadImage("field.png");
  goalie = loadImage("goalie.png");
  goalieL = loadImage("goalieL.png");
  goalieR = loadImage("goalieR.png");
  ronaldo = loadImage("ronaldo.png");
  win = loadImage("win.jpg");
  lose = loadImage("lose.jpg");
  soccer.y = 450;
  soccer.x = 250;
  soccer.directionY = -1;
  soccer.speed = random(10, 15);
  textSize(25);
}

void draw()
{
  imageMode(CENTER);
  image(field, 250, 250, width, height);
  println(endlessTimer);
  println(goal);
  println("x: " + mouseX + " y: " + mouseY);
  println(soccer.speed);
  println(h);

  text("Saves: " + (int)(save/90), 0, 30);
  text("Goals: " + (int)(goal/82), 400, 30);
  
  checkMovement();

  if ((int)(save/90) == 5)
  {
    wL =1;
    imageMode(CORNER);
    image(lose, -200, 0, 751, height);
  }

  if ((int)(goal/82) == 5)
  {
    wL =1;
    imageMode(CORNER);
    image(win, -100, 0, 713, height);
  }
  if (start == 0)
  {
    noFill();
    stroke(0);
    strokeWeight(3);
    ellipse(h, j, 30, 30);
  }
  if (kick == 0 && wL == 0)
  {
    image(ronaldo, q, w);
    image(goalie, x, y);
  }
  if (keyPressed)
  {
    if (key == ' ')
    {
      start = 1;
      if (h > 250)
      {
      soccer.directionX = random(0, 0.7);
      }
      if(h < 250)
      {
        soccer.directionX = random(-0.7, 0);
      }
    }
  }

  if (start == 1 && wL == 0)
  {
    kick = 1;
    endlessTimer++;

    float directionQ = 1;
    float directionW = 1;
    float speed1 = 5;
    q += directionQ * speed1;
    w += directionW * speed1;
    float targetQ = 225;
    float dq = targetQ - q;
    if (abs(dq) > 1) 
    {
      q += dq * easing1;
    }
    float targetW = 350;
    float dw = targetW - w;
    if (abs(dw) > 1) {
      w += dw * easing1;
    }
    image(ronaldo, q, w);


    if (endlessTimer > 125)
    {
      x=250;
      y=100;
      q = 200;
      w = 450;
      h = 250;
      j = 450;
      endlessTimer=0;
      soccer.x =0.0;
      soccer.y=0.0;
      soccer.directionY =0;
      soccer.directionX =0;
      kick = 0;
      start = 0;
      setup();
    }
  }

  if (wL == 0)
  {
    soccer.render();
  }
  if (kick == 1 && wL == 0)
  {
    soccer.update();
    float targetX = soccer.x;
    float dx = targetX - x;
    if (abs(dx) > 1) 
    {
      x += dx * easing;
    }
    if (soccer.directionX > -0.2 && soccer.directionX < 0.2)
    {
      image(goalie, x, 100);
      if (soccer.y < 145)
      {
        soccer.speed =0;
        soccer.rotation =0;
        save++;
      }
    }
    if (soccer.directionX < -0.2)
    {
      image(goalieL, x, 100);
      if (soccer.y < 120 && soccer.y >110 && (soccer.x+25)>(x-25))
      {
        soccer.speed =0;
        soccer.rotation =0;
        save++;
      }
    }
    if (soccer.directionX > 0.2)
    {
      image(goalieR, x, 100);
      if (soccer.y < 120 && soccer.y >110 && (soccer.x-25)<(x+25))
      {
        soccer.speed =0;
        soccer.rotation =0;
        save++;
      }
    }
  }
}

void keyPressed()
{
  if (key == 'w')
  {
    up = true;
  }

  if (key == 's')
  {
    down = true;
  }

  if (key == 'a')
  {
    left = true;
  }

  if (key == 'd')
  {
    right = true;
  }
}

  void keyReleased()
  {
    if (key == 'w')
    {
      up = false;
    }

    if (key == 's')
    {
      down = false;
    }

    if (key == 'a')
    {
      left = false;
    }

    if (key == 'd')
    {
      right = false;
    }
  }
  void checkMovement()
  {
    if (up && right)
    {
      h +=7;
      j -=5;
    }

    else if (up && left)
    {
      h -=3;
      j -=5;
    }

    else if (down && right)
    {
      h +=7;
      j +=5;
    }

    else if (down && left)
    {
      h -=3;
      j +=5;
    }

    else if (up)
    {
      j -=5;
    }

    else if (down)
    {
      j +=5;
    }

    else if (left)
    {
      h -=3;
    }

    else if (right)
    {
      h +=7;
    }
  }
  class SpriteObject
  {
    float x = 0.0;
    float y = 0.0;
    float directionX;
    float directionY;
    float speed;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1.0;
    PImage img;
    boolean loaded = false;

    SpriteObject(String filename)
    {
      this.img = requestImage(filename);
    }

    void update()
    {
      // If hitting Right goal post
      if (this.x > 425 && this.x < 433 && this.directionX > 0 && this.y < 116   - (this.h * this.s * 0.5) && this.y > 54 + (this.h * this.s * 0.5))
      {
        this.x = 429 - (this.w * this.s * 0.5);
        this.directionX = -this.directionX;
      }
      if (this.x >= 433 && this.x < 470 && this.directionX > 0 && this.y < 116 - (this.h * this.s * 0.5) && this.y > 54 + (this.h * this.s * 0.5))
      {
        this.x = 455 - (this.w * this.s * 0.5);
        this.directionY = -this.directionY;
        save = save+90;
      }

      // Left
      if (this.x < 75 && this.x > 68 && this.directionX < 0 && this.y < 116   - (this.h * this.s * 0.5) && this.y > 54 + (this.h * this.s * 0.5))
      {
        this.x = 71 - (this.w * this.s * 0.5);
        this.directionX = -this.directionX;
      }
      if (this.x <= 75 && this.x > 30 && this.directionX < 0 && this.y < 116 - (this.h * this.s * 0.5) && this.y > 54 + (this.h * this.s * 0.5))
      {
        this.x = 55 - (this.w * this.s * 0.5);
        this.directionY = -this.directionY;
        save = save+90;
      }

      // If hitting Right
      if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
      {
        this.x = width - (this.w * this.s * 0.5);
        this.directionX = -this.directionX;
        this.speed -=9;
      }

      // Left
      if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
      {
        this.x = (this.w * this.s * 0.5);
        this.directionX = -this.directionX;
        this.speed -=9;
      }

      // Bottom
      if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
      {
        this.y = height - (this.h * this.s * 0.5);
        this.directionY = -this.directionY;
      }

      // Net
      if (this.y < 57 + (this.h * this.s * 0.5) && this.directionY <= 0  && (this.x-25)>30 && (this.x+25)<470 && this.y > 50)
      {
        speed = 0;
        goal++;
      }

      // Move the sprite
      this.y += directionY * speed;
      this.x += directionX * speed;

      if (kick == 1)
      {
        if (directionX < 0)
        {
          this.rotation +=10;
        }
        if (directionX > 0)
        {
          this.rotation -=10;
        }
      }
    }

    void render()
    {
      if (this.img.width > 0 && loaded == false)
      {
        loaded = true;
        if (this.w == -1.0)
        {
          this.w = width/15;
        }
        if (this.h == -1.0)
        {
          this.h = height/15;
        }
      }

      if (loaded)
      {
        imageMode(CENTER);
        pushMatrix();
        translate(this.x, this.y);
        rotate(radians(this.rotation));
        scale(this.s);
        image(this.img, 0, 0, this.w, this.h);
        popMatrix();
      }
    }
  }



