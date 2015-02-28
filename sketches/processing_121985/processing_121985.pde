
//Variable for camera image.
PImage cameraImage;
PImage logoImage;

//Sets partNum to 7, to represent seven parts.
int partNum = 7;

//Creates an array for the CameraParts
CameraPart[] cameraArray = new CameraPart[partNum];

//coordinates from which we start drawing buttons in testing part
int xDef = 300;
int yDef = 240; 

IntList que = new IntList();

//variables for menu

//Sets both pages to false as the default value
boolean startTeaching = false;
boolean startChallenge = false; 

void setup()
{
//Sets background color
//Set size of screen
background(255);
size(640,600);

//Calls image from web urll = "https://shop.pkr.com/images/600/600/thumb_1605.jpg";
// Load image from a web server.
cameraImage = loadImage("thumb_1605.jpg");
logoImage = loadImage("lens.jpg");

//Sets attributes for aperture
cameraArray[0] = new CameraPart( color(20,224,171), 242, 323, 50, 50, "Aperture", xDef, yDef);

//Sets attributes for shutter speed 
cameraArray[1] = new CameraPart( color(20,224,171), 137, 325, 80, 50, "Shutter Speed", xDef, yDef+50); 

//Sets attributes for menu
cameraArray[2] = new CameraPart( color(20,224,171), 74, 242, 50, 50, "Menu", xDef, yDef+100);

//Sets attributes for AV
cameraArray[3] = new CameraPart( color(20,224,171), 360, 277, 50, 50, "Av", xDef+110, yDef+100);

//Sets attributes for Photo count
cameraArray[4] = new CameraPart( color(20,224,171), 247, 450, 55, 50, "Photo count", xDef+110, yDef);

//Sets attributes for Set button
cameraArray[5] = new CameraPart( color(20,224,171), 397, 405, 40, 40, "Set", xDef+110,yDef+50);

//Sets attributes for Multiple shots
cameraArray[6] = new CameraPart( color(20,224,171), 356, 405, 30, 70, "Multipple shots", xDef+60, yDef+150);

//append numbers 0-6 to the list
for(int i=0; i<partNum; i++)
{
que.append(i);
}
//set random order of the numbers in the list
que.shuffle();

//Make the first element in the queue visible
cameraArray[que.get(0)].show = true;

}

//Function to create the button allowing changes between test and teach
void swapScreens(int x, int y, String label)
{

//draw the button 
noStroke();
fill(73,211,168);
ellipse(x, y, 40, 40);

//if the mouse clicks on the area of
//the values of startTeaching and testingTeaching change to opposite
if(mousePressed && dist(mouseX, mouseY, x, y) < 25)
{
startTeaching = !startTeaching;
startChallenge = !startChallenge;
}

//add label
fill(0);
textAlign(LEFT);
textSize(18);
text(" "+label, x, y);
}

//TEACH ME FUNCTIONS
void teachMe()
{

//Sets the skelton as the background image.
image(cameraImage, 0, 0);

//settings for text
fill(0);
textSize(20);
textAlign(LEFT);
int xPos = 10;
int yPos = 30;

//Puts the text on top of the skelton image.
text("Click circled areas of camera to learn..", xPos, yPos);

//For every body part in array
//the loop will call the drawCircle & teach function.
for (int i=0; i<partNum; i++)
{

cameraArray[i].drawCircle();
cameraArray[i].teach();
}
//place the button to move to testing
swapScreens(470, 30, "Photo Challenge");
}

void ChallengeMe()
{
//Sets image.
background(255);
int xPos = 10;
int yPos = 30;

//Gives a textsize for the message at the top
//Also the textsize used for the answers & centers the text.
textAlign(LEFT); 
textSize(20);
//Sets colour of the text
fill(0);
text("Photo Challenge: Take 100 photos each week.", xPos, yPos);

//Numbers on graph
textAlign(LEFT);
textSize(15);
//set colour for text
fill(0);
text("100", xPos+70, yPos+110); 

text("0", xPos+85, yPos+475);

text("Week 1", xPos+136, yPos+490);

text("Week 2", xPos+237, yPos+490);

text("Week 3", xPos+338, yPos+490);

text("Week 4", xPos+439, yPos+490);

//building the graph

fill(0);
stroke(2);
line(xPos+100,yPos+100, 110,500);
line(xPos+100,500,525,500);

fill(10,144,103);
rect(xPos+125, yPos+100, 75, 370);

fill(8,177,201);
rect(xPos+225, yPos+210, 75, 260);

fill(73,211,168);
rect(xPos+325, yPos+350, 75, 120);

fill(56,129,139);
rect(xPos+425, yPos+180, 75, 290);

//numbers within bars
fill(255); 
noStroke();
ellipse(xPos+163, yPos+430, 40, 40);

ellipse(xPos+264, yPos+430, 40, 40);

ellipse(xPos+365, yPos+430, 40, 40);

ellipse(xPos+466, yPos+430, 40, 40); 

fill(0);
text("100", xPos+150, yPos+435);
text("65", xPos+255, yPos+435);
text("32", xPos+356, yPos+435);
text("78", xPos+457, yPos+435);

//draws on switch button
swapScreens(30, 60, "Learn about the camera");

}

//MENU FUNTIONS

void drawMenu()
{

image(logoImage, 50, 250, width/4, height/4);

//varaibles to draw buttons
int xOpt = 105;
int yOpt = 290;
int diameter = 30;

//Sets the buttons used in menu.
fill(73,211,168);
noStroke();
ellipse(xOpt+112, yOpt+40, diameter, diameter);
ellipse(xOpt+100, yOpt+80, diameter, diameter);

//Coordinates where to start writing text
int startX = 50;
int startY = 200;

//Displays the text that is in the menu page.
textSize(45);
fill(0);
text("Jacob's Photo ",startX+140, startY+60);
text("Challenge.", startX+160, startY+100);
textSize(30);

fill(0);
text("Learn about the Camera", startX+160, startY+140);
textSize(30);

fill(0);
text("Photo Challenge", startX+150, startY+180);

{

//If the mouse is clicked then go to the teach me page.
if (dist(mouseX, mouseY, xOpt+112, yOpt+40) <= (diameter/2))
{
startTeaching = true;
}

//If the mouse is clicked go to the test me page.
if (dist(mouseX, mouseY, xOpt+100, yOpt+80) <= 20)
{
startChallenge = true;
}

}
} 

void draw()
{

//If not on the teach or test page, then display the menu.
if (!startTeaching && !startChallenge)
{
drawMenu();
}

//If the teach page is selected go to that method.
if(startTeaching)
{
teachMe();
}

//If the test page is selected go to that method.
if (startChallenge)
{
ChallengeMe();

}
}

class CameraPart
{ 
// instance variables for CameraPart.
color cl;
int xPos;
int yPos;
int xSize;
int ySize;
String name;
int xAns;
int yAns;
boolean show = false;

//Gives cameraParts attributes.
CameraPart(color clTmp, int xPTmp, int yPTmp, int xSTmp, int ySTmp, String nameTmp, int xATmp, int yATmp)
{
cl = clTmp; //color of the circle
xPos = xPTmp;
yPos = yPTmp; //^coordinates of position of body part
xSize = xSTmp;
ySize = ySTmp; //^size of circle
name = nameTmp; //name of body part
xAns = xATmp;
yAns =yATmp; //position of correct answer to this body part in testing part
}

//Used by all cameraParts
//Function to draw a circle around the camera part.
void drawCircle()
{
stroke(cl);
strokeWeight(3);
noFill(); 
ellipse(xPos, yPos, xSize, ySize); 
}

//Used by all cameraParts in teaching
//Function to detect the mouse click & what body part is being clicked.
//Displays the description
void teach()
{
if (mousePressed)
{
if( (mouseX < xPos+(xSize/2)) && (mouseX > xPos-(xSize/2)) && (mouseY < yPos+(ySize/2)) && (mouseY > yPos-(ySize/2)) )
{

fill(0);
textAlign(CENTER);
textSize(25);
text(name, 270, 80);
}
}
}

}
