
/* @pjs preload="crawler.jpg, critter.jpg, web.png, owlmage.jpg"; */
//a mix of the inclass and examples from the book
float radius=15.0;
float speedX=1.0;
float speedY=0.4;
int directionX=1;
int directionY=-1;
float timer=0.0;
PImage web;

class Crawler
{
  float x=50.0;
  float y=50.0;
  float radius=15.0;
  float speedX=1.0;
  float speedY=0.4;
  PImage img2;
  Crawler()
    {
      this.img2= requestImage("crawler.jpg");
    }
  void draw()
  {
  image(img2,x,y,radius,radius);
  
  x+=speedX*directionX;
  if ((x>width-radius)||(x<radius))
    {
      directionX=-directionX;
    }
    
  y+= speedY * directionY;
  if ((y>height-radius)||(y<radius))
     {
       directionY=-directionY;
     }
  }
}


class Critter
{
  float x=300;
  float y=300;
  float speed=3;
  PVector position= new PVector(100,100);
  PImage img3;
  Critter()
    {
      this.img3=requestImage("critter.jpg");
    }
  void update()
    {
      float toX= x-this.position.x;
      float toY= y-this.position.y;
      if (dist(x,y,this.position.x,this.position.y)<200)
        {
          this.speed=4;
        }
      PVector direction= new PVector(toX,toY);
      direction.normalize();
      this.position.x += direction.x*this.speed;
      this.position.y += direction.y*this.speed;
    }
  void draw()
    {
      this.x+= this.speed;
      if (this.x > width-(this.img3.width/2) || this.x < (this.img3.width/2))
        {
          this.speed=-this.speed;
        }
      if (this.img3.width > 0)
        {
          pushMatrix();
            translate(this.x,this.y);
            if( this.speed > 0)
              {
                scale(-1,1);
              }
            imageMode(CENTER);
            image(this.img3,0,0);
            imageMode(CORNER);
          popMatrix();
        }
      if (timer>10.0)
        {
          new Critter();
        }
    }
}

class Predator
{
  float x= 100;
  float y= 100;
  float size=70.0;
  float speed=2;
  PVector position= new PVector(300,300);
  PImage img;
  Predator()
  {
    this.img=requestImage("owlmage.jpg");
  }
  
  
  void draw(float tx, float ty)
  {
    float toX= tx-this.position.x;
    float toY= ty-this.position.y;

    PVector direction= new PVector(toX,toY);
    direction.normalize();
    this.position.x += direction.x*this.speed;
    this.position.y += direction.y*this.speed;
 
    image(img,this.position.x,this.position.y, this.size, this.size); 

  }
}


Critter mycritter= new Critter();
Crawler mycrawler= new Crawler();
Predator mypredator = new Predator();


void setup()
{
  size(500,500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);
  mypredator.position.y=0;
  web = requestImage("web.png");
}

void draw()
{
  timer=timer+(1.0/30.0);
  fill(0,12);
  rect(0,0,width,height);
  fill(255);
 image(web,0,0,width,height);
  
  //here's the issue...
  float distanceToCritter= dist(mycritter.x,mycritter.y,mypredator.x,mypredator.y);
  float distanceToCrawler= dist(mycrawler.x,mycrawler.y,mypredator.x,mypredator.y);
  
  if (distanceToCritter < distanceToCrawler)
    {
       mypredator.draw(mycritter.x, mycritter.y);
    }
   else
     {
       mypredator.draw(mycrawler.x, mycrawler.y);
     }

  mycritter.draw();
  
  mycrawler.draw();


     
}


