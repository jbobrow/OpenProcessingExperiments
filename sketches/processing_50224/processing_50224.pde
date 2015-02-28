
// Homework #3
// Computing for the Arts with Processing
// Zoe Lu copyright 2012, Pittsburgh PA15213

color c1 = color(255); // white color
color c2 = color(0);   // black color
color c3 = color(255, 255, 93);
color c4 = color(random(255),random(255), random(255));//random color
float x = random(width); //coordination x
float y = random(height); //coordination y
//float x1= mouseX;
//float y1= mouseY;
float xspeed = random(9);
float yspeed = random(9);
int xsize=10;
int ysize=10; 
int space=5;
void setup(){//this only runs once 
  size(400, 400);
}

void draw(){//this will keep running
  background(c2);
  moveObj();
  display();
  action();
}

void moveObj(){
  x+=xspeed;
  y+=yspeed;
  //check if the obj out of the boundary
  if(x>width||x<0){
    xspeed*=-1;
  }
  //check if the obj out of the boundary
  if (y>height||y<0){
    yspeed*=-1;
  }
}

void display(){
  //draw a ghost
  fill(c1,220);
  ellipse(x,y,6*xsize,6*ysize);
  fill(c2);
  ellipse(x+(1.1*xsize),y-(1.2*ysize),xsize,ysize);//draw eye
  ellipse(x-(1.1*xsize),y-(1.2*ysize),xsize,ysize);//draw eye
  ellipse(x,y+(1.6*ysize),xsize,2*ysize);  
  //draw an aim
  fill(random(225),random(225),random(225),190);
  ellipse(mouseX,mouseY,60,60);
  line(mouseX-30,mouseY,mouseX+30,mouseY);
  line(mouseX,mouseY-30,mouseX,mouseY+30);
  
  /*
  //check mouse position when clicking  
  if(mouseX==x|| mouseY==y){
    fill(c2);
    rect(0,0,width,height);
  }
  */
  
}//end display()

//check if the mouse is pressed
void action(){
  if(mousePressed){
    xspeed++;
    yspeed++;
    xsize*=1.1;
    ysize*=1.1;
    //set upper limits of xsize and ysize
    if(xsize>width/7 || ysize>height/7){
      xsize=10;
      ysize=10;
    }
    if(xspeed>15 || yspeed>15){
      xspeed = random(2);
      yspeed = random(2);
    }
    //draw a ghost
    fill(c1,220);
    ellipse(x,y,6*xsize,6*ysize);
    fill(c3);
    noStroke();
    ellipse(x+(1.1*xsize),y-(1.2*ysize),xsize,ysize);//draw eye
    ellipse(x-(1.1*xsize),y-(1.2*ysize),xsize,ysize);//draw eye
    ellipse(x,y+(1.6*ysize),xsize,2*ysize);  
  }//end if(mousePressed)
}//end action()

