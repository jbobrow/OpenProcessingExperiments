
//Copyright Samantha Zucker, PIttsburgh PA, Oct 2011
//Homework 11


color s = color(206,121,121,80);
color solid = color(150);
float x,y,depth,z;
float changeInz;
float centerX, centerY, centerZ;
float changeX, changeY, changeZ;
float speed;
int barThick = 10;
int spacing=10;
float slideX,slideY,slideZ;
///////////////////////////////////
void setup()
{
 size(400,600,P3D);
 //smooth();
 lights();

 depth = 200;
 x = width*.5;
 y = height*.5;
 
 centerX = width/2;
 centerY = height/2;
 centerZ = 0;
 
 changeX = 0;
 changeY = 0;
 changeZ = 0;
 
 speed = .2; 
 
 slideX = width*.5;
 slideY = width*.5;
 slideZ = width*.5;
 
}
/////////////////////////////////
void draw()
{
 prepButtons();
 informationOverload();
 moveS();
 rotateSliders();
 prepScreen();
 drawInitial();

}
/////////////////////////////////
void mousePressed()
{
  //stop button
  if(width*.04 < mouseX && mouseX < width*.12)
  {
   if(spacing < mouseY && mouseY < (spacing*3 + barThick*3))
     {
       changeX = 0;
       changeY = 0;
       changeZ = 0;
     }
  }
  //reset button
  if((width*.12+spacing) < mouseX && mouseX < (width*.2 + spacing))
  {
    if(spacing < mouseY && mouseY < (spacing*3 + barThick*3))
    {
       changeX = 0;
       changeY = 0;
       changeZ = 0;
       
       centerX = width/2;
       centerY = height/2;
       centerZ = 0;
        
       slideX = width*.5;
       slideY = width*.5;
       slideZ = width*.5;
       
    }
  }
}

//  rect(width*.04,spacing,width*.08,spacing*2+barThick*3); //stop
//  rect(width*.12+spacing,spacing,width*.08,spacing*2+barThick*3); //reset
////////////////////////////////
void keyPressed()
  {
     
    if(keyCode == 65) //a = away
     {
       changeZ = changeZ + speed;
     } 
     else if(keyCode == 67) //c = closer
     {
       changeZ = changeZ - speed;
     } 
     else if(keyCode == UP)
     {
       changeY = changeY - speed;
     }
     else if(keyCode == DOWN)
     {
       changeY = changeY + speed;
     }
     else if (keyCode == LEFT)
     {
       changeX = changeX - speed;
     } 
     else if (keyCode == RIGHT)
     {
       changeX = changeX + speed;
     } 
     else if (keyCode == 83) //s = stop
     {
     changeX = 0;
     changeY = 0;
     changeZ = 0; 
     }
   }
/////////////////////////////////
void mouseDragged()
{
 //moving slider markers
  if (width*.25 <= mouseX && mouseX <= width*.91)
  {
    if(spacing <= mouseY && mouseY <= (spacing+barThick))
    {
     slideX = mouseX;

    }
    else if(spacing*2+barThick <= mouseY && mouseY <= spacing*2+barThick*2)
    {
     slideY = mouseX; 
    }
    else if(spacing*3+barThick*2 <= mouseY && mouseY <= spacing*3+barThick*3)
    {
     slideZ = mouseX; 
    }
  }
}
////////////////////////////////
void informationOverload()
{
  fill(0);
  //rotation
  text("Rotation", width*.1, height*.9);
   text("X: " + slideX, width*.1, height*.92); 
   text("Y: " + slideY, width*.1, height*.94);
   text("Z: " + slideZ, width*.1, height*.96);
  //distance
  text("Distance", width*.35, height*.9);
//find distances  
float XDist = width/2 - centerX;
float YDist = height/2 - centerY;
float ZDist = 0 - centerZ;
  
   text("X: " + XDist +"px", width*.35, height*.92);
   text("Y: " + YDist +"px", width*.35, height*.94);
   text("Z: " + ZDist +"px", width*.35, height*.96);
//movement
  text("Movement", width*.7, height*.9);
   text("X: " + changeX + "px", width*.7, height*.92);
   text("Y: " + changeY + "px", width*.7, height*.94);
   text("Z: " + changeZ + "px", width*.7, height*.96);
}
/////////////////////////////////
void moveS()
{
 translate(centerX,centerY,centerZ); 
 centerZ = centerZ - changeZ;
 centerX = centerX + changeX;
 centerY = centerY + changeY;
}
////////////////////////////////
void rotateSliders()
{
    map(slideX, width*.25, width*.91, 0, 360);
    rotateX(radians(slideX));
    
    map(slideY, width*.25, width*.91, 0, 360);
    rotateY(radians(slideY));
    
    map(slideZ, width*.25, width*.91, 0, 360);
    rotateZ(radians(slideZ));
}
////////////////////////////////
void drawInitial()
{

//center box
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);

//going up

 pushMatrix();
 translate(-x*.3, -y*.1);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();



 pushMatrix();
 translate(-x*.6, -y*.2);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(-x*.3, -y*.3);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(0, -y*.4);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(x*.3, -y*.3);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(x*.6, -y*.2);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

//going down
 pushMatrix();
 translate(x*.3, y*.1);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(x*.6, y*.2);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(x*.3, y*.3);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(0, y*.4);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(-x*.3, y*.3);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();

 pushMatrix();
 translate(-x*.6, y*.2);
 fill(s);
 box(x*.4, y*.1, depth);
 fill(solid);
 box(x*.4, y*.1, depth/2);
 popMatrix();
}
/////////////////////////////////
void prepScreen()
{
//axes
fill(255);
box(400,5,5);
box(5,400,5);
box(5,5,400);
}
////////////////////////////////
void prepButtons()
{ 
  background(250);
  fill(s);
 //sliders
  rect(width*.25,spacing,width*.66,barThick);
  rect(width*.25,spacing*2+barThick,width*.66,barThick);
  rect(width*.25,spacing*3+barThick*2,width*.66,barThick);
 //buttons 
  rect(width*.04,spacing,width*.08,spacing*2+barThick*3); //stop
  rect(width*.12+spacing,spacing,width*.08,spacing*2+barThick*3); //reset
  fill(0);
  text("stop",width*.05,(spacing*4+barThick*3)/2);
  text("reset",width*.125+spacing,(spacing*4+barThick*3)/2);
  
  text("x",width*.93,spacing + barThick); 
  text("y",width*.93,spacing*2 + barThick*2);
  text("z",width*.93,spacing*3 + barThick*3);

 //slider markers 

  fill(solid);
  rect(slideX,spacing/2,spacing,spacing*1.75);
  rect(slideY,spacing/2+spacing+barThick,spacing,spacing*1.75);
  rect(slideZ,spacing/2+spacing*2+barThick*2,spacing,spacing*1.75);

}

