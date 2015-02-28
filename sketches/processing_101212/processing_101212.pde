


//integers go here
int mySize1= 400;//size one
int mySize2= 500;//size two

//my objects being declared
Rooster rooster1;
Rooster rooster2;
Rooster rooster3;
Rooster rooster4;

//start setup here
void setup()
{
  //here goes anything I need to setup
  size(mySize1,mySize2);//display the window my size

// Making my object being copied into 4 new object of their own
rooster1 = new Rooster();
rooster2 = new Rooster();
rooster3 = new Rooster();
rooster4 = new Rooster();
}
//begin draw here
void draw()
{
  //state my background here
  drawBackground();
  //state all objects here such as display my object,move my object
  // and bounce my object
  
  //rooster one
  rooster1.displayRooster();
  rooster1.moveRooster();
  rooster1.bounceRooster();
  
  //rooster two
  
  rooster2.displayRooster();
  rooster2.moveRooster();
  rooster2.bounceRooster();
  
  //rooster three
  
  rooster3.displayRooster();
  rooster3.moveRooster();
  rooster3.bounceRooster();
  
  //rooster four
  
  rooster4.displayRooster();
  rooster4.moveRooster();
  rooster4.bounceRooster();
  
}

void drawBackground()//draws a background 
{
  
  
  int bW=0;//background location for width
  int bH=0;//background location for hieght
  
  
  
  background ((int) random(20,255)); //random flashes of darkness 
  //in the every other square
   
  for(int ctr=0; ctr<height; ctr++){
  
    bW=1+ctr*40;//size of square
    bH=1+ctr*40;//size of inbetween squares
   
       
   fill(255); // will make every other square white
  
   rect(bW,bH+480,40,40);
   rect(bW,bH+400,40,40);
   rect(bW,bH+320,40,40);
   rect(bW,bH+240,40,40);
   rect(bW,bH+160,40,40);
   rect(bW,bH+80,40,40);
   rect(bW,bH,40,40);
   rect(bW+80,bH,40,40);
   rect(bW+160,bH,40,40);
   rect(bW+240,bH,40,40);
   rect(bW+320,bH,40,40);
   rect(bW+400,bH,40,40);
   rect(bW+480,bH,40,40);
 }
}
//setting of my object in class
class Rooster
{
  //display x and y with speed of x and y
  float x;
  float y;
  int speedX = 2;
  int speedY = 2;
  
  Rooster()
  {
    //setting y and x in random positons eveytimes it runs
    x = random(0,width);
    y = random(0,height);
  }
  
  void displayRooster()//display my rooster
  {
    fill(255);//leg attacher color
  ellipse(x-10,y+35,18,18);//leg attacher
  fill(188,141,70);//color of body
  ellipse(x,y,75,75);//body
  fill(250,13,17);//head spikes color
  beginShape();//head spikes
  vertex(x-30,y-65);
  vertex(x-30,y-85);
  vertex(x-25,y-70);
  vertex(x-20,y-80);
  vertex(x-15,y-70);
  vertex(x-10,y-75);
  vertex(x-5,y-62);
  endShape();//end of head spikes
  fill(239);//color of head
  ellipse(x-20,y-50,35,35);//head
  fill(252,156,0);//color of beak
  beginShape();//beak
  vertex(x-58,y-54);
  vertex(x-35,y-50);
  vertex(x-35,y-58);
  vertex(x-58,y-54);
  endShape();//end of beak
  beginShape();//sepration of beak
  vertex(x-58,y-54);
  vertex(x-35,y-54);
  endShape();//end of seperation of beak
  fill(250,87,5);//color of eyeball
  ellipse(x-25,y-55,10,10);//eyeball
  fill(0);//color of eye
  ellipse(x-25,y-55,5,5);//eye
  fill(144,58,15);//color of wing
  ellipse(x+12,y-15,35,35);//wing
  fill(229,39,90);//color of leg
  beginShape();//leg 
  vertex(x-15,y+42);
  vertex(x-20,y+60);
  vertex(x-15,y+60);
  vertex(x-10,y+42);
  vertex(x-15,y+42);
  endShape();//end of leg
  fill(246,255,13);//color of foot
  beginShape();//foot
  vertex(x-20,y+60);
  vertex(x-40,y+50);
  vertex(x-32,y+68);
  vertex(x-50,y+73);
  vertex(x-35,y+78);
  vertex(x-37,y+88);
  vertex(x+5,y+70);
  vertex(x-15,y+60);
  vertex(x-20,y+60);
  endShape();//end foot
  fill(216,39,104);//color of tail
  beginShape();//tail
  vertex(x+35,y+15);
  vertex(x+70,y+25);
  vertex(x+62,y+10);
  vertex(x+88,y-5);
  vertex(x+62,y-15);
  vertex(x+85,y-22);
  vertex(x+33,y-25);
  vertex(x+35,y+15);
  endShape();//end of tail
    
  }
  
  void moveRooster()//move my rooster
  {
   x = x + speedX;
   y = y + speedY;
  }
  
  void bounceRooster()//bounce my rooster
  {
    if (x >= width || x <=0)//reverse when hits left or right
  {
    speedX=-speedX;//formula for the x(bouncing)
  }
  if(y >= height || y <=0)//reverse when hits up or down
 {
   speedY=-speedY;//make y move(bouncing)
 }
}
}

