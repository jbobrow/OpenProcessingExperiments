
int x = 0; //location of x
int speed =1; // speed = 1
float eyeR = 255; //variable eye will be RED and will be the full 255
float eyeG = 255; //variable eye will be Green and will be the full 255
float eyeB = 255; //variable eye will be Blue and will be the full 255
void setup() {
  size(300,300); //size of the page
}// This is my background colour which i have left white as i plain to do a robot so the grey will stand out more in the white
void draw(){
  background(255);
  stroke(0); //Colour of line inbetween
  line(150,0,150,300); //line dividing the page
  line(0,225,300,225); //line dividing the page
  line(0,100,300,100); //line dividing the page
 
  
  if (mousePressed){// if mouse is pressed background turns black
  background(0); //if the mouse is pressed the colour it will change
   x = x + speed; //add speed to the location
if (x > 305 || x < -250) //if pressed the robot will not go off the screen but will return once it hits them co-or
speed = speed * 10; //Once the mouse is pressed the robot will speed up
  }
if (mousePressed)   // if mouse pressed it will bring the objects like rain
for (int x = 0; x < width; x+=50) { // this adds how many rows of lines there are.
  for (int y = 0; y < height; y+=20) { //this adds how many are going up
    stroke(random(255) ); //this is the random colour for the outline of the wee rectangles 
    fill(random(255)); //this is the random fill for the rect
    rect(x+25,y+5,5,5); //this is the co-or for the rect
  }
}

 eyeR = random(255); //Random red have set it to max
  eyeB = random(255); //Random colour Blue have set it to max
  eyeG = random(255); //Random colour Green have set it to max
  fill(eyeR,eyeG,eyeB); //Fill have used all the RGB colours
 if (mouseX < 150 && mouseY < 100) { // if the mouse goes over to set out perimeter it 
   rect(0,0,300,200); // once the mouse has went to the set out perimeter it will then change random colours
 }else if (mouseX > 150 && mouseY >220) { //if the mouse goes over to set out perimeter it 
   rect(300,375,300,300); // once the mouse has went to the set out perimeter it will then change random colours
 }
 //This is the basic shape i have used for the robots main body.
 stroke(0); //the outline colour of the robots body
  fill(175); //what colour the robot is
  rectMode(CENTER); //the position of the robot
x = x + speed; //the speed of the robot moving
if (x > 165 || x < -75) // the robot will not go off the screen but will return once it hits them wall it will return
speed = speed * -1; //the return speed

  //This is the basic shape i have used for the robots main body.
  rectMode(CENTER);//the shape and the position 
  rect(x+100,125,65,100); //the width, height and where it is placed
 // Down below instead of doing the normal two legs for a robot i decided to add one leg for a wheel.
 stroke(75); //the outline colour of the leg
  fill(175); //the colour of the leg
  rectMode(CENTER); //the shape of the leg
  rect(x+100,203,10,55); //the width, height and where it is placed
  //This is the wheels to his leg.
  fill(0); //the fill of the bolt in his wheel
  ellipse(x+100,225,16,16); //the shape of the bolt in the middle of the wheel
  fill(255); //the colour of the wheel
  ellipse(x+100,225,5,5); //the shape of the wheel
  //This is the robots head and the smaller square inside the face.
    stroke(0); //the colour outline of his head
  fill(175); //the colour of the head
  rectMode(CENTER); //shape
  rect(x+100,75,85,50); //shape and where it is placed
  fill(eyeR,eyeG,eyeB);//the random colour for part of his face
  rect(x+100,75,42,25); //shape and where it is placed
  //Here is the Hands
 fill(eyeR,eyeG); //here i have added just two random colours for his hands
  stroke(0); //the outline of his hand
  rect(x+65,165,10,15); //the shape and where the hand is placed
  rect(x+130,165,10,15); //the shape and where the hand is placed
  //Pupils in his eye.
  eyeR = random(255); //random colour of Red
  eyeB = random(255); //random colour of Blue
  eyeG = random(255);//random colour of Green
  fill(eyeR,eyeG,eyeB); //the fill is now all three random colours
  ellipse(x+75,70,16,16); //the eyes
  ellipse(x+125,70,16,16);//the eyes
  //The mouth
    stroke(0); //the outline of the shape
  fill(eyeR,eyeG,eyeB); //the fill has been set to random colours 
  rectMode(CENTER);
  rect(x+100,90,42,10); //the shape, where it is placed and it follow the rest of the body
  //Left Arm
  stroke(0); //the colour of the outline
  fill(0); //the colour of the arm
  rectMode(CENTER);
  rect(x+65,130,15,55); //the shape, where it is placed and it follow the rest of the body
  //Right Arm
  stroke(0); //the colour of the outline
  fill(0); //the colour of the arm
  rectMode(CENTER);
  rect(x+130,130,15,55);  //the shape, where it is placed and it follow the rest of the body
   //Circuit Box in the middle of the body.
  stroke(0); //the colour of the outline
  fill(255); //the colour of the arm
  rectMode(CENTER);
  rect(x+100,140,35,65); //the shape, where it is placed and it follow the rest of the body
  //Left Pupil
  fill(0); //the colour of the arm
ellipse(x+75,70,8,8); //the shape, where it is placed and it follow the rest of the body
//Right pupil
fill(0);//the colour of the arm
ellipse(x+125,70,8,8);
//Circles in the middle of the circuit.
eyeR = random(255);
  eyeB = random(255);
  eyeG = random(255);
  fill(eyeR,eyeG,eyeB); //the colour of the arm and its going to be random
stroke(155); //the colour of the outline
ellipse(x+110,165,8,8); //the shape, where it is placed and it follow the rest of the body
ellipse(x+110,125,8,8); //the shape, where it is placed and it follow the rest of the body
ellipse(x+110,145,8,8);//the shape, where it is placed and it follow the rest of the body
}
  

