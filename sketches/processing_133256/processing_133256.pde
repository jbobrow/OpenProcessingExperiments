
//James LeVasseur
//Feburary 11th 2014
//My "haunted" house for nmd 295.



//declaration variables
float midx, midy; //used for mid screen
float treex, treey; //used for tree coordinates
boolean point = false;//used for plotting
boolean flickon; //used for flickering of windows

int cloudSpawnOne, cloudSpawnTwo, cloudSpawnThree; //used for spawning clouds at different rates

Weather weather; //a single weather object, determines weather of sketch

float currentWindSpeed, windTime; //floats for determining windspeed and when it changes respectively
int trueWindTime; //int for converting windTime

Orbit theSun,theMoon,theClockMin,theClockHour; //new Orbit objects, sun and moon

float newWind; //float newWind determines new wind speeds

color win1,win2,win3,win4,win5,win6,win7,win8; //colors for windows of the house

Windy theWind; //theWind, a windy object

Timer timerOne,timerTwo,timerThree; //timers used for timing clouds

Timer flickrTime,flickoffTime;//timers used for window flickering

Timer windChange; //determines when the windChanges

ArrayList<Cloudy> clouds; //a new arraylist to contain the clouds

ArrayList<Orbit> stars; //A new ArrayList of orbit objects for stars

ArrayList<WFX> allrain; //used for containg rain

ArrayList<WFX> allsnow; //used for containing snow

ArrayList<WFX> fallensnow; //used for containing snow on the ground

ArrayList<WFX> rainsplash; //used for containing rain splashes

ArrayList<monster> ghosts; //used for containing ghosts

float snowcount,raincount; //variables used for determining amount of rain and snow

void setup(){
  //size of screen
  
  size(780,487);
  //initialization of mid screen variables
  midx=width/2;
  midy=height/2;
  
  //initialization of tree variables
  treex=midx+20;
  treey=midy+35;

  //initializes variables from about
 raincount = 0;
 snowcount = 0;

  //initializes the moon
  theMoon = new Orbit("moon",500,350,midx,midy+150); 
  //initializes the sun
  theSun = new Orbit("sun", 500,390,midx,midy+175);
  theClockHour = new Orbit("hour", 20,20,(width/2)-207.5,(height/2)-60);
  theClockMin = new Orbit("min", 15,15,(width/2)-207.5,(height/2)-60);
  
  
  clouds = new ArrayList<Cloudy>(); //initializing a new arraylist for clouds
  stars = new ArrayList<Orbit>(); //initializes the stars arraylist
  allrain = new ArrayList<WFX>(); //initialize the rain arraylist
  allsnow = new ArrayList<WFX>(); //initialize the snow arraylist
  fallensnow = new ArrayList<WFX>(); //initialize the fallensnow arraylist
  rainsplash = new ArrayList<WFX>(); //initialize the rainsplash arraylist
  ghosts = new ArrayList<monster>(); //initialize the ghosts arraylist
  
  //initializes the wind
  theWind = new Windy();
  //initializes the weather
  weather = new Weather();
  //setting values for cloudpawn, will be used for timers relating to cloud spawn time
  cloudSpawnOne = 8000;
  cloudSpawnTwo = 5000;
  cloudSpawnThree = 12000;
  
  //initializing new timers with their times
  timerOne = new Timer(cloudSpawnOne);
  timerTwo = new Timer(cloudSpawnTwo);
  timerThree= new Timer(cloudSpawnThree);
  
  flickrTime = new Timer(4000);//flickr off is always more than on
  flickoffTime = new Timer(6000);
  //random time between the wind changes direction
  windTime = random(10000,50000);
  //converts the float windTime to an int
  trueWindTime = int(windTime);
  //new Timer for wind
  windChange = new Timer(trueWindTime);
  
  //colors of all the windows, for the flickr function
  win1= color(104,146,150);
  win2= color(104,146,150);
  win3= color(104,146,150);
  win4= color(104,146,150);
  
  win5= color(104,146,150);
  win6= color(104,146,150);
  win7= color(104,146,150);
  win8= color(104,146,150);
  
  //gets the current weather decided by the weather object
  String currentWeather = weather.theWeather();
  
  //spawns several clouds in the middle of the screen at the start of the sketch
  for(int s=0;s<random(1,6);s++){
    //the skies function is used for cloud spawning
      skies(currentWindSpeed,currentWeather,true); //passing windspeed, current weather and a boolean, true is to indicate that this is before the draw function has started, and therefore the clouds should spawn in the middle of the screen
    }
  
  //initializes flickon
  flickon=false;
  //generates 200 stars
  for(int q=0;q<200;q++){
    //night skies generates stars
    nightSkies();
  }
 
}

void draw(){

  background(0,0,100); //background
  smooth(); //used to smooth out lines and objects
  //uses the function horizon for the sky
  horizon(theSun.currentDeg());
  //loops through the stars Arraylist
  for(int j=0;j<stars.size();j++){
    Orbit tempStar = stars.get(j);//sets new orbit equal to current object that j is getting from stars arraylist
    tempStar.run(theSun.currentDeg());//runs that object, passing it the current degree of the sun
  }
  
  String currentWeather = weather.theWeather();//gets the current weather, rewritten here so it will be updated with draw function

  
  theMoon.run(theSun.currentDeg());//runs moon passing the current degree of the sun
  theSun.run(theSun.currentDeg());//runs the sun, passes it's own current deg, but never makes use of it

  
  //for loop to run through the clouds in "clouds"
  for(int i=0;i<clouds.size();i++){
    Cloudy tempCloud = clouds.get(i); //sets temp to current cloud
    tempCloud.run(currentWindSpeed,currentWeather);//runs functions for current cloud
    if(tempCloud.x>width+250||tempCloud.x<-250||tempCloud.opa<10){ //checks to see if current cloud is beyond 50 more than the width
      clouds.remove(tempCloud); //removes current cloud from "clouds" to keep "clouds" small and to conserve memory
    }
  }
  
  

  noStroke(); //used for base house rooms

  rectMode(CENTER); //used for all rectangles
  
  noStroke();
  fill(0,100,0);//color of grass
  rect(midx,midy+175,width,150); //grass

  fill(108,84,129);
  rect(midx,midy+90,110,120);//center room
  rect(midx,midy-25,100,110);//center higher room
  
  fill(150);
  rect(midx+36.5,midy+145,36.5,10);//front foundation right
  rect(midx-36.5,midy+145,36.5,10);//front foundation left
  
  fill(175);
  rect(midx,midy+145,50,10); //front foundation middle

  fill(108,84,129);
  rect(midx+105,midy+95,100,110);//right room
  rect(midx-105,midy+95,100,110);//left room
  
  fill(125);
  rect(midx+105,midy+145,100,10); //right foundation
  rect(midx-105,midy+145,100,10); //left foundation
  
  fill(108,84,129);
  rect(midx+205,midy+87.5,110,125);//far right room
  rect(midx-205,midy+20,110,260);//far left room
  
  rect(midx+222.5,midy-25,75,100);//far right top room
  
  fill(150);
  rect(midx+205,midy+145,110,10);//far right foundation
  rect(midx-205,midy+145,110,10);//far left foundation
  
  stroke(0);
  strokeWeight(1);
  //the following for loops make the siding for different parts of the house as labeled
  //Left Room
  for(int i=0, j=45; i<19;i++){
   
    line(midx-150,midy+j,midx-55,midy+j);
    j+=5;
  }

  //right room
  
  for(int i=0, j=45; i<19;i++){
 
    line(midx+150,midy+j,midx+55,midy+j);
    j+=5;
  }

  //top center
  for(int i=0, j=25; i<21;i++){
  
    line(midx-50,midy+j,midx+50,midy+j);
    j-=5;
  }
  //far right room
  for(int t=0, y=30;t<22;t++){
    line(midx+150,midy+y,midx+260,midy+y);
    y+=5;
  }

  //top far right
  
  for(int q=0, w= 25;q<20;q++){
    
    line(midx+185,midy+w,midx+260,midy+w);
    w-=5;
  }

  
  //clock tower
  for(int e=0, r = 135; e<49;e++){
    
    line(midx-150,midy+r,midx-260,midy+r);
    r-=5;
    
  }

  
  
  //center room
  for(int v = 0, b = 135; v<22;v++){
    line(midx-55,midy+b,midx+55,midy+b);
    b-=5;
    
  }

  noStroke();
  fill(75,119,91);
  triangle(midx-260,midy-110,midx-205,midy-160,midx-150,midy-110);//clock tower roof
  triangle(midx-50,midy-80,midx,midy-122.5,midx+50,midy-80); //center roof
  triangle(midx+185,midy-75,midx+222.5,midy-112.5,midx+260,midy-75); //right roof
  
  fill(219,202,143);
  stroke(0);
  strokeWeight(3);
  ellipse(midx-207.5,midy-60,75,75); //clock face
  strokeWeight(1);
  stroke(108,84,129);
  line(midx+150,midy+40,midx+150,midy+140); //line on right side of house used to break up siding
  line(midx-150,midy+40,midx-150,midy+140); //line on left side of house used to break up siding
  
  fill(102,76,51);
  noStroke();
  rect(midx,midy+117.5,35,45);//front door
  arc(midx,midy+97.5,35,35,PI, TWO_PI); //front door top
  
  stroke(0);
  fill(0);
  ellipse(midx-12.5,midy+117.5,2.5,2.5); //door knobs
  ellipse(midx+190,midy+112.5,2.5,2.5);
 
 
  strokeWeight(2);//for clock lines
  
  stroke(0);
  //lines on the clock
  line(midx-207.5,midy-92.5,midx-207.5,midy-82.5);
  line(midx-185,midy-60,midx-175,midy-60);
  line(midx-240,midy-60,midx-230,midy-60);
  line(midx-207.5,midy-27.5,midx-207.5,midy-37.5);
  
  strokeWeight(1);
  
  noStroke();

  
  fill(175);
  rect(midx-20,midy+102.5,10,75);//front pillars
  rect(midx+20,midy+102.5,10,75);
  
  fill(150);
  rect(midx+50,midy+102.5,7.5,75);//side pillars
  rect(midx-50,midy+102.5,7.5,75);
  
  rect(midx-36.5,midy+60,36.5,10); //top blocks
  rect(midx+36.5,midy+60,36.5,10);
  fill(175);
  rect(midx,midy+60,50,10); //middle block
  
  fill(0);
  rect(midx-205,midy+112.5,45,55); //door for clock tower
  arc(midx-205,midy+85,45,37.5,PI, TWO_PI); //clock tower door top
  
  fill(102,76,51);
  rect(midx+205,midy+118.5,35,45); //far right door
  arc(midx+205,midy+97.5,35,35,PI, TWO_PI); //far right door top

  //window center left
  noStroke(); 
  fill(win1);
  rect(midx-25,midy-37.5,20,30); //rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(1.5);
  rect(midx-25,midy-37.5,20,30); //frame
  line(midx-35,midy-37.5,midx-15,midy-37.5);//frame
  line(midx-25,midy-52.5,midx-25,midy-22.5);//frame
  
  //window center right
  noStroke();
  fill(win2);
  rect(midx+25,midy-37.5,20,30);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(1.5);
  rect(midx+25,midy-37.5,20,30);//frame
  line(midx+35,midy-37.5,midx+15,midy-37.5);//frame
  line(midx+25,midy-52.5,midx+25,midy-22.5);//frame
  
  //window right room left
  noStroke();
  fill(win3);
  rect(midx+77.5,midy+92.5,20,30);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(1.5);
  rect(midx+77.5,midy+92.5,20,30);//frame
  line(midx+67.5,midy+92.5,midx+87.5,midy+92.5);//frame
  line(midx+77.5,midy+107.5,midx+77.5,midy+77.5);//frame
  
  //window right room right
  noStroke();
  fill(win4);
  rect(midx+120,midy+92.5,20,30);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(1.5);
  rect(midx+120,midy+92.5,20,30);//frame
  line(midx+110,midy+92.5,midx+130,midy+92.5);//frame
  line(midx+120,midy+107.5,midx+120,midy+77.5);//frame
  
  //circle window, left room
  noStroke();
  fill(win5);
  ellipse(midx-102.5,midy+60,25,25);//ellipse with blue tint- glass
  stroke(0);
  noFill();
  ellipse(midx-102.5,midy+60,25,25); //first frame
  ellipse(midx-102.5,midy+60,10,10);//smaller frame
  line(midx-102.5,midy+72.5,midx-102.5,midy+47.5); //line frame
  //circle window, right room
  noStroke();
  fill(win6);
  ellipse(midx+97.5,midy+60,25,25);//ellipse with blue tint- glass
  stroke(0);
  noFill();
  ellipse(midx+97.5,midy+60,25,25); //first frame
  ellipse(midx+97.5,midy+60,10,10); //smaller frame
  line(midx+97.5,midy+72.5,midx+97.5,midy+47.5); //line frame
  //right poarch window
  fill(win7);
  noStroke();
  rect(midx+222.5,midy+7.5,25,35); //glass
  arc(midx+222.5,midy-10,25,21,PI, TWO_PI); //glass
  stroke(0);
  noFill();
  rect(midx+222.5,midy+7.5,25,35); //frame
  arc(midx+222.5,midy-10,25,21,PI, TWO_PI);  //frame
  line(midx+222.5,midy+25,midx+222.5,midy-10); //frame
  line(midx+210,midy-10,midx+235,midy-10); //frame
  //left poarch window
  fill(win8);
  noStroke();
  rect(midx-207.5,midy+7.5,25,35); //glass
  arc(midx-207.5,midy-10,25,21,PI, TWO_PI);//glass 
  stroke(0);
  noFill();
  rect(midx-207.5,midy+7.5,25,35); //frame
  arc(midx-207.5,midy-10,25,21,PI, TWO_PI); //frame 
  line(midx-207.5,midy+25,midx-207.5,midy-10); //frame
  line(midx-197.5,midy-10,midx-212.5,midy-10); //frame
  
  
  //function "istime" returns an integer, these assign the returned ints to a variable
  int one = timerOne.istime();
  int two = timerTwo.istime();
  int three = timerThree.istime();
  
  if(one==1&&currentWeather!="blue"||two==1&&currentWeather!="blue"||three==1&&currentWeather!="blue"){ //if any of the ints are 1 skies is called. 1 is returned everytime the timer runs through it's time. The if statement also requires that the weather is not blue, because blue stands for blue skies, aka no clouds, and thusly we don't want clouds spawning then
    skies(currentWindSpeed,currentWeather,false); //calls the skies function, which generates clouds
  }
  

  
  //checks for a return value from flickrTime to see if flickon will be true or not
  int flick = flickrTime.istime();
  if(flick==1){ //if flick returns one 
    flickon=true;//flickon is true

  }
  //if flickoff returns one flickon is set to false and all windows set back to their original color
  //this is to prevent miscolored windows
  int flickoff = flickoffTime.istime();
  if(flickoff ==1){
    flickon=false;
    win1 = color(104,146,150);
    win2 = color(104,146,150); 
    win3 = color(104,146,150); 
    win4 = color(104,146,150); 
    win5 = color(104,146,150); 
    win6 = color(104,146,150); 
    win7 = color(104,146,150); 
    win8 = color(104,146,150); 
  }
  
  //checks for flick on to see if flickr function is activated
  if(flickon==true){//if flickon is true
    flickr(theSun.currentDeg());//calls flickr, passing the current degree of the sun so that the lights only flickr at night
  }
  //declares and initializes a new integer receive the time from windChange.istime()
  int windTimer = windChange.istime();
  //determines what the new wind speed is
  newWind = theWind.isWind(windTimer, currentWindSpeed);
  //sets the current windSpeed to the new windspeed;
  currentWindSpeed = newWind;

  fill(0);
  smooth();
  noStroke();
  

  //calls the creeprs function, passing the sun's current degree
  //creepers is used to spawn ghosts.
  creepers(theSun.currentDeg());

  //calls stormyskies, passing the current weather
  //stormy skies is used to make a lot of weather effects happen at the right time
  stormySkies(currentWeather);
  
//runs the hour hand of the clock
 theClockHour.run(theSun.currentDeg());
 //runs the minute hand of the clock, both take the suns current degree
 theClockMin.run(theSun.currentDeg());
 
  //begin the tree...OF DEATH
    beginShape();

vertex(treex+271.0, treey+206.0);
vertex(treex+285.0, treey+206.0);
vertex(treex+298.0, treey+203.0);
vertex(treex+303.0, treey+203.0);
vertex(treex+307.0, treey+203.0);
vertex(treex+314.0, treey+203.0);
vertex(treex+322.0, treey+203.0);
vertex(treex+324.0, treey+203.0);
vertex(treex+328.0, treey+203.0);
vertex(treex+330.0, treey+203.0);
vertex(treex+333.0, treey+202.0);
vertex(treex+333.0, treey+194.0);
vertex(treex+329.0, treey+189.0);
vertex(treex+328.0, treey+188.0);
vertex(treex+328.0, treey+183.0);
vertex(treex+326.0, treey+176.0);
vertex(treex+326.0, treey+171.0);
vertex(treex+325.0, treey+165.0);
vertex(treex+325.0, treey+164.0);
vertex(treex+325.0, treey+160.0);
vertex(treex+325.0, treey+155.0);
vertex(treex+325.0, treey+148.0);
vertex(treex+324.0, treey+141.0);
vertex(treex+323.0, treey+134.0);
vertex(treex+322.0, treey+127.0);
vertex(treex+322.0, treey+122.0);
vertex(treex+319.0, treey+117.0);
vertex(treex+312.0, treey+114.0);
vertex(treex+305.0, treey+114.0);
vertex(treex+299.0, treey+114.0);
vertex(treex+295.0, treey+115.0);
vertex(treex+292.0, treey+119.0);
vertex(treex+289.0, treey+129.0);
vertex(treex+288.0, treey+136.0);
vertex(treex+288.0, treey+144.0);
vertex(treex+289.0, treey+153.0);
vertex(treex+289.0, treey+157.0);
vertex(treex+289.0, treey+162.0);
vertex(treex+289.0, treey+169.0);
vertex(treex+285.0, treey+175.0);
vertex(treex+279.0, treey+186.0);
vertex(treex+275.0, treey+189.0);
vertex(treex+272.0, treey+195.0);
vertex(treex+272.0, treey+195.0);

  endShape();
  
  beginShape();
  
vertex(treex+297.0, treey+119.0);
vertex(treex+295.0, treey+115.0);
vertex(treex+291.0, treey+106.0);
vertex(treex+291.0, treey+99.0);
vertex(treex+291.0, treey+95.0);
vertex(treex+290.0, treey+86.0);
vertex(treex+288.0, treey+78.0);
vertex(treex+283.0, treey+67.0);
vertex(treex+282.0, treey+66.0);
vertex(treex+282.0, treey+68.0);
vertex(treex+282.0, treey+77.0);
vertex(treex+284.0, treey+83.0);
vertex(treex+285.0, treey+91.0);
vertex(treex+286.0, treey+99.0);
vertex(treex+286.0, treey+102.0);
vertex(treex+290.0, treey+114.0);
vertex(treex+292.0, treey+121.0);
vertex(treex+298.0, treey+123.0);

  endShape();
  
  beginShape();

vertex(treex+305.0, treey+119.0);
vertex(treex+305.0, treey+114.0);
vertex(treex+306.0, treey+108.0);
vertex(treex+308.0, treey+103.0);
vertex(treex+308.0, treey+91.0);
vertex(treex+308.0, treey+87.0);
vertex(treex+308.0, treey+80.0);
vertex(treex+311.0, treey+69.0);
vertex(treex+311.0, treey+67.0);
vertex(treex+311.0, treey+67.0);
vertex(treex+313.0, treey+69.0);
vertex(treex+314.0, treey+74.0);
vertex(treex+313.0, treey+78.0);
vertex(treex+312.0, treey+82.0);
vertex(treex+311.0, treey+96.0);
vertex(treex+311.0, treey+100.0);
vertex(treex+311.0, treey+107.0);
vertex(treex+311.0, treey+115.0);
vertex(treex+309.0, treey+124.0);

  endShape();
  
  beginShape();
  
vertex(treex+318.0, treey+126.0);
vertex(treex+319.0, treey+119.0);
vertex(treex+322.0, treey+114.0);
vertex(treex+325.0, treey+107.0);
vertex(treex+330.0, treey+97.0);
vertex(treex+332.0, treey+91.0);
vertex(treex+335.0, treey+83.0);
vertex(treex+339.0, treey+77.0);
vertex(treex+343.0, treey+71.0);
vertex(treex+343.0, treey+72.0);
vertex(treex+344.0, treey+77.0);
vertex(treex+343.0, treey+83.0);
vertex(treex+339.0, treey+88.0);
vertex(treex+338.0, treey+93.0);
vertex(treex+338.0, treey+98.0);
vertex(treex+336.0, treey+105.0);
vertex(treex+331.0, treey+111.0);
vertex(treex+328.0, treey+117.0);
vertex(treex+324.0, treey+122.0);
vertex(treex+321.0, treey+127.0);

  endShape();
  
  beginShape();

vertex(treex+296.0, treey+126.0);
vertex(treex+291.0, treey+124.0);
vertex(treex+290.0, treey+124.0);
vertex(treex+279.0, treey+118.0);
vertex(treex+273.0, treey+115.0);
vertex(treex+268.0, treey+111.0);
vertex(treex+262.0, treey+107.0);
vertex(treex+255.0, treey+105.0);
vertex(treex+247.0, treey+102.0);
vertex(treex+241.0, treey+99.0);
vertex(treex+244.0, treey+100.0);
vertex(treex+251.0, treey+105.0);
vertex(treex+256.0, treey+113.0);
vertex(treex+264.0, treey+118.0);
vertex(treex+271.0, treey+120.0);
vertex(treex+278.0, treey+125.0);
vertex(treex+282.0, treey+128.0);
vertex(treex+289.0, treey+131.0);
vertex(treex+290.0, treey+131.0);

  endShape();
  
  beginShape();

vertex(treex+300.0, treey+135.0);
vertex(treex+292.0, treey+135.0);
vertex(treex+290.0, treey+134.0);
vertex(treex+281.0, treey+133.0);
vertex(treex+273.0, treey+132.0);
vertex(treex+270.0, treey+131.0);
vertex(treex+257.0, treey+128.0);
vertex(treex+255.0, treey+127.0);
vertex(treex+245.0, treey+125.0);
vertex(treex+237.0, treey+124.0);
vertex(treex+241.0, treey+125.0);
vertex(treex+254.0, treey+133.0);
vertex(treex+257.0, treey+133.0);
vertex(treex+265.0, treey+135.0);
vertex(treex+268.0, treey+138.0);
vertex(treex+277.0, treey+142.0);
vertex(treex+287.0, treey+144.0);
vertex(treex+288.0, treey+144.0);
vertex(treex+291.0, treey+144.0);

  endShape();
  
  beginShape();
  
vertex(treex+317.0, treey+137.0);
vertex(treex+321.0, treey+135.0);
vertex(treex+329.0, treey+131.0);
vertex(treex+336.0, treey+129.0);
vertex(treex+341.0, treey+125.0);
vertex(treex+349.0, treey+119.0);
vertex(treex+353.0, treey+118.0);
vertex(treex+358.0, treey+114.0);
vertex(treex+358.0, treey+114.0);
vertex(treex+358.0, treey+119.0);
vertex(treex+352.0, treey+126.0);
vertex(treex+346.0, treey+129.0);
vertex(treex+343.0, treey+134.0);
vertex(treex+342.0, treey+135.0);
vertex(treex+330.0, treey+142.0);
vertex(treex+329.0, treey+142.0);
vertex(treex+322.0, treey+148.0);

  endShape();
  
  beginShape();
  
vertex(treex+308.0, treey+128.0);
vertex(treex+305.0, treey+124.0);
vertex(treex+302.0, treey+119.0);
vertex(treex+294.0, treey+114.0);
vertex(treex+289.0, treey+107.0);
vertex(treex+284.0, treey+101.0);
vertex(treex+275.0, treey+88.0);
vertex(treex+267.0, treey+81.0);
vertex(treex+258.0, treey+75.0);
vertex(treex+258.0, treey+75.0);
vertex(treex+266.0, treey+84.0);
vertex(treex+272.0, treey+93.0);
vertex(treex+277.0, treey+102.0);
vertex(treex+284.0, treey+113.0);
vertex(treex+290.0, treey+122.0);
vertex(treex+293.0, treey+127.0);

  endShape();
  
  beginShape();
  
vertex(treex+309.0, treey+129.0);
vertex(treex+309.0, treey+123.0);
vertex(treex+310.0, treey+119.0);
vertex(treex+315.0, treey+106.0);
vertex(treex+321.0, treey+85.0);
vertex(treex+326.0, treey+72.0);
vertex(treex+328.0, treey+65.0);
vertex(treex+328.0, treey+68.0);
vertex(treex+327.0, treey+82.0);
vertex(treex+323.0, treey+99.0);
vertex(treex+318.0, treey+109.0);
vertex(treex+315.0, treey+118.0);

  endShape();
  
  beginShape();

vertex(treex+307.0, treey+127.0);
vertex(treex+306.0, treey+115.0);
vertex(treex+303.0, treey+101.0);
vertex(treex+303.0, treey+86.0);
vertex(treex+300.0, treey+71.0);
vertex(treex+298.0, treey+57.0);
vertex(treex+298.0, treey+58.0);
vertex(treex+298.0, treey+82.0);
vertex(treex+298.0, treey+100.0);
vertex(treex+298.0, treey+119.0);
vertex(treex+304.0, treey+134.0);

  endShape();

//end of tree
//begin tombstones
fill(100);
noStroke();
beginShape();

vertex(36,467);
vertex(37,467);
vertex(43,467);
vertex(47,467);
vertex(51,467);
vertex(55,466);
vertex(60,465);
vertex(64,465);
vertex(68,465);
vertex(69,463);
vertex(71,456);
vertex(72,450);
vertex(72,447);
vertex(72,443);
vertex(72,438);
vertex(72,435);
vertex(72,431);
vertex(69,429);
vertex(63,428);
vertex(58,428);
vertex(54,428);
vertex(50,428);
vertex(46,428);
vertex(43,428);
vertex(41,428);
vertex(39,428);
vertex(39,430);
vertex(39,441);
vertex(38,448);
vertex(38,452);
vertex(37,456);
vertex(36,459);
vertex(36,459);

endShape();

beginShape();

vertex(107,466);
vertex(107,466);
vertex(104,465);
vertex(109,465);
vertex(112,465);
vertex(116,465);
vertex(118,465);
vertex(118,464);
vertex(118,462);
vertex(119,459);
vertex(120,453);
vertex(121,447);
vertex(123,440);
vertex(123,437);
vertex(123,431);
vertex(123,426);
vertex(122,417);
vertex(113,416);
vertex(107,417);
vertex(102,424);
vertex(101,431);
vertex(101,440);
vertex(100,447);
vertex(99,453);
vertex(99,457);
vertex(99,460);
vertex(99,463);

endShape();

beginShape();
 
vertex(147,467);
vertex(148,467);
vertex(154,464);
vertex(160,464);
vertex(164,464);
vertex(170,461);
vertex(170,449);
vertex(170,441);
vertex(170,436);
vertex(170,426);
vertex(159,423);
vertex(153,425);
vertex(147,439);
vertex(143,459);
vertex(143,462);

endShape();
//end tomb stones

//for loop for running rain drops in the allrain arraylist
for(int r=0;r<allrain.size();r++){
    WFX tempDrop = allrain.get(r);
    
    if(tempDrop.y<tempDrop.splashat){//if tempDrop's y coordinate is less that tempDrop's splashat point
      tempDrop.run("drop");//run tempDrop as a "drop" type
    } else if(tempDrop.y>tempDrop.splashat){//else if tempDrop's y value is greater than it's splashat value, or it has passed the point where it should splash
      rainsplash.add(tempDrop);//tempDrop is added to rainsplash
      allrain.remove(tempDrop);//tempdrop is remove from rain
      //this essentially means that it's becomes splashing rain drop, and stops being a falling rain drop
    }
  }
  
  for(int s=0;s<allsnow.size();s++){//for loop that loops through the allsnow arraylist
    WFX tempSnow = allsnow.get(s);
    
    if(tempSnow.y<tempSnow.splashat){//if tempsnow is above it's splashat point
      tempSnow.run("flake");//run tempsnow as a flake
    } else if(tempSnow.y>tempSnow.splashat){//else if it's passsed it's splashat point
      fallensnow.add(tempSnow);//add tempsnow to fallensnow arraylist
      allsnow.remove(tempSnow);//remove tempsnow from allsnow
    }
  }
  
  for(int p=0;p<rainsplash.size();p++){//for loop running through rainsplash arraylist
    WFX tempSplash = rainsplash.get(p);
    
    tempSplash.run("splash");//run tempsplash as a splash
    if(tempSplash.op<50){//if tempsplash's op (opacity) value is less than 50
      rainsplash.remove(tempSplash);//remove tempsplash
    }
  }
  
  for(int f=0;f<fallensnow.size();f++){//for loop for fallen snow arraylist
    WFX tempFallen = fallensnow.get(f);
    
    tempFallen.run("fallen");//run fallen snow as fallen type
    
    if(currentWeather=="sunny"){//if weather is sunny
      tempFallen.op-=1;//reduce opacity for tempfallen by 1 per loop
    } else if(currentWeather=="blue"){//if blue skies
      tempFallen.op-=2;//reduce by 2
    } else if(currentWeather=="rain"){//same as blue
      tempFallen.op-=2;
    } else if(currentWeather=="snow"){//if snowing, increase opacity by 2
      tempFallen.op+=2;
    } else if(currentWeather=="cloudy"){//if cloudy
      tempFallen.op-=.05;//reduce by .05
    }
    
    if(tempFallen.op<50){//if tempfallen's opacity is less than 50
     fallensnow.remove(tempFallen); //remove tempfallen
    }
  }
  
  for(int g=0;g<ghosts.size();g++){//for loop for ghosts arraylist
    monster tempGhost = ghosts.get(g);
    
    if(theSun.currentDeg()>170 && theSun.currentDeg() <= 350){//if it's day time
      tempGhost.op-=.5;//tempghost's opacity is reduce by .5 per loop
    }
    
    if(tempGhost.op<5){//if tempghost's opacity is greater than 5
      ghosts.remove(tempGhost);//remove temp ghost
    }
    
    tempGhost.run("ghost");//run ghost as ghost object
  }

}//end of draw

//FUNCTION CREEPERS//
void creepers(float sundeg){//creepers takes the current degree of the sun
  
  if(sundeg>170 && sundeg <= 350){//if it's day time
  //nothing happens
    
  } else if(ghosts.size()<6){//else if there are less than 6 ghosts on the screen

    ghosts.add(new monster());//add a new monster class to ghosts

  }
}

//FUNCTION HORIZON//
void horizon(float sundeg){//takes the current degrees of the sun
  
  float degScaleOne,degScaleTwo,degScaleThree;//declare variables for sky color change
  
  if(sundeg>180 && sundeg <= 270){ //changes sky color for morning/ mid day
  //mapping the sun's degrees to color values
    degScaleOne = map(sundeg,180,270,21,153);
    degScaleTwo = map(sundeg,180,270,33,212);
    degScaleThree = map(sundeg,180,270,153,255);
    
    
  } else if(sundeg>270 && sundeg<=360){ //declares sky color for evening
      //mapping the sun's degrees to color values
    degScaleOne= map(sundeg,270,360,153,21);
    degScaleTwo= map(sundeg,270,360,212,33);
    degScaleThree= map(sundeg,270,360,255,153);
    
  } else{ //sky color for night
  //night time color values
   degScaleOne = 21;
   degScaleTwo = 33;
   degScaleThree = 153;
  }
  rectMode(CORNERS); //sets rectMode to corners for the sky
  noStroke(); 
  fill(degScaleOne,degScaleTwo,degScaleThree); //fill for sky

  rect(-10,-10,width,(height/2)+175); //the horizon/sky
  rectMode(CENTER);//resets to center

}


//FUNCTION NIGHT SKIES//

void nightSkies(){
  
  float starX = 500; //starX, x coordinate of stars is constantly 500
  float starY = random(100,700); //the Y coordinate of is between 100 and 700
  float defDeg = random(0,359); //puts the stars at a random degree point, random point in their rotation

  stars.add(new Orbit("star",starX,starY,midx,midy+175,defDeg));//adds new stars to arralist stars
}

//FUNCTION Stormy SKIES//
void stormySkies(String weatheris){//stormyskies takes the current weather in string form
  
  if(weatheris == "rain" && allsnow.size()<1){//if current weather is rain and it isn't snowing
    raincount = 3;//raincount=3
  } else if(weatheris != "rain" && raincount>=0){
    raincount-=.01;// if it isn't raining and raincount isn't 0, then reduce raincount by .01
    //this is to gradually stop the rain, rather than all at once.
  }
  //same idea with this if else block here, but for snow
  if(weatheris == "snow" && allrain.size()<1){
    snowcount = 3;
  } else if(weatheris != "snow" && snowcount>=0){
    snowcount-=.01;
  }
  //if there are clouds in the sky
  if(clouds.size()>1){
      //if p is less than raincount
      for(int p=0;p<raincount;p++){
        
        float rainX = random(0,width);//random rain width
        
        allrain.add(new WFX(rainX,0));//add new weather effects object to allrain
        
      }
      //again, same concept but with snow
       for(int s=0;s<snowcount;s++){
        
        float snowX = random(0,width);
        
        allsnow.add(new WFX(snowX,0));
        
      }
      
      //NOTE: this was could for putting snow on roofs, but it ended up being time consuming, and was never finished, still might finish it someday because i was very close i think
      //midx-260,midy-110,midx-205,midy-160,midx-150,midy-110
     // triangle(130,133,185,83,240,133);//clock tower roof
  //triangle(midx-50,midy-80,midx,midy-122.5,midx+50,midy-80); //center roof
  //triangle(midx+185,midy-75,midx+222.5,midy-112.5,midx+260,midy-75); //right roof
      /*for(int f=0;f<5;f++){
        float g = random(0,50);
        float fallenY= 83+g;
        
        
        float d=1.1;
        
        float m=random(0, fallenY*d);
        
        float fallenX = 157.5+m;
        
        fallensnow.add(new WFX(fallenX,fallenY));
        
      }*/
      
}
  
  if(weatheris == "cloudy" || weatheris =="rain" || weatheris =="snow"){//if the weather is cloudy, snow, or rain
    //set cloudspawn times to be less than usual
    cloudSpawnOne = 7000;
    cloudSpawnOne = 4000;
    cloudSpawnOne = 10000;
    
  } else if(weatheris == "sunny"){//if the weather is sunny
    
    cloudSpawnOne = 18000;//slower times
    cloudSpawnOne = 12000;
    cloudSpawnOne = 25000;
    
  } else {
   //else normal times
     cloudSpawnOne = 8000;
     cloudSpawnTwo = 5000;
     cloudSpawnThree = 12000;
    
  }
  
}


//FUNCTION SKIES//

void skies(float currentWindSpeed, String weatheris, boolean predraw){ //skies function
  float originX;
  if(predraw){
    originX = random(0,width);
  } else {
    originX = -175; //all clouds are spawned off screen originX is the x coordinate of the "origin" ellipse that all clouds are based off of.

  }
  
  float originY = random(15,height/2-25); //the origin y for the origin ellipse is random from 15 to half the height of the screen minus 50
  
  float originD = random(10,50); //the diameter of the origin ellipse
  
  String currentW = "Spring";
  
  if(currentWindSpeed<0&&predraw==false){
     originX=(originX+width+250);
   }
  
  clouds.add(new Cloudy(originX,originY,originD,currentW,weatheris)); //adds the origin ellipse to "clouds"
  
  for(float y = random(35,55);y>0;y--){ //begins a for loop that determines the size of the cloud. That is, how many ellipses it has, chosen randomly between 5 and 15
    
    float dec1 = random(-1,1); //dec stands for decide, dec1 & 2 will determine if the ellipse spawns higher or lower, to the left or right of the origin ellipse
    float dec2 = random(-1,1);
    
    float sp1; //declaring sp1 and sp2 sp stands for space
    float sp2;
    
    float selfD = random(15,75);//declares selfD and sets it to random. selfD is the diameter of the current ellipse
    
    if(dec1>0){//checking to see if the ellipse will spawn on the left or right of the origin ellipse
    //the spacing pushes the current ellipse further away from the origin ellipse by adding twice the diameter to the X or Y coordinate
      sp1 = originD*2.5;//if on the right, the spacing is positive

    } else{
     sp1 = originD*2.5*-1;  //if on the left the spacing is negative

    }
    
    if(dec2>0){//checking to see if the ellipse will spawn above or below of the origin ellipse
      //the spacing pushes the current ellipse further away from the origin ellipse by adding twice the diameter to the X or Y coordinate
      sp2 = originD*2; //if below the spacing is positive

    } else{
     sp2 = originD*2*-1; //if above the spacing is negative

    }
    
    
    
    
    //sets the X and Y coordinates of the current ellipse, with spacing added
    //the X and Y coordinates are chosen between the Origin X or Y and the Origin plus spacing
    float selfX = random(originX,originX+sp1); 
    //the spacing for the Y coordinate is given less spacing for a more "cloud-like" look
    float selfY = random(originY,originY+sp2/4);
    
    //adds the ellipse to cloudy
    clouds.add(new Cloudy(selfX,selfY,selfD,currentW,weatheris));
  }
  
  
}


//////////////function FLICKR/////////////
//////////////////////////////////////

void flickr(float sundeg){

  //this float determines which window is flickered
  float winWhichf = random(1,9);
  //convert float to int
  int winWhich = int(winWhichf);
  //switch checking for which window to flickr
  if(sundeg>=170&& sundeg<=350){
    
  } else {
  switch (winWhich) {
    
    case 1:
    for(float r=random(5,20);r>0;r--){//flickrs a random amount of times

      float current =random(300);//this float helps to determine the state of the window
      if(current>100){//checks for current
      
        win1 = color(245,245,153);//window is on
        
      } else{
        
        win1 = color(104,146,150); //window is off
        
      }
    }
    
    break;//breaks afterwards
    //the following cases are all setup the same
    case 2:
    for(float r=random(5,20);r>0;r--){

      float current =random(300);
      if(current>100){
      
        win2 = color(245,245,153);
        
      } else{
        
        win2 = color(104,146,150); 
        
      }
    }
    
    break;
    
    case 3:
    for(float r=random(5,20);r>0;r--){

      float current =random(300);
      if(current>100){
      
        win3 = color(245,245,153);
        
      } else{
        
        win3 = color(104,146,150); 
        
      }
    }
    
    break;
    
    case 4:
    for(float r=random(5,20);r>0;r--){

      float current =random(300);
      if(current>100){
      
        win4 = color(245,245,153);
        
      } else{
        
        win4 = color(104,146,150); 
        
      }
    }
    
    break;
    
    case 5:
    for(float r=random(5,20);r>0;r--){

      float current =random(300);
      if(current>100){ 
      
        win5 = color(245,245,153);
        
      } else{
        
        win5 = color(104,146,150); 
        
      }
    }
    
    break;
    
    case 6:
    for(float r=random(5,20);r>0;r--){

      float current =random(300);
      if(current>100){
      
        win6 = color(245,245,153);
        
      } else{
        
        win6 = color(104,146,150); 
        
      }
    }
    
    break;
    
    case 7:
    for(float r=random(5,20);r>0;r--){

      float current =random(300);
      if(current>100){
      
        win7 = color(245,245,153);
        
      } else{
        
        win7 = color(104,146,150); 
        
      }
    }
    
    break;
    
    case 8:
    for(float r=random(5,20);r>0;r--){

      float current =random(300);
      if(current>100){
      
        win8 = color(245,245,153);
        
      } else{
        
        win8 = color(104,146,150); 
        
      }
    }
    
    break;

  }
  }
  
}

class WFX{
  //declare class variables
  float x,y,xmo,ymo,splashat,op,oneX,oneY,twoX,twoY,threeX,threeY;
  String type;
 WFX(float px, float py){//takes parameters x and y
   //setting up x and y to parameters x and y
   x=px;
   y=py;
   op=255; //opacity starts at fully opaque
   splashat=random((height/2)+100,height);//splasat point is a point on the y axis, determines when rain splashes, and snow settles
   
   if(x>130 && x<595+55){//checks to see if the object is spawned withing the x boundries of the house
     if(splashat<=393 && splashat>=(height/2)+100){//checks if the splashat point is intersecting with the house
       splashat+=50;//if so it moves the splash point up so it doesn't splash on the house
     }
   }
   
   
 }
 
 void run(String objtype){ //run takes a string indicating what object type this will be
   type=objtype;//sets objtype to instance variable type
   
   if(type=="drop"){//if type is drop
     //sets acceleration for rain drop
     xmo=0;
     ymo=2;
     
     raindrop();//runs raindrop
     
   } else if(type=="flake"){//checks for type
     //sets accelleration
     xmo=0;
     ymo=1;
     snowflake();//runs snowflake
     
   } else if(type=="fallen"){//checks type
     xmo=0;//fallen is a settled snowflake, so not accelleration
     ymo=0;
     snowflake();//runs a snowflake
   } else if(type=="splash"){//if splash type
     xmo=0;//no x and y accelleration
     ymo=0;
     
     oneX=x; //sets new x and y values for splasher
     oneY=y;
     twoX=x;
     twoY=y;
     threeX=x;
     threeY=y;
     splasher();//runs splasher and splashmo
     splashmo();
   }
   
   motion();//runs motion
 }
 
 void raindrop(){
   //makes thing blue rectangle
   noStroke();
   fill(39,122,231);
   rect(x,y,1,5);
   
 }
 
 void snowflake(){
   //makes small white ellipse
   noStroke();
   fill(255,255,255,op);
   ellipse(x,y,2,2);
   
 }
 
 void splasher(){
   //makes three blue ellipses
   noStroke();
   fill(39,122,231,op);
   ellipse(oneX,oneY,3,3);
   ellipse(twoX,twoY,3,3);
   ellipse(threeX,threeY,3,3);
   
 }
 
 void splashmo(){
   //moves the three ellipses outward at different angles
  oneX+=-1;
  oneY+=-.5;
  
  
  twoY+=-1;
  
  threeX+=1;
  threeY+=.5;
  
  op-=5;//reduces opacity as it does
  
 }
 
 
 void motion(){
   //moves objects on x and y axises
  x+=xmo;
  y+=ymo;
 }
  

 
}

//////////////CLASS WEATHER//////////////
////////////////////////////////////////
class Weather{
  //declaring instance variables
 int progress,timeLimit;
 
 float limitis,pickWeather;
   
 String weatheris;
 //makes a list of possible weather affects as strings
 String[] FX ={"snow","rain","sunny","cloudy","blue"};
 
 Weather(){
   
   limitis = random(15000,30000);//makes random limit for changing weather
   //Note: I built the timer withing the class in weather, as opposed to outside as with cloudy
   //this is probably a more preferably method, and will continue to use this sort of method in the future
   
   timeLimit = int(limitis);//setting limit
   
   progress = millis();//progress is millis
   
   pickWeather = random(0,5);//used for choosing weather
   
   weatheris = FX[int(pickWeather)];//chooses weather based on pickWeather
   
 }
 
void run(){
  
  theWeather();//runs the weather, I generally always put stuff in run even if only one function as a workflow trait
  //it makes me think less hard about what i need to call for every class, then i can save brain power
  //brain power I use for things like thinking about cats
  //i like cats.
}

String theWeather(){
  int passedTime = millis()-progress;//weather has it's own timer
  if(passedTime>timeLimit){//checks for time passing time limit
    
    limitis = random(15000,30000);//chooses a new random timelimit
   
   timeLimit = int(limitis);//sets the new limit
    
    pickWeather = random(0,5);//picks a new weather type
   
   weatheris = FX[int(pickWeather)];//assigns new weather type
    
    progress = millis();//resets timer
  }
  //the following are key inputs used for changing the weather
  //I used them for making testing quicker, but see no reason to remove them
  if(keyPressed && key=='1'){//if pressing a key and a key is one
    weatheris="sunny";//weather is sunny
    //etc.
    //it was 12:35 am when I wrote this
  }
  if(keyPressed && key=='2'){
    weatheris="blue";
  }
  if(keyPressed && key=='3'){
    weatheris="rain";
  }
  if(keyPressed && key=='4'){
    weatheris="snow";
  }
  if(keyPressed && key=='5'){
    weatheris="cloudy";
  }

  return weatheris;//returns weatheris, the chosen weather
  
} 
}
////////////////CLASS MONSTER////////////
////////////////////////////////////////
class monster{
  //declaring instance variables
  int ghostbod;
  float bodchooser,op,ecto;
  float midx,midy,contX,contY,xmo,ymo,revcontX,revcontY;
  monster(){
    
    bodchooser=random(0,5);//chooses body
    ghostbod= int(bodchooser);//sets choice
    
    //sets random opacity
    op= random(50,150);
    //sets random color
    ecto = random(255);
    
    //sets a random containment point for x and y
    //this will be used for dynamic collision detection for ghosts
    contX = random(width/2,width);
    contY = random(height/2,height);
    
    //sets and opposite containment point forming a box
    revcontX = contX-(contX/2);
    revcontY = contY-(contY/2);
    
    //chooses random speeds
    xmo=random(-.8,.8);
    ymo=random(-.2,.2);
    //midx is different here from in the main sketch
    //the reason is i made the ghostbods in another program and used midx for that too
    //lesson learned, be less consistent with variable names
    //midx and y here choose a random spawn point within the containment box
    midx=random(revcontX,contX);
    midy=random(revcontY,contY);
  }
  
  void run(String breed){//breed is equivalent to type, but variety is the spice of life
    if(breed=="ghost"){//i don't even know why i did this, i was never going to have time for other monsters
      //runs all this stuff
      ghost();
      ghostmo();
      ghostcont();
    }
  }
  
  void ghost(){
    noStroke();
    fill(ecto,op);
    //bodies are chosen based on ghostbod
    //the bods are made with vertexes and beginshape/endshape
    if(ghostbod==1){
        beginShape();

vertex(midx-21.0, midy+47.0);
vertex(midx-18.0, midy+47.0);
vertex(midx-7.0, midy+45.0);
vertex(midx+6.0, midy+44.0);
vertex(midx+12.0, midy+46.0);
vertex(midx+19.0, midy+47.0);
vertex(midx+24.0, midy+47.0);
vertex(midx+27.0, midy+33.0);
vertex(midx+28.0, midy+24.0);
vertex(midx+26.0, midy+14.0);
vertex(midx+26.0, midy-16.0);
vertex(midx+26.0, midy-25.0);
vertex(midx+22.0, midy-36.0);
vertex(midx+14.0, midy-46.0);
vertex(midx+2.0, midy-50.0);
vertex(midx-16.0, midy-46.0);
vertex(midx-26.0, midy-32.0);
vertex(midx-29.0, midy-13.0);
vertex(midx-31.0, midy-2.0);
vertex(midx-31.0, midy+8.0);
vertex(midx-31.0, midy+21.0);
vertex(midx-31.0, midy+28.0);
vertex(midx-31.0, midy+33.0);

  endShape();
    } else if(ghostbod==2){
      
beginShape();

vertex(midx-31.0, midy+51.0);
vertex(midx-23.0, midy+46.0);
vertex(midx-19.0, midy+46.0);
vertex(midx-4.0, midy+50.0);
vertex(midx+8.0, midy+53.0);
vertex(midx+22.0, midy+54.0);
vertex(midx+26.0, midy+54.0);
vertex(midx+28.0, midy+43.0);
vertex(midx+28.0, midy+29.0);
vertex(midx+28.0, midy+18.0);
vertex(midx+28.0, midy+6.0);
vertex(midx+26.0, midy-10.0);
vertex(midx+26.0, midy-18.0);
vertex(midx+22.0, midy-41.0);
vertex(midx+15.0, midy-52.0);
vertex(midx+3.0, midy-58.0);
vertex(midx-15.0, midy-60.0);
vertex(midx-35.0, midy-48.0);
vertex(midx-43.0, midy-24.0);
vertex(midx-43.0, midy-4.0);
vertex(midx-43.0, midy+13.0);
vertex(midx-42.0, midy+29.0);
vertex(midx-41.0, midy+43.0);

  endShape();
    } else if(ghostbod==3){
        beginShape();
vertex(midx-27.0, midy+63.0);
vertex(midx-15.0, midy+58.0);
vertex(midx-6.0, midy+58.0);
vertex(midx+1.0, midy+59.0);
vertex(midx+18.0, midy+60.0);
vertex(midx+36.0, midy+65.0);
vertex(midx+45.0, midy+66.0);
vertex(midx+49.0, midy+51.0);
vertex(midx+50.0, midy+34.0);
vertex(midx+51.0, midy+23.0);
vertex(midx+52.0, midy+6.0);
vertex(midx+51.0, midy-9.0);
vertex(midx+47.0, midy-22.0);
vertex(midx+41.0, midy-35.0);
vertex(midx+25.0, midy-52.0);
vertex(midx+11.0, midy-59.0);
vertex(midx-8.0, midy-59.0);
vertex(midx-18.0, midy-53.0);
vertex(midx-29.0, midy-38.0);
vertex(midx-37.0, midy-11.0);
vertex(midx-38.0, midy+17.0);
vertex(midx-38.0, midy+33.0);
vertex(midx-38.0, midy+50.0);
vertex(midx-38.0, midy+51.0);
  endShape();
    } else if(ghostbod==4){
     
  beginShape();

vertex(midx-28.0, midy+49.0);
vertex(midx-28.0, midy+38.0);
vertex(midx-28.0, midy+29.0);
vertex(midx-28.0, midy+12.0);
vertex(midx-28.0, midy-20.0);
vertex(midx-28.0, midy-40.0);
vertex(midx-18.0, midy-57.0);
vertex(midx-11.0, midy-62.0);
vertex(midx+5.0, midy-64.0);
vertex(midx+16.0, midy-64.0);
vertex(midx+26.0, midy-59.0);
vertex(midx+33.0, midy-49.0);
vertex(midx+36.0, midy-33.0);
vertex(midx+36.0, midy-10.0);
vertex(midx+36.0, midy+10.0);
vertex(midx+36.0, midy+27.0);
vertex(midx+33.0, midy+39.0);
vertex(midx+29.0, midy+50.0);
vertex(midx+29.0, midy+55.0);
vertex(midx+17.0, midy+56.0);
vertex(midx+8.0, midy+56.0);
vertex(midx-9.0, midy+55.0);
vertex(midx-14.0, midy+53.0);

  endShape(); 
    }
    
  }
  
  void ghostmo(){
    //makes ghosts move
    midx+=xmo;
    midy+=ymo;
  }
  
  void ghostcont(){
    //checks for collision for the ghosts containment field
    if(midx<=revcontX||midx>=contX){
      xmo*=-1;
    }
    if(midy<=revcontY||midy>=contY){
      ymo*=-1;
    }
  }
  
}

///////////////////CLASS ORBIT////////////////
//////////////////////////////////////////////
class Orbit{
  //declaresfloats for the class
  float x,y,orbitX, orbitY, deg,midx,midy,d,opa;
  //declares ints for the class
  int progress, timeLimit,ts,h,m,s;
  //inc is a double for accuracy
  float inc;
  //string type
  String type;
  //first Orbit constructor for moons and sun
  Orbit(String typePara,float px,float py,float pmidx, float pmidy){
     //the type is used to determine what kind of Orbit object it will be i.e. sun, moon, star
     type=typePara;
     //all orbits move at one second
     timeLimit = 1000;
     //gives degScale a placeholder
     
     h= hour();
     m= minute();
     s= second();
     
     ts=(3600*h)+(m*60)+s;
     
     if(typePara=="sun"){//for now the sun starts at noon always
        deg=ts*.00416666666;
        deg+=90;
        if(deg>360){
          deg=deg-360;
        }
       
     } else if(typePara=="hour"){
       
       
       deg=ts*(.00416666666*2);
       
        deg+=270;
        if(deg>360){
          deg=deg-360;
        }
        
     println("ts: "+ts);
     println("deg: "+deg);
       
     } else {
      deg=90; //moon starts opposite of sun
     }
     //setting class variables to parameters
     orbitX =px; 
     orbitY =py;
     
     midx=pmidx;
     midy=pmidy;
     //opa starts at 255, fully opaque
     opa=255;

   }
   //SECOND class constructor, orbit. Use for Stars
   //Note: a second constructor was not really needed, but I wanted to try using one.
   Orbit(String typePara,float px,float py,float pmidx, float pmidy,float defDeg){
     //still accepts type
     type=typePara;
     //same time
     timeLimit = 1000;

     //checks to make sure it is a star
     if(typePara=="star"){
       //this constructor accepts one additional parameter, degDeg. This allows the stars to spawn at different points in their orbit based on input
       deg = defDeg;
     }
     
     orbitX =px;
     orbitY =py;
     
     midx=pmidx;
     midy=pmidy;
     
     opa=255;
     
     
 
   }
   

   
   void run(float sundeg){//function run takes the suns current degrees so that it can pass it along to other functions
     translate(midx,midy);//transaltes to half screen
     
     
    if(type=="sun"){//checks for type
      sun();//calls sun fucntion
      inc=.0041666666666666666666666*24;//sets inc for sun
      d=50;//sets diameter for sun
     
     
    }
      
    
    
    if(type=="star"){//checks for type
      star(sundeg);//calls star function
      inc=.000001*24;//sets inc for stars

    }
    
    if(type=="moon"){//checks for type
      moon(sundeg);//calls moon
      inc=.005*24;//sets inc for moon
      d=40;//sets diamter for moon
     
      }
      
    if(type=="min"){
      //inc=.005*24;//sets inc for moon
      clock(sundeg, type);
        
      }
      
    if(type=="hour"){
      //inc=.005*24;//sets inc for moon
      clock(sundeg, type);
        
      }
    
    
    
    makeOrbit();
    translate(midx*-1,midy*-1);//offsets previous translate
    
    if(deg>=360){//resets deg for trackability purposes
      deg=0;
   }
   }
   
   void clock(float sundeg, String hand){
     if(hand=="hour"){
       
       inc=.0041666666666666666666666*48;
       
     } else if(hand=="min"){
       
       inc=.0041666666666666666666666*2880;
       
     }
     
     x = cos(radians(deg)) * orbitX;
  
     y = sin(radians(deg)) * orbitY;
     
     stroke(0);
     strokeWeight(2.5);
     line(0,0,x,y);
     
   }
   
   void star(float sundeg){//function star takes the suns current degree so that it knows when to adjust opacity
     
     if(sundeg>=150 && sundeg<=200){//if the sun is rising 
       
       opa=map(sundeg,150,200,255,0);//start lowering opacity
       
     } else if(sundeg>=310 && sundeg <=360){//if the sun is setting
       opa=map(sundeg,310,360,0,255);//start to raise opacity
     } else if(sundeg>=200 &&sundeg<=310){//if the sun is mid day
       opa=0;//no opacity
     } else {//if it's night
      opa=225; //full opacity
     }
     //x and y of star
     x = cos(radians(deg)) * orbitX;
  
     y = sin(radians(deg)) * orbitY;
     
     stroke(212,231,69,opa);//stroke of star
     //star is a point
     rect(x,y,.5,.5);
   }
   //the moon function is very similar to the star function
   //and I have to leave soon or be late.
   void moon(float sundeg){
     
     if(sundeg>=150 && sundeg<=200){
       
       opa=map(sundeg,150,200,255,0);
       
     } else if(sundeg>=310 && sundeg <=360){
       opa= map(sundeg,310,360,0,255);
     } else if(sundeg>=200 &&sundeg<=310){
       opa=0;
     } else {
      opa=225; 
     }
     
     x = cos(radians(deg)) * orbitX;
  
     y = sin(radians(deg)) * orbitY;
     
     fill(196,209,100,opa);
     noStroke();
     
     ellipse(x,y,d,d);
   }
   //the sun is the same as star and moon, without the need to worry about opacity
   void sun(){
     
     x = cos(radians(deg)) * orbitX;
  
     y = sin(radians(deg)) * orbitY;
     
     fill(255,255,0);
     noStroke();
     
     ellipse(x,y,d,d);
     
     
     
   }
   
   void makeOrbit(){
     deg+=inc;//makes the Orbit objects move
   }
   
   float currentDeg(){
     return deg;//returns deg, used for tracking the suns location
   }
  
}

///////////////////CLASS WINDY////////////////
/////////////////////////////////////////////

class Windy{
  //declare class variables
  float windSpeed;
    
  float newSpeed;
  
  Windy(){
    
    newSpeed = random(-1.4,1.4);//new speed is chosen here
    
    
    
  }

float isWind(int onTime,float currentWindSpeed){
  
  
  if(onTime==1){
    newSpeed = random(-1.4,1.4); //new speeds will be chosen from here
  }
    
  windSpeed = currentWindSpeed;//sets windspeed to the current windspeed
  
  if(windSpeed!=newSpeed){ //if the speeds are different
    float diff = newSpeed-windSpeed; //creates diff of the two speeds
    if(windSpeed<newSpeed){
      
        windSpeed+=.001; //increaments towards the new speed
      
    } else if(windSpeed>newSpeed){
      
        windSpeed-=.001; //increaments towards the new speed
      
    }
  }
  //these if statements stop the windspeed from going too high
  if(windSpeed>1.5){
    windSpeed=1.5;
  }
  if(windSpeed<-1.5){
    windSpeed=-1.5;
  }
  return windSpeed;//returns the windspeed
  
}

}
/////////////CLASS TIMER/////////////
////////////////////////////////////

class Timer{//class Timer
  int savedTime,totalTime; //initializes instance variables
 
 Timer(int limit){//Timer takes one paramter, the time it will take to go through a loop, in millis
   totalTime=limit; //the total time is set to the parameter
   savedTime=millis(); //savedTime is set to millis

 }
 
 int istime(){
   
   int passedTime = millis() - savedTime; //passed time is declared and initialized
   
   if(passedTime>totalTime){ //checks to see if the time passed is equal to the totalTime
     

     
     savedTime=millis();//resets savedTime
     
     
     return 1;//returns 1 to indicate that X amount of time has passed
   } else {
     
    return 0; //if the timer hasn't gone through a loop yet it will return 0 to indicate the limit has not been reached
   }
   
   
   
 }
  
}

///////////////////// CLASS CLOUDY //////////////////////
////////////////////////////////////////////////////////

class Cloudy{ //class cloudy
  
 float x,y,d,col,opa,xmo; //declares instance variables
 
 int k1,k2,k3,c1,c2,c3;
 
 Cloudy(float px, float py, float pd, String cw, String weatheris){
   //sets instance variables to paramters
   x=px;
   y=py;
   d=pd;
   //it it's raining the clouds are darker in color
   //used 3 color values because i entertained the idea of having rose colored clouds at sunrise
   //then i through that idea out the window, but kept these
   if(weatheris=="rain"){
     c1=128;
     c2=128;
     c3=128;
   } else {
     c1=255;
     c2=255; 
     c3=255;
   }
   
   
   
   
   opa=random(100,240); //a random opacity is chosen for each ellipse
  
 }
 //SECOND CONSTRUCTOR
 Cloudy(float px, float py, float pd, String cw, String weatheris,float opaPara){
   //sets instance variables to paramters
   x=px;
   y=py;
   d=pd;
   
   if(weatheris=="rain"){
     c1=128;
     c2=128;
     c3=128;
   } else {
     c1=255;
     c2=255; 
     c3=255;
   }
   
   
   
   
   opa=opaPara;
  
 }
 
 void run(float CurrentWindSpeed, String weatheris){//runs all functions
   //if the weather is blue skies
   if(weatheris=="blue"){
     opa-=.5;//lower opacity
   }
   //if raining it changes the color adjusters to the intended color
   if(weatheris=="rain"){
     k1=128;
     k2=128;
     k3=128;
   } else {
     k1=255;
      k2=255; 
      k3=255;
   }
    //runs class functions
   cloudgen();
   mover(currentWindSpeed);
   
   
 }
 
 
 void cloudgen(){//makes a single white ellipse based on parameters
   //adjusts color values in a smooth transition from actual colors to the color adjuster values
   if(c1<k1){//if current color value is less than color adjuster
     c1++;//increase to color adjuster
   } else if(c1>k1){//etc.
     c1--;
   }
   if(c2<k2){
     c2++;
   } else if(c2>k2){
     c2--;
   }
   if(c3<k3){
     c3++;
   } else if(c3>k3){
     c3--;
   }
   
   noStroke();
   fill(c1,c2,c3,opa);
   ellipse(x,y,d,d);
   
}
  
 void mover(float currentWindSpeed){ //moves the cloud horizontally
   
   xmo=currentWindSpeed;//sets xmo to current windspeed
   
   
   x+=xmo;//moves cloud
   
   
 }
  
}


