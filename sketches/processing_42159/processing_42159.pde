
//variables
float y = 1;
int sunbiteY=0;
int sunbiteSpeed=int(random(1, 30));

//speed variables
float x =random(75, 225);
float xspeed=1;
float yspeed=1;
int grassspeed=1;
float negxspeed=(-1*xspeed);
int i=75;

//sunBite variables
float rectx=random(75,225);
float rectSpacing=random(20,200);
float ellipsex=random(75,225);


//triangle variables
int triax = 10;
int triay = 599;
int triaTop = triay-10;
int topx; //top x vertices
int topy; //top y vertices
int rightx; //right x vertices
int righty; //right y vertices

void setup() {
  size(300, 600);
  smooth();
}

void draw() {
  background(124, 221, 255);

  //sun bites
  if (x>150) {
    xspeed=.25+xspeed;
    yspeed=1+yspeed;
    fill(250, 166, 63);
    ellipse(x+xspeed, y+yspeed, 10, 10);
  }
  if (x<150) {
    x = x-xspeed/2;
    y = y+yspeed;
    fill(250, 166, 63);
    ellipse(x-1, y-1, 10, 10);
  }

  if (sunbiteY>100) {
    sunbiteY=0;
  } 
  else if (sunbiteY<100) {
    sunbiteY= sunbiteY+sunbiteSpeed;
  }
  ellipse(x+negxspeed, y+yspeed, 10, 10);
 
  rect(rectx+xspeed, y+yspeed/.25, 10,10);
  rect((rectx-rectSpacing)+xspeed, y+yspeed/.2, 10,10);
  
  ellipse(ellipsex-xspeed,y+yspeed/.4,10,10);


  //EARTH
  if (mousePressed) { 
    triaTop = triaTop-grassspeed;
  }

  fill(179, 234, 52);
  strokeWeight(3);
  stroke(150, 255, 75);
  for (int i=10; i<600; i+=30) {
    triangle(i, triay, i+10, triaTop, i+8, triay);
    triaTop=constrain(triaTop, 200, 600);
  }

  //LOOP TO GET TRIANGLES TO MOVE UP, NOT WORKING
  //for (int j=600; j>300; j+=10) {
  //  triangle(i,j, i+4,j-10, i+8,j);
  //}




  //SUN
  ellipseMode(CENTER);
  stroke(250, 234, 83);
  fill(mouseX*15, mouseX, -1*mouseX);
  ellipse(150, -20, 150, 150);
  //for (int i = 225; i>=75; i+=20); LOOP FOR RAYS OF SUN NOT WORKING
  //line(i,0,i+i/2,180);




  //WHAT IS X??
  println("x is now:" + x);
}


