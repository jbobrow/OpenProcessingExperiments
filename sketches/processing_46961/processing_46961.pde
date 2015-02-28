
  //HW 11 - 3d controls
  //Copy right Felipe Castelblanco / Nov 2011
  
  //Press  Key 'Z' to zoom in & 'A' to zoom out
  //Press "S" or space Bar to Stop
  //Press Arrows to move fig UP, DOWN, LEFt & RIGHT
  //Press "R" to reset position
  //Press "X" for extreme zoom 
  
  int xrotation, yrotation, zrotation; //Rotation
  float barRot,barWidth, barHeight, XbarHeight, YbarHeight, ZbarHeight, RbuttonX, RbuttonY, SbuttonX, SbuttonY; // width scrollbar objects
  
  float deltaZ, deltaX, deltaY, diamB, x, y, z; //zoom
  
  void setup()
  {
    
  size(600,600,P3D);
  sphereDetail(10);
 
  noStroke();
  
 
  barRot = int (width*.05); //bar dimension values
  
  XbarHeight = int (height*.9); //bar dimension values
  YbarHeight = int (height*.8); //bar dimension values
  ZbarHeight = int (height*.7); //bar dimension values
  
  barWidth = .5*width; // space bar dimension values
  barHeight = .05*height; // space bar dimension values
  
  x = .5*width; //pos
  y = .5*height; //pos
  z = -.1*width; //pos
  
  deltaZ = 0; 
  deltaX = 0;
  deltaY = 0;
  
  diamB = width*.1; //diam button
  
  RbuttonX = .1*width; //button position
  RbuttonY = .1*height; //button position
  SbuttonX = .3*width; //button position
  SbuttonY = .1*height; //button position
    
  ellipseMode(CENTER);
  
  }
  
  void draw()
  {
    
  background(10);
  directionalLight(86, 90, 126, 0, 0, -1);//light adjustment
  ambientLight(150, 150, 80);//light adjusment
  
 
  fig( );
  moveRotate( );
  Sliders( );
  RotationStats ();
  buttons ();
  moveAxisM();
  
  }
  
  void mousePressed ()
  {
   if (mouseX >= RbuttonX - diamB && mouseX <= RbuttonX + diamB/2  && mouseY >= RbuttonY - diamB && mouseY <= RbuttonY + diamB/2 ) // limits mouse to button pos
   {
     //reset actions //
      xrotation = 0;
      yrotation = 0;
      zrotation = 0;
      deltaZ = 0;
      deltaY = 0;
      deltaX = 0;
      x = .5*width;
      y = .5*height;
      z = -.1*width;
  } 
  
  if (mouseX >= SbuttonX - diamB && mouseX <= SbuttonX + diamB/2  && mouseY >= SbuttonY - diamB && mouseY <= SbuttonY + diamB/2 ) // limit mouse to button pos
   {
     // stop actions //
      deltaZ = 0;
      deltaY = 0;
      deltaX = 0;
  }  



  }
  
  void buttons () //draw buttons
  {
    
    fill(240,0,240);
    ellipse(RbuttonX,RbuttonY,diamB,diamB);  
    fill (0);
    text("RESET", RbuttonX - 15, RbuttonY); 
    
    
    fill(240,240,0);
    ellipse(SbuttonX,SbuttonY,diamB,diamB); 
    fill (0);
    text("STOP", SbuttonX- 15, SbuttonY);
    
  }
  
  
//============= movement ================

void moveRotate() // Rotation

   { 
     if (mousePressed && mouseX >= barRot && mouseX <= barRot + barWidth 
     && mouseY >= XbarHeight && mouseY <= XbarHeight + barHeight)
     {
      xrotation = int( map (mouseX, barRot, barRot + barWidth, -360, 360));
    
        if (xrotation < -360)
        {
            xrotation = -360;
           
        }else if (xrotation > 360)
        {
            xrotation = 360;
        }
      } else if (mousePressed && mouseX >= barRot && mouseX <= barRot + barWidth 
     && mouseY >= YbarHeight && mouseY <= YbarHeight + barHeight)
     {
       yrotation = int( map (mouseX, barRot, barRot + barWidth, -360, 360));
       
        if (yrotation < -360)
        {
            yrotation = -360;
           
        }else if (yrotation > 360)
        {
            yrotation = 360;
        }
    
   }else if (mousePressed && mouseX >= barRot && mouseX <= barRot + barWidth 
     && mouseY >= ZbarHeight && mouseY <= ZbarHeight + barHeight)
     { 
    
    zrotation = int( map (mouseX, barRot, barRot + barWidth, -360, 360));
    
    if (zrotation < -360)
    {
        zrotation = -360;
       
    }else if (zrotation > 360)
    {
        zrotation = 360;
    }
  }
}

void moveAxisM() //Displacement x, y & z
{
  x = x + deltaX;
  y = y + deltaY;
  z = z + deltaZ;
  
}

//===== All Stats ====

void RotationStats ()
{
  fill(250,250,250);
  
  text(xrotation + " "+"Angle x", barRot, XbarHeight - 4); // Angle X
  text(yrotation + " "+"Angle y", barRot, YbarHeight - 4); // Angle Y
  text(zrotation + " "+"Angle z", barRot, ZbarHeight - 4); // Angle Z
  
  text(x + " " + "X POS", barRot, height/2); 
  text(y + " " + "Y POS", barRot, height/2 + 20); 
  text(z + " " + "Z POS", barRot, height/2 + 40); 
  
  text(deltaX + " " + "X Speed", barRot, height/2-40); 
  text(deltaY + " " + "Y Speed", barRot, height/2 - 60); 
  text(deltaZ + " " + "Z Spreed", barRot, height/2 -80); 
}
  
/// ======Sliders ======/// 

void Sliders()
  {
    ///map mouse X ///
    fill(250,60);
    rect(barRot,XbarHeight,barWidth + barRot, barHeight);
    fill(180,180,0);
    
    float xX = map (xrotation, -360, 360, barRot, barRot+barWidth);
    rect(xX, XbarHeight, barRot, barHeight); 
   
    ///map mouse Y ///
    fill(250,60);
    rect(barRot,YbarHeight,barWidth + barRot, barHeight);
    fill(180,0,180);
    float xY = map (yrotation, -360, 360, barRot, barRot+barWidth);
    rect(xY,YbarHeight, barRot, barHeight);   
    
    ///map mouse Z ///
    fill(250,60);
    rect(barRot,ZbarHeight,barWidth + barRot, barHeight);
    fill(0,180,180);
    
    float xZ = map (zrotation, -360, 360, barRot, barRot+barWidth);
    rect(xZ,ZbarHeight,barRot, barHeight); 
  }

//======= key controls ======//

void keyPressed ()
{
  if (key == 'z' || key == 'Z')
  {
    deltaZ = deltaZ + 1;
  }else if ( key == 'a' || key == 'A')
  {
    deltaZ = deltaZ - 1;
  }else if (keyCode == UP)
  {
    deltaY = deltaY - 1;
  }else if (keyCode == DOWN)
  {
    deltaY =  deltaY + 1;
  }else if (keyCode == LEFT)
   {
    deltaX = deltaX - 1;
  }else if (keyCode == RIGHT)
  {
    deltaX = deltaX + 1;
  }else if ( key == 's' || key == 'S')
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    
  }else if ( keyCode == ' ')
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }else if ( key == 'r' || key == 'R')
  {
    xrotation = 0;
      yrotation = 0;
      zrotation = 0;
      deltaZ = 0;
      deltaY = 0;
      deltaX = 0;
      x = .5*width;
      y = .5*height;
      z = -.1*width;
  }else if ( key == 'x' || key == 'X')
  {
      z = z * -5;
  }
  
}
//=======Draw Figure=====//

void fig( )
{
  
  fill(0,200,255);
  pushMatrix();
  
     translate(x,y,z);
     rotateX(radians(xrotation));
     rotateY(radians(yrotation));
     rotateZ(radians(zrotation));
     
    noStroke();
      box(.1*width, .4*height, 30);//vertical
    
    pushMatrix(); //yellow sphere
        translate(0,.28*height);
        fill(255,250,0);
          sphere(.04*width);
          popMatrix();
            pushMatrix(); // pedestal pinkish
              translate(0,.23*height);
              fill(255,100);
              box(.1*width, .1*height, 70);//vertical
        popMatrix();
      
     fill(0,200,255);
     
     pushMatrix();
       translate(.1*width,0,35);
       box(.2*width,.05*height,22);//horizontal samll
     popMatrix();
     
     pushMatrix();
       translate(.15*width,-.20*height,-30);
       box(.3*width,.1*height,20);//horizontal long
     popMatrix();
 
 popMatrix();  
 
}


  




