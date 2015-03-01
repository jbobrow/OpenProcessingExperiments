
/*
 
A simple program, 
save this man from Electrocution!!!

With a mouse click you can
save this man from a constant flow of Electricity!!!!!!!!
 
*/




void setup()
{
  size(300,300);
  frameRate(300) ;
  
  
  PFont font;

font = loadFont("PublicoText-Bold-40.vlw"); //set up publico font ~~~ works in java mode?
textFont(font, 32); //font size
  
  
}
 
void draw()
{
  
  //translate(width, height);
  background(255);

//draw person in background  
 
// shirt
fill(0);
ellipse (50,100,50,70); //elipse orgin is at center
 
//face
fill(253,228,200);
ellipse (50,50,40,60); //elipse orgin is at center
 
// eye dots
 
fill(0,25,74); //square fill in rgb // last number is opacity
noStroke();
rect (43,43,3,3); // draw a rectangle x,y,width,height
 
rect (58,43,3,3); // draw a rectangle x,y,width,height
 
//mouth
 
fill(0); //square fill in rgb // last number is opacity
noStroke();
rect (45,69,10,4); // draw a rectangle x,y,width,height
 
ellipse(47,70,5,4); // draw a rectangle x,y,width,height
ellipse(53,70,5,4); // draw a rectangle x,y,width,height
 
//pants
rect (30,85,15,100);
rect (50,85,15,100);
 
  
  
  
  fill(0);
  stroke(random(10,300), random(10,300), random(10,300)); //random confetti color
  strokeWeight(.5); //electricy stroke
  for (float y=0; y< height; y+=1){
  float snowX = random(0, width);
  float snowSz = random(0,height) ;
  line(snowX, y, snowSz, snowSz);
  }
  if(mousePressed) // on press
  {
    background(255); //draw a new white background

text("OMG Thank You!", 10, 130); //text thanking user
text("You Are A Savior! ", 10, 160);
text("", 10, 190); 
    
  }
}
