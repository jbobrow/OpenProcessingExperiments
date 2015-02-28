
// BALL

import java.awt.geom.*;
public class Ball {

  Rectangle rectangle;
  // BALL PROPERTIES --
  
  int width = 5;
  int height = 5;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  // velocity
  int velX = 3;
  int velY = 3;
  //
  int x;
  int y;
  int ox;
  int oy;
  int xcentre;
  int ycentre;
  //
  float splashOpac = 0;
    
  

  Ball(int X, int Y) {
    x = X;
    y = Y;
    rectangle = new Rectangle(width, height, hasStroke, strokeColor, hasFill, fillColor);
    rectangle.setPosition(x, y);
    narwhals (x,  y);
    splash (x, y);
  }
  
  
  

  void refresh(){
    updatePosition();
    rectangle.setPosition(x, y);
    rectangle.drawYourself();
    narwhals (x,  y);
    splash (x, y);
  }
  
  
  
  

  void updatePosition() {
    // add velocity to position
    x+=velX;
    y+=velY;
    
    // collision with limits
    if(x<=0 || x>=gameFrameWidth-width){
      velX = -velX;
      x = constrain(x, 0, gameFrameWidth-width);
      
    }
    if(y<=0 || y>=gameFrameHeight-height){
      velY = -velY;
      y = constrain(y, 0, gameFrameHeight-height);
      loop();
    }
    xcentre = x+width/2;
    ycentre = y+height/2;
    
    
    // collision with paddle
    
    
    int result = checkCollisionWithRectangle(paddle.rectangle);
    
    // if collides on top, control direction of ball
    
    
    if (result == 1){
        if(xcentre < paddle.rectangle.x1+paddle.rectangle.width/2){
          if(velX>0){
            velX = -velX;  
          }
        }else{
          if(velX<0){
            velX = -velX;  
          }
        }
    }
    // collision with bricks
    
    if (result == 0) {
      for (int i=0; i<bricks.length; i++){
         if(bricks[i].imAlive){
           int res = checkCollisionWithRectangle(bricks[i].rectangle);
           if (res != 0){
             bricks[i].die();
            splashOpac = 255;
             break;
             
           }
         }
      }
    }
    ox = x;
    oy = y;
  
}
  
  
  
  // FUNCION DETECCION DE COLISION --
  // result: 0: no collision 1: top 2: right 3: bottom 4: left 5: couldn't detect which side
  int checkCollisionWithRectangle (Rectangle R){
    int result = 0;
    if (R.doesPointTouchMe(xcentre, ycentre)){
      // which side did it collide
      Line2D lineaBola = new Line2D.Float(xcentre,ycentre,ox+width/2,oy+height/2);
      result = R.whatSideDoesLineTouch(lineaBola, velX, velY);
      // top
      if(result==1){
        velY = -velY;
        y = R.y1-height;
        // right
      }else if(result==2){
        velX = -velX;
        x = R.x2;
        // bottom
      }else if(result==3){
        velY = -velY;
        y = R.y2;
        // left
      }else if(result==4){
        velX = -velX;
        x = R.x1-width;
      }else{
        result = 5;
      }
    }
    return result;
  }

  
  
  
  void splash (float splashx, float splashy)
  
  {
    
 strokeWeight(3);                                          //waves
 stroke(52+random(-40, 100), 120+random(-40, 100), 155+random(-40, 100),splashOpac);
 noFill();
   
       
   for (int m = 1; m<= 4; m++){
     
       
     pushMatrix();
     
     translate(45+splashx, 45+splashy);
     rotate((2*PI/m)*random(-0.3, 0.6));
     translate(random(-3, 3), random(-3,3));
     
     scale(0.5);
     
 for (int stream = 0; stream <= 4; stream++)
 {
 arc (0+stream*16, 70-stream*3, 50, 50, 0, PI/2);
 arc (50+stream*16, 70-stream*3, 50, 100, PI, PI*1.5);
 arc (50+stream*16, 30-stream*3, 20, 20, -PI*0.5, PI/1.2);
 }
 popMatrix();
   }
 
 
    if (splashOpac>=0){
    splashOpac=splashOpac-5;}
    
    println (splashOpac);
    noStroke();
  }
  
  
  
  
  //float whalesize = 0.1;
  float spin = 0;
  float spinner=0.01;
  float sizer=0.003;
  
  
  void narwhals (float midx,  float midy){
    
    spin=spin+spinner;
    
  float whalesize=midy/300;
  
  if (spin>=2 || spin <=0){
  
    spinner = spinner*-1;
  }
  
  
    pushMatrix();
    translate(midx+50, midy+50);
    rotate(spin*PI);
    
  
  
  for (float j=0; j <=2; j = j+0.2)        //rotation iteration
  {
      
    pushMatrix();
    
    scale(whalesize);  //this controls size of the whales
  rotate (PI*j);        //this rotates the whales
  translate (100, -30);
  fill(255);
  triangle(-56, 73, 18, 88, 18, 98);
    
  fill(152,182,203);
 ellipse(50, 87, 70, 25);
  rect(50, 75, 40, 10);
 ellipse(68, 104, 70, 27);
  rect(50, 105, 40, 10);
  ellipse(90, 95, 40, 38);
  rect(40,85, 40, 20);
  ellipse(97,97, 30,30);
 beginShape();
 curveVertex(21, 91);
 curveVertex(21,91);
 curveVertex(30,104);
 curveVertex(42,109);
 curveVertex(47,110);
 curveVertex(61, 86);
 curveVertex(61, 86);
 endShape();
 beginShape();
 curveVertex(91, 78);
 curveVertex( 91, 78);
 curveVertex( 118, 78);
 curveVertex(118,66);
 curveVertex(113, 60);
 curveVertex(108, 54);
 curveVertex(111, 52);
 curveVertex(119,53);
 curveVertex(124, 57);
 curveVertex(132, 49);
 curveVertex(142,49);
 curveVertex(138, 60);
 curveVertex(129, 70);
 curveVertex(126, 99);
 curveVertex(100,108);
 curveVertex(100,110);
 curveVertex(100,110);
 endShape();
 ellipse (60, 100, 50, 20);
 fill(255);
 ellipse(34, 84, 14, 14);
 fill(0);
 ellipse(34, 81, 9, 9);
 fill(255);
 ellipse(32, 82, 4, 4);
 fill(170,170,170);
 arc(54, 92, 80, 46, 0.1, PI/0.99);
 ellipse (80, 100, 50, 20);
 stroke(120,120,120);
 strokeWeight(1.5);
 line(20, 105, 20, 93);
 line(25,108, 25, 93);
 line(30,109, 30, 93);
 line(35,111, 35, 93);
 line(40,113, 40, 93);
 line(45,114, 45, 93);
 noStroke();
 popMatrix();}
 popMatrix();}}




  

