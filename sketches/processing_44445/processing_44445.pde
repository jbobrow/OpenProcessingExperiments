
// Homework 11
// Copyright Kinnari Thakker 2011, Pittsburgh 15224

//Slider
int gap,s1x,s2x,s3x, sy, swd, sht;
float s1dist, s2dist, s3dist, xRotation, yRotation, zRotation;
color sliderColor;

//Key Movements
float x,y,z, deltaX, deltaY, deltaZ, speed, zPos;

//Buttons
float buttonRx, buttonRy, buttonwidth;
float buttonSx, buttonSy;
color buttonColor;


void setup()
{
    size (600,600, P3D);
    
    x = width/2;
    y = height/2;
    z = 0;
    
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    speed = 1;
    
   swd = int(width*.29);
   sht = int(height*.04);
   gap = int(width*.03); 
   s1x = gap;
   s2x = 2*gap+swd;
   s3x = 3*gap+2*swd;
   sy = int(height*.9);
   sliderColor = color(24, 88,38);
   
   buttonRx = 2.5*gap;
   buttonSx = 6.7*gap;
   buttonRy = 2.5*gap;
   buttonSy = buttonRy;
   buttonwidth = 3*gap; 
   buttonColor = color(245);
   
   textMode(SCREEN);
   textSize(12);
   
}

void draw()
{
    backgrounder();
    
    sliderFunction(s1x, xRotation);
    sliderFunction(s2x, yRotation);
    sliderFunction(s3x, zRotation);
    
    buttons();
    buttonActions();
    
    objectRotation();
    linkingMouseRotation();
    
    drawObject();
     
    objectMoved();
    
    textLabels();
}


void sliderFunction(float sliderX, float Rotation)
{
    fill(sliderColor);
    rect(sliderX,sy,swd,sht);
    
    stroke(255);
    strokeWeight(5);
    float tempX = map(Rotation, -360, 360, sliderX, sliderX + swd);
    line(tempX, sy, tempX, sy + sht);
    noStroke();
}


void textLabels()
{
   textAlign(CORNER);
   fill(255); 
   text("X Rotation: "+int(xRotation), s1x, sy+40);
   text("Y Rotation: "+int(yRotation), s2x, sy+40); 
   text("Z Rotation: "+int(zRotation), s3x, sy+40);
  
   text("X Position: "+int(x-width/2), s1x, gap+130);
   text("Y Position: "+int(y-width/2), s1x, gap+145); 
   text("Z Position: "+int(z), s1x, gap+160);
   
   text("X Speed: "+int(deltaX), s1x, gap+80);
   text("Y Speed: "+int(deltaY), s1x, gap+95); 
   text("Z Speed: "+int(deltaZ), s1x, gap+110);
   
   

}


void linkingMouseRotation()
{
    s1dist = dist(s1x+swd/2, sy+sht/2, mouseX, mouseY);
      if (mousePressed && s1dist <= swd/2 && mouseY >= sy && mouseY <=sy+swd)
        {
            xRotation = mapRotation(s1x, sy, swd);
        } 
    s2dist = dist(s2x+swd/2, sy+sht/2, mouseX, mouseY);
      if (mousePressed && s2dist <= swd/2 && mouseY >= sy && mouseY <=sy+swd)
        {
            yRotation = mapRotation(s2x, sy, swd);
        }
      
    s3dist = dist(s3x+swd/2, sy+sht/2, mouseX, mouseY);
      if (mousePressed && s3dist <= swd/2 && mouseY >= sy && mouseY <=sy+swd)
        {
            zRotation = mapRotation(s3x, sy, swd);
        }    
}


float mapRotation(int x, int y, int wd)
{
    float rotation = (map(mouseX, x, x+wd, -360, 360));
    if (rotation < -360) ////// limiting rotation
        {
          rotation = -360;
        }
    if (rotation > 360)
        {
          rotation = 360;
        } 
     return rotation;   
}


void objectRotation()
{
    translate(x,y,z);
    rotateX(radians(xRotation));
    rotateY(radians(yRotation));
    rotateZ(radians(zRotation));
}


void objectMoved()
{
    x = x+deltaX;
    y = y+ deltaY;
    z = z+deltaZ;
}


void keyReleased()
{
    if (keyCode == RIGHT) // movement along x axis
      {
        deltaX=deltaX+speed;
      }
    else if (keyCode == LEFT)
      {
        deltaX=deltaX-speed;
      }
    else if (keyCode == DOWN) // movement along Y axis
      {
        deltaY=deltaY+speed;
      }
    else if (keyCode == UP)
      {
        deltaY=deltaY-speed;
      }
    else if (keyCode == 'A') // movement along Z axis
      {
        deltaZ=deltaZ-speed;
      }
    else if (keyCode == 'C')
      {
        deltaZ=deltaZ+speed;
      }
    else if (keyCode == 'S') // stop all movement
      {
         stopAllMovement();
      }
    else if (keyCode == ' ') // return state to zero
      {
         returnToZero();
      }
    else if (keyCode == 'Z') // return state to zero
      {
         zPos = z;
         z = -500;
      } 
    else if (keyCode == 'X') // return state to zero
      {
         z = zPos;
      } 
}

void buttons()
{
    
    ellipseMode(CENTER);
    fill(buttonColor);
    textAlign(CENTER);
    ellipse(buttonRx, buttonRy, buttonwidth,buttonwidth);
    ellipse(buttonSx, buttonSy, buttonwidth,buttonwidth);
    
    fill(0);
    text("Reset", buttonRx, buttonRy);
    text("Stop", buttonSx, buttonSy);
    
}

void buttonActions()
{
   float button1 = dist(buttonRx, buttonRy, mouseX, mouseY); 
   if (mousePressed && button1 <= buttonwidth/2)
     {
        fill(0); 
        returnToZero();
     }
     
   float button2 = dist(buttonSx, buttonSy, mouseX, mouseY); 
   if (mousePressed && button2 <= buttonwidth/2)
     {
        fill(0); 
        stopAllMovement();
     }  

}

void stopAllMovement()
{
    deltaX = 0;
    deltaX = 0;
    deltaX = 0;
}


void returnToZero()
{
    x = width/2;
    y = height/2;
    z = 0;
    
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    
    xRotation = 0;
    yRotation = 0;
    zRotation = 0;
}

void backgrounder() ////////////////// BAckground Stuff
{
    background(100);
    lights();
    noStroke();
}

void drawObject()  ////////////////////////////////// Object
{
    fill(225,240,65,200);
    
    pushMatrix(); //stem of the k
    translate(-width*.1, 0, 0);
    box(width*0.1,height*0.4,-30);
    popMatrix();
    
    pushMatrix(); //slab serif top
    translate(-width*.1, -height*.225, 0);
    box(width*0.2,height*0.05,-60);
    popMatrix();
    
    pushMatrix(); //slab serif bottom
    translate(-width*.1, height*.225, 0);
    box(width*0.2,height*0.05,-60);
    popMatrix();
    
    
    
    pushMatrix(); 
    translate(-width*.05, height*.05, 15);

    beginShape();  /////////////// Lower left Polygon
    vertex(0,0);
    vertex(width*0.07, -height*0.06);
    vertex(width*0.25, height*0.2);
    vertex(width*.15, height*0.2);
    vertex(0,0);
    endShape();
    
    beginShape(); //upper Left Polygon
    vertex(0,0);
    vertex(0,-height*0.1);
    vertex(width*0.23,-height*0.3);
    vertex(width*0.23,-height*0.2 );
    vertex(0,0);
    endShape();
    
    beginShape(); ///// upper connector 1
    vertex(0,-height*0.1,0);
    vertex(0,-height*0.1,-30);
    vertex(width*0.23,-height*0.3,-30);
    vertex(width*0.23,-height*0.3,0);
    vertex(0,-height*0.1,0);
    endShape();
    
    beginShape();
    vertex(width*0.23,-height*0.3,-30); ////////// upper connector 2
    vertex(width*0.23,-height*0.3,0);
    vertex(width*0.23,-height*0.2, 0);
    vertex(width*0.23,-height*0.2, -30);
    vertex(width*0.23,-height*0.3,-30);
    endShape();
    
    beginShape();
    vertex(width*0.23,-height*0.2, 0);  ////////// upper connector 3
    vertex(width*0.23,-height*0.2, -30);
    vertex(0,0,-30);
    vertex(0,0,0);
    vertex(width*0.23,-height*0.2, 0);
    endShape();
    
    popMatrix();
    
    
    
    
    pushMatrix(); 
    translate(-width*.05, height*.05, -15);
    
    beginShape(); ////////  lower right polygon
    vertex(0,0);
    vertex(width*0.07, -height*0.06);
    vertex(width*0.25, height*0.2);
    vertex(width*.15, height*0.2);
    vertex(0,0);
    endShape();
    
    beginShape(); //////// upper right polygon
    vertex(0,0);
    vertex(0,-height*0.1);
    vertex(width*0.23,-height*0.3);
    vertex(width*0.23,-height*0.2 );
    vertex(0,0);
    endShape();
    
    beginShape(); //////////// lower connector 3
    vertex(0,0,0);
    vertex(0,0,30);
    vertex(width*0.15, height*0.2,30);
    vertex(width*0.15, height*0.2,0);
    vertex(0,0,0);
    endShape();
    
    beginShape(); /////////// lower connector 2
    vertex(width*0.15, height*0.2,30);
    vertex(width*0.15, height*0.2,0);
    vertex(width*0.25, height*0.2,0);
    vertex(width*0.25, height*0.2,30);
    vertex(width*0.15, height*0.2,30);
    endShape();
    
    beginShape();   //////////////// lower connector 1
    vertex(width*0.25, height*0.2,30);
    vertex(width*0.25, height*0.2,0);
    vertex(width*0.07, -height*0.06,0);
    vertex(width*0.07, -height*0.06,30);
    vertex(width*0.25, height*0.2,30);
    endShape();
    
    popMatrix();
    
    
    
}

