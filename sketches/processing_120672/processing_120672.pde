
int x = 400; // set central point on x axis Glen is built around this variable
int y = 480; // set central point on y axis Glen is built around this variable
float r = 0.0; //scaling point for Glen
int rocketX = 100;  //starting x position for rocket
int rocketY = 800; //starting y position for rocket
int rocketX1 = 100; //starting x position for static rocket before exit 
int rocketY1 = 195; //starting y position for static rocket before exit 
int phase = 0;  //starting phase for draw()
int speed = 10; //speed of Glen on Moon
boolean button = false;  //boolean for button colour on mouse press

 

 
// set how many, colour and size of background stars
int[] starX = new int[600];
int[] starY = new int[600];
color[] starColor = new color[600];
int starSize = 4; // the size of stars

 
 
void setup() {
  size(600,600);//declare size of display window
  background(0);//black background
  smooth();//make it smooth
 
  // create the star locations
  // For loop selecting random positions and colours of stars
  for (int i = 0; i < starX.length; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(100,255));
  }
}
 
void draw() {
    drawStars();//call code to draw stars
    drawMoon();//call code to draw moon
    drawRocket();//call code to call rocket arriving
    // Phase 1 - Rocket is stationary
    // Phase 2 - Glen has been returned to the rocket and sketch is 
    //           redrawn without Glen
    // Phase 3 - Rocket ready to exit
    if (phase == 1) {
      drawGlen();
    } else if (phase == 2) {
        drawStars();
        drawMoon();
        drawRocketStatic();
        phase = 3;
    } else if (phase == 3) {
        drawStars();
        drawMoon();
        drawRocketExit();
    }        
}
 
//code to draw stars
void drawStars() {
 
  stroke(0); //stroke is black
  strokeWeight(1); //fine stroke
  for (int i = 0; i < starX.length; i++) { //expand star size
    fill(random(50,255)); // makes them appear to be twinkling by assigning a random grey to white colour
    if (random(10) < 1) { //vary the colour if the random colour gets too dark
      starColor[i] = (int)random(100,255);//random integer constrained to 100 to 255 for star colour
    }
    fill(starColor[i]);//fill stars with random colours constrained to 100 to 255
    ellipse(starX[i], starY[i], starSize, starSize);//draw stars
  }
}
 
//code to draw moon
void drawMoon() {
  background(0);//black background
  drawStars();//draw the stars
  ellipseMode(CENTER);//set ellipseMode to center
  noStroke();//no stroke required
  fill(210);//fill with light grey
  ellipse(600, 1000, 1200, 1200);//draw the moon
  
  stroke(240);//light grey stroke
  strokeWeight(10);//set strokeWeight to 10
  fill(160);//dark grey craters
  ellipse(300,560,140,50);//draw first crater
 
  rotate(radians(352)); //tilt the first moon crater
  ellipse(520,520,120,50);//draw the second crater
  rotate(radians(10)); //tilt the third moon crater
  ellipse(550,575,120,50); //draw the third crater
}
 

//code to draw rocket arriving
void drawRocket() {
  noStroke();//no stroke required
  fill(255); //white fill for rocket
  arc(rocketX,rocketY,50,300,-PI,0);//draw an arc for the rocket
  stroke(255,0,0);//red fill for flames
  strokeWeight(6); //strokeWeight set to 6
  fill(245,213,49);//yellow fill for flames
  ellipse(rocketX-10, rocketY+30, 10, 40);//draw flames
  ellipse(rocketX+10, rocketY+30, 10, 40);//draw flames
  noStroke();//set noStroke
  fill(255);//set fill to white for tail of rocket
  triangle(rocketX,rocketY-50,rocketX+30,rocketY+30,rocketX-30,rocketY+30);  //draw tail of rocket
  stroke(255,0,0);//set red fill for door of rocket
  strokeWeight(4);//set strokeWeight to 4
  fill(240); //set grey fill
  ellipse(rocketX,rocketY-70, 25,25);//draw door of rocket

  
  rocketY = constrain(rocketY,200,800);//rocketY variable is constrained to 800 to 200 to stop rocket at appropriate position
  rocketY -= 5;  //speed of rocket arriving
  if (rocketY == 200) {
  phase = 1;  //change phase to 1 to indicate Glen can now leave rocket
  } 
}
//draw static rocket with closed door - called when Glen is returned to the rocket
void drawRocketStatic() {
  noStroke();  //set noStroke
  fill(255);//set fill colour to white
  arc(rocketX1,rocketY1,50,300,-PI,0);//draw an arc for the rocket
  stroke(255,0,0);//set red stroke
  strokeWeight(6);//set strokeWeight to 6
  fill(245,213,49);//yellow for flames
  ellipse(rocketX1-10, rocketY1+30, 10, 40);//draw flame 1
  ellipse(rocketX1+10, rocketY1+30, 10, 40);//draw flame 2
  noStroke();//set no stroke
  fill(255);//set fill colour back to white
  triangle(rocketX1,rocketY1-50,rocketX1+30,rocketY1+30,rocketX1-30,rocketY1+30);//draw rocket tail
  stroke(255,0,0);//set fill colour to red again
  strokeWeight(4);//set strokeweight to 4
  fill(240);//fill with grey - thereby closing door
  ellipse(rocketX1,rocketY1-70, 25,25); //draw door of rocket
}
//draw rocket leaving the display window
void drawRocketExit() {
  noStroke();//set no stroke
  fill(255);//set fill colour to white
  arc(rocketX1,rocketY1,50,300,-PI,0);//draw an arc for the rocket
  stroke(255,0,0);//set stroke colour to red for flames
  strokeWeight(6); //set stroke weight to 6
  fill(245,213,49);//fill colour is yellow for flames
  ellipse(rocketX1-10, rocketY1+30, 10, 85);//flame 1 - increased in size on the y axis
  ellipse(rocketX1+10, rocketY1+30, 10, 85);//flame 2 - increased in size on the y axis
  ellipse(rocketX1-5, rocketY1+30, 10, 85);//flame 3 - increased in size on the y axis
  ellipse(rocketX1+5, rocketY1+30, 10, 85);//flame 4 - increased in size on the y axis
  noStroke();//set no stroke
  fill(255);//set fill colour to white
  triangle(rocketX1,rocketY1-50,rocketX1+30,rocketY1+30,rocketX1-30,rocketY1+30);//draw rocket tail
  stroke(255,0,0);//set stroke to red
  strokeWeight(4);//set stroke weight to 4
  fill(240);//fill with light grey
  ellipse(rocketX1,rocketY1-70, 25,25); //draw door of rocket
  
  rocketY1 -= 12;  //speed of rocket exiting

} 
  
void drawGlen() {
  
  //rocket door
  stroke(255,0,0);//set stroke colour to red
  strokeWeight(4);//set stroke weight to 4
  fill(0);//set fill colour to black to open door of rocket
  ellipse(rocketX,rocketY-70, 25,25);//draw the door of the rocket
  
  //position Glen
  translate(80,100);//position that Glen will arrive from
  scale(r);//scaling variable for Glen
  
  //tether
  stroke(255);//set stroke to white
  strokeWeight(4);//set stroke weight to 4
  line(50,80,x,y); //draw tether attached to Glen at x and y
  
  //helmet
  strokeWeight(4);//reduce the strokeWeight
  stroke(230);//make the stroke light grey
  fill(230);//make fill colour light grey
  ellipseMode(CENTER);//change ellipse mode to CENTER
  arc(x,y,210,340,-PI,0);//draw an arc for the helmet
 
  //inside helmet
  stroke(229,249,252);//change stroke colour to light blue
  fill(242,227,208);//change fill colour to skin colour
  ellipse(x,y-80,150,100);//draw the ellipse for the inside of the helmet
 
  //eyes
  stroke(255);//change stroke colour to white
  strokeWeight(2);//reduce strokeWeight
  fill(255);//change fill colour to white
  ellipse(x-30,y-100,40,40);//left eye
  ellipse(x+30,y-100,40,40);//right eye
  stroke(0);//change stroke colour to black
  fill(0);//change fill colour to black
  ellipse(x-30,y-100,3,3);//left pupil
  ellipse(x+30,y-100,3,3);//right pupil
 
  //mouth
  strokeWeight(3);//increase strokeWeight
  fill(242,227,208);//fill with skin colour
  bezier(x-40,y-50,x-20,y-35,x+20,y-35,x+40,y-50);//curve of mouth
 
  //body
  stroke(255);//change stroke colour to white
  fill(255);//fill with white
  quad(x-80,y,x+80,y,x+120,y+120,x-120,y+120);//quad for body
 
  //trousers
  stroke(230);//change stroke colour to light grey
  fill(230);//change fill colour to light grey
  quad(x-119,y+121,x+119,y+121,x+80,y+162,x-80,y+162);//quad for trousers
 
  //pocket
  fill(60,115,206);//change fill colour to blue
  stroke(60,115,206);//change stroke colour to blue
  rectMode(CENTER);//update rectMode to CENTER
  rect(x+30,y+60,80,80);//rectangular pocket
 
  //buttons 
   if (mousePressed) {
    button = true; 
  } else {
    button = false;
  } 
  if (button) {  
  fill(13,244,250);
  stroke(13,244,250);
  ellipse(x-50,y+30,20,20);//change colour of top button to bright blue
  ellipse(x-55,y+70,20,20);//change colour of bottom button to bright blue  
} else {
  fill(60,115,206); 
  ellipse(x-50,y+30,20,20);//draw top button in blue
  ellipse(x-55,y+70,20,20);//draw top button in blue   
}
  //shoes
  stroke(255);//change stroke colour to white
  fill(255);//change fill colour to white
  arc(x+60,y+172,120,60,-PI,0);//arc for left shoe
  arc(x-60,y+172,120,60,-PI,0);//arc for right shoe
 
  //arms
  stroke(230);//change stroke colour to light grey
  fill(230);//change fill colour to light grey
  quad(x-156,y+30,x-82,y+3,x-97,y+43,x-156,y+70); //right arm
  quad(x+82,y+3,x+156,y+30,x+156,y+70,x+97,y+43); //left arm
 
  //hands
  stroke(255);//change stroke colour to white
  fill(255);//change fill colour to white
  ellipse(x-156,y+50,40,45);//right hand
  ellipse(x+156,y+50,40,45);//left hand
  stroke(230);//change stroke colour to light grey
  fill(230);//change fill colour to light grey
  ellipse(x-156,y+35,15,10);//right thumb
  ellipse(x+156,y+35,15,10);//left thumb
 
  //badge on pocket
  stroke(255);//change stroke colour to white
  fill(255);//change fill colour to white
  rect(x+55,y+35,20,20);//white rectangle
  stroke(60,115,206);//change the stroke colour to blue
  fill(60,115,206);//change the fill colour to blue
  strokeWeight(1);//reduce strokeWeight
  ellipse(x+55,y+35,17,17);//blue circle inside badge
  stroke(206,40,53);//change stroke colour to red
  strokeWeight(2);//increase the strokeWeight
  line(x+45,y+35,x+65,y+30);//red line in badge
  line(x+65,y+30,x+48,y+45);//red line in badge
  strokeWeight(1);//change stroke width to one
  stroke(255);//change stroke colour to white
  noFill();//set no filler colour
  ellipse(x+55,y+35,8,14); //white oval with no filler
  
  r = constrain(r,0.06,0.66);//from the rocket to the moon - constrained
  r += 0.01;//rate at which Glen will travel to the moon
}
  
  //left and right arrow keys to move Glen sideways and back to the rocket
void keyPressed() {
 
  if (key == CODED) {
    if (keyCode == LEFT) { //left arrow key
    if(x > 350)  //stops at left hand side of sketch window
      x = x-speed;//speed that Glen will walk on moon
    } else if (keyCode == RIGHT) //right arrow key
    if(x < 600) //stops at right of moon
      x = x+speed;//speed that Glen will walk on moon
       }     
        if (keyCode == UP) { //up arrow key
     r = constrain(r,0.06,0.66);  //constrain the upward movement of Glen
     r -= 0.02;  //speed at which Glen will diminish in size
     if (r <= 0.04) {  //when Glen reaches the rocket
       phase = 2;      //change the phase to 2
     }   
  }
}


