
//homework 4
//Copyright Kinnari Thakker August 2011, Pittsburgh 15224


float x,y,wd,ht;
float variance;
int dia;
color firstbg= color(125,125,125);
color last;

void setup()
{
    size(400,400);
    smooth();
    frameRate(120); // this is high because I need the initials to show when dragging along with bg color change
    //maybe I could search for a more appropriate way to do this without making it so slow
    
    //for reference only
    //textSize(24);
    //textAlign(CENTER,CENTER);
    
    dia=400;
    x=200;
    y=200;
    wd=dia; 
    ht=dia;
    last= color(random(256),random(256),random(256));
    
    //baseline
    //line(x+.375*wd, y+.3*ht,x-.375*wd, y+.3*ht);
    strokeWeight(30);
    strokeCap(SQUARE);
}

//Pasted from Homework 2 - Initials drawn with bezier curves
void draw()
{
    background(firstbg);
    fill(53,119,209);
    noStroke();
    ellipse(x,y,wd*.9, ht*.9);
    
    //k
    noFill();
    stroke(164,211,151);
    beginShape();
    vertex(x-.3*wd, y+.3*ht);
    vertex(x-.3*wd,y-.3*ht);
    vertex(x-.3*wd,y+.05*ht);
    bezierVertex( x-.15*wd,y-.125*ht,    x-.1*wd,y-.02*ht,      x-.1*wd,y);
    bezierVertex(  x-.150*wd,y+.125*ht,  x-.3*wd,y+.075*ht,    x-.275*wd,y+.05*ht);
    bezierVertex(  x-.125*wd,y+.3*ht,  x-.125*wd,y+.3*ht,    x-.075*wd,y+.3*ht);
    endShape();

    //stem of the a
    //stroke(249,240,205);
    stroke(240,227,245);
    beginShape();
    vertex(x-.05*wd, y);
    //point(x-.05*wd, y-.05*ht);
    bezierVertex(  x+.125*wd,y-.15*ht,  x+.125*wd, y+.15*ht,  x+.125*wd,y+.15*ht);
    bezierVertex(  x+.125*wd,y+.3*ht,  x+.125*wd, y+.3*ht,  x+.175*wd,y+.3*ht);
    endShape();

     //round part of the a
    beginShape();
    vertex(x+.125*wd,y+.15*ht);
    bezierVertex(  x+.025*wd, y+.05*ht,  x-.05*wd, y+.1*ht, x-.05*wd,y+.2*ht );
    bezierVertex(  x-.05*wd, y+.325*ht,  x+.075*wd, y+.325*ht, x+.125*wd,y+.225*ht );
    endShape();

    //t
    stroke(222,191,67);
    beginShape();
    vertex(x+.225*wd,y-.15*ht);
    vertex(x+.225*wd, y+.25*ht);
    bezierVertex(  x+.225*wd,y+.3*ht,  x+.225*wd, y+.3*ht,  x+.275*wd,y+.3*ht);
    endShape();

    //crossing the t
    beginShape();
    vertex(x+.150*wd,y-.075*ht);
    vertex(x+.3*wd, y-.075*ht);
    endShape();
    
    //for reference only
    //text (key, 320, 380);
    
}

// Starting Interactivity
void keyPressed() //incremental movement
{
  
    if (keyCode == UP) //to move upwards in increments of 10pts
    {
      y = y - 10;    
    }
    else if (keyCode == DOWN) //to move downwards in increments of 10pts
    {
      y = y + 10; 
    }
    if (keyCode == RIGHT) //to move right in increments of 10pts
    {
      x = x + 10;
    }
    if (keyCode == LEFT) //to move left in increments of 10pts
    {
      x = x - 10;
    }
    if (keyCode == ENTER) //return to how you started
    {
      x = 200;
      y = 200;
      dia = 400;
    }
      if (key == 's') //to save screenshot
    {
     //saveFrame("screenshot-####.jpg");
    }

}

void mouseDragged() //moving the initials with dragging and dropping
{
  variance+=0.1; // I'm trying to do a gradual shift in colors, but I need some help. Its very cluncky in its current state
  if (variance >=1)
  {
      variance = 0.0;
      firstbg = last;
      last = color(random(255), random(255), random(255));
  }
  
  background(lerpColor(firstbg, last, variance)); // changes bg color incrementally+randomizes it
  
    if (x == x)
    {
      x = mouseX;
    }
    if (y == y)
    {
      y = mouseY;
    }
}


    
    



