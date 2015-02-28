

Set wreaths = new HashSet();
Wreath newWreath = null;

void keyPressed(){
   if(key == ' '){
      wreaths = new HashSet();
   } 
}

void setup(){
  size(250,250);
  frameRate(50);
  ellipseMode(CENTER_DIAMETER);
  rectMode(CENTER);
  fill(255); //white circles
}

void draw(){
  background(100);

  float centerX = 0, centerY = 0;
  float howMany=0;

  //centerx and y represent the "center of gravity"
  // that balls are drawn to; here we show all balls
  //in current position and add their center point to
  //be averaged out
  Iterator i = wreaths.iterator();
  while(i.hasNext()){
    Wreath w = (Wreath)i.next();
    w.showthingy();
    centerX += w.getX();
    centerY += w.getY();
    howMany ++;
  }

  if(newWreath != null){
     newWreath.showthingy(); 
      centerX += newWreath.getX();
    centerY += newWreath.getY();
    newWreath.thingsize += 1;
    
  }

  if(howMany > 0){
    centerX /= howMany;
    centerY /= howMany;
  }
//add in attractive force to center as
//well as screen center to each ball
i = wreaths.iterator();
  while(i.hasNext()){
    Wreath w = (Wreath)i.next();
    w.recenter(width/2,height/2);
    w.recenter(centerX,centerY);
    //line(th.getX(),th.getY(),centerX,centerY);
  }
//mark the center point
//  point(centerX,centerY);

}

class Wreath {
  float x, y, thingsize;
  float xspeed, yspeed;
  float accel;
  float maxspeed = 10;

  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  float getSize(){
    return thingsize;
  }

  Wreath(float newx, float newy, float newsize, float newaccel){
    x = newx;
    y = newy;
    thingsize = newsize;
    accel = newaccel;
  }
  void showthingy(){
    noFill();
    
    pushMatrix();
    translate(x,y);
    
    strokeWeight(thingsize/4);
    stroke(0,200,0);
    ellipse(0,0,thingsize,thingsize);

    stroke(0);
    strokeWeight(thingsize/8);
//    strokeWeight(3);
    ellipse(0,0,thingsize*1.25,thingsize*1.25);
    ellipse(0,0,thingsize*.75,thingsize*.75);

    pushMatrix();

  strokeWeight(thingsize/16);

    rotate(xspeed/5 + yspeed/5);
    translate(0,-thingsize/2);
    fill(225,0,0);
//    ellipse(0,0,thingsize/4,thingsize/4);

    pushMatrix();
    rotate(HALF_PI/3);
    rect(0,thingsize/4,thingsize/6,thingsize/2);
     popMatrix();
    pushMatrix();
    rotate(-HALF_PI/3);
    rect(0,thingsize/4,thingsize/6,thingsize/2);
    popMatrix();

    rotate(HALF_PI);
    triangle(0,0,-thingsize/5,thingsize/5,thingsize/5,thingsize/5);
    rotate(PI);
    triangle(0,0,-thingsize/5,thingsize/5,thingsize/5,thingsize/5);

    popMatrix();

    popMatrix();
    
    

    //rect(x,y,(1/xspeed)*20,(1/yspeed)*20);
  }
  //recenter makes attraction to x y point
  void recenter(float inx, float iny){
    if(x < inx){
      xspeed += accel;
    }
    if(x > inx){
      xspeed -= accel;
    }

    if(y < iny){
      yspeed += accel;
    }

    if(y > iny){
      yspeed -= accel;
    }

    xspeed = constrain(xspeed,-maxspeed,maxspeed);
    yspeed = constrain(yspeed,-maxspeed,maxspeed);

    x += xspeed;
    y += yspeed;
  }
}

float m;

void mouseDragged(){
  if(newWreath != null){
     newWreath.x = mouseX;
     newWreath.y = mouseY;
  }
}

void mousePressed(){
   newWreath =  new Wreath(mouseX,mouseY,10,.1);
}
//when mouse released, let new ball drop into wild...
void mouseReleased(){
    wreaths.add(newWreath);
    newWreath = null;
}



