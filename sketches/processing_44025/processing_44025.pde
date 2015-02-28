
//homework11
//Joel McCullough Copyright October2011 Pittsburgh PA 15221
// INSTRUCTIONS:
//   ARROW KEYS TRANSLATE SHAPE AROUND SCREEN X, Y AXIS
//    'A' == AWAY // TRANSLATES SHAPE AWAY FROM VIEWER
//    'C' == CLOSER // TRANSLATES SHAPE CLOSER TO VIEWER
//    'S' == STOP MOVEMENT
//    'SPACEBAR' == RESET OBJECT
//    'Z' == ZOOM IN
//    'X' == ZOOM OUT

float ix,iy,iz,deltaX,deltaY,deltaZ,vel;
float bx,by,bw,bh;//button values stop
float bx2,by2,bw2,bh2;// button values reset
int rotationValueX,rotShapeX;
int rotationValueY,rotShapeY;
int rotationValueZ,rotShapeZ;
int barX,barY,barW,barH;
int barXy,barYy,barWy,barHy;
int barXz,barYz,barWz,barHz;


void setup()
{
  size(600,600,P3D);
  smooth();
  noStroke();
  
  ix=0;
  iy=0;
  iz=0;
  
  deltaX=0;
  deltaY=0;
  deltaZ=0;
  
  vel=10;
  
  barX = int(width*.5);
  barY = int( height*.85);
  barW = int( 200);
  barH = int( .01*height );
  
  rotationValueX = 0;
  rotationValueY = 0;
  rotationValueZ = 0;  
//x bar values 
  bx=30;
  by=20;
  bw=60;
  bh=20;
  
  bx2=150;
  by2=20;
  bw2=60;
  bh2=20;
//y bar values
  barYy= int(height*.9);
  barHy = int(.01*height);
//z bar values
  barYz = int (height*.95);
  barHz = int(.01*height);

  
}

void draw()
{
  
  background(217); 
  stopShape();
  resetShape();
  
  stopButton();
  resetButton();
  
  showStats();
  
  followMouse();

  drawRotationXBar();
  drawRotationYBar();
  drawRotationZBar();
  
  translate(width/2,height/2,0);
  rotateShape();
  drawShape();
  moveShape();
  
  
}

void showStats()
{
  pushMatrix();
    translate(0,height*.75);
      textSize(10);
      fill(125);
  
    text("TRANSLATION",0,-160);
      text("X: "+ ix,0,-140);
      text("Y: "+ -iy,0,-120);
      text("Z: "+ iz,0,-100);
  
    text("ROTATION X(degrees)",0,-80);
      text("X-axis: "+rotShapeX ,0,-60);
      text("Y-axis: "+rotShapeY ,0,-40);
      text("Z-axis: "+rotShapeZ,0,-20);
  
    text("TRANSLATION RATES", 0,0);
      text("X:"+ deltaX,0,20);
      text("Y:"+ deltaY,0,40);
      text("Z:"+ deltaZ,0,60);
  
  popMatrix();

}
void drawRotationZBar()
{
  noStroke();
  fill(127);
  rect(barX,barYz,barW,barHz);
  stroke(71,255,255);
  strokeWeight(5);
  
    float x = map( rotationValueZ, 360 , -360, barX,barX + barW);
 
    fill(127);
    line( x, barYz - 5,x, barYz +barHz+5);

}
void followMouse()
{
  if ( mousePressed)
  {
   mapMouse();
  }
}


void drawRotationYBar()
{
  noStroke();
  fill(127);
  rect(barX,barYy,barW,barHy);
  stroke(71,255,255);
  strokeWeight(5);
  
    float x = map( rotationValueY, 360 , -360, barX,barX + barW);
 
    fill(127);
    line( x, barYy - 5,x, barYy +barHy+5);

}
  

void drawRotationXBar()
{
  noStroke();
  fill(127);
  rect(barX,barY,barW,barH);
  stroke(71,255,255);
  strokeWeight(5);
//  if(mouseY>barY && mouseY < barH+barY )
//  {
    
    float x = map( rotationValueX, 360 , -360, barX,barX + barW);
 
    fill(127);
    line( x, barY - 5,x, barY +barH+5);
//  }
  
}

void mapMouse()
{  
    if(mouseY >= barY && mouseY <=barY+barH && 
       mouseX >= barX && mouseX<= barX + barW)
    {
      rotationValueX = int( map( mouseX,barX,barX + barW,360,-360));
        if( rotationValueX < -360 )
        {
          rotationValueX = -360;
        }
        else if (rotationValueX > 360)
        {
          rotationValueX = 360;
        }
      rotShapeX = rotationValueX;
    }
    else if(mouseY >= barYy && mouseY <=barYy+barHy && 
       mouseX >= barX && mouseX<= barX + barW)
    {
      rotationValueY = int( map( mouseX,barX,barX + barW,-360,360));
        if( rotationValueY < -360 )
        {
          rotationValueY = -360;
        }
        else if (rotationValueY > 360)
        {
          rotationValueY = 360;
        }
      rotShapeY = rotationValueY;
    }
    else if(mouseY >= barYz && mouseY <=barYz+barHz && 
       mouseX >= barX && mouseX<= barX + barW)
    {
      rotationValueZ = int( map( mouseX,barX,barX + barW,360,-360));
        if( rotationValueZ < -360 )
        {
          rotationValueZ = -360;
        }
        else if (rotationValueZ > 360)
        {
          rotationValueZ = 360;
        }
      rotShapeZ = rotationValueZ;
    }
}

void mousePressed()
{
  if(mouseY>=by && mouseY<=by+bh &&
      mouseX >=bx && mouseX <=bx+bx)
      {
       deltaX=0;
       deltaY=0;
       deltaZ=0;
      }
  else if(mouseY>=by2 && mouseY<=by2+bh2 &&
      mouseX >=bx2 && mouseX <=bx2+bx2)
      {
        deltaX=0;
        deltaY=0;
        deltaZ=0;
        ix=0;
        iy=0;
        iz=0;
        rotShapeX = 0;
        rotationValueX=0;
        rotShapeY = 0;
        rotationValueY=0;
        rotShapeZ = 0;
        rotationValueZ=0;
      }
      
}

void resetButton()
{
  pushMatrix();
    fill(127);
    rect(150,20,60,20);
    text("Reset",155,20);
    noFill();
  popMatrix();
}
void stopButton()
{
  pushMatrix(); 
     textSize(20);
     fill(127);
     text("Stop",40,20);
     rect(bx,by,bw,bh);
     noFill();
  popMatrix(); 
  
}



void resetShape()
{
  if( keyPressed && key == ' ')
  {
    deltaX=0;
    deltaY=0;
    deltaZ=0;
    ix=0;
    iy=0;
    iz=0;
    rotShapeX = 0;
    rotationValueX=0;
    rotShapeY = 0;
    rotationValueY=0;
    rotShapeZ = 0;
    rotationValueZ=0;
    
  }
}
void stopShape()
{
  if( keyPressed && key == 's')
  {
     deltaX=0;
     deltaY=0;
     deltaZ=0;
  }
}
    
   
void rotateShape()
{  
  rotateX(radians(rotShapeX));    
  rotateY(radians(rotShapeY));
  rotateZ(radians(rotShapeZ));
}
     
void moveShape()
  {
    ix= ix + deltaX;
    iy= iy + deltaY;
    iz= iz + deltaZ;
  } 
void keyPressed()
  {
    if (keyCode == UP && deltaY > -vel)
    {
      deltaY = deltaY - .5;
    }
    
    else if (keyCode == DOWN && deltaY < vel)
    {
       deltaY = deltaY + .5;
    }
  
    else if (keyCode == LEFT && deltaX > -vel)
    {
       deltaX = deltaX - .5;
    }
  
    else if (keyCode == RIGHT && deltaX < vel)
    {
       deltaX = deltaX + .5;
    }
    
    else if ( key == 'a' && deltaZ > -vel)
    {
      deltaZ = deltaZ -.5;
    }
    else if ( key == 'c' && deltaZ < vel)
    {
      deltaZ = deltaZ + .5;
    }
    
    else if( key == 'z')
    {
      iz=iz-500;
      
    } 
    
    else if( key == 'x')
    {
      iz=iz+500;
    } 
    
  }

void drawShape()
{
//lights
    directionalLight(51,102,126,-width*.25,height*.2,-70);
    directionalLight(255,223,25,width*.1,height/2,50);
    directionalLight(178,18,117,width*.75,-height/2,-50);
//shape
  noStroke();
  fill(255);
  pushMatrix();
    translate(ix,iy,iz);
    sphere(10);
    sphere(8);
    sphere(6);
    sphere(4);
    sphere(2);
    sphere(1);
  popMatrix();
  pushMatrix();
    translate(ix+width*.25,iy,iz+50);
    sphere(70);
  popMatrix();
  pushMatrix();
    translate(ix-width*.25,iy,iz-20);
    sphere(20);
  popMatrix();
  pushMatrix();
    translate(ix - width*.35,iy-height/4,iz);
    sphere(40);      
  popMatrix();  
  pushMatrix();
    translate(ix+width*.5,iy+height*.25,iz-50);
    sphere(60);
  popMatrix();
  pushMatrix();
    translate(ix,iy+height*.5,iz-70);
    sphere(50);
  popMatrix();
  pushMatrix();
    translate(ix,iy,iz+200);
    sphere(30);
  popMatrix();
  pushMatrix();
     translate(ix+width*.1,iy+height*.4,iz+50);
     sphere(5);
  popMatrix();
  pushMatrix();
     translate(ix+width*.4,iy-height*.3,iz+80);
     sphere(20);
  popMatrix();
   //line connections primary
      stroke(0);
      strokeWeight(1);
      
        line(ix,iy,iz,ix + width*.4,iy - height*.3,iz+80);//1
        line(ix,iy,iz,ix,iy,iz + 200); //2
        line(ix,iy,iz,ix,iy + height*.5,iz - 70);//3
        line(ix,iy,iz,ix + width*.5,iy + height*.25,iz - 50);//4
        line(ix,iy,iz,ix - width*.35,iy - height/4,iz);//5
        line(ix,iy,iz,ix - width*.25,iy,iz - 20);//6
        line(ix,iy,iz,ix + width*.25,iy,iz + 50);//7
        line(ix,iy,iz,ix + width*.1,iy+height*.4,iz+50);//8
     //line connections secondary 1
        line(ix + width*.4,iy - height*.3,iz+80,ix,iy,iz + 200);//1.2
        line(ix + width*.4,iy - height*.3,iz+80,ix,iy + height*.5,iz - 70);//1.3
        line(ix + width*.4,iy - height*.3,iz+80,ix + width*.5,iy + height*.25,iz - 50);//1.4
        line(ix + width*.4,iy - height*.3,iz+80,ix - width*.35,iy - height/4,iz);//1.5
        line(ix + width*.4,iy - height*.3,iz+80,ix - width*.25,iy,iz - 20);//1.6
        line(ix + width*.4,iy - height*.3,iz+80,ix + width*.25,iy,iz + 50);//1.7
        line(ix + width*.4,iy - height*.3,iz+80,ix + width*.1,iy+height*.4,iz+50);//1.8
      //line connections secondary 2
        line(ix,iy,iz + 200,ix,iy + height*.5,iz - 70);//2.3
        line(ix,iy,iz + 200,ix + width*.5,iy + height*.25,iz - 50);//2.4
        line(ix,iy,iz + 200,ix - width*.35,iy - height/4,iz);//2.5
        line(ix,iy,iz + 200,ix - width*.25,iy,iz - 20);//2.6
        line(ix,iy,iz + 200,ix + width*.25,iy,iz + 50);//2.7
        line(ix,iy,iz + 200,ix + width*.1,iy+height*.4,iz+50);//2.8
      //line connections secondary 3
        line(ix,iy + height*.5,iz - 70,ix + width*.5,iy + height*.25,iz - 50);//3.4
        line(ix,iy + height*.5,iz - 70,ix - width*.35,iy - height/4,iz);//3.5
        line(ix,iy + height*.5,iz - 70,ix - width*.25,iy,iz - 20);//3.6
        line(ix,iy + height*.5,iz - 70,ix + width*.25,iy,iz + 50);//3.7
        line(ix,iy + height*.5,iz - 70,ix + width*.1,iy+height*.4,iz+50);//3.8
      //line connections secondary 4
        line(ix + width*.5,iy + height*.25,iz - 50,ix - width*.35,iy - height/4,iz);//4.5
        line(ix + width*.5,iy + height*.25,iz - 50,ix - width*.25,iy,iz - 20);//4.6
        line(ix + width*.5,iy + height*.25,iz - 50,ix + width*.25,iy,iz + 50);//4.7
        line(ix + width*.5,iy + height*.25,iz - 50,ix + width*.1,iy+height*.4,iz+50);//4.8
      //line connections secondary 5
        line(ix - width*.35,iy - height/4,iz,ix - width*.25,iy,iz - 20);//5.6
        line(ix - width*.35,iy - height/4,iz,ix + width*.25,iy,iz + 50);//5.7
        line(ix - width*.35,iy - height/4,iz,ix + width*.1,iy+height*.4,iz+50);//5.8
      //line connections secondary 6
        line(ix - width*.25,iy,iz - 20,ix + width*.25,iy,iz + 50);//6.7
        line(ix - width*.25,iy,iz - 20,ix + width*.1,iy+height*.4,iz+50);//6.8
      //line connections secondary 7
        line(ix + width*.25,iy,iz + 50,ix + width*.1,iy+height*.4,iz+50);//7.8
      
      noStroke();
    
    
}


  

