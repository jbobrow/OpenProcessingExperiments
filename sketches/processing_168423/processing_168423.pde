
/*I'll make a class of creating creatures which defiens what they are and
 how they move, how they separate, make collision and other movement.
 Then another class of movenment's guidence which is the upper control system  */

/* I love flocking...I love flocking...I love flocking...I love flocking...I love flocking...*/
//sorry Bob is wearing bikini...

PImage die;
PImage begin;
PImage fish;

PFont f;
int lifes;
 boolean up, right, left, down, restart;
Current fishcurrent;
Man bob;
//Look! Above is the fishcurrent,yeah!
PVector randomPos;
//check belowing webpage to see how to declare a PVector
//https://processing.org/reference/PVector.html
//I hate the quiz...


void setup() {
  size(1000, 600);
  die=loadImage("die.jpg");
  begin=loadImage("begin.jpg");
  fish=loadImage("fish.jpg");
  f = createFont("Arial",16,true); 
  bob=new Man();
  bob.pos.x=20;
  bob.pos.y=300;
 lifes=-5;
 
  fishcurrent=new Current();
  //initialize after the canvas is defined
  //then create the fish current
  for (int i=0; i<140; i++) {
    randomPos=new PVector(random(205, 695), random(0,10));
    fishcurrent.addFish(new Fish(randomPos.x, randomPos.y));
}
}

void draw() {
  background(50);
  fill(10,10,50);
  stroke(100,100,250);
  rect(180,0,640,600);
  fill(0,125,0);
  stroke(0,255,0);
  rect(900,150,10,300);
  fishcurrent.flow(bob);
  bob.run();
  life();
  if(lifes==-5){
    image(begin,-300,-100);
    textFont (f,60);
    fill(255);
    
    text("Click to help Bob \nsurviving from Piranhas!!!",100,450);

    noLoop();
  }
  
  
  if(lifes==0){
    image(die,-200,-60);
 fill(3,80,134);
    
    rect(250,175,500,250);
    textFont (f,40);
    fill(255);
    
    text("YOU WERE EATEN!\nClick to restart!",300,280);
lifes=0;
life();
noLoop();}

if(bob.pos.x>900){
  image(fish,0,0);
    textFont (f,60);
    fill(155);
    
    text("YOU WON!!!",600,250);
bob.pos.x=900;
    noLoop();
}
}

void keyPressed() {//thanks for Processing Reference page

    //Right Hand Movement
    if (key==CODED) {
      if (keyCode==UP) {
        down=false;
        up=true;
      }
      if (keyCode==DOWN) {
        up=false;
        down=true;
      }
      if (keyCode==LEFT) {
        right=false;
        left=true;
      }
      if (keyCode==RIGHT) {
        left=false;
        right=true;
      }
    }
    if (keyCode=='r') {
      restart=true;
    }
  }
  void keyReleased() {

    if (keyCode==UP) {
      up=false;
    }
    if (keyCode==DOWN) {
      down=false;

      if (keyCode=='r') {
        restart=false;
      }
    }

    if (key==CODED) {
      if (keyCode==LEFT) {
        left=false;
      }
      if (keyCode==RIGHT) {
        right=false;
      }
    }
  }

void life(){
  textFont (f,20);
    fill(255);
    textAlign(LEFT);
    text("Life Point",50,100);
    text(lifes,50,120);
    
}

void mouseClicked(){
if(lifes==0||lifes==-5||bob.pos.x==900){
  lifes=30;
  bob=new Man();
  bob.pos.x=20;
  bob.pos.y=300;
  fishcurrent=new Current();
  //initialize after the canvas is defined
  //then create the fish current
  for (int i=0; i<140; i++) {
    randomPos=new PVector(random(205, 695), random(0,10));
    fishcurrent.addFish(new Fish(randomPos.x, randomPos.y));
  }
loop();
}
}

class Current {
Man bob;
  ArrayList<Fish> fish; 
  //here is an array of every individual devil fish

    Current() {
    //Watch this! I initialize the fish array here!
    fish= new ArrayList<Fish>();
    //so this constructer includes 
    //how the fish look like, and how they move!
  }
  //below I gonna make some functions
  //which will instruct those fish to do something
  //here is the first one
  void flow(Man bob) {
    for (Fish f : fish) {
      f.swim(fish,bob);
    }
  }

  void addFish(Fish f) {
    fish.add(f);
  }
}

class Fish {
  //there will be several function
  //the things or the attributes that every element
  //will always carry, will be put in constructer
  //and the things they do will be shown as functions

  //now I'm going to give some attributes
  PVector loc, vel, acc;//deteremins where the element is
  float maxfor, maxspe;//limitations!
  float body, angle;
  //body defines every point of the shape of the body

  Fish(float x, float y/*get ready for postion*/)
  {
    acc=new PVector(0, 0);
    loc=new PVector(x, y);
    vel=new PVector(cos(angle), sin(angle));
    angle=random(TWO_PI);//choose one angle from 360 degree
    body=2.0;
    maxspe=1.58;
    maxfor=0.02;
  }

  //there will be a swim function inside the Current class
  void swim(ArrayList<Fish> fish, Man bob) {
    //actually the fish also flock!
    flock(fish,bob);
    update();//adding the changes to acc, vel, loc, and clear acc
    borders();//set the borders of the river
    render();//make them appear on screen using this function!
  }

  void applyForce(PVector force) {
    acc.add(force);//the force actually is acc
  }

  void flock(ArrayList<Fish> fish, Man bob) {
    PVector sep=separation(fish);
    //this equation will set the return value of separate funtion
    //to sep!
    //If I want collision and bounce effect,
    //I should set a minus acc to it when it touches each other
    PVector ali=align(fish);
    PVector coh=cohesion(fish);
PVector att=attraction(fish,bob);
    sep.mult(20);
    ali.mult(1);
    coh.mult(1);
att.mult(10);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(att);
  }

  void update() {
    vel.add(acc);
    vel.limit(maxspe);
    loc.add(vel);
   if (loc.x <200||loc.x>800) vel.x=-vel.x;
   loc.add(vel);
    acc.mult(0);
  }


  //now it's time for force defination
  PVector align(ArrayList<Fish> fish) {
    float dist=50;
    PVector sum=new PVector(0, 0); //the sum of all elements' force
    int count=0;
    for (Fish other: fish) {
      float d=PVector.dist(loc, other.loc) ;
      if (d>0&&d<dist) {
        sum.add(other.vel); //attention:finaly it's the force of whole other elements
        count++;
      }
    }
    if (count>0) {
      sum.div((float)count);//???what's this?
      sum.normalize();
      sum.mult(maxspe);
      PVector steer=PVector.sub(sum, vel);
      steer.limit(maxfor);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }


  PVector separation(ArrayList<Fish> fish) {
    float dist=20.0f;
    PVector steer=new PVector(0, 0, 0);//???why is it triple 0?
    int count=0;

    for (Fish other:fish) {
      float d=PVector.dist(loc, other.loc);
      if (d>0&&d<dist) {
        PVector diff=PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if (count>0) {
      steer.div((float)count);
    }
    if (steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspe);
      steer.sub(vel);
      steer.limit(maxfor);
    }
    return steer;
  }

  //following is a function which returns a value of force of chasing a target
  //the target can be anything like the sum of all other force,it's not a specific element
  PVector seek(PVector target/*other fish*/)
  {
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxspe);
    //desired vector is the speed that the element is going to be
    //steer is how much it is going to increase
    PVector steer=PVector.sub(desired, vel);
    steer.limit(maxfor);
    return steer;
  }

  PVector cohesion(ArrayList<Fish> fish) {
    float dist = 50;
    PVector sum = new PVector(0, 0);  
    int count = 0;
    for (Fish other : fish) {
      float d = PVector.dist(loc, other.loc);
      if (d > 0 && d < dist) {
        sum.add(other.loc); 
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }


PVector attraction(ArrayList<Fish> fish, Man bob)
{
  PVector steer=new PVector(0,0);
  float dist=200;
  int count=0;
  int countl=0;
  for (Fish f : fish) {
  float d=PVector.dist(loc,bob.pos);
  
  if(d>8&&d<dist){
    PVector diff=PVector.sub(bob.pos,loc);
    diff.normalize();
    diff.div(d);//weight by distance
    steer.add(diff);
  count++;
  }
  else if(d<=8&&d<dist)
  {
    countl++;
  }
  }
  if(countl>0){
   countl=countl/100;
   lifes=lifes-countl;
   
  }
  if(count>0){
    steer.div((float)count);
}
 if (steer.mag() > 0) {
steer.normalize();
      steer.mult(maxspe);
      steer.sub(vel);
      steer.limit(maxfor);
    }
    return steer;
  }
  
//now draw the fish!
void render() {
  float theta = vel.heading2D() + radians(90);
  fill(129,20,152);
    stroke(179,70,172);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    ellipse(0,-body*2.5,body*2.5,body*4);
    beginShape(TRIANGLES);
    vertex(0, -body/2);
    vertex(-body, body);
    vertex(body, body);
    endShape();
    popMatrix();
}

void borders() {
    if (loc.y < -body) loc.y = height+body;
    if (loc.y > height+body) loc.y = -body;
  }
}

class Man {
  PVector pos;
  PVector vel;
 
  
  Man() {
    pos=new PVector(0, 0);
    vel=new PVector(4.4, 4.4);
  }
  void run(){
  update();
  render();
  borders();
  }
  
  

void update(){
  if(up){
    pos.y-=vel.y;
  }
  if(down){
    pos.y+=vel.y;
  }
  if(right){
    pos.x+=vel.x;
  }
  if(left){
    pos.x-=vel.x;
  }
}
void render(){
fill(140);
    stroke(230);
    pushMatrix();
    translate(pos.x, pos.y);
    //body
    rect(-2, -4, 4, 8, 1.2);
    //head
    ellipse(1, -7, 3, 3);
    //arms
    rect(-3.5, -4, 1, 5, 0.3);
    rect(3.7, -3.8, 1, 5, 0.3);
    //legs
    rect(-2, 4, 2, 8, 0.3);
    rect(0, 4, 2, 8, 0.3);
    endShape();
    popMatrix(); 
}
void borders(){
 if(pos.x<6) pos.x=6;
if(pos.x>994) pos.x=994;
if(pos.y<4) pos.y=4;
if(pos.y>594) pos.y=594;
}
}



