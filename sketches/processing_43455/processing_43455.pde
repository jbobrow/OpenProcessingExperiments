
//set up the refferances for the two objects
Bot b;
Wall w;

//set up function called once 
void setup() {
  //set the window size width & height
  size(500, 500);

  //instanceate an object of type Bot and 'hang it off' the refferance b we set up earlyer
  // this effectivley calls the constructor and sets up the object attributes in this case x y and radious
  b = new Bot(60, 60, 10);

  //instanceate an object of type Wall and 'hang it off' the refferance b we set up earlyer  
  //our wall class contructor wants to know an x, y ,w and h value
  w = new Wall(100, 50, 100, 100);
}


//now we have instanciated objects based on the two classes we are using
//we want to do soem stuff with them in our draw function

void draw() {
  //refreash the screen with a just off black colour
  background(50);


  //check to see if your bot has collided in with the wall
  boolean xCollision =w.collisionX(mouseX, mouseY, b.getR());
  boolean yCollision =w.collisionY(mouseX, mouseY, b.getR());


  // no collision update the bot
  if (!xCollision || !yCollision) {
    b.updateY();
    b.updateX();
  }

  w.render();
  b.render();
}

/*
  this is the wall class
  it encapsulat its dimentions
  and has methods to:
  detect collisions
  render it's self 
*/
class Wall {
  //dimention attributes
  int x;
  int y;
  int w;
  int h;

  //constructor this is used when we instanciate the object and set the values of all of the wall attributes
  //based on the paramaters passed you may wish to introduce colour and other attributes
  public Wall(int x, int y, int w, int h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }

  //this method returns true if the current bot possition is inside the x boundaries of the wall
  boolean collisionX(int botX, int botY, int botR) {
    if ( botX - botR < x+w &&  botX + botR > x) {
      return true;
    }
    else {
      return false;
    }
  }

  //this metthod returns true if the bot is inside the y boudaries of the wall
  boolean collisionY(int botX, int botY, int botR) {
    if (botY - botR < y+h && botY + botR > y) {
      return true;
    }
    else {
      return false;
    }
  }

  //this returns true if the bot is inside the wall
  boolean collision(int botX, int botY, int botR) {
    if ( botX - botR < x+w &&
      botY - botR < y+h &&
      botX + botR > x &&
      botY + botR > y)
    {
      fill(255, 30, 30);
      return true;
    }
    else {
      fill(255);
      return false;
    }
  }
  
  
  //this draws a rectange with the attribute of this particular wall
  void render() {

    rect(x, y, w, h);
  }
}


/*
  bot class
  
  this encapsulates all of hte attributes and methodes required 
  for the bot wich is the thing drawn at theo mosue x y
  
  this has accesor methods to retriev the Bot attributes
  and a method to render it
*/

class Bot {
  //bot attributers position and radious
  int x;
  int y;
  int r;
  
  //bot constructor to initilise all those attributes when you instanciate an object
  public Bot(int x, int y, int r) {
    this.x=x;
    this.y=y;
    this.r=r;
  }
  
  //accesor methods for the attributes ofthe class
  // this is a mechanisme to grab a copy of the attributes
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getR() {
    return r;
  }

  //a method to update the x value of the bot
  void updateX() {    
    this.x = mouseX;
  }

  // a method to update the y value of the bot
  void updateY() {
    this.y = mouseY;
  }

  // this fucntion is used to draw the bot
  void render() {
    ellipse(this.x, this.y, this.r*2, this.r*2);
  }
}


