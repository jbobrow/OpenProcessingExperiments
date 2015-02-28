
//Lauren Fraser 2011. Frog Zoog Disco!

//DECLARE VARIABLES
float r;
float g;
float b;
float a;
Dog myDog;

//INITIAL SETTINGS
void setup(){
   size(800,800); 
//choosing background colour -values in RGB
background(40,162,60);
//drawing big white circle for face)
smooth();
//Initializing my object
myDog = new Dog();
}


//REPEAT
//background colour is variable depending upon the position of the mouse
void draw(){
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(155);
  background(40,mouseX/8,60);
//Information to control behaviour of my object
myDog.move();
myDog.display();
//square of rapidly randomly variating colour in the background depending upon where your mouse is.
fill(0);
if (mouseX < 400 && mouseY < 400) { rect(0,0,400,400);}
else if (mouseX > 400 && mouseY < 400) { rect(400,0,400,400);}
else if (mouseX < 400 && mouseY > 400) { rect(0,400,400,400);}
else if (mouseX > 400 && mouseY > 400) { rect(400,400,400,400);}

//drawing zoogs face (white part)
fill(255);
ellipse(mouseX-150,mouseY,400,300);

//colour of following 2 elipses - variable depending on the position of the mouse)
fill(mouseX/4+100,mouseX/8,mouseY/6+100);
smooth();
ellipse(mouseX,mouseY,100,100);
ellipse(mouseX-300,mouseY,100,100);
//colour of pupils - black)
fill(0);
smooth();
ellipse(mouseX,mouseY,50,50);
ellipse(mouseX-300,mouseY,50,50);
//making the mouth in red
fill(200,20,20);
//making things a little smoother - more pleasant on the eye!
smooth();
//changing the stroke colour (around the red mouth elipse) and giving it transparency
stroke(155,75,75,200);
//making the stroke thicker
strokeWeight(abs(mouseX - pmouseX));
ellipse(mouseX-150,mouseY+100,80,40);
//making the 2 points for the nose)
stroke(0);
strokeWeight(4);
point(mouseX-100,mouseY+50);
point(mouseX-200,mouseY+50);
}


//EVENT HANDLERS



//CLASSES
class Dog{
 color col;
 float xpos;
 float ypos;
 float xspeed;
 Dog(){
  col = color(100,100,100);
  xpos = width/4;
  ypos = height/6;
  xspeed = 2;
 } 
//CUSTOM FUNCTIONS
void move(){
 xpos = xpos + xspeed;
if (xpos>width){
  xpos=0;} 
}


void display(){
  //the dog is actually an ellipse...
  fill(255);
  rect(xpos,ypos,20,20);
}

}


