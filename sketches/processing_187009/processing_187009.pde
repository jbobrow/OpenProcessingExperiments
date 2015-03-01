
  // The Nature of Code
// Daniel Shiffman  
// http://natureofcode.com


// Two "vehicles" follow the mouse position

// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "seeks"

import java.util.ArrayList;
import oscP5.*;
import netP5.*;
import triss.colourlovers.*;

ArrayList<Vehicle> vehicles;
ArrayList<Predator> predators;
ArrayList<Food> food;
ArrayList<PImage> backgrounds;
int maxage;
OscP5 oscP5;
int count;
NetAddress superCollider;
PVector mouse;
float x;
float y;
float w;
float h;
color fashionable;
color fashionableTwo;
int predTotal;
int preyTotal;
int foodTotal;
int waveStation;

int frameRateInt;

int sizeIntY;
int sizeIntX;
int backgroundNum;
PImage foreGround;

boolean newCanvas;


int blendSpeed;
PImage background;
color[] colours;

void setup() {
  sizeIntY = 750;
  sizeIntX = 1280;
  
  
  // OSC MESSAGING STUFF

  // start oscP5, telling it to listen for incoming messages at port 5001 */
  oscP5 = new OscP5(this, 5001);

  // set the remote location to be the localhost on port 5001
  superCollider = new NetAddress("127.0.0.1", 57120);



  waveStation = 255;
  //  MenuBar mb = new MenuBar();  
  //  mb.add(fm = new Menu("File"));
  //  fm.add(ol = new RedirectingMenuItem(this,"Open", new MenuShortcut( KeyEvent.VK_O )));  
  //  fm.add(sl = new RedirectingMenuItem(this,"Show Info", new MenuShortcut( KeyEvent.VK_S )));
  //  this.frame.setMenuBar(mb);
  // 

  smooth(8);
  changePallet();






  backgroundNum = 7; 
  backgrounds = new ArrayList<PImage>();

  for (int i = 0;i<backgroundNum;i++)
  {
    backgrounds.add(loadImage(i +".jpg"));
    backgrounds.get(i).resize(sizeIntX, sizeIntY);
  }

  int rand = (int) random(backgroundNum);

  background = backgrounds.get(4);

  foreGround = loadImage("ww.png");

  size(1280, 750, P3D);
  colorMode(RGB);
  background(color(255, 255, 255, 255));

  count = 0 ;
  vehicles = new ArrayList<Vehicle>();
  predators = new ArrayList<Predator>();
  food = new ArrayList<Food>();


  maxage = 200;

  predTotal = 1;
  preyTotal = 1;
  foodTotal = 10;

  frameRateInt = 50;

  blendSpeed = 20;

  // Set inital fashionable color.


  int rnd = (int) random(colours.length);
  fashionable = colours[rnd];

  int rndTwo = (int) random(colours.length);
  fashionableTwo = colours[rndTwo];


  //color(random(255), random(255), random(255), 255);
  // fashionableTwo = color(random(255), random(255), random(255), 255);



  for ( int i = 0; i<foodTotal/2;i++)

  {

    food.add(new Food(random(width-80)+40, random(height-120)+60, (int) random(255), fashionable, (int)random(1, 3), 0));
  }

  for ( int i = 0; i<foodTotal/2;i++)

  {

    food.add(new Food(random(width-80)+40, random(height-120)+60, (int) random(255), fashionableTwo, (int)random(1, 3), 0));
  }

  for ( int i = 0; i<predTotal;i++)

  {

    predators.add(new Predator(random(width), random(height), (int) random(255), colours));
  }

  for ( int i = 0; i<preyTotal;i++)

  {
    vehicles.add(new Vehicle(random(width), random(height), (int) random(255), (int)random(1, 3), colours));
  }
}


void textUpdate()

{
  int fashionOneFollowers = 0;
  int fashionTwoFollowers = 0;

  //  if (!showText)
  //  
  //  {
  //   return; 
  //  }
  fill(fashionable);
  textSize(20); 
  text(("Food: " + food.size()+ "  Prey: " + vehicles.size() + "  Predators: " + predators.size()), sizeIntX - 370, sizeIntY - 20);
  //text("Prey: " + vehicles.size(), sizeIntX - 280, sizeIntY - 20);
  //text("Predators: " + predators.size(), sizeIntX - 170, sizeIntY - 20);

  textSize(25); 

  fill(fashionableTwo);
  if (vehicles.size() != 0)

  {

    text("Oldest prey age: " + vehicles.get(0).age/frameRateInt + "s" + " Count: " + count, 10, sizeIntY - 20);
  }

  if (vehicles.size() != 0)

  {
    for (int i = 0; i <vehicles.size();i++)

    {
      if (vehicles.get(i).favoriteColor == 1)

      {
        fashionOneFollowers++;
      }
      if (vehicles.get(i).favoriteColor == 2)

      {
        fashionTwoFollowers++;
      }
    }
  }

  fill(fashionable);
  text("Fashion One: " + fashionTwoFollowers, sizeIntX -820, sizeIntY - 20);

  fill(fashionableTwo);
  text("Fashion Two: " + fashionOneFollowers, sizeIntX -600, sizeIntY - 20);
}

color blend(color colOne, color colTwo)

{
  int rOne = (colOne >> 16) & 0xFF;  // Faster way of getting red(argb)
  int gOne = (colOne >> 8) & 0xFF;   // Faster way of getting green(argb)
  int bOne = colOne & 0xFF;          // Faster way of getting blue(argb)
  int rTwo = (colTwo >> 16) & 0xFF;  // Faster way of getting red(argb)
  int gTwo = (colTwo >> 8) & 0xFF;   // Faster way of getting green(argb)
  int bTwo = colTwo & 0xFF;          // Faster way of getting blue(argb)

  return color(((blendSpeed*rOne)+rTwo)/(blendSpeed+1), ((blendSpeed*gOne)+gTwo)/(blendSpeed+1), ((blendSpeed*bOne)+bTwo)/(blendSpeed+1), waveStation);
}

void changePallet()

{
  ColourLovers cl = new ColourLovers(this);

  // get a random Colour Lover's palette
  ColourLoversPalette palette = cl.getRandomPalette();

  // print some info about the palette
  //  println(palette.getId());
  //  println(palette.getTitle());
  //  println(palette.getNumHearts());

  // get the list of colours from the palette
  colours = palette.getColours();
  
    int rnd = (int)random(colours.length);
    fashionable = colours[rnd];

    //fashionable = color(random(255), random(255), random(255), 255);


    int rndTwo = (int)random(colours.length);
    fashionableTwo = colours[rndTwo];
    
    changeChord();
}

void mouseClicked() {

  if (mouseButton == RIGHT)

  {
    predators.add(new Predator(width/4, height/2, int (random(255)), colours));
  }

  if (mouseButton == LEFT)

    vehicles.add(new Vehicle(random(width), random(height), int (random(255)), (int)random(1, 3), colours));
}

PVector prey(PVector position, Predator vehicle)

{

  PVector target = position;

  if (vehicles.size() != 0)

  {

    target = vehicles.get(0).location;
  }

  for ( int i = 0; i<vehicles.size();i++)

  {

    if (vehicles.get(i).location.dist(position) <  target.dist(position))

      if 
        (vehicles.get(i).location.dist(position) < vehicle.sightRange)
      {
        //System.out.println(vehicles.get(i).location.dist(position)); 
        target = vehicles.get(i).location;
      };
  };

  if 
    (target.dist(position) > vehicle.sightRange)
  {


    return position;
  }

  return target;
}


 PVector herbavorAvoid(PVector position, Vehicle vehicle)

{

  PVector target = position;


  if (predators.size() != 0)

  {

    target = predators.get(0).location;
  }

  for ( int i = 0; i<predators.size();i++)

  {

    if (predators.get(i).location.dist(position) <  target.dist(position))

      if 
        (predators.get(i).location.dist(position) < 40)
      {
        //System.out.println(vehicles.get(i).location.dist(position)); 
        target = predators.get(i).location;
      };
  };

  
  
  if (target.dist(position) > 40)
  {

    return position;
  }


  
  
 float targetX = position.x - target.x;
   float targetY = position.y - target.y;
 
 
 targetX += position.x;
 targetY += position.y;
 

  
  return new PVector(targetX,targetY);
    
  //return target;
}

PVector herbavor(PVector position, Vehicle vehicle)

{

  PVector target = position;
  
  
  
  if (position.dist(herbavorAvoid(position, vehicle))!=0)
  
  
  {
     return herbavorAvoid(position,vehicle); 
  }

  


  if (vehicle.full())

  {
    return position;
  }

  if (food.size() != 0)

  {

    target = food.get(0).location;
  }

  for ( int i = 0; i<food.size();i++)

  {

    if (food.get(i).location.dist(position) <  target.dist(position))

      if 
        ((food.get(i).location.dist(position) < vehicle.sightRange) && food.get(i).index == vehicle.favoriteColor)
      {
        //System.out.println(vehicles.get(i).location.dist(position)); 
        target = food.get(i).location;
      };
  };

  if 
    (target.dist(position) > vehicle.sightRange)
  {

    for ( int i = 0; i<food.size();i++)

    {

      if (food.get(i).location.dist(position) <  target.dist(position))
      {
        if 
          (food.get(i).location.dist(position) < vehicle.sightRange)
        {
          //System.out.println(vehicles.get(i).location.dist(position)); 
          target = food.get(i).location;
        }
      };
    };
  }
  if (target.dist(position) > vehicle.sightRange)
  {

    return position;
  }

  return target;
}

boolean colorSame(color colOne, color colTwo)

{
  int rOne = (colOne >> 16) & 0xFF;  // Faster way of getting red(argb)
  int gOne = (colOne >> 8) & 0xFF;   // Faster way of getting green(argb)
  int bOne = colOne & 0xFF;          // Faster way of getting blue(argb)
  int rTwo = (colTwo >> 16) & 0xFF;  // Faster way of getting red(argb)
  int gTwo = (colTwo >> 8) & 0xFF;   // Faster way of getting green(argb)
  int bTwo = colTwo & 0xFF;          // Faster way of getting blue(argb)

  if 

    (rOne == rTwo && gOne == gTwo && bOne == bTwo)
  {
    return true;
  }

  else 

  {
    return false;
  }
}



void populate(int prey, int pred)

{
  
  println("populate");
  for ( int i = 0; i<pred;i++)

  {

   predators.add(new Predator(random(width), random(height), int (random(255)), colours));
  }

  for ( int i = 0; i<prey;i++)

  {
    if (vehicles.size() > 1)
    {
      Vehicle father = null;
      Vehicle mother = null;
      
      for (int j = 0; j< vehicles.size(); j++)
      {
        //println("here");
      if (vehicles.get(j).male)
      {
      father = vehicles.get(j);
      //print("father assiged");
      }
      if (!vehicles.get(j).male)
      {
      mother = vehicles.get(j);
      //print("mother assiged");
      }
      
      }
      
      if (father!=null && mother != null)
      
      {
       breed(mother,father);
       
      }
    
    }
    
    }
  }



void feed(int quant) {

  for (int i = 0 ; i < quant;i++)

  {

    int rand = (int) random(10);
    rand++;

    if (rand <= 5)
    {

      food.add(new Food(random(10)*width/21, random(height-350)+60, (int) random(255), fashionable, 1, 0));

      if (vehicles.size() != 0)
      {
        for (int j = 0;j<(vehicles.size()/2);j++)

        {
          vehicles.get(j).favoriteColor = 1;
        }
      }
    }
    if (rand >5)
    {
      food.add(new Food((random(10)+11)*width/21, random(height-120)+60, (int) random(255), fashionableTwo, 2, 0));

      if (vehicles.size() != 0)

      {

        for (int j = 0;j<(vehicles.size()/2);j++)

        {
          vehicles.get(j+(vehicles.size()/2)).favoriteColor = 2;
        }
      }
    }
  }
}






void predatorsEat()
{
  for (int i = 0; i <predators.size();i++)

  {

    // If prey is within 5 
    if (prey(predators.get(i).location, predators.get(i)).dist(predators.get(i).location) < 5)

    {
      for ( int j = 0; j<vehicles.size();j++)

      {


        if (prey(predators.get(i).location, predators.get(i)) == vehicles.get(j).location)

        {

          if (predators.get(i).eat())

          {

            vehicles.get(j).size--;
            predators.get(i).col = blend(predators.get(i).col, vehicles.get(j).col);
            
            predPlay(predators.size(),i);
           
            return;
          }
        }
      }
    }
  }
}


void predatorsUpdate()

{

  for ( int i = 0; i<predators.size();i++)

  {

    if (predators.get(i).stationary)
    {
      //System.out.println(predators.get(i).size);
      predators.get(i).age();
      //System.out.println(predators.get(i).size);
    }

    else 

    {
      predators.get(i).age();
    }
    predators.get(i).seek(prey(predators.get(i).location, predators.get(i)));
    predators.get(i).update();
    predators.get(i).display();


    if (predators.get(i).size < 1)

    {
      predators.remove(i);
    };
  };
};

void preyEat()
{
  for (int i = 0; i <vehicles.size();i++)

  {

    // If prey is within 5 
    if (herbavor(vehicles.get(i).location, vehicles.get(i)).dist(vehicles.get(i).location) < 15)

    {
      for ( int j = 0; j<food.size();j++)

      {

        if (herbavor(vehicles.get(i).location, vehicles.get(i)) == food.get(j).location)

        {

          if  (vehicles.get(i).eat())
          {

            food.get(j).graze();
            vehicles.get(i).col = blend(vehicles.get(i).col, food.get(j).col);
            
            oscStuff(vehicles.size(),i);

            return;
          }
        }
      }
    }
  }
}

void preyUpdate()

{


  for ( int i = 0; i<vehicles.size();i++)

  {

    vehicles.get(i).age();


    vehicles.get(i).seek(herbavor(vehicles.get(i).location, vehicles.get(i)));
    vehicles.get(i).update();
    vehicles.get(i).display();

    //    if (vehicles.get(i).iter%600 == 599)
    //       {
    //        food.add(new Food(vehicles.get(i).location.x,vehicles.get(i).location.y,(int) random(255), vehicles.get(i).col, (int)random(1,3),vehicles.get(i).droppings));
    //        vehicles.get(i).droppings = 0;
    //       }


    if (vehicles.get(i).size < 1)

    {
      vehicles.remove(i);
    };
  }

  preyEat();
}


void backgroundChange()

{
  int rand = (int) random(backgroundNum);

  background = backgrounds.get(rand);
  newCanvas = true;
}












void draw() {


  //translate(0,0,random(-3,3));
  //rect(x,y,w,h);
  //fill(255);

  frameRate(frameRateInt);

  // System.out.println(count);
  if (!(mousePressed && (mouseButton == RIGHT)))



    // Refresh Background



  {
    //waveStation =  (int) random(5, 30);

    //waveStation + (int)(sin((float)count%100));


    ;
  }



//  else 
//  {
    //background(color(255,255,255,255));
    fill(255,255,255,50);
    //fill(255, 255-(count%255));
//    
//    if (count % 3 == 1)
//    {
  
      rect(0, 0, width, height);
    
//    }
    //fill(0);
    waveStation = 255;
//  }

  if (newCanvas)

  {
    // background(color(255, 255, 255, 255));
    frameRateInt = (int)random(50, 51);
    newCanvas = false;
  }


  // Populate if no prey

  if (vehicles.size()<preyTotal)

  {
    populate(preyTotal-vehicles.size(), 0);
  }

   if (count % 500  == 499 && preyTotal < 5)
 {
    //preyTotal ++;
   }

  // Populate if no predators

  if (predators.size()==0)

  {
    populate(0, (int)random(4));
  }

  // Populate if no food

  if (food.size() == 0)

  {
    feed(vehicles.size()*2);


    if (vehicles.size()==1)

    {
      //feed(1);
    }
  }

  // Change fashions

 // if (count %3000 == 1)

  {
//    int rnd = (int)random(colours.length);
//    fashionable = colours[rnd];
//
//    //fashionable = color(random(255), random(255), random(255), 255);
//
//
//    int rndTwo = (int)random(colours.length);
//    fashionableTwo = colours[rndTwo];
  }; 


  if (count %3000 == 2999)

  {

    //backgroundChange();
    changePallet();
  };

  // REFRESH BACKGROUND


  if (count %3000 > 3000)

  {
    waveStation = 200;
    background(color(255, 255, 255, 255));
  };

  // blur background
  if 

    (count %3000 < 2000 && count %3000 > 1000)


  {
    waveStation = 200;
    fill(colours[(int)random(colours.length)], 5);
    //rect(0, 0, width, height);
    //fill(0);
  };


  if (count %3000 >= 2000)
    //
  {
    //fill(255, 4);
   // rect(0, 0, width, height);


    //waveStation = (int) random(5, 30);
    //    //fashionableTwo = color(random(255), random(255), random(255), 255);
  };




  //  pushMatrix();
  //  translate(width/2, height/2);
  //  rotate(radians((count/20)%360));
  //  translate(-width/2, -height/2);


  for ( int i = 0; i<food.size();i++)
    //
  {
    //
    food.get(i).display();

    if (food.get(i).size < 1)

    {
      food.remove(i);
    }
  }








  //frameRateInt = 1+(count % 300);
  predatorsUpdate();
  predatorsEat();


  preyUpdate();

  //popMatrix();
  //  
  if (count % 40  == 1)
  {
   // drums(1);
    fill(colours[(int)random(colours.length)]);
    //ellipse(width/2, (height/2)-200, 100, 100);
  }

  if (count % 20  == 1)
  {
   // drums(3);
    fill(colours[(int)random(colours.length)]);
    //ellipse(width/2+50, (height/2)-280, 100, 100);
  }


  if (count % 80  == 40)
  {

    pushMatrix();
    fill(colours[(int)random(colours.length)]);
    translate(width/2, height/2);
    rotateX(150);
    //ellipse(width/2-50, (height/2)-230, 100, 100);
    translate(-width/2, -height/2);
    popMatrix();
    //drums(2);
  }

  if (count % 800  == 400)
  {
   // changeChord();
  }

  if (count % 80  == 1)
  {
    //oscStuff(1,null);
  }

  if (vehicles.size()>1)
  {
    if (count % 40  == 15)
    {
      //oscStuff(2,null);
    }
  }
  

  //println(vehicles.size());
  if (vehicles.size()>2)
  {
    if (count % 20  == 1)
    {
      //oscStuff(4,null);
    }
  }

  if (vehicles.size()>3)
  {
    if (count % 10  == 1)
    {
      //oscStuff(8,-1);
    }
  }

//  if (vehicles.size()>4)
//  {
//
//    if (count % 5  == 1)
//    {
//      oscStuff(16);
//    }
//  }





  // Update Text

  fill(color(255, 255, 255, 160));



  rect(0, sizeIntY-60, sizeIntX, 60); 

  //  image(foreGround,0,sizeIntY-400,sizeIntX,400);


  float rectWidth = sizeIntX/ colours.length;

  for (int i = 0; i< colours.length;i++)

  {
    fill(colours[i]);
    rect(i * rectWidth, sizeIntY - 10, (i + 1) * rectWidth, 10);
  }

  textUpdate();




  // Saving images

  //System.out.println(count);
  if (count % (10*frameRateInt) == (10*frameRateInt)-1)

  {
    //System.out.println("Save"); 

    //save(""+count);
  }


  count++;
}

void changeChord()

{
  OscMessage myMessage = new OscMessage("/test");

  int chordChange = (int)random(10);

  if (chordChange <5)

  {
    myMessage.add(201);
  }


  else {

    myMessage.add(201);
    println("chord");
  }
  oscP5.send(myMessage, superCollider);
}

void drums(int drum)

{

  if (drum == 1)

  {
    OscMessage myMessage = new OscMessage("/test"); 
    myMessage.add(204);
    oscP5.send(myMessage, superCollider);
  }

  if (drum == 2)

  {

    OscMessage myMessage = new OscMessage("/test"); 
    myMessage.add(205);
    oscP5.send(myMessage, superCollider);
  }

  if (drum == 3)

  {
    OscMessage myMessage = new OscMessage("/test"); 
    myMessage.add(206);
    oscP5.send(myMessage, superCollider);
  }
}
void oscStuff(int chance, int vehicleNo)

{

  int noteNumber = (int)random(1, vehicles.size());

  if (((int)random(chance))< 1)

  {

    if (vehicles.size()!= 0)

    {
      for (int i = 0; i<noteNumber;i++)    
      {


        vehicles.get(vehicleNo).glowValue = 5;

        OscMessage myMessage = new OscMessage("/test");
      
//        if (vehicleNo == null)
//        {
//          vehicleNo = (int)random(vehicles.size());
//        }
//    
        int note = vehicles.get(vehicleNo).note();
        float dynamic = vehicles.get(vehicleNo).dynamic();
        float pan = vehicles.get(vehicleNo).location.x;
        pan /= width;
        
        pan *= 2;
        
        pan -= 1;
        
        println("Pan:");
        println(pan);
        //(int)((vehicles.get((int)random(vehicles.size())).location.x/width) * 21);
        
        println(note);
        //println(note);

        //myMessage.add(100+1)

//        if (vehicles.get(i).favoriteColor == 1)
//        {
          myMessage.add(note);
          myMessage.add(dynamic);
          myMessage.add(pan);
        
        
          println(vehicles.get(vehicleNo).favoriteColor);
        
          myMessage.add(vehicles.get(vehicleNo).favoriteColor);
          
//        }

//        if (vehicles.get(i).favoriteColor == 2)
//        {
//          myMessage.add(note+50);
//        }
        //myMessage.add(vehicles.get(i).location.y);
        //myMessage.add(vehicles.get(i).location.x);
        // System.out.println(vehicles.get(i).location.y);
        oscP5.send(myMessage, superCollider);
      }
    }
  }
}


void predPlay(int chance, int vehicleNo)

{

 

  if (((int)random(chance))< 1)

  {

    if (predators.size()!= 0)

    {
     

      //  predators.get(vehicleNo).glowValue = 5;

        OscMessage myMessage = new OscMessage("/test");
      
//        if (vehicleNo == null)
//        {
//          vehicleNo = (int)random(vehicles.size());
//        }
//    
        int note = predators.get(vehicleNo).note();
        float dynamic = predators.get(vehicleNo).dynamic();
        float pan = predators.get(vehicleNo).location.x;
        pan /= width;
        
        pan *= 2;
        
        pan -= 1;
        
        println("Pan:");
        println(pan);
        //(int)((vehicles.get((int)random(vehicles.size())).location.x/width) * 21);
        
        println(note);
        //println(note);

        //myMessage.add(100+1)

//        if (vehicles.get(i).favoriteColor == 1)
//        {
          myMessage.add(note);
          myMessage.add(dynamic);
          myMessage.add(pan);
        
        
          println(vehicles.get(vehicleNo).favoriteColor);
        
          myMessage.add(3);
          
//        }

//        if (vehicles.get(i).favoriteColor == 2)
//        {
//          myMessage.add(note+50);
//        }
        //myMessage.add(vehicles.get(i).location.y);
        //myMessage.add(vehicles.get(i).location.x);
        // System.out.println(vehicles.get(i).location.y);
        oscP5.send(myMessage, superCollider);
      
    }
  
}

}
void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } 
  else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    if (predators.size()!=0) 

    {
      predators.remove(0);
    }
  } 
  else { 
    // It's a letter key, fill a rectangle
    System.out.println('k');
    changePallet();
  }
}

void breed(Vehicle mother, Vehicle father)

{

  int geneOne = round(random (1));
  int geneTwo = round(random (1));
  int geneThree = round(random (1));
  int geneFour = round (random (1));
  int geneFive = round(random (1));



  Vehicle child = new Vehicle(mother.location.x,mother.location.y, int (random(255)), (int)random(1, 3), colours);
  


    if (geneOne == 1)
    {
      child.birthspeed = father.birthspeed;
    }
    
    else

    {
       child.birthspeed = mother.birthspeed;
    }

  
  if (geneTwo == 1)
  {
    child.shrinkSpeed = father.shrinkSpeed;
  }
  
  else

  {
    child.shrinkSpeed = mother.shrinkSpeed;
  }
  
  
  if (geneThree == 1)
  {
    child.maxforce = father.maxforce;
  }
  
  else

  {
    child.maxforce = mother.maxforce;
  }
  
  
  if (geneFour == 1)
  {
    child.maxSize = father.maxSize;
  }
  
  else

  {
    child.maxSize = mother.maxSize;
  }

  if (geneFive == 1)
  {
    child.sightRange = father.sightRange;
  }
  else

  {
    child.sightRange = mother.sightRange;
  }

  vehicles.add(child);
  
}

  
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

class Food {
  // internal state stored in location, vel and accel
  PVector location;
  PVector acceleration;
  float r;        // radius 
// Maximum speed
  color col;         // colour
  int id;
  int age;
  int lifespan;
  int size;
  float amountEaten;  
  int iter;
  int startSize;
  int index;


  Food(float x, float y, int _id, color col,int index, int size
) {
   
    if (size == 0)
    
    {
    this.size = (int) random(10,20);
    }
    
    else {
      
      this.size = size;
      
    }
    
     location = new PVector(x, y);
    
//     float angle = random(1)*PI*2;
//
//     location.x = cos(angle)*250;
//     location.y = sin(angle)*250; 
//    
//     location.x += (width/2);
//     location.y += (height/2);
     
    
    
    startSize = size;
    lifespan = size*40;
    iter = 0;
    this.index = index;

    acceleration = new PVector(0, 0);

    
    r = 25;
    id = _id;
    
    this.col = col;  
    
  }


void graze()

{
   size--; 
   amountEaten = (float)size/(float)startSize;  
   //System.out.println(amountEaten);
    //System.out.println(size);
     //System.out.println(startSize);
}



// constrain movement to the page - we've drawn a little fence inside the canvas so you can see what's going on at the edges

 


  void display() {
    // Draw a triangle rotated in the direction of velocity

    fill(col);
    stroke(col);
    strokeWeight(1);
    
    // an example of beginShape - used to draw vertices of a triangle
    
    //    pushMatrix();
    //    translate(location.x,location.y);
    //    rotate(theta);
    //    beginShape();
    //    vertex(0, -r*2);
    //    vertex(-r, r*2);
    //    vertex(r, r*2);
    //    endShape(CLOSE);
    //    popMatrix();

  
    rect(location.x, location.y, size, size);   // draw the agent
    
     // a little bit of trig to draw the direction of travel 

  }
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

class Predator {
  // internal state stored in location, vel and accel
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;        // radius 
  float maxforce;    // Maximum steering force 
  float maxspeed;    // Maximum speed
  color col;         // colour
  int id;
  int age;
  int lifespan;
  int size;
  int birthspeed;
  int maxSize;
  PVector desired;
  int shrinkSpeed;

  int sightRange;
  boolean turn;
  
  int triDeg;
  
  int iter;
   boolean stationary;

  Predator(float x, float y, int _id, color[] colours) {
   
    maxforce = random(5.5);
    
    
    shrinkSpeed = (int)random(10,50);
    
    maxSize = (int)random(50,250);
    turn = true;
    size = (int) random(30,maxSize);
    birthspeed = size;
    triDeg = (int) ((birthspeed-30)/11)+40;
    lifespan = size*40;
    iter = 0;
    maxspeed = 41- size;
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-maxspeed, maxspeed), random(-maxspeed, maxspeed));
    location = new PVector(x, y);
    r = 25;
    id = _id;
    
    int rnd = (int)random(colours.length);
    col = colours[rnd];
    
    color(random(220)+30,random(220)+30,random(220)+30, 175);  // a cheap way to make a rainbow population - in HSB space, each agent will take a different colour
    stationary = false;
    
    
    //triDeg = 50;
    
    //(int) random(40,60);
    //System.out.println(triDeg);
   
    
    sightRange = (int) random(0,3000);
  }

  // Method to update location
  void update() {
    
    maxspeed = (birthspeed/5 - (size/15));
    
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    
  
    location.add(velocity);
    
    
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
    checkBoundaryNonTorroidal();
    //System.out.println(velocity.mag());
    
    stationary = (velocity.mag() == 0);
    
    turn = (velocity.mag() < 2); 
   
    
    
    
  }
  
boolean eat()

{
   if ((size<maxSize)&& ! stationary)
  
  {
     size++;
     return true;
  } 
  
  else
  
  {
   return false; 
  }
  
  
}

void age()

{
   age++; 

   if (iter%shrinkSpeed== shrinkSpeed-1)
   {
   size--;
   };
   iter++;

   
}



// constrain movement to the page - we've drawn a little fence inside the canvas so you can see what's going on at the edges
  void checkBoundaryNonTorroidal() {

    if ((location.x > width-size) || (location.x < size)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height-size) || (location.y < -size)) {
      velocity.y = velocity.y * -1;
    }
  }

 

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    
    //force.div(size*40);
    
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    desired = PVector.sub(target, location);  // A vector pointing from the location to the target

    // Scale to maximum speed
    desired.setMag(maxspeed);
    


    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }



  void display() {
    // Draw a triangle rotated in the direction of velocity

    

    
    float theta = velocity.heading2D() + PI/2;
    fill(col);
    stroke(col);
    strokeWeight(1);
   
   pushMatrix();
   
   float angle = ((velocity.heading2D() + PI/2));
   //System.out.println(angle*57.2957795);
   //rotate(angle,location.x,location.y,5);
   
   
   translate(location.x, location.y);
   rotate(angle);
   translate(-location.x, -location.y);
    if (!stationary)
    
    
    {
      
      triangle(location.x, location.y, location.x-size/cos(triDeg),location.y + size,location.x+size/cos(triDeg),location.y + size);   // draw the agent
    }
    
    else 
    
    {
      
           rect(location.x, location.y, size, size);   // draw the agent
 
    }
    
    
     // a little bit of trig to draw the direction of travel 
    //line(location.x + size/2, location.y + size/2, location.x + (r*0.5*sin(theta)), location.y - (r*0.5* cos(theta)));
    
    fill(color(0,0,0,150));
    ellipse(location.x, location.y, sightRange/100, sightRange/100);
    
    popMatrix();

  }


 float dynamic()
 
 {
   println("Size:");
   println(size);
   println("Max Size:");
   println(maxSize);
   
   println("Dynamic:");
   float floatSize = (float) size;
   float floatMaxSize = (float) maxSize;
     println(  floatSize/floatMaxSize);
   
   float dynamic = (floatSize/floatMaxSize);
   println("Dynamic Float:");
   
   println(dynamic);
   return(dynamic);

 }
 
  int note()
 
 {
  


  
  int r = (col >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (col >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = col & 0xFF;          // Faster way of getting blue(argb)
  
  int noteMultiply = 1;
  
  if (r < g && r < b)
  
  {
     noteMultiply = 1; 
  }
  
   else if (g < r && g < b)
  
  {
     noteMultiply = 2; 
  }
  
    else if (b < g && b < r)
  
  {
     noteMultiply = 3; 
  }
  
  int note = ((r + g + b) /128) * noteMultiply;
  
  return note;
   
 }
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

class Vehicle {
  // internal state stored in location, vel and accel
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;        // radius 
  float maxforce;    // Maximum steering force 
  float maxspeed;    // Maximum speed
  color col;         // colour
  int id;
  int age;
  int lifespan;
  int size;
  int birthspeed;
  int sightRange;
  int maxSize;
  int droppings;
  
  int shrinkSpeed;
  
  int iter;
  int favoriteColor;
  
  boolean stationary;
  boolean male;
  
  color colStore;
  int glowValue;
  
  Vehicle(float x, float y, int _id, int favoriteColor,color[] colours
) {
  
    shrinkSpeed = (int)random(5,30);
   
    maxforce = random(5.5);
    
    maxSize = (int)random(50,300);
    this.favoriteColor = favoriteColor;
    size = (int) random(30,40);
    birthspeed = size*4;
    lifespan = size*40;
    iter = 0;
    maxspeed = 41- size;
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-maxspeed, maxspeed), random(-maxspeed, maxspeed));
    location = new PVector(x, y);
    r = 25;
    id = _id;
    droppings = 0;
    
    if (favoriteColor == 1)
    
    {
       male = true; 
       println("male");
    }
    
        if (favoriteColor == 2)
    
    {
       println("fmale");
       male = false; 
    }
    
    
    int rnd = (int)random(colours.length);
    col = colours[rnd];
    
    
    //color(random(220)+30,random(220)+30,random(220)+30, 175);  // a cheap way to make a rainbow population - in HSB space, each agent will take a different colour
     sightRange = (int) random(200,1000);
     stationary = false;
     
     
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    
      if (!full())
    {
    location.add(velocity);
    }
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
    checkBoundaryNonTorroidal();

    maxspeed = (birthspeed/5 - (size/15));
    
        if (velocity.mag() == 0)
    
    {
     stationary = true; 
    }
    
    else 
    
    {
     stationary = false; 
    }  
  }
  

boolean full()

{
  return (size == maxSize); 
};

boolean eat()

{
  //System.out.println(((size<maxSize)&& !stationary));
   if ((size<maxSize))
  
  {
     
     size++;
     return true;
  } 
  
  else
  
  {
   return false; 
  }
  
  
  }
void age()

  {
   age++; 

   if (iter%shrinkSpeed == shrinkSpeed - 1)
   {
   size--;
   droppings++;
   };
   iter++;

   
  }



// constrain movement to the page - we've drawn a little fence inside the canvas so you can see what's going on at the edges
  void checkBoundaryNonTorroidal() {

    if ((location.x > width-size) || (location.x < size)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height-size) || (location.y < size)) {
      velocity.y = velocity.y * -1;
    };
  }

 int note()
 
 {
  


  
  int r = (col >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (col >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = col & 0xFF;          // Faster way of getting blue(argb)
  
  int noteMultiply = 1;
  
  if (r < g && r < b)
  
  {
     noteMultiply = 1; 
  }
  
   else if (g < r && g < b)
  
  {
     noteMultiply = 2; 
  }
  
    else if (b < g && b < r)
  
  {
     noteMultiply = 3; 
  }
  
  int note = ((r + g + b) /128) * noteMultiply;
  
  return note;
   
 }
 
 float dynamic()
 
 {
   println("Size:");
   println(size);
   println("Max Size:");
   println(maxSize);
   
   println("Dynamic:");
   float floatSize = (float) size;
   float floatMaxSize = (float) maxSize;
     println(  floatSize/floatMaxSize);
   
   float dynamic = (floatSize/floatMaxSize);
   println("Dynamic Float:");
   
   println(dynamic);
   return(dynamic);

 }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    
    //force.div(size*40);
    
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target

    // Scale to maximum speed
    desired.setMag(maxspeed);

    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }


  void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    
    if (full()&& stationary)
    
    {
      
      fill(255);
      stroke(col);
      //fill(color(255,255,255,255));
      fill(col);
    
    }
    
    else 
    
    {
      fill(col);
      stroke(col);
    }
    
    //stroke(0);
    strokeWeight(1);

    
    ellipse(location.x, location.y, size, size);
    
    if (glowValue > 0)
    {
      
    //fill(color(255,255,255,glowValue*25));
    fill(color(255,255,255,255));
    ellipse(location.x, location.y, size, size);   // draw the agent
    
    glowValue--;
  
    }
    
    
//    fill(color(255,255,255,255));
//    textSize(5);
//    text(favoriteColor, 5,5);
    
    fill(color(0,0,0,150));
    ellipse(location.x, location.y, sightRange/60, sightRange/60);
     // a little bit of trig to draw the direction of travel 
    line(location.x, location.y, location.x + (r*0.5*sin(theta)), location.y - (r*0.5* cos(theta)));
  }

}




