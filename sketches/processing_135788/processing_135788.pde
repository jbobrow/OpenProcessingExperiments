
float buseyX=30;
float buseyY=30;
float pieX=30;
float pieY=50;
float otherpieX=200;
float otherpieY=400;
PImage galaxy;

float easing= 0.10;

Pie mypie = new Pie();
  Otherpie myotherpie = new Otherpie();
  Busey mybusey = new Busey();
  
void setup()
    {
      size(600,600);
      galaxy=requestImage("galaxy.jpeg");
    }

void draw()
    {
      image(galaxy,0,0,width,height);
      mypie.draw();
      myotherpie.draw();
      //this is the part I couldn't figure... I copied the example and altered some parts
      float distanceToPie = dist(mypie.x,mypie.y,mybusey.x,mybusey.y);
      float distanceToOtherpie = dist(myotherpie.x,myotherpie.y,mybusey.x,mybusey.y);
      if (distanceToOtherpie < distanceToPie)
        {
          mybusey.draw(myotherpie.x,myotherpie.y);
        }
      else
        {
          mybusey.draw(mypie.x,mypie.y);
        }
    }
        
    
//the most pursued pie ever...
class Pie
  {
    float size = 50;
    float speed = 5;
    PImage img;
    Pie()
      {
        this.img=requestImage("pie.jpeg");
      }  
    void draw()
      {
        image(img,pieX,pieY,this.size,this.size);
      }
  }

//or... well... close to...
class Otherpie
  {
    float size = 50;
    float speed = 3;
    PImage img;
    Otherpie()
      {
        this.img=requestImage("otherpie.jpeg");
      }
    void draw()
      {
        image(img,otherpieX,otherpieY,this.size,this.size);
      }
  }
  
  
// and now the alpha predator...
class Busey
  {
    float size = 100;
    float speed = 5;
    PImage img;
    Busey()
      {
        this.img=requestImage("busey.png");
      }
    void update()
      {
        float toX = pieX-buseyX;
        float toY = pieY-buseyY;
          if  (dist(pieX,pieY,buseyX,buseyY) < 90)
            {
              buseyX = buseyX+(toX*easing);
              buseyY = buseyY+(toY*easing);
            }
        float theotherX = otherpieX-buseyX;
        float theotherY = otherpieY-buseyY;
          if  (dist(otherpieX,otherpieY,buseyX,buseyY) < 90)
            {
              buseyX = buseyX+(theotherX*easing);
              buseyY = buseyY+(theotherY*easing);
            }
      }
     void draw()
       {
         fill(#FFFFFF);
         image(img,buseyX,buseyY,this.size,this.size);
       }
  }
    
  
    
    


