
void setup()
{
  size(600,800);
  background(255);
  smooth();
  frameRate(60);
  fill(0,255,0);
  // Draw christmas tree
 triangle(width/2,height/8,width/8,height/1.25,width/1.25,height/1.25);
 fill(0,0,0);
rect(width/2.5,height/1.25,100,50);
fill(255,0,0);
textSize(25);
text("Decorate the Tree",180,60);
textSize(14);
text("Click on the tree to add a bulb", 380,100);
text("Press R to change bulb to red",380,120);
text("Press B to change bulb to blue",380,140);
text("Press Y to change bulb to yellow",380,160);
text("Press W to change bulb to white",380,180);
text("Press S to add Star",380,200);
text("Press N to reset the tree",380,220);

}



void draw()
{

}

void mousePressed()
{
 ellipse(mouseX,mouseY,20,20);
}  
void keyPressed() {

// lowercase Red
  if (key == 114)
  {
    
    fill(255,0,0);
   }
   
// RED uppercase
     if (key == 82)
  {
    fill(255,0,0);
   }  
   
 // Blue lowercase
   if (key == 98)
  {

    fill(0,0,255);
   }

// blue uppercase 
   if (key == 66)
  {
 
    fill(0,0,255);
   }
 
// white lowercase
if (key == 119) 
{
fill(255);  
}
// white uppercase
if (key == 87) 
{
 fill(255); 
}
//yellow lowercase
if (key == 121)
{
fill(255,255,0);
}
 //yellow uppercase
if (key == 89)
{
 fill(255,255,0);
}


// Add Star to tree lowercase
if (key == 115)
{
  noStroke();
  fill(255,255,0);
triangle(width/2,height/8+20,width/2-10,height/8-10,width/2+10,height/8-10);
triangle(width/2,height/8-20,width/2+10,height/8+10,width/2-10,height/8+10);
}
// Add Star to tree uppercase
if (key == 83)
{
  noStroke();
  fill(255,255,0);
triangle(width/2,height/8+20,width/2-10,height/8-10,width/2+10,height/8-10);
triangle(width/2,height/8-20,width/2+10,height/8+10,width/2-10,height/8+10);
}

//new tree lowercase
if (key == 110)
{
 background(255);
 fill(0,255,0);
  // Draw christmas tree
 triangle(width/2,height/8,width/8,height/1.25,width/1.25,height/1.25);
 fill(0,0,0);
rect(width/2.5,height/1.25,100,50);
fill(255,0,0);
textSize(25);
text("Decorate the Tree",180,60);
textSize(14);
text("Click on the tree to add a bulb", 380,100);
text("Press R to change bulb to red",380,120);
text("Press B to change bulb to blue",380,140);
text("Press Y to change bulb to yellow",380,160);
text("Press W to change bulb to white",380,180);
text("Press S to add Star",380,200);
text("Press N to reset the tree",380,220);

}
// new tree uppercase
if (key == 78)
{
background(255);
  fill(0,255,0);
  // Draw christmas tree
 triangle(width/2,height/8,width/8,height/1.25,width/1.25,height/1.25);
 fill(0,0,0);
rect(width/2.5,height/1.25,100,50);
fill(255,0,0);
textSize(25);
text("Decorate the Tree",180,60);
textSize(14);
text("Click on the tree to add a bulb", 380,100);
text("Press R to change bulb to red",380,120);
text("Press B to change bulb to blue",380,140);
text("Press Y to change bulb to yellow",380,160);
text("Press W to change bulb to white",380,180);
text("Press S to add Star",380,200);
text("Press N to reset the tree",380,220);

}






}
