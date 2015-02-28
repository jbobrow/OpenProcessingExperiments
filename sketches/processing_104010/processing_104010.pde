
//Name Starfields
Starfield fore, mid, back;
//Name ArrayList which stores bodies and id's
ArrayList bodies;

ArrayList sparks;

PShape lines;

ArrayList pauseLines;
//
PVector mouseS, mouseR;
color cnew;

//magconvert counts pixels as mass units, change to calculate
//proportionate to mass

//or find mass overlaping out of 100% and exchange

//and fix scalar velocity


float tMass;

PVector relVel, mouseP;

boolean pause;


void setup()
{
  //set screen size to 600x600
  size(500,500);
  //background color to dark gray
  background(40);
  cnew = color(255,255,150);
  //Create one of each starfield and the 'bodies' ArrayList
  fore = new Starfield(0, .01, cnew, 3);
  mid = new Starfield(0, .007, cnew, 2.5);
  back = new Starfield(0, .005, cnew, 2);
  bodies = new ArrayList();  
  sparks = new ArrayList();
  pauseLines = new ArrayList();
  mouseS = new PVector();
  mouseR = new PVector();
  smooth();
}

void draw()
{
  //draw dark gray first each frame
  background(40);
  //Draw and update starfields on top of background
  fore.display(bodies);
  mid.display(bodies);
  back.display(bodies);
  
    

  
  screenMass();
  if(bodies.size() > 0)
  {
    
    if(pause)
    {
      for(int i = 0; i<pauseLines.size();i+=2)
      {
        
        PVector pullS = (PVector) pauseLines.get(i);
        PVector pullR = (PVector) pauseLines.get(i+1);
        
        stroke(255,150);
        line(pullS.x,pullS.y,
          pullR.x,pullR.y);
      }
      
    } else pauseLines = new ArrayList();
    //Check the bodies ArrayList for any and all loaded bodies
    for(int i=bodies.size()-1; i>-1; i--)
    {
      //Cast b as 'Body' at location 'i' on ArrayList
      Body b = (Body) bodies.get(i);
      //Reset every body's 'id' tag to its location on the ArrayList
      /*println(b.id + " " + "id");*/
      //Draw every Body on ArrayList
      b.display();
      //Run the 'Update' function inside the individual Body
      //this is where "allballs" is passed into each Body
      if(!pause)
      {
        b.update(bodies);
      }
      
      if(b.selfMass < .01)
      {
        bodies.remove(b);
      }
      b.id = i;
    }
    
  }
  
  if(sparks.size() > 0)
  {
    for(int i = 0; i < sparks.size(); i++)
    {
      Spark s = (Spark) sparks.get(i);
      if(!pause)
      {
        s.update();
      }
      s.display();
    }
  }
  
  if (mousePressed)
  {
    //After creating body in mousePressed function
    //find the last body made and run its "generate" function
    int i = bodies.size()-1;
    //'-1' because when 'size' of array is 1, body is at 0
    Body b = (Body) bodies.get(i);
    
    if(mouseButton == LEFT)
    {
      b.generate(0);
    }
    else if(mouseButton == RIGHT)
    {
      b.generate(1);
    }
    
  }
  

    
 
  


}

void mousePressed()
{
  //When the mouse button is pressed create a new Body and pass in its
  //location on the ArrayList to assign its initial 'id'
  //First one is created at 0 but bodies.size() is = 1
  bodies.add(new Body(bodies.size()));
  //for pause line draw
  mouseS = new PVector(mouseX, mouseY);
}

void mouseReleased()
{
  //On mouse release find Body just added
  int i = bodies.size()-1;
  Body b = (Body) bodies.get(i);
  
  //Give position at mouseP so others aren't attracted to it before release
  //Create acc and vel variables so it doesn't leave cursor before 
  //button is released
  b.mouseR();
  
  //After vel is created, calculate the initial velocity
  //from mouse click and drag
  relVel = PVector.sub(b.mouseP, new PVector(mouseX, mouseY)); //create new PVector so it doesn;t default to zero co-ordinates
  float distance = PVector.dist(b.mouseP, new PVector(mouseX, mouseY));
  relVel.normalize();
  relVel.mult(distance/20);
//  relVel.mult(distance);
  b.vel.add(relVel);
  
  //for pause line draw
  mouseR = new PVector(mouseX, mouseY);
  if(pause)
  {
    pauseLines.add(mouseS);
    pauseLines.add(mouseR);
  } 
}

void screenMass()
{
  tMass = 0;
  rMass = 0;
  for(int i = 0; i < bodies.size(); i++)
  {
    Body b = (Body) bodies.get(i);
    tMass += b.selfMass;
    
    if(b.bodyType == 0){
        rMass+=b.selfMass;
    }
  }
  fill(0,150);
  stroke(180,125);
  rectMode(CENTER);
  rect(width-105, height-24,200,44);
  
     
  //println(bodies.size() + " " + "array size");
  fill(150);
  text("Number of bodies: " + bodies.size(),width-140,height-34);
  
  
  fill(150);
  //println(tMass + " " + "mass");
  text("Total Value of Absolute Mass: " + tMass,width-201,height-6);
  text("Total Mass of BlackHoles: " + rMass, width-180, height-20);
}

void keyPressed()
{
  if(key == 'r')
  {
    bodies = new ArrayList();
  }
  if(key == 'p')
  {
    if(!pause)
    {
      pause = true;
    } else if(pause)
    {
      pause = false;
    }
  }
}
class Body
{
  PVector pos, vel, acc, mouseP;
  int id, selfMode, distance, radMult;
  float rad, diameter, G, selfMass, posDist, accDamp;
  boolean active, contact, rendevous, sameType;
  float springyness = 0.75; //or .3
  float mergeTolerance = .5;
  int bodyType;
  int dir = 1;
  
  Body(int number)
  {
    active = false;
    mouseP = new PVector(mouseX, mouseY);
    id = number;
    radMult = 15;
    G = 9.8/2;
    selfMass = 1;
    rad = sqrt(selfMass/PI)*radMult;  //multiplied to increase size; copied in update
    diameter = rad*2;
    accDamp = .1;
  }
  
  void generate(int mode)
  {
    bodyType = mode;
        
    //Draw line helping show inverse trajectory and potential energy
    strokeWeight(2);
    stroke(255);
    line(mouseP.x, mouseP.y, mouseX, mouseY);
    
    if(bodyType == 0)
    {
      //Draw body at mousePressed co-ord
      //fill(255, 150);
      fill(0);
      stroke(150);
      ellipse(mouseP.x, mouseP.y, diameter, diameter);
      
      dir = 1;
    }
    
    if(bodyType == 1)
    {
      //Draw body at mousePressed co-ord
      //fill(255, 150);
      noFill();
      stroke(255);
      ellipse(mouseP.x, mouseP.y, diameter, diameter);
      
      dir = -1;
    }
    
    //print(bodyType);
    
  }
  
  void mouseR()
  {
    //On mouse release, define variables and allow for update/display
    pos = new PVector(mouseP.x, mouseP.y);
    vel = new PVector();
    acc = new PVector();
    active = true;
  }
  
  void display()
  {
    if (active)
    {
      if(bodyType == 0)
      {
        //fill(255, 150);
        
//        noStroke(); //This prevents star strokes fro carrying over to bodies
//        noFill();
//        fill(0,70);
//        ellipse(pos.x,pos.y, diameter*2,diameter*2);
//        
//        fill(0,150);
//        noStroke();
//        ellipse(pos.x,pos.y,diameter*1.5,diameter*1.5);
        
        strokeWeight(2);
        stroke(0,70); //This prevents star strokes fro carrying over to bodies
        noFill();
        ellipse(pos.x,pos.y, diameter*2,diameter*2);
        
        strokeWeight(3);
        stroke(0,150);
        noFill();
        ellipse(pos.x,pos.y,diameter*1.5,diameter*1.5);
        
        fill(6);
        //noStroke();
        strokeWeight(7);
        stroke(0);
        ellipse(pos.x, pos.y, diameter, diameter);
      }
      if(bodyType == 1)
      {
        strokeWeight(3);
        stroke(255,50); //This prevents star strokes fro carrying over to bodies
        noFill();
        ellipse(pos.x,pos.y, diameter*2,diameter*2);
        
        strokeWeight(2);
        stroke(255,100);
        noFill();
        ellipse(pos.x,pos.y,diameter*1.5,diameter*1.5);
        
        //noFill();
        fill(0,20);
        strokeWeight(1);
        stroke(255,150);
        ellipse(pos.x, pos.y, diameter, diameter);
      }
    }
  }
  
  void update(ArrayList allBalls)
  {
    if (active)
    {
      rad = sqrt(selfMass/PI)*radMult;  //multiplied to increase size;copied in update
      diameter = rad*2;
      
      //all calculations run first
      kinetic(allBalls);
      
      //then calculations run through limiters before output
      speedCap();
      borderCollide();
      
      acc.mult(accDamp);
      vel.add(acc);
      pos.add(vel);  
    }
  }
  
  void kinetic(ArrayList allBalls) //calculate acceleration towards every object each 'update()'
  {
    acc = new PVector(); //set fresh acc each update
    
    for (int i=allBalls.size()-1; i>-1; i--) //check every body in array
    {
      Body other = (Body) allBalls.get(i); 
      if (other.active) //if other body has had mouseR called
      {
        float distance = PVector.dist(pos, other.pos);
        float mindist = rad + other.rad;
        float mDistance = distance - mindist; //finds distance between edge of two bodies
        float magConvert = mindist - distance; //finds overlap of bodies
        PVector vector = new PVector();
        
        if (other.id != id) //checking to see if selected object is not self
        {
          if(distance < mindist)
          {
            merge(other, magConvert);
//            collide(other, mindist, distance);            
          }          
          if(distance > mindist/5)//Prevents 'fatal' attractions; buffers 'merge'
          {
            float otherMass = other.selfMass;
            vector = PVector.sub(other.pos, pos);
            vector.normalize();
            if(otherMass > selfMass)
            {
              vector.mult(((dir*other.dir*G*(pow(otherMass-selfMass, 2)))/sq(distance)));//This line can be removed deactivate 'gravitational' influence but leave normalized attraction
            }
            else
            {
              vector.mult(((dir*other.dir*G*(otherMass*selfMass))/sq(distance)));
            }
            acc.add(vector); //adds the acceleration towards every object together to obtain a total acc for that 'update()'
          }
        }
      }
    }
  }
  
  void collide(Body collide, float mDst, float dst)    // bounce off the other balls (don't worry about the math here...)
  {
    Body other = (Body)collide;
    float mindist = mDst;
    float distance = dst;
    
    float angle = atan2(other.pos.y - pos.y, other.pos.x - pos.x);
        
    PVector target = new PVector( pos.x + cos(angle)*mindist, pos.y + sin(angle)*mindist);
    PVector acc = PVector.sub( target, other.pos );
    acc.mult(springyness);
    float selfMass = sq(rad);
    float otherMass = sq(other.rad);
    PVector selfForce = PVector.mult(acc, otherMass/(selfMass+otherMass));
    PVector otherForce = PVector.mult(acc, selfMass/(selfMass+otherMass));
    vel.sub(selfForce);
    other.vel.add(otherForce);
  } 
  
  void merge(Body collide, float magnitude)
  {
    Body other = (Body)collide;
    
    //
    PVector vector = PVector.sub(other.pos, pos);
    vector.normalize();
    vector.mult(rad);
    vector.add(pos);
    PVector contactPosition = vector;
    if(rendevous)
    {
      if(PVector.dist(other.pos,pos) < rad)
      {
        contactPosition = other.pos;
      }
    }
    spark(contactPosition);
    //print("called spark");
    //
    
    
    if(other.bodyType == bodyType)
    {
      sameType = true;
    }
    else sameType = false;
    
    float magConvert = magnitude;
    
    if (selfMass > other.selfMass)
    {
      rendevous = true;
      if(magConvert > other.selfMass)
      {
        magConvert = other.selfMass;
      }
      changeMass(other, rendevous, sameType, magConvert);
    }
    if (selfMass < other.selfMass)
    {
      rendevous = false;
      changeMass(other, rendevous, sameType, magConvert);
    }
    if (selfMass == other.selfMass)
    {
      if (id > other.id)
      {
        rendevous = true;
        if(magConvert > other.selfMass)
        {
          magConvert = other.selfMass;
        }
        changeMass(other, rendevous, sameType, magConvert);
      }
      else
      {
        rendevous = false;
        changeMass(other, rendevous, sameType, magConvert);
      }
    }
    
  }
  
  void changeMass(Body collision, boolean selfBodyIsLarger, boolean sameBodyType, float magnitudeOfConversion)
  {
    float magConvert = magnitudeOfConversion;
    boolean rendevous = selfBodyIsLarger;
    boolean sameType = sameBodyType;
    
    if(rendevous)
    {
      if(sameType)
      {
        selfMass += magConvert;
        collision.selfMass -= magConvert;
      }
      if(!sameType)
      {
        selfMass -= magConvert;
        collision.selfMass -= magConvert;
      }

    }
//    else if(!rendevous)
//    {
//      selfMass -= magConvert;
//    }
    
  }
  
  void spark(PVector contact)
  {
    for(int i = 0; i<3; i++)
    {
      sparks.add(new Spark(contact));
      //print("print");
    }
  }


  void speedCap() //caps velocity at '10'
  {
    if (vel.x > 20)
    {
      vel.x = 20;
    }

    if (vel.x < -20)
    {
      vel.x = -20;
    }

    if (vel.y < -20)
    {
      vel.y = -20;
    }

    if (vel.y > 20)
    {
      vel.y = 20;
    }
  }

  void borderCollide() //if body exits, moves back to exit point and reverses vel
  {
    if (pos.x < 0 + rad)
    {
      pos.x = 0 + rad; 
      vel.x = -vel.x;
    }
    
    if (pos.x > width - rad)
    {
      pos.x = width-rad;
      vel.x = -vel.x;
    }
    
    if (pos.y < 0 + rad)
    {
      pos.y = 0 + rad;
      vel.y = -vel.y;
    }
    
    if (pos.y > height - rad)
    {
      pos.y = height - rad;
      vel.y = -vel.y;
//      vel.y = -.999*vel.y;
    }
    
  }
  
}



class Spark
{
  PVector pos, vel, rotPos, posToRot, spawnPoint;
  float count, firstCount, theta, a, freq, strokeW;
  int relFrameCount;
  
  Spark(PVector spawn)
  {
    spawnPoint = spawn;
    pos = new PVector(0,0);
    vel = new PVector(random(-5,5),0);
    count = random(5,30);
    firstCount = count;
    
    relFrameCount = 0;
    
    theta = random(360);
    
    strokeW = 5;
    
    freq = random(.01,.5);
    
  }
  
  void update()
  {
    count-=.4;

    pos.add(vel);
    
    relFrameCount +=1;

  }
  
  void display()
  {
    posToRot = new PVector (pos.x + vel.x + noise(relFrameCount)*10, pos.y - count*sin(relFrameCount*freq));
    rotPos = new PVector((cos(theta)*posToRot.x) + (-sin(theta)*posToRot.x),
      (sin(theta)*posToRot.x) + (cos(theta)*posToRot.y));
    rotPos.add(spawnPoint);
    a = map(count, 0, firstCount, 0, 255);
    float sW = map(count, 0, firstCount, 0, strokeW);
    if(count > 0)
    {
      strokeWeight(sW);
      stroke(255, 50, 50, a);
      point(rotPos.x, rotPos.y);
    }
  }
}
class Star
{
  int type;
  PVector sPos, pos, p;
  color col;
  float freq, weight, a, rad, saveWeight;
  //ArrayList bods;

  Star(int mode, float pulseFreq, color c, float sWeight)
  {
    type = mode;
    col = c;
    sPos = new PVector(int(round(random(width))), int(round(random(height))));
    freq = pulseFreq;
    pos = sPos;
    weight = sWeight;
    saveWeight = weight;
    //set initial alpha value
    a = 255;
  }
      
  void display(ArrayList allBalls)
  {
    if(allBalls.size() > 0)
    {
      for(int i = allBalls.size()-1; i > -1; i--)
      {
        Body b = (Body)allBalls.get(i);
        if(b.active){
          //print("hello");
          PVector ballPos = b.pos;
          PVector vector = PVector.sub(sPos, ballPos);
          PVector nVector = vector;
          float rad = b.rad;
          if(b.bodyType == 0){
            rad*=1.5;}

          float distance = PVector.dist(pos, ballPos);
          float sDistance = PVector.dist(sPos, ballPos);

          weight = saveWeight;

          if(distance <= rad)
          {
            float prop = (rad-sDistance)/rad;
            nVector = vector;
            nVector.mult(prop);
            pos = PVector.add(nVector, sPos);
            weight*=1.5;
            break;
          }
          else if (distance > rad)
          {
            pos = sPos;
          }

        }       
      }
    } else {pos = sPos; weight = saveWeight;}//this line added in for reset
  
    a = round(map(sin(frameCount*freq), -1, 1, 0, 255));
    stroke(col,a);
    strokeWeight(weight);
    point(pos.x, pos.y);
    
  }   

  
//  void rangeList(ArrayList allBalls)
//  {
//    if(allBalls.size() > -1)
//    {
//      for(int i = allBalls.size()-1; i > -1; i--)
//      {
//        Body b = (Body)allBalls.get(i);
//        if(PVector.dist(b.pos,sPos)<b.rad)
//        {           
//          if(b.active){
//            bods.add(b.pos);
//          }
//        }
//      }
//    }   
//  }
}
//name class Starfield
class Starfield
{
  
  //Star(int mode, PVector position, float pulseFreq, color c, float sWeight)
  
  //name an ArrayList pos
  ArrayList Stars;
  
  //name integers for length of array position, alpha and passed in layer/mode
  int ArraySize, layer;
  float freq, weight;
  color col;
  
  //declare internal properties of Starfield and mode pass in
  Starfield(int mode, float pulseFreq, color c, float sWeight)
  {
    //length of array is relative to screen proportions
    ArraySize = (width/60)*(height/60);
    //layers/incoming modes represent different Starfield configurations and timing
//    layer = mode;
//    //
//    freq = pulseFreq;
//    //
    col = c;
//    //
//    weight = sWeight;
    
    
    
    //create ArrayList of positions
    Stars = new ArrayList();
    
    //for loop runs through ArrayList, adding spaces equal to the ArraySize
    //and generating random x and y co-ordinates within the screen bounds
    for(int i = 0; i<ArraySize; i++)
    {
//      Stars.add(Star(layer, freq, col, weight));
      Stars.add(new Star(mode, pulseFreq, col, sWeight));
    }
  }
  
  //display checks for inout mode and draws points at each location on the relative ArrayList
  void display(ArrayList allBalls)
  {
      for(int i = 0; i<ArraySize; i++)
      {
        Star s = (Star)Stars.get(i);
        s.display(allBalls);
      }

  }
}


