
//Homework 8
//Copyright Kinnari Thakker 2011, Pittsburgh 15224


float dia, x, y, deltaX, deltaY, x2, y2, deltaX2, deltaY2, numCol;
PImage img, img2;
int timeElapsed = 0;
void setup()
{
    size (600, 600);
    
    dia = 50;       //     sets size of piranha as well as initials, value is small to make it a little difficult
    x = width/2;
    y = height/2;
    
    deltaX2 = random(2,5);       //      sets speed of piranha
    deltaY2 = random(2,5);       //      sets speed of piranha
    img = loadImage("piranha.png");
    
    textAlign(LEFT);
    textSize(12);
    
    img2 = loadImage("explosion.jpg");
    numCol = 0;
}

void draw()
{
  prepScreen(); 
  
  Initials(x,y,dia,dia);
  moveInitials();
  detectInitials();
  
  movePiranha();
  
  whenCollision();
  
  showStats();
  //saveFrame("hw8.jpg");
  
}

void prepScreen()
{
    noStroke();
    fill(255,255,255,180);
    rect(0,0, width,height);
}

void keyPressed()
{
    if (keyCode == UP) /////////   assigning speed to the arrow keys
  {
    deltaY = deltaY - .5;
  }
 
  if (keyCode == DOWN)
  {
    deltaY = deltaY + .5;
  }
 
  if (keyCode == LEFT)
  {
    deltaX = deltaX - .5;
  }
 
  if (keyCode == RIGHT )
  {
    deltaX = deltaX + .5;
  }

  if (keyCode == 32) ///////   space bar brings initials original state
  {
    x = width/2;
    y = height/2;
    deltaX = 0;
    deltaY = 0;
  }

}
void moveInitials()
{
    x = x + deltaX;
    y = y + deltaY;
}

void movePiranha()
{
    image(img, x2, y2, dia, dia);
    
    x2 = x2 + deltaX2;               //////    moving the piranha
    if(x2 > width - dia || x2 < 0)
    {
       deltaX2 = -deltaX2;
    }

    y2 = y2 + deltaY2;
    if(y2 >= width - dia || y2 < 0)
    {
       deltaY2 = -deltaY2;
    }
}

void whenCollision()
{
    if (dist(x2,y2,x,y) < 1.4*dia)    //////   if the distance between the x,y values is <= dia, then there is collision
    {
      fill(255);
      noStroke();
      rect(0,0,width,height);
      fill(255,0,0);
      image(img2, x-100, y-100, 200, 200); //   explosive image when collision
      
      x2 = random(0,width-dia);
      y2 = random(0,height-dia);
      deltaX2 = -deltaX2;
      deltaY2 = -deltaY2;
      
      numCol = numCol + 1; ////  counting collisions
      //println(numCol);  
    }    
}

void detectInitials()
{
    if(x > width + dia/2 || y > height+dia/2 || x < 0 - dia/2 || y < 0 - dia/2)
    {
        fill(80);
        strokeWeight(0.5);
        stroke(80);
        line(width/2, height/2, x,y);
        text("The initials are outside the area of the program,", 15, 60);
        text("try bringing them back in (or press the space bar)", 15, 80);
        text(round(x), width/2 + 15,height/2);
        text(",", width/2 + 50,height/2);
        text(round(y), width/2 + 60,height/2);
    }
}

void showStats()
{
   int timeElapsed = millis();

    //text("Horizontal speed: "+
   text("Collisions: "+ round(numCol), width-150, height-75);
   text("Time: "+ timeElapsed/1000 +" secs.", width-150, height-60);
   text("Horizontal Speed: "+ deltaX , width-150, height-45);
   text("Vertical Speed: "+ deltaY , width-150, height-30);
}


// Initials code pasted from prev assignment //
void Initials(float x, float y, float wd, float ht) //Setting up Initials
{

  fill(50,165,130);  // Bounding ellipse
  noStroke();
  ellipse(x,y,wd*.9, ht*.9);

  noFill();    // Initial strokes start here
  strokeWeight(2);
  strokeCap(SQUARE);
  stroke(164,211,151);

  //k
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
}


