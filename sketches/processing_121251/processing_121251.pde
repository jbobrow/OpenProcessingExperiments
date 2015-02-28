
Meteor meteor1; 
Meteor meteor2;
Meteor meteor3;
Meteor meteor4;
Meteor meteor5;
Meteor meteor6;
Meteor meteor7;
Meteor meteor8;
Meteor meteor9;
Meteor meteor10;

int point = 0; 

void setup()
{
  size(600,600);
  meteor1 = new Meteor();
  meteor2 = new Meteor();
  meteor3 = new Meteor();
  meteor4 = new Meteor();
  meteor5 = new Meteor();
  meteor6 = new Meteor();
  meteor7 = new Meteor();
  meteor8 = new Meteor();
  meteor9 = new Meteor();
  meteor10 = new Meteor();
}

void draw()
{
  background(255,255,255);

  meteor1.tegn();
  meteor1.fald();
  
  meteor2.tegn();
  meteor2.fald();
  
  meteor3.tegn();
  meteor3.fald();
  
  meteor4.tegn();
  meteor4.fald();
  
  meteor5.tegn();
  meteor5.fald();
  
  meteor6.tegn();
  meteor6.fald();
  
  meteor7.tegn();
  meteor7.fald();
  
  meteor8.tegn();
  meteor8.fald();
  
  meteor9.tegn();
  meteor9.fald();
  
  meteor10.tegn();
  meteor10.fald();
  
  fill(0,0,0);
  text("Bolde: " + point, 20,20);
  
}


class Meteor
{

  float xPos;
  float yPos;
  float fart;
  color c;
  
  
  Meteor()
  {
    c = color(random(0,255),random(0,255),random(0,255));
    xPos = random(0,600);
    yPos = random(-150,-20);
    fart = random(2,12);
  
  }
  
  
  void tegn()
  {
    
    
    fill(c);
    ellipseMode(CENTER);
    ellipse(xPos,yPos,10,10);
       
    
  }
  
  void fald()
  {
    yPos = yPos+fart;
    
    if(yPos>600+20)
    {
      yPos = random(-150,-20);
      xPos = random(0,600);
      fart = random(2,12);
      c = color(random(0,255),random(0,255),random(0,255)); 
      point++;
    }
    
  }









}


