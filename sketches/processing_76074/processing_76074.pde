
class critter1{
  
  //positon values
  float postx;
  float posty;

  //speed values
  float speedx;
  float speedy;
  float accererationx;
  float accererationy;
  
  //size values
  float sizeheight;
  float sizewidth;
  
  //growth rate
  float growthrate;
  
  //color
  float crittercolor;
  
  //constructor
  critter1(float positionx, float positiony, float grow, float rgb, float accelx, float accely){
    postx = width/2;
    posty = height/2;
    speedx = positionx;
    speedy = positiony;
    growthrate = grow;
    sizeheight = 10;
    sizewidth = 10;
    crittercolor = rgb;
    accererationx = accelx / 10;
    accererationy = accely / 10;
  }
  
  //grow
  void grow(){
    sizeheight = sizeheight + growthrate;
    sizewidth = sizewidth + growthrate;
  }
  
  //move
  void move(){
    postx = postx + speedx;
    posty = posty + speedy;
    display();
    speedx = speedx + accererationx;
    speedy = speedy + accererationy;

  }
  
  //draw circle that represents size and position
  void display(){
    fill(crittercolor);
    noStroke();
    ellipse(postx, posty, sizewidth, sizeheight);
  }
  
  //draw circle that follows mouse
  void mousefollow(){
    noStroke();
    fill(crittercolor);
    ellipse(mouseX, mouseY, sizewidth, sizeheight);
  }

  //update size, position, and speed
  void update(){
    grow();
    move();
  }
}//end critter object



//declare variables for setup and draw
int count = 0;
critter1[] critterarray = new critter1[50];




//set up the draw area
void setup(){
  size(640, 360);  // Size must be the first statement
  frameRate(10);    // Number of frames per second
  for (int i = 0; i < 50; i++){
    critterarray[i] = new critter1(0, 0, 0, 0, 0, 0);
  }
}

//the draw loop
void draw(){
  //move and grow objects, increase count(spawn) clock, refresh background
  count++;
  color sky = color(0, 191, 255);
  background(sky);
  for (int i = 0; i < 50; i++){
    critterarray[i].update();
  }
  /*
  if (count > 50){
    float ratex = random(-10, 10);
    float ratey = random(-10, 10);
    float growr = random(7);
    float critcolor = random(256);
    c1 = new critter1(ratex, ratey, growr, critcolor);
    c1.display();
    count = 0;
  }
  */
  float ratex = random(-10, 10);
  float ratey = random(-10, 10);
  float growr = random(7);
  float critcolor = random(256);
  float accelx = random(11);
  float accely = random(9);
  critterarray[count] = new critter1(ratex, ratey, growr, critcolor, accelx, accely);
  if (count == 49)
    count = 0;
}


