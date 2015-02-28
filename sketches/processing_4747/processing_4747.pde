
int rondX = 1; //X 
int rondY = 1; //Y 
int blauw = 90; //Blauw
int rood = 60; //Rood
int groen = 30; //Groen
int trans = 20; //Transpa

//Basics
  void setup() 
  
{   smooth();
    size(600,800);
    background(200,200,200);
    frameRate(300);}

//Rondje       		  
  void draw()
     
{   noStroke();
    
    fill(100,20);
    ellipseMode(CORNER);
    ellipse(mouseY,mouseX,rondX,rondY);
    
    fill(100,20);
    ellipseMode(CORNER);
    ellipse(mouseX,mouseY,rondX,rondY);
       
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,rondX,rondY);
     
    fill(rood,blauw,groen,trans);
    ellipseMode(CENTER);
    ellipse(mouseY,mouseX,rondX,rondY);

    
    fill(groen,blauw,rood,trans);
    ellipse(mouseX,mouseY,rondX,rondY);}
    

{   blauw = int(random(0,255));
    rood = int(random(0,255));
    groen = int(random(0,255));
    trans = int(random(0,255));}

//Drukknop
  void mousePressed()
  
{   rondX = rondX +5;
    rondY = rondY +5;
    blauw = int(random(0,255));
    rood = int(random(0,255));
    groen = int(random(0,255));
    trans = int(random(0,255));}

