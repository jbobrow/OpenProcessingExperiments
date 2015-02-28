
class Soul
{
  PVector place;
  PVector velocity;
  PVector acceleration;
  PVector trgtloc;
  PVector mouse;
  color clr;
  PImage img;
  
  Soul(PImage img)
  {
    place=new PVector(random(width), random(height));
    trgtloc=new PVector(random(width), random(height));
    velocity=new PVector(random(3), random(3));
    acceleration= PVector.sub(trgtloc, place);
    mouse=new PVector(mouseX, mouseY);
    clr=color(random(255), 0, 0);
    this.img=img;
    //mumo=loadImage("mump.png");
  }
  
  void update()
  {
    
    if(sqrt(((mouseX-place.x)*(mouseX-place.x)+(mouseY-place.y)*(mouseY-place.y)))>60)
    {
      acceleration= PVector.sub(trgtloc, place);
      acceleration.normalize();
    }
    else
    {
      mouse=new PVector(mouseX, mouseY);
      acceleration=PVector.sub(place, mouse);
      acceleration.normalize();
      
    }
    velocity.add(acceleration);
    velocity.limit(2);
    place.add(velocity);
    if(sqrt(((place.x-trgtloc.x)*(place.x-trgtloc.x) + (place.y-trgtloc.y)*(place.y-trgtloc.y)))<12)
    {
      trgtloc=new PVector(random(width), random(height));
    }
  }
  
  void draw()
  {
    clr=pozadie.get((int) place.x, (int) place.y);
    fill(clr);
    rect(place.x, place.y, 1, 1);
    //image(img, place.x, place.y);
    //ellipse(place.x, place.y, 5, 5);
  }
  
}
////////////////////////////////////////////////////////
class Mumu
{
  PVector place;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  color clr;
  PImage img;
  
  Mumu(PImage img)
  {
    place=new PVector(random(width), random(height));
    velocity=new PVector(random(3), random(3));
    mouse=new PVector(mouseX, mouseY);
    clr=color(random(255), random(255), random(255));
    this.img=img;
    //mumo=loadImage("mump.png");
  }
  
  void update()
  {
    mouse=new PVector(mouseX, mouseY);
    acceleration=PVector.sub(mouse, place);
    acceleration.normalize();
      
    
    velocity.add(acceleration);
    velocity.limit(3);
    place.add(velocity);
  }
  
  void draw()
  {
    //fill(clr);
    //rect(place.x, place.y, 5, 5);
    image(img, place.x, place.y);
  }
  
}
///////////////////////////////////////////////////////


Soul[] soul;
PImage mumo;
PImage kote;
Mumu kotatkejc;
PImage pozadie;

void setup()
{
  size(800, 600);
  background(0);
  smooth();
  frameRate(30);
  soul=new Soul[4000];
  mumo=loadImage("mump.png");
  kote=loadImage("mumo.png");
  pozadie=loadImage("pozadie.png");
  for(int i=0; i<soul.length; i++)
  {
    soul[i]= new Soul(mumo);
  }
  kotatkejc=new Mumu(kote);
  noStroke();
  rectMode(CENTER);
  
}

void draw()
{
  fill(0, 3);
  rect(width/2, height/2, width, height);
  
  
  //background(0);
  for(int i=0; i<soul.length; i++)
  {
    soul[i].update();
    soul[i].draw();
  }
  kotatkejc.update();
  kotatkejc.draw();
  /*
  for(int i=0; i<4500;i++)
  {
    float x=random(width);
    float y=random(height);
    if(sqrt((x-mouseX)*(x-mouseX)+(y-mouseY)*(y-mouseY))>70)
    {
      fill(random(23));
      rect(x, y, 20, 20);
      //ellipse(x, y, 20, 20);
    }
  }
  */
}

void mousePressed()
{
  save("obrazok"+ day() + month()+ hour() + minute() + second() +".png");
}


