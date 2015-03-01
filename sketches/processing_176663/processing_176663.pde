
//The artistic intent is to depict an interactive Christmas Card. 
//The viewer can put lights on the tree by clicking
//on the mouse. 
//The borders of the candle flames will also become another color.
//Then click on the keyboard to add the Star to the top of
//the tree.
//Hold the mouse down and move it around and the lights change color.
//The borders of the candle flames will also change color.
//Hold both a key down and the mouse down and the border of the
//star also changes color.

//pjs preload*/directive
/* @pjs preload="project3background.png; */

//Loading an image
//Delcare a PImage variable type
PImage project3background;

//click sketch, add file
//import project3background.png. Open.

//setup()
void setup() {
  size(864, 720);
  //Draw the image to the screen at (0,0)
   project3background = loadImage("project3background.png");
    image (project3background, 0, 0);  
  colorMode(HSB,200, 400,100);  
}



//Draw block
void draw(){  
//turning on the lights with mousePressed
  if (mousePressed == true){ 
  pushMatrix();
  
  //ellipse
  //red light
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(mouseY, mouseX, 75);
  ellipse(185,260,20,20);
   //red light 
   stroke(mouseX,mouseY,50); 
  strokeWeight(2); 
  fill(mouseY, mouseX, 75);
  ellipse(275,460,20,20);
   //red light 
   stroke(mouseX,mouseY,50);
  strokeWeight(2); 
  fill(mouseY, mouseX, 75);
  ellipse(300,260,20,20);
   //red light  
   stroke(mouseX,mouseY,50);
  strokeWeight(2); 
 fill(mouseY, mouseX, 75); 
  ellipse(175,480,20,20);
   //red light  
   stroke(mouseX,mouseY,50);
  strokeWeight(2);
fill(mouseY, mouseX, 75);   
  ellipse(240,550,20,20);
  //blue light 
  stroke(mouseX,mouseY,70); 
  strokeWeight(2); 
 fill(mouseY, mouseX, 25);   
  ellipse(312,310,20,20);
   //blue light  
  strokeWeight(2);  
  ellipse(225,400,20,20);
   //blue light  
  strokeWeight(2);  
  ellipse(180,520,20,20);
   //blue light
  strokeWeight(2); 
  ellipse(312,600,20,20);
   //blue light
  strokeWeight(2);  
  ellipse(175,350,20,20);
  //yellow light
  stroke(mouseX,mouseY,25); 
  strokeWeight(2);
fill(mouseY, mouseX, 100);    
  ellipse(120,400,20,20);
   //yellow light  
  strokeWeight(2);  
  ellipse(275,550,20,20);
   //yellow light
  strokeWeight(2); 
  ellipse(270,350,20,20);
   //yellow light  
  strokeWeight(2);  
  ellipse(240,650,20,20);
  //green light 
  strokeWeight(2);  
  ellipse(350,480,20,20);
 //red light  
  strokeWeight(2); 
  ellipse(90,560,20,20);   
  strokeWeight(2);  
  ellipse(375,650,20,20);
   //blue light 
  strokeWeight(2);
  
  ellipse(100,650,20,20);
  //green light 
  stroke(mouseX,mouseY,40); 
  strokeWeight(2); 
  fill(mouseY, mouseX, 75);
  ellipse(200,450,20,20);
  //green light
  strokeWeight(2);  
  ellipse(238,300,20,20);
  //green light 
  strokeWeight(2);  
  ellipse(170,600,20,20);
//red light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#AF0734);
  ellipse(250,230,20,20);
  //red light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#AF0734);
  ellipse(270,620,20,20);
  //red light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#AF0734);
  ellipse(140,460,20,20);
  //red light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#AF0734);
  ellipse(290,420,20,20);
  //blue light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#1830C6);
  ellipse(250,500,20,20);
  //blue light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#1830C6);
  ellipse(180,630,20,20);
  //blue light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#1830C6);
  ellipse(320,670,20,20);
  //blue light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#1830C6);
  ellipse(200,310,20,20);
  //yellow light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#B7A81C);
  ellipse(200,570,20,20);
  //yellow light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#B7A81C);
  ellipse(260,270,20,20);
  //yellow light2
  stroke(mouseX,mouseY,50);
  strokeWeight(2);
  fill(#B7A81C);
  ellipse(350,440,20,20);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(300,225,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(325,210,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(305,205,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(600,225,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(575,210,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(600,205,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(405,215,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(510,217,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(460,205,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(425,200,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(440,210,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(478,217,5,5);
  //red mantlepiece berries
  stroke(mouseX,mouseY,50);
  strokeWeight(1);
  fill(#AF0734);
  ellipse(482,207,5,5);

 
 //candle flame
 noFill();
  
   stroke(mouseX,mouseY,50);
   strokeWeight(20);
   scale(.09);
  translate(3620,1150);
   arc (400,400,200,200,5.45,7.08);
   arc (520,385,200,200,2.12,3.32);
   arc (310,200,400,400,6.96,7.26);
   stroke(mouseX,mouseY,50);
   strokeWeight(20);

   translate(1866,0);
   arc (400,400,200,200,5.45,7.08);
   arc (520,385,200,200,2.12,3.32);
   arc (310,200,400,400,6.96,7.26);
   popMatrix();
 
  }
  
  //star
  //a polygon with 10 vertexes
  //center of star
  //(238,165)
//line(238,700,238,0);
//line(0,165,850,165);
{
  //transform the grid
  //Star comes on when key pressed
  if (keyPressed == true){
  pushMatrix();

  scale(.8);
  translate(60,50);
fill(#B7A81C);
 stroke(mouseX,mouseY,70);
strokeWeight(4);
  beginShape();
 vertex(238, 115);
  vertex(252, 145);
  vertex(285, 150);
  vertex(261, 172);
  vertex(267, 205);
  vertex(238, 190);
  vertex(209, 205);
  vertex(215, 172);
  vertex(191, 150);
  vertex(224, 145);
  vertex (238,115);
  endShape();
 
 popMatrix();
}}



}



