
//variables
int y = 1;

//speed variables
float x =random(75, 225);
float xspeed;
float yspeed;
float negxspeed=(-1*xspeed);
int i=75;

//triangle variables
int triax;
int triay;
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
    yspeed=.8+yspeed;
    fill(250, 166, 63);
    ellipse(x+xspeed, y+yspeed, 10, 10);
  }
  else if (x<150) {

    yspeed=1+yspeed;
    fill(250, 166, 63);
    ellipse(x+negxspeed, y+yspeed, 10, 10);
  }


//EARTH
    triax=10;
    triay=599;
    fill(179,234,52);
    strokeWeight(3);
    stroke(150,255,75);
  for (int i=10; i<600; i+=30) {
    triangle(i,triay, i+10,triay-10, i+8,triay);
      }
    //    triangle(triax,triay, triax+4,triay-10, triax+8,triay);
    //    triangle(triax+30,triay, triax+34,triay-10, triax+38,triay);
    //    triangle(triax+60,triay, triax+64,triay-10, triax+68,triay);
    //    triangle(triax+90,triay, triax+94,triay-10, triax+98,triay);
    //    triangle(triax+120,triay, triax+124,triay-10, triax+128,triay);
    //    triangle(triax+150,triay, triax+154,triay-10, triax+158,triay);
    //    triangle(triax+180,triay, triax+184,triay-10, triax+188,triay);
    //    triangle(triax+210,triay, triax+214,triay-10, triax+218,triay);
    //    triangle(triax+240,triay, triax+244,triay-10, triax+248,triay);
    //    triangle(triax+270,triay, triax+274,triay-10, triax+278,triay);
    
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


