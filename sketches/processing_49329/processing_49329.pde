
class Birdy {
 float r;
 float g;
 float b;
 float x;
 float y;
 int w = 48;
 int h = 64;
 
 boolean hit = false;
 
 Birdy(float r_, float g_, float b_) { //color as arguments in the class constructor
   r = r_;
   g = g_;
   b = b_;
   
 }
 
 void display (float x_, float y_) {
   x = x_;
   y = y_;
   
   noStroke();
   if (hit) {
     fill(r,g,b);
   } else {
     fill(255);
   }
   //draw birdy's body
  fill (r,g,b);
  stroke (r,g,b);
  strokeWeight(2);
  ellipse(x,y,w,h);

//draw birdy's top hair
  noStroke();
  fill (r,g,b);
  triangle(x-5,y-30,x,y-40,x+5,y-30);
  
  //draw birdy's eyes
  stroke(0);
  noStroke(); // <-- this was set to 255 and drawing a very thick line around each eye! i changed it to 2
  fill(255);
  ellipse(x-10,y-5,12,12);
  ellipse(x+10,y-5,12,12);

//draw birdy's wings
  fill (r,g,b);
  stroke (r,g,b);
  strokeWeight(2);
  
//IF BIRDY HITS
  if (hit){    
//left wing
  triangle(x-25,y,x-35,y+8,x-25,y+5);
//right wing
  triangle(x+25,y,x+35,y+8,x+25,y+5);
  
  //pupils
  noStroke();
  fill(0);
  ellipse(x-10,y-7,8,8);
  ellipse(x+10,y-7,8,8);
  
  //draw birdy's mouth
  noStroke();
  fill (255,156,40);//orange
  arc(x,y+10,11,10,0,PI);//lower lip
  arc(x,y+10,11,10,-PI,0);//upper lip
  
  }else{
  //left wing
    triangle(x-25,y,x-35,y-2,x-25, y+5);//top right pt, middle pt,bottom r pt
  //right wing
    triangle(x+25,y,x+35 ,y-2,x+25, y+5);
   
  //pupils
  noStroke();
  fill(0);
  ellipse(x-10,y-3,8,8);
  ellipse(x+10,y-3,8,8);
  
//draw birdy's mouth
  noStroke();
  fill (255,156,40);//orange
  arc(x,y+12,11,10,0,PI);//lower lip
  arc(x,y+10,11,10,-PI,0);//upper lip
  }



//draw birdy's legs
  stroke(255);
  strokeWeight(2);
//left leg
  line(x-6,y+32,x-6,y+42);//left leg
  line(x-6,y+39,x-9,y+42); //left talon
  line(x-6,y+39,x-3,y+42); // right talon

//right leg
  line(x+6,y+32,x+6,y+42);// right leg
  line(x+6,y+39,x+3,y+42); //right leg, left talon
  line(x+6,y+39,x+9,y+42); //right leg, right talon
}

void hitTest(Birdy birdy) {
    
    if (dist(x, y, birdy.x, birdy.y) <= 100) { // <-- you can set the size of each birdy manually here. look for the radius of a circle that encompasses the entire shape
      birdy.hit = true;
      hit = true;
      println("hit!");
    } else {
      birdy.hit = false;
      hit = false;
    }
  }
}


