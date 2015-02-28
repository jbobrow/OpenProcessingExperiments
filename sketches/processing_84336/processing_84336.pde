

int windowHeight = 600;
int windowWidth = 1024;
//building variables
int gap = 10; //spacing between buildings
int newStartx = gap - 40; //the value x where each building will start
int floorHeight = 35; //the height of each floor on a building
int buildingFloors; //the number of floors per building
int buildingSpread;//the spread of each building
//road variables
int roadStarty = windowHeight/2+148; //the starting y of the road
int roadThickness = 90; //thickness of the road
//declares the vehicle object
class Vehicle {  //defines the vehicle class
  int x;  //x location of vehicle
  int y; //y location of vehicle
  int speed;  //speed of vehicle
  color color1; //color 1 of vehicle
  color color2; //color 2 of vehicle
  int type; //type of vehicle; 0 for car and 1 for truck
  int direction; //direction for vehicle, 0 for left and 1 for truck 
  int acceleration;//acceleration of vehicle 
}
int r;
int g;
int b;
int stopX = 50; //stopping distance for vehicles
boolean offScreentop = true; //boolean telling us if top vehicle is off screen or not  
boolean offScreenbottom = true; //boolean telling us if bottom vehicle is off screen or not  
Vehicle topVehicle, bottomVehicle; //declares the two types of vehicles
Person person;//declares person as a Person
class Person { //defines the person class
  int x;
  int y;
}

// main procedure
void setup() {
  size(windowWidth, windowHeight); //size of the window
  drawScene();
   stroke(0,0,0);
  drawBuilding();
  frameRate(30);
}


//moves vehicles across screen
void draw() {

   person = new Person();//creates a new object of a person
   person.x = mouseX;
   person.y = mouseY;
   
   drawScene();
   stroke(0,0,0);
  drawBuilding();
//redraws the background each time
  
  if(offScreentop == true){  //if the vehicle is offscreen then a random other vehicle drives on
    newTopvehicle();
    offScreentop = false;
    topVehicle.x = windowWidth + 240;

  }
  if(offScreenbottom == true){  //if the vehicle is offscreen then a random other vehicle drives on
    newBottomvehicle();
    offScreenbottom = false;
 
    bottomVehicle.x = -240;
  }
  
  
  
  if((topVehicle.speed - topVehicle.acceleration) <= 0){ //if the vehicle is at a stop
    topVehicle.x = topVehicle.x; //stop it
  }else if((topVehicle.speed + topVehicle.acceleration) > 0){ //if the vehicle is not at a stop
    topVehicle.x = topVehicle.x - topVehicle.speed +  topVehicle.acceleration; //moves the top vehicle across the screen to the left
  }
  
  if((bottomVehicle.speed - bottomVehicle.acceleration) <= 0){ //if the vehicle is at a stop
    bottomVehicle.x = bottomVehicle.x;
  }else { //if the vehicle is not at a stop
  bottomVehicle.x = bottomVehicle.x + bottomVehicle.speed - bottomVehicle.acceleration; //moves the bottom behicle across the screen to the right
  }
    //if the person is above the road
  if(person.y <= roadStarty){
    drawPerson(person.x, person.y); //draw the person in front of bottom vehicles
  } 
  
  //draws the specific vehicle for the top and bottom
  if(topVehicle.type == 0){
    drawTopcar(topVehicle.x, topVehicle.y-17);
  }else if(topVehicle.type == 1){
    drawTopTruck(topVehicle.x, topVehicle.y);
  }
  
  //if the person is on the road
  if((person.y > roadStarty) && (person.y < roadStarty+roadThickness)){
    drawPerson(person.x, person.y); //draw the person in front of top vehicles
  }
  
    //draws the specific vehicle for the top and bottom
  if(bottomVehicle.type == 0){
    drawBottomcar(bottomVehicle.x, bottomVehicle.y-17);
   
  }else if(bottomVehicle.type == 1){
    drawBottomTruck(bottomVehicle.x, bottomVehicle.y);
    
  }

  //if the person is below the road
  if(person.y >= roadStarty+roadThickness){
    drawPerson(person.x, person.y); //draw the person in front of bottom vehicles
  } 
  
  //draws the specific vehicle for the top and bottom
  if(topVehicle.x <= 0){
    offScreentop = true;
  }
  if(bottomVehicle.x >= windowWidth + 230){
    offScreenbottom = true;
  }

//if the person is on the top lane
  if((person.y > roadStarty) && (person.y < (roadStarty+(roadThickness/2)-2))){
    if(((topVehicle.x-person.x) < 400) && (topVehicle.x - 100 -person.x) > 0){ //if the vehicle is relatively close to the person
      topVehicle.acceleration = topVehicle.acceleration + 1; //have the vehicle decrease
    }  
  } else{
  topVehicle.acceleration = 0;
  }

  //if the person is on the bottom lane
  if((person.y > (roadStarty+(roadThickness/2)+2)) && (person.y < (roadStarty+roadThickness))){
    if(((bottomVehicle.x + person.x) > 200) && (bottomVehicle.x - 100 -person.x) < 0){ //if the vehicle is relatively close to the person
      bottomVehicle.acceleration = bottomVehicle.acceleration + 1; //have the vehicle decrease
    }  
  } else{
  bottomVehicle.acceleration = 0;
  }

}


// Draw a person at the given location
void drawPerson(int x, int y) {
  // Draw shirt/pants 
  fill(255,67,1);
  rect(x-5, y-27, 10, 15); 
  
  // Draw legs and arms and head
  fill(216,207,162);
  rect(x-5, y-12, 3, 12);
  rect(x+2, y-12, 3, 12);
  rect(x-8, y-25, 3, 10); 
  rect(x+5, y-25, 3, 10); 
  ellipse(x, y-32, 8, 10);

   

}

//gives values to the paramaters of the Vehicle class
void newTopvehicle() {
  topVehicle = new Vehicle();
  topVehicle.y = roadStarty+40;
  topVehicle.color1 = color((int)random(200), (int)random(200), (int)random(200));
  topVehicle.color2 = color((int)random(200), (int)random(200), (int)random(200));
  topVehicle.speed = ((int)random(8,16));
  topVehicle.type = ((int)random(0,2));
  topVehicle.direction = 0;
  topVehicle.acceleration = 0;
  
}


//gives values to the paramaters of the Vehicle class
void newBottomvehicle() {
  bottomVehicle = new Vehicle();
  bottomVehicle.y = roadStarty+80;
  bottomVehicle.color1 = color((int)random(200), (int)random(200), (int)random(200));
  bottomVehicle.color2 = color((int)random(200), (int)random(200), (int)random(200));
  bottomVehicle.speed = ((int)random(3,9));
  bottomVehicle.type = ((int)random(0,2));
  bottomVehicle.direction = 0;
  bottomVehicle.acceleration = 0;
}


// Draw a bottom Truck at the given location
void drawBottomTruck(int x, int y) {
    // Draw trailor
    noStroke();
    fill(bottomVehicle.color1);
    rect(x, y-55, 128, 45); 
    rect(x+128, y-55, 42, 37); 
    
    // Draw tractor part
    fill(bottomVehicle.color2);
    quad(x+175, y-55, x+205, y-55, x+215, y-37, x+175, y-37); 
    rect(x+175, y-37, 55, 23); 
    rect(x+128, y-18, 102, 8); 
  
    //Draw black borders
    stroke(0);
    line(x, y-55, x+170, y-55);
    line(x+170, y-55, x+170, y-55+37);
    line(x+170, y-18, x+128, y-18);
    line(x+128, y-18,x+128, y-10);
    line(x+128, y-10, x, y-10);
    line(x, y-10, x, y-55);
    line(x+175, y-55, x+205, y-55);
    line(x+205, y-55, x+215, y-37);
    line(x+215, y-37, x+230, y-37);
    line(x+230, y-37, x+230, y-11);
    line(x+230, y-11,x+128, y-11);
    line(x+175, y-55, x+175, y-18);
    line(x+175, y-18,x+170, y-18);
    
    // Draw the wheels
    fill(0);
    ellipse(x+20, y-10, 20, 20);
    ellipse(x+42, y-10, 20, 20);
    ellipse(x+138, y-10, 20, 20);
    ellipse(x+160, y-10, 20, 20);
    ellipse(x+215, y-10, 20, 20);
    fill(255);
    ellipse(x+20, y-10, 10, 10);
    ellipse(x+42, y-10, 10, 10);
    ellipse(x+138, y-10, 10, 10);
    ellipse(x+160, y-10, 10, 10);
    ellipse(x+215, y-10, 10, 10);
    
  
 }

//draws top truck
void drawTopTruck(int x, int y) {
    //draw trailor
    noStroke();
    fill(topVehicle.color1);
    rect(x-128,y-55,128,45);
    rect(x-128-42,y-55,42,37);
    
    //draw tractor part
    fill(topVehicle.color2);
    quad(x-175, y-55, x-205, y-55, x-215, y-37, x-175, y-37);
    rect(x-175-55, y-37, 55, 23);
    rect(x-128-102, y-18, 102, 8);
  
    //Draw black borders
    stroke(0);
    line(x-128-42, y-55, x, y-55);
    line(x-170, y-55, x-170, y-55+37);
    line(x-170, y-18, x-128, y-18);
    line(x-128, y-11, x, y-11);
    line(x-128, y-18,x-128, y-10);
    line(x-128, y-10, x-128, y-10);
    line(x, y-10, x, y-55);
    line(x-175, y-55, x-205, y-55);
    line(x-205, y-55, x-215, y-37);
    line(x-215, y-37, x-230, y-37);
    line(x-230, y-37, x-230, y-11);
    line(x-230, y-11,x-128, y-11);
    line(x-175, y-55, x-175, y-18);
    line(x-175, y-18,x-170, y-18);
  
    // Draw the wheels
    fill(0);
    ellipse(x-20, y-10, 20, 20);
    ellipse(x-42, y-10, 20, 20);
    ellipse(x-138, y-10, 20, 20);
    ellipse(x-160, y-10, 20, 20);
    ellipse(x-215, y-10, 20, 20);
    fill(255);
    ellipse(x-20, y-10, 10, 10);
    ellipse(x-42, y-10, 10, 10);
    ellipse(x-138, y-10, 10, 10);
    ellipse(x-160, y-10, 10, 10);
    ellipse(x-215, y-10, 10, 10);

}

//draws the bottom car
void drawBottomcar(int x, int y) {
  //draw bottom
stroke(0,0,0);
fill(bottomVehicle.color1);
rect(x,y-20,90,20);
//draw top
quad(x+20, y-20, x+25, y-37, x+60, y-37, x+72, y-20);
//draw wheels
 fill(0);
 ellipse(x+25, y+4, 20, 20);
 ellipse(x+67, y+4, 20, 20);
 fill(255);
 ellipse(x+25, y+4, 10, 10);
 ellipse(x+67, y+4, 10, 10);
}

//draws the top car
void drawTopcar(int x, int y) {
  
//draw bottom
stroke(0,0,0);
fill(topVehicle.color1);
rect(x-90,y-20,90,20);
//draw top
quad(x-20, y-20, x-25, y-37, x-60, y-37, x-72, y-20);
//draw wheels
 fill(0);
 ellipse(x-25, y+4, 20, 20);
 ellipse(x-67, y+4, 20, 20);
 fill(255);
 ellipse(x-25, y+4, 10, 10);
 ellipse(x-67, y+4, 10, 10);


}







//draw the scenery
void drawScene(){

  fill(#56A5EC);
  rect(0-4,0,windowWidth+5,windowHeight/2); //draws sky
  fill(#347C17);
  rect(0-4,windowHeight/2-30,windowWidth+5,windowHeight/2+100); //draws grass
  fill(#cacccb);
  rect(0-4,windowHeight/2,windowWidth+5,140);  //draws curb
  rect(0-4,windowHeight/2+140,windowWidth+5,8);
  fill(#413839);
  rect(0-4,roadStarty,windowWidth+5,roadThickness); //draws road
  fill(#cacccb);
  rect(0-4,roadStarty+roadThickness,windowWidth+5,8); //draws bottom curb
  fill(#fffc00);
  stroke(#fffc00);
  rect(0-4,roadStarty+(roadThickness/2)-2,windowWidth+5,1); //draws yellow lines on road
  rect(0-4,roadStarty+(roadThickness/2)+2,windowWidth+5,1);
}


//draw the buildings
void drawBuilding() { //procedure to draw each building



  for (int i = 0; i<10; i++){ //draw 8 buildings
    
    if((i == 0) | (i==4) | (i==6)){
    buildingSpread = 3;
    buildingFloors = 4;
    } else if((i == 1) | (i==5) | (i==3)){
    buildingSpread = 2;
    buildingFloors = 3;
    } else if((i == 2) | (i==7)){
    buildingSpread = 3;
    buildingFloors = 8;
    } else if((i== 8)){
    buildingSpread = 3;
    buildingFloors = 6;
    } else if((i == 9)){
    buildingSpread = 5;
    buildingFloors = 9;
    }
    int buildingHeight = buildingFloors * 35 - (buildingFloors/3); //determines height in pixels
    int buildingWidth = buildingSpread * 35; //determines width in pixels
    int buildingY = 420 - buildingHeight; //pushes the building down to the ground
    
    int quadX = 15 * buildingSpread; // width of rooftop
    int quadY = 15 * buildingSpread; // height of rooftop
    
    
    if(i==0){
      r = 255;
      g = 23;
      b = 100;
    } else if(i==1){
      r = 54;
      g = 69;
       b = 100;
    } else if(i==2){
       r = 98;
       g = 23;
       b = 34;
    } else if(i==3){
       r = 23;
       g = 200;
      b = 200;
    } else if(i==4){
       r = 90;
       g = 200;
       b = 60;
    } else if(i==5){
      r = 34;
      g = 105;
       b = 77;
    } else if(i==6){
       r = 167;
       g = 143;
       b = 176;
    } else if(i==7){
      r = 122;
       g = 23;
      b = 167;
    } else if(i==8){
      r = 255;
      g = 23;
       b = 255;
    } else if(i==9){
      r = 05;
       g = 03;
       b = 255;
    }
    
    fill(r, g, b); //determines a random color of the building
    rect(newStartx, buildingY, buildingWidth, buildingHeight); //draw the rectangle for the building
    fill(r + 55, g + 55, b + 55); //makes the roof lighter
    
    quad(newStartx, buildingY, newStartx + quadX, buildingY - quadY, newStartx + quadX + buildingWidth, buildingY - quadY, newStartx + buildingWidth, buildingY); //draw the top of roof
    fill(r - 20, g - 25, b - 30); //makes the side darker than the color as the front
    quad(newStartx + buildingWidth, buildingY, newStartx + quadX + buildingWidth, buildingY - quadY, newStartx + quadX + buildingWidth, buildingY + buildingHeight - quadY, newStartx + buildingWidth, buildingY + buildingHeight);//draws the side of building
    drawDoors(buildingWidth, newStartx, buildingY, buildingHeight); //draws the doors
    drawWindows(buildingFloors, buildingSpread, newStartx, buildingY); //draws windows
    drawSideWindows(buildingFloors, buildingSpread, newStartx, buildingY); //draws the side windows
    newStartx = newStartx + gap + buildingWidth; //the new starting x for the next building is increased
 

  }
  newStartx = gap- 40;
}


void drawDoors(int buildingWidth, int startX, int doorY, int buildingHeight) {
  fill(255,255,255);  //fills the doors being white
  rect(newStartx + (buildingWidth/2 - 25), doorY + buildingHeight - floorHeight, 50, floorHeight); //draws the main portion of the door beign centered at the bottom of the building
  line(newStartx + buildingWidth/2, doorY + buildingHeight - floorHeight, newStartx+ buildingWidth/2, doorY + buildingHeight); //draws the line in the middle of the doors
  line(newStartx + buildingWidth/2 - 10, doorY + buildingHeight - (floorHeight/2) - 3, newStartx+ buildingWidth/2 - 10, doorY + buildingHeight - (floorHeight/2) + 3); //draws the left door handle
  line(newStartx + buildingWidth/2 + 10, doorY + buildingHeight - (floorHeight/2) - 3, newStartx+ buildingWidth/2 + 10, doorY + buildingHeight - (floorHeight/2) + 3); //draws the left door handle
}

void drawWindows(int floors, int spread, int startX, int buildingY) {
  fill(255,255,255);  //fills the doors being white
  int windowSpacing = 8;
  if(spread == 2)
  windowSpacing = 7;
  int newStarty = buildingY + windowSpacing;
  int spreadX = 0;
  for (int x = 0; x<(spread); x++){ //draws a window for the spread scross
    newStarty = buildingY + windowSpacing;
    for (int i = 0; i<(floors - 1); i++){ // draws a window for the height
      rect(startX + windowSpacing + spreadX, newStarty, 25, 25);
      newStarty = newStarty + windowSpacing + 25;
    }
    spreadX = 25 + windowSpacing + spreadX;  //increases the x value of each window for each column
    
  }
}

void drawSideWindows(int floors, int spread, int startX, int buildingY) {
  fill(255,255,255);  //fills the doors being white
  int windowSpacing = 8; //spacing of each window
  int newStarty = buildingY + windowSpacing; //declares the variable as the starting point y for each window
  int spreadX = 35 * spread + 10; //starting point x for first window
  int windowX = 10; 
  int windowY = 5;
  int yOffset = -5;
  int y = 2; 
  int z = -2;
  int w = -3;
  for (int x = 0; x<(spread); x++){ //draws a window for the spread scross
    newStarty = buildingY + windowSpacing; //resets starting point y for each window
    for (int i = 0; i<(floors - 1); i++){ // draws a window for the height
      quad(startX + spreadX + z, newStarty + y, w + z + startX + spreadX + windowX, newStarty - windowY + yOffset + y, z + w + startX + spreadX + windowX, newStarty - windowY + 25 + yOffset + y, z + startX + spreadX, newStarty + 25 + y);
      newStarty = newStarty + windowSpacing + 25;//increments the starting point y for each window
    }
    y = y - 14;
    z = z - 20;
    spreadX = 25 + windowSpacing + spreadX;  //increases the x value of each window for each column
  }
}


//redraws the abckgroudn behind vehicles
void behindVehicles(){

    fill(#413839);
  rect(0-4,roadStarty,windowWidth+5,roadThickness); //draws road
  fill(#cacccb);
    rect(0-4,windowHeight/2+140,windowWidth+5,8);
  rect(0-4,roadStarty+roadThickness,windowWidth+5,8); //draws bottom curb
  rect(0-4,420,windowWidth+5,20);
  fill(#fffc00);
  stroke(#fffc00);
  rect(0-4,roadStarty+(roadThickness/2)-2,windowWidth+5,1); //draws yellow lines on road
  rect(0-4,roadStarty+(roadThickness/2)+2,windowWidth+5,1);
  stroke(0,0,0);
   fill(#347C17);
  rect(0-4,roadStarty+roadThickness+8,windowWidth+5,windowHeight/2+100); //draws grass
 
  
  drawBuilding();
}


