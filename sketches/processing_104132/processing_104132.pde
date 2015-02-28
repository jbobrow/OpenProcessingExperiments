
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;



Physics physics;
Maxim maxim;
AudioPlayer[] pum;
//AudioPlayer[] turum;

CollisionDetector detector;

int numpiedras = 150;
int cont = 0;
int timer = 0;
float danio = 0;

int pumcount = 0;
//int turumcount = 0;
int locoSize = 35;

boolean fin = false;
boolean roto = false;
boolean reventado = false;


Body loco;
Body granizo [];
int Gsize[];
Body car;
Body floor;
Body Lwall;
Body Rwall;

PImage carImage, locoImage, granizoImage,storm;

void setup()
{
  
  background(0);
  size(600,600);
  noCursor();
  maxim = new Maxim(this);
  pum = new AudioPlayer[5];
  for (int i=0; i<pum.length;i++)
  {
    pum[i] = maxim.loadFile("pum1.wav");
    pum[i].setLooping(false);
    pum[i].volume(1);
  }
  
//  turum = new AudioPlayer[5];
//    for (int i=0; i<turum.length;i++)
//  {
//    turum[i] = maxim.loadFile("turum1.wav");
//    turum[i].setLooping(false);
//    turum[i].volume(1);
//  }
//  
  imageMode(CENTER);
  carImage = loadImage("car.png");
  locoImage = loadImage("loco1.png");
  granizoImage = loadImage("granizo.png");
  storm = loadImage("storm.jpg");
  
  
  
  physics = new Physics(this, width, height, 0, -10, width*2, height*2, width, height, 20);
  //physics = new Physics(this, width, height);
  physics.setRestitution(0.1);
  detector = new CollisionDetector (physics, this);
  physics.setDensity(10.0);
  

  car = physics.createRect(120,550,390,600);
  loco = physics.createCircle(300,300,locoSize);
  floor = physics.createRect(0,height-10,width,height);
  Lwall = physics.createRect(0,0,10,height);
  Rwall = physics.createRect(width-20,0,width,height);
  granizo = new Body[numpiedras];
  Gsize= new int[numpiedras];
  
  physics.setCustomRenderingMethod(this, "myCustomRenderer");
 
  //println(physics.getRestitution());
  
  //physics.setEdgesFriction(10);
 }

void draw()
{  
  
  
   background(0);
   image(storm, width/2, height/2, width, height);
   
   loco.setPosition(physics.screenToWorld(new Vec2(mouseX, mouseY)));
   
     
   if (timer%30 == 0)
   {
     if (cont<numpiedras)
     {
     int Xpos = (int) random(0,width);
     Gsize[cont] = (int) random(2,5);
     granizo[cont] = physics.createCircle(Xpos,1,Gsize[cont]);
     cont++;  
     }
   
   }
   timer++;
   
   
   if (!fin)
  {
    if (timer > (numpiedras + 10)*30)
      {
        //println("ufff se te hizo pelota, te va a salir $" + (danio*10));
        fin = true;
      }
  }
 
   if (!reventado)
   {
     if(danio > 500)
     {
        locoImage = loadImage("loco2.png");
        reventado = true;
     }
   }
   
   if (!roto)
   {
     if(danio > 1000)
     {
        carImage = loadImage("car2.png");
        roto = true;
     }
   }
   
   
   
}

void mousePressed()
{

 // float spd = map(mouseY, 0, 600, 0.1, 2);
 // playSound((int) random(1,2), spd);

}




void collision(Body b1, Body b2, float imp)
{
  
  if (imp > 5)
  {
    int loud = (int) map (imp,5,30,0.7,1.6);
    playSound(1, loud);
  }
  
  if(imp > 10)
  {
    if(b1 != loco && b2 != loco )
    {
      
      
      Vec2 pb1 = b1.getPosition();
      Vec2 pb2 = b2.getPosition();
      if (b1 == car &&  pb1.y > pb2.y)
      {
        fill(255,0,0);
        rect(0,0, width,height);
        danio += imp*4;
        //println( imp);
      }
      if (b2 == car && pb1.y<pb2.y)
      {
        fill(255,0,0);
        rect(0,0, width,height);
        danio += imp*4;
        //println( imp);
      }
      
    }
  }

  
}

void playSound(int sound, float spd)
{
  
  if (sound==1)
  {
   if (pumcount > pum.length-1)
   {
     pumcount = 0;
   } 
    pum[pumcount].cue(0);
    pum[pumcount].speed(spd);
    //pum1.speed(random(0.1,2));
    pum[pumcount].play();
    pumcount ++;

  }
//   if (sound==2)
//  {
//   if (turumcount > turum.length-1)
//   {
//     turumcount = 0;
//   } 
//    turum[turumcount].cue(0);
//    turum[turumcount].speed(spd);
//    turum[turumcount].play();
//    turumcount++;
//
//  }

  
}
void myCustomRenderer(World world)
{
  Vec2 screenLocoPos = physics.worldToScreen(loco.getWorldCenter());
  float locoAngle = physics.getAngle(loco);
  pushMatrix();
  translate(screenLocoPos.x, screenLocoPos.y);
  rotate(-radians(locoAngle));
  image(locoImage,0,0,locoSize*2,locoSize*2);
  popMatrix();
  
  Vec2 screenCarPos = physics.worldToScreen(car.getWorldCenter());
  float carAngle = physics.getAngle(car);
  pushMatrix();
  translate(screenCarPos.x, screenCarPos.y);
  rotate(-radians(carAngle));
  image(carImage,-5,-10,295,70);
  popMatrix();
  
  for (int i=0; i < cont-1; i++)
  {
    Vec2 screenGranPos = physics.worldToScreen(granizo[i].getWorldCenter());
    float granAngle = physics.getAngle(granizo[i]);
    pushMatrix();
    translate(screenGranPos.x, screenGranPos.y);
    rotate(-radians(granAngle));
    image(granizoImage,0,0,Gsize[i]*2,Gsize[i]*2);
    popMatrix();
  }
}



