
//Homework 3
//copyright Maitri Shah Septemper Pittsburgh Pa

float x,y;//variable declarations
color col1,col2,col3,tempcol;

void setup( )
{
 size( 400,400 );
 
 //define the variables
 
 //y = 1/x;
 
 col1 = color(random(100),random(100),random(255));
 col2 = color(random(0),random(255),random(0));
 col3 = color(random(255),random(0),random(0));
 
 //common rules for the whole animation
 smooth();
 noCursor();

}


//basic animation
void draw( )
{
  //Overlaying rectangle(background)
  
  noStroke();
  
  fill(col1,5);
  rect(0,0,width,height);
  
  //Four circles

  fill(col2);
  
  ellipse( mouseY,mouseX,20,20);

  ellipse( mouseX, mouseY, 20, 20);
  
  ellipse( width-mouseX, height-mouseY, 20,20);
 
  ellipse(width-mouseY, height-mouseX, 20,20);
  
  //Four lines
 
  x = frameCount/10;
  stroke(col3,x);
  
  strokeWeight(3);
  
  line(200,200,pmouseY,pmouseX);
  
  line(200,200,pmouseX,pmouseY);
  
  line(200,200,width-pmouseX,height-pmouseY);
  
  line(200,200,width-pmouseY,height-pmouseX);


}


//everytime mouse is clicked
void mouseClicked()
{
  col1 = color(random(100),random(100),random(255));

}


//everytime key is pressed
void keyPressed()
{
  //col2 = color(random(256),random(50),random(50));
  //col3 = color(random(50),random(255),random(50));  
  tempcol = col2;
  col2 = col3;
  col3 = tempcol;
  
  //saveFrame("hw3."+frameCount+"jpg");
}



