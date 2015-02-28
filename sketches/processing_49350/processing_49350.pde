
class Scabs{
  //global variables
float bodyX,bodyY;
float eyeColorXeyeColorY;
float eyeShiftX,eyeShiftY;
float mouthTalkX,mouthTalkY;
float a,x,y,c;
color fillValue;
float sxmove = 0.0;
float symove = 0.0;
float samove = 0.0;
color col;
boolean hit = false;

Scabs( float x_, float y_, color col_) {
  col=col_;
  x=x_;
  y=y_;
}

void display (float x_, float y_) {
  x=x_;
  y=x_;
  //a=a_;
  ellipseMode(CENTER);
  rectMode(CENTER);
  //scab's pieces
  
  body(x_,y_);
  eyeColor(x_,y_);
  eyeShift(x_,y_);
  mouthTalk(x_,y_); 
}
  //Scab's body  
      void body(float x_,float y_) {
        //ears
        if (hit) {
          fill (col);
        } else {
        fill(29,82,69);
        }
        triangle(x-10, y-20, x+30, y, x+30, y-25);
        triangle(x-10, y-20, x-30, y, x-30, y-25);
        //inside ear pinks
        fill(80,16,48);
        triangle(x+10, y-20, x+27, y-5, x+27, y-20);
        triangle(x+10, y-20, x-27, y-5, x-27, y-20);
        //arms
        if (hit) {
          fill (col);
        } else {
        fill(29,82,69);
        }
        rect(x-15, y+30, 7,5);
        rect(x+15, y+30, 7,5);
        //body
        arc(x+1,y+28,31,30,PI/2,PI);
        arc(x-1,y+28,31,30,0,PI/2);
        //feet
        ellipse(x-10,y+42,10,8);
        ellipse(x+10,y+42,10,8);
        //head
        ellipse(x,y,60,60); 
        //nose
        fill(80,16,48);
        triangle(x-5,y+7,x+5,y+7,x,y+10);
        //CLAWSSS
        fill(100);
        //left hand
        ellipse(x-18,y+28,3,3);
        ellipse(x-18,y+32,3,3);
        //right hand
        ellipse(x+18,y+28,3,3);
        ellipse(x+18,y+32,3,3);
        //left foot
        ellipse(x-15,y+45,3,3);
        ellipse(x-12,y+47,3,3);
        ellipse(x-11,y+47,3,3);
        //right foot
        ellipse(x+9,y+47,3,3);
        ellipse(x+12,y+47,3,3);
        ellipse(x+15,y+45,3,3);
      }
      
      //eyes
  void eyeColor(float x_,float y_) {
        //eyes whites
        fill(100);
        ellipse(x-20,y,25,25); 
        ellipse(x+20,y,25,25);
        //eye blue rings
        //float c=map(mouseX,0,.5*width,0,255);
        //fill(c,0,c);
        fill(mouseX/3, 200-mouseX/2, mouseY/3);
        ellipse(x-20,y,20,20);
        ellipse(x+20,y,20,20);
        //eye black
        fill(0);
        ellipse(x-20,y,13,13);
        ellipse(x+20,y,13,13);
      } 
      
      //white glimmer in eyes
  void eyeShift(float x_, float y_) {
          //eye shift
          //a=(mouseX);
          fill(100);
          if ((width/2)<mouseX) {
           ellipse(x-25,y-2,7,5);
           ellipse(x+15,y-2,7,5);
          }
          else {
            ellipse(x-15,y-2,7,5);
            ellipse(x+25,y-2,7,5);
        }
      }
      
      //mouth
  void mouthTalk(float x_, float y_) { 
        keyPressed() ;
        if (key==CODED) {
          if (keyCode==UP) 
            fillValue=0;
            stroke(0);
            strokeWeight(3);
            noFill();
            arc(x,y+15,10,5,0,PI);
            noStroke();
        } else 
          { fill(0);
            ellipse(x,y+15,10,7);     
      }  
  }
      
void hitTest(Scabs scabs) {
  if (dist(x,y,scabs.x,scabs.y) <=100) {
    scabs.hit = true;
  } else {
    scabs.hit = false;
    hit = false;
  }
}
  }

