
int z=0; // variable for the background mesh

PImage xis;   // image of x
PImage ball;   // image of 0

PFont arial; // variable source

// variables of location
int  x1XIS; // image x
int  y1XIS; // image x
int  x1Ball; // image 0
int  y1Ball; // image 0

//  variables of each of the 9 areas
int area1=0; 
int area2=0;
int area3=0;
int area4=0;
int area5=0;
int area6=0;
int area7=0;
int area8=0;
int area9=0;


void setup() {
size (500,320);
background(253,230,60);
stroke(0);
fill(0);
smooth();


// build background mesh
for(z=100; z<300; z=z+110) {
  rect(z,0,10,320);
  rect(0,z,320,10);
  }

stroke(253,33,132); // background score
fill (253,33,132);
rect(320,0,180,320);

  PImage xis_icone;   // image of x - score
  xis_icone = loadImage("xis_icone.jpg");
  image(xis_icone, 340,100);
  PImage ball_icone;   // image of 0 - score
  ball_icone = loadImage("ball_icone.jpg");
  image(ball_icone, 340,180);

    xis = loadImage("xis.jpg");
    ball = loadImage("ball.jpg");
  
arial = loadFont( "ArialMT-20.vlw" );


}


void draw()
{
  textFont (arial); 
  fill(0); // color
  text ("score",350,50);  // show text
 
 

    
  if(mouseX<600&&mouseX>320 && mouseY<320&&mouseY>0) // area of score
  { 
    noCursor();
   
  }
  else
  {
    cursor(HAND); //to know where to click
  }
}

int x=1;  // variable to mouse click
int cliques=0;

void mousePressed()
{
  if(cliques<=8)// limit total move
  {
    cliques +=1;
    
if (x == 1)
{

    //delimitation of areas
    if (mouseX<110&&mouseX>0 && mouseY<110&&mouseY>0 )  // area 1
    {
      x1XIS= 0; // vertex upper left of the image x
      y1XIS= 0;
      area1=1;
      x = 2;
     
    }
    if (mouseX<220&&mouseX>110 && mouseY<110&&mouseY>0) // area 2
    {
      x1XIS= 110; // vertex upper left of the image x
      y1XIS= 0;
      area2=1;
      x = 2;
    }
    if (mouseX<320&&mouseX>220 && mouseY<110&&mouseY>0) // area 3
    {
      x1XIS= 220; //vertex upper left of the image x
      y1XIS= 0;
      area3=1;
      x = 2;
    }
    if (mouseX<110&&mouseX>0 && mouseY<220&&mouseY>110) // area 4
    {
      x1XIS= 0; // vertex upper left of the image x
      y1XIS= 110;
      area4=1;
      x = 2;
    }
    if (mouseX<220&&mouseX>110 && mouseY<220&&mouseY>110) // area 5
    {
      x1XIS= 110; // vertex upper left of the image x
      y1XIS= 110;
      area5=1;
      x = 2;
    }
    if (mouseX<320&&mouseX>220 && mouseY<220&&mouseY>110) // area 6
    {
      x1XIS= 220; // vertex upper left of the image x
      y1XIS= 110;
      area6=1;
      x = 2;
    }
    if (mouseX<110&&mouseX>0 && mouseY<320&&mouseY>220) // area 7
    {
      x1XIS= 0; // vertex upper left of the image x
      y1XIS= 220;
      area7=1;
      x=2;
    }
    if (mouseX<220&&mouseX>110 && mouseY<320&&mouseY>220) // area 8
    {
      x1XIS= 110; //vertex upper left of the image x
      y1XIS= 220;
      area8=1;
      x =2;
    }
    if (mouseX<320&&mouseX>220 && mouseY<320&&mouseY>220) // area 9
    {
      x1XIS= 220; // vertex upper left of the image x
      y1XIS= 220;
      area9=1;
      x = 2;
    }
    image(xis, x1XIS, y1XIS);
}
 else
{
     //delimitation areas
    if (mouseX<110&&mouseX>0 && mouseY<110&&mouseY>0 )  // area 1
    {
      x1Ball= 0; // vertex upper left of the image 0
      y1Ball= 0;
      area1=2;
      x = 1;
    }
    if (mouseX<220&&mouseX>110 && mouseY<110&&mouseY>0) // area 2
    {
      x1Ball=110; //vertex upper left of the image 0
      y1Ball=0;
      area2=2;
      x = 1;
    }
    if (mouseX<320&&mouseX>220 && mouseY<110&&mouseY>0) // area 3
    {
      x1Ball= 220; // vertex upper left of the image 0
      y1Ball= 0;
      area3=2;
      x = 1;
    }
    if (mouseX<110&&mouseX>0 && mouseY<220&&mouseY>110) // area 4
    {
      x1Ball=0; // vertex upper left of the image 0
      y1Ball=110;
      area4=2;
      x = 1;
    }
    if (mouseX<220&&mouseX>110 && mouseY<220&&mouseY>110) // area 5
    {
      x1Ball=110; // vertex upper left of the image 0
      y1Ball=110;
      area5=2;
      x = 1;
    }
    if (mouseX<320&&mouseX>220 && mouseY<220&&mouseY>110) // area 6
    {
      x1Ball=220; // vertex upper left of the image 0
      y1Ball=110;
      area6=2;
      x = 1;
    }
    if (mouseX<110&&mouseX>0 && mouseY<320&&mouseY>220) // area 7
    {
      x1Ball=0; // vertex upper left of the image 0
      y1Ball=220;
      area7=2;
      x = 1;
    }
    if (mouseX<220&&mouseX>110 && mouseY<320&&mouseY>220) // area 8
    {
      x1Ball=110; // vertex upper left of the image 0
      y1Ball=220;
      area8=2;
      x = 1;
    }
    if (mouseX<320&&mouseX>220 && mouseY<320&&mouseY>220) // area 9
    {
      x1Ball=220; // vertex upper left of the image 0
      y1Ball=220;
      area9=2;
      x = 1;
    }
    image(ball, x1Ball, y1Ball);
}
 
 
   
    // possibility of x win
    if ((area1 == 1 && area2 == 1 && area3 == 1 ) ||
        (area4 == 1 && area5 == 1 && area6 == 1 ) ||
        (area7 == 1 && area8 == 1 && area9 == 1 ) ||
        (area1 == 1 && area4 == 1 && area7 == 1 ) ||
        (area2 == 1 && area5 == 1 && area8 == 1 ) ||
        (area3 == 1 && area6 == 1 && area9 == 1 ) ||
        (area1 == 1 && area5 == 1 && area9 == 1 ) ||
        (area3 == 1 && area5 == 1 && area7 == 1 ) )
    {
      text ("won!",400,130); //shows won to x
      // c = c +1;
      //text (c,400,150);
    }
    //possibility of 0 win
    else if ((area1 == 2 && area2 == 2 && area3 == 2) ||
             (area4 == 2 && area5 == 2 && area6 == 2) ||
             (area7 == 2 && area8 == 2 && area9 == 2) ||
             (area1 == 2 && area4 == 2 && area7 == 2) ||
             (area2 == 2 && area5 == 2 && area8 == 2) ||
             (area3 == 2 && area6 == 2 && area9 == 2) ||
             (area1 == 2 && area5 == 2 && area9 == 2) ||
             (area3 == 2 && area5 == 2 && area7 == 2))
      {
        text ("won!",400,210); // shows won to 0
      }
      // if no one wins
      else if (cliques>=9)
      {
        text ("draw!",350,280);
      }
      
      
  }
}
    
       



