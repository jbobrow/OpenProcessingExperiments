
float eyeR = 255; //variable eye will be Red and will be the full 255
float eyeG = 255; //variable eye will be Green and will be the full 255
float eyeB = 255;//variable eye will be Blue and will be the full 255

void setup() //setting up the actual game
{
  size(600, 600); //size of the game
  background(0); //background kept at white
}

float x=0; //variable for the x
int y=0; //variable for y
float changex=5.5; //variable to make the ball bounce
int changey=10;    //variable to make the ball go side to side
void draw()
{
  background(255); //background kept at white
  fill(255,0,0); //colour of the text at the top which is red
  textSize(15); //text size of the writing
  textAlign(CENTER); //aligning the text
  text("You Must Shoot The Target Agent", 300, 30); //the text and what position it is at
  fill(255,0,0); //colour for the text below the first line
  text("BUT YOU ONLY HAVE ONE SHOT!", 300,60); //the text and what position it is at
  text("Press The left or right mouse button to shoot", 300,90); //the text and what position it is at
  
  textSize(30); //size of the text
  fill(eyeR,eyeG,0); // used the eyer and eyeg and left the blue out so it will keep changing to different colours
  text("score",50,30); //the text and its position
  text("0:0",45,90);//the text and its position
  
  
  fill(0, 255, 255, 100); //colour of the shooting crossmark
  ellipse(mouseX, mouseY, 300, 300); //using a circle to follow the mouse and the size of the circle 
  stroke(255,225,0); //the stroke of the cross lines
  line(mouseX-150, mouseY, mouseX+150, mouseY); // lines of the crossmark
  line(mouseX, mouseY-150, mouseX, mouseY+150); //lines of the cross mark
  
  stroke(250);// stroke for the line underneath the writing at the top
  
  line(0,100,600,100);// line under neath
  
  fill(0,200,75); // the colour of the ball
  ellipse(300+y, 300+x, 90, 90); //The ball bouncing
  y=y+changey; //makes the ball bounce side to side
  x=x+changex; // makes the ball bounce up and down
{ 
eyeR = random(255); //random colour for the word fun fair
eyeG = random(255); //random colour for the word fun fair
eyeB = random(255); //random colour for the word fun fair
   fill(eyeR,eyeG,eyeB); //setting the file to the random colours
  textSize(75); //size of the text 
    text("FUN FAIR", 300,500); // the text and its position
}
stroke(250,0,0); //stroke for the stall
fill(190,50,120); // the colour for the stall
rect(0,100,600,90); // the shape of the stall
rect(0,500,600,100); // the shape of the stall
fill(95,25,95); //using a different colour for the stall
rect(0,120,600,50); //the shape of the rect at the top


  if (x>240) //this bounces pass a certain area it will bounce back to a different position
  {
    changex=changex-11;
  }
  if (x<200)//this bounces pass a certain area it will bounce back to a different position
  {
    changex=changex+5;
  }
  if (y>300)//this bounces pass a certain area it will bounce back to a different position
  {
    changey=changey-20;
  }
  if (y<-300)//this bounces pass a certain area it will bounce back to a different position
  {
    changey=changey+20;
  }
  if (mousePressed==true) // if the mouse is pressed what i want to appear is down below
  

  {
    fill(255,0,0); //once the mouse is pressed i want words to appear and this is editing the fill of the words
    textSize(30); // the size of the text appearing once pressed
    textAlign(CENTER); // aligning the text when it appears
    text("You missed!", 300, 425); // you have missed will appear once a shot is fired
    textSize(50); // size of the text
    text("Failed To Hit The Target", 300, 300); //the text and its position.
    
    
  }
}


