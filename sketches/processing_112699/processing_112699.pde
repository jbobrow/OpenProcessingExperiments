
void setup(){
  size(600,600);
  background(188,233,245);
  
}
//Simon: Really like what Amy has done from our original idea. 
 // The cloud is a good addition. 
 //David: I think the colours really stand out and are used well.
void draw(){
  //This is for the sun and the cloud. The first fill, stroke and ellipse is for the yellow of the sun.
  fill(255,245,131);
  stroke(255,245,131);
  ellipse(230,140,200,200);
  //This is for the three circles for the clouds. The white for the cloud.
  //David: I like the idea and design of the clouds that are used.
  fill(255,255,255);
  stroke(255,255,255);
  ellipse(250,150,100,120);
  ellipse(300,150,100,100);
  ellipse(200,150,100,100);
  //Simon: another cloud?
   fill(255,255,255);
  stroke(255,255,255);
  ellipse(480,100,100,120);
  ellipse(530,100,100,100);
  ellipse(430,100,100,100);
  //This is for the rectangle of the house
  fill(216,162,131);
  //stroke(216,162,131);
  stroke(0);
  rect(300,300,200,145);
  //This is for the roof of the house.
  //Simon: Going to "3D" the house.
  quad(500,300,550,285,550,430,500,445);
  fill(255,240,232);
  triangle(300,300,400,200,500,300);
  quad(400,200,450,185,550,285,500,300);
  //This is for the grass for the garden.
  fill(185,245,156);
  stroke(185,245,156);
  rect(0,445,600,445);
  //Going to now add things in, windows and doors and such like.
 fill(255,240,232);
 noStroke();
 rect(310,310,60,50);
 rect(310,380,100,50);
 rect(430,310,60,50);
 fill(90,11,18);
 stroke(90,11,18);
 rect(440,380,35,65);
 //Simon: I should make the grass under the 3D part of the house.
 fill(185,245,156);
 noStroke();
 quad(500,445,550,430,600,430,600,500);
 //David: One little thing that could be changed is 
 //the level off the grass on the left side of the house 
 //could be made the same as on the right side if possible. 
 //Not sure how to do it myself.
 rect(0,430,300,15);
}


