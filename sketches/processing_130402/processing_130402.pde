
//James LeVasseur
//January 22nd 2014
//My "haunted" house for nmd 295.



//declaration variables
float midx, midy; //used for mid screen
boolean point = false;//used for plotting
boolean flickon; //used for flickering of windows
int number = 0; //used for plotting

color win1,win2,win3,win4,win5,win6,win7,win8;

Timer timerOne,timerTwo,timerThree; //timers used for timing clouds

Timer flickrTime,flickoffTime;//timers used for window flickering

ArrayList<Cloudy> clouds; //a new arraylist to contain the clouds

void setup(){
  size(1200,750); //size of screen
  //initialization of mid screen variables
  midx=width/2;
  midy=height/2;
  
  clouds = new ArrayList<Cloudy>(); //initializing a new arraylist
  
  //initializing new timers with their times
  timerOne = new Timer(8000);
  timerTwo = new Timer(5000);
  timerThree= new Timer(12000);
  
  flickrTime = new Timer(4000);//flickr off is always more than on
  flickoffTime = new Timer(6000);
  
  //colors of all the windows, for the flickr function
  win1= color(104,146,150);
  win2= color(104,146,150);
  win3= color(104,146,150);
  win4= color(104,146,150);
  
  win5= color(104,146,150);
  win6= color(104,146,150);
  win7= color(104,146,150);
  win8= color(104,146,150);
  
  //initializes flickon
  flickon=false;
}

void draw(){
  
  //scale(.7);
  background(0,0,100); //background
  smooth(); //used to smooth out lines and objects
  
  //for loop to run through the clouds in "clouds"
  for(int i=0;i<clouds.size();i++){
    Cloudy temp = clouds.get(i); //sets temp to current cloud
    temp.run();//runs functions for current cloud
    if(temp.x>width+50){ //checks to see if current cloud is beyond 50 more than the width
      clouds.remove(temp); //removes current cloud from "clouds" to keep "clouds" small and to conserve memory
    }
  }
  
  noStroke(); //used for base house rooms

  rectMode(CENTER); //used for all rectangles

  
  fill(140,121,160);
  rect(midx,midy+180,220,240);//center room
  rect(midx,midy-50,200,220);//center higher room
  
  fill(150);
  rect(midx+73,midy+290,73.3333,20);//front foundation right
  rect(midx-73,midy+290,73.3333,20);//front foundation left
  
  fill(175);
  rect(midx,midy+290,100,20); //front foundation middle

  fill(130,111,150);
  rect(midx+210,midy+190,200,220);//right room
  rect(midx-210,midy+190,200,220);//left room
  
  fill(125);
  rect(midx+210,midy+290,200,20); //right foundation
  rect(midx-210,midy+290,200,20); //left foundation
  
  fill(140,121,160);
  rect(midx+410,midy+175,220,250);//far right room
  rect(midx-410,midy+40,220,520);//far left room
  
  rect(midx+445,midy-50,150,200);//far right top room
  
  fill(150);
  rect(midx+410,midy+290,220,20);//far right foundation
  rect(midx-410,midy+290,220,20);//far left foundation
  
  stroke(0);
  
//the following for loops make the siding for different parts of the house as labeled
  //Left Room
  for(int i=0, j=90; i<19;i++){
   
    line(midx-300,midy+j,midx-110,midy+j);
    j+=10;
  }

  //right room
  
  for(int i=0, j=90; i<19;i++){
 
    line(midx+300,midy+j,midx+110,midy+j);
    j+=10;
  }

  //top center
  for(int i=0, j=50; i<21;i++){
  
    line(midx-100,midy+j,midx+100,midy+j);
    j-=10;
  }
  //far right room
  for(int t=0, y=60;t<22;t++){
    line(midx+300,midy+y,midx+520,midy+y);
    y+=10;
  }

  //top far right
  
  for(int q=0, w= 50;q<20;q++){
    
    line(midx+370,midy+w,midx+520,midy+w);
    w-=10;
  }

  
  //clock tower
  for(int e=0, r = 270; e<49;e++){
    
    line(midx-300,midy+r,midx-520,midy+r);
    r-=10;
    
  }

  
  
  //center room
  for(int v = 0, b = 270; v<22;v++){
    line(midx-110,midy+b,midx+110,midy+b);
    b-=10;
    
  }
  
 



  noStroke();
  fill(75,119,91);
  triangle(midx-520,midy-220,midx-410,midy-320,midx-300,midy-220);//clock tower roof
  triangle(500,215,600,130,700,215); //center roof
  triangle(970,225,1045,150,1120,225); //right roof
  
  fill(219,202,143);
  stroke(0);
  strokeWeight(3);
  ellipse(midx-415,midy-120,150,150); //clock face
  strokeWeight(1);
  stroke(130,111,150);
  line(midx+300,midy+80,midx+300,midy+280); //line on right side of house used to break up siding
  line(midx-300,midy+80,midx-300,midy+280); //line on left side of house used to break up siding
  
 /* code to be used in later versions
  stroke(255,0,0);
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(500,215);
  bezierVertex(560,200,580,170,575,150);
  endShape();
  
  beginShape();
  vertex(midx-100,midy-160);
  bezierVertex(midx-40,midy-175,midx-20,midy-200,midx-25,midy-225);

  endShape();*/
  
  fill(102,76,51);
  noStroke();
  rect(midx,midy+235,70,90);//front door
  arc(midx,midy+195,70,70,PI, TWO_PI); //front door top
  
  stroke(0);
  fill(0);
  ellipse(575,610,5,5); //door knobs
  ellipse(980,600,5,5);
 
 
  strokeWeight(2);//for clock lines
  
  stroke(0);
  //lines on the clock
  line(185,190,185,210);
  line(230,255,250,255);
  line(120,255,140,255);
  line(185,320,185,300);
  
  strokeWeight(1);
  
  noStroke();
  fill(0,100,0);
  rect(midx,midy+350,width,100); //grass
  
  fill(175);
  rect(midx-40,midy+205,20,150);//front pillars
  rect(midx+40,midy+205,20,150);
  
  fill(150);
  rect(midx+100,midy+205,15,150);//side pillars
  rect(midx-100,midy+205,15,150);
  
  rect(midx-73,midy+120,73.3333,20); //top blocks
  rect(midx+73,midy+120,73.3333,20);
  fill(175);
  rect(midx,midy+120,100,20); //middle block
  
  fill(0);
  rect(midx-410,midy+225,90,110); //door for clock tower
  arc(midx-410,midy+170,90,75,PI, TWO_PI); //clock tower door top
  
  fill(102,76,51);
  rect(midx+410,midy+237,70,90); //far right door
  arc(midx+410,midy+195,70,70,PI, TWO_PI); //far right door top

  //window center left
  noStroke(); 
  fill(win1);
  rect(midx-50,midy-75,40,60); //rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx-50,midy-75,40,60); //frame
  line(midx-70,midy-75,midx-30,midy-75);//frame
  line(midx-50,midy-105,midx-50,midy-45);//frame
  
  //window center right
  noStroke();
  fill(win2);
  rect(midx+50,midy-75,40,60);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx+50,midy-75,40,60);//frame
  line(midx+70,midy-75,midx+30,midy-75);//frame
  line(midx+50,midy-105,midx+50,midy-45);//frame
  
  //window right room left
  noStroke();
  fill(win3);
  rect(midx+155,midy+185,40,60);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx+155,midy+185,40,60);//frame
  line(midx+135,midy+185,midx+175,midy+185);//frame
  line(midx+155,midy+215,midx+155,midy+155);//frame
  
  //window right room right
  noStroke();
  fill(win4);
  rect(midx+240,midy+185,40,60);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx+240,midy+185,40,60);//frame
  line(midx+220,midy+185,midx+260,midy+185);//frame
  line(midx+240,midy+215,midx+240,midy+155);//frame
  
  //circle window, left room
  noStroke();
  fill(win5);
  ellipse(midx-205,midy+120,50,50);//ellipse with blue tint- glass
  stroke(0);
  noFill();
  ellipse(midx-205,midy+120,50,50); //first frame
  ellipse(midx-205,midy+120,20,20);//smaller frame
  line(midx-205,midy+145,midx-205,midy+95); //line frame
  //circle window, right room
  noStroke();
  fill(win6);
  ellipse(midx+195,midy+120,50,50);//ellipse with blue tint- glass
  stroke(0);
  noFill();
  ellipse(midx+195,midy+120,50,50); //first frame
  ellipse(midx+195,midy+120,20,20); //smaller frame
  line(midx+195,midy+145,midx+195,midy+95); //line frame
  //right poarch window
  fill(win7);
  noStroke();
  rect(midx+445,midy+15,50,70); //glass
  arc(midx+445,midy-20,50,42,PI, TWO_PI); //glass
  stroke(0);
  noFill();
  rect(midx+445,midy+15,50,70); //frame
  arc(midx+445,midy-20,50,42,PI, TWO_PI);  //frame
  line(midx+445,midy+50,midx+445,midy-20); //frame
  line(midx+420,midy-20,midx+470,midy-20); //frame
  //left poarch window
  fill(win8);
  noStroke();
  rect(midx-415,midy+15,50,70); //glass
  arc(midx-415,midy-20,50,42,PI, TWO_PI);//glass 
  stroke(0);
  noFill();
  rect(midx-415,midy+15,50,70); //frame
  arc(midx-415,midy-20,50,42,PI, TWO_PI); //frame 
  line(midx-415,midy+50,midx-415,midy-20); //frame
  line(midx-395,midy-20,midx-425,midy-20); //frame

  
  //function "istime" returns an integer, these assign the returned ints to a variable
  int one = timerOne.istime();
  int two = timerTwo.istime();
  int three = timerThree.istime();
  
  if(one==1||two==1||three==1){ //if any of the ints are 1 skies is called. 1 is returned everytime the timer runs through it's time
    skies();
  }
  
  //checks for a return value from flickrTime to see if flickon will be true of not
  int flick = flickrTime.istime();
  if(flick==1){
    flickon=true;

  }
  //if flickoff returns one flickon is set to false and all windows set back to their original color
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
  if(flickon==true){
    flickr();
  }
  
  
}


void skies(){ //skies function
  
  float originX = -150; //all clouds are spawned off screen originX is the x coordinate of the "origin" ellipse that all clouds are based off of.
  float originY = random(15,height/2-50); //the origin y for the origin ellipse is random from 15 to half the height of the screen minus 50
  
  float originD = random(10,15); //the diameter of the origin ellipse
  
  String currentW = "Spring";
  
  clouds.add(new Cloudy(originX,originY,originD,currentW)); //adds the origin ellipse to "clouds"
  
  for(float y = random(5,15);y>0;y--){ //begins a for loop that determines the size of the cloud. That is, how many ellipses it has, chosen randomly between 5 and 15
    
    float dec1 = random(-1,1); //dec stands for decide, dec1 & 2 will determine if the ellipse spawns higher or lower, to the left or right of the origin ellipse
    float dec2 = random(-1,1);
    
    float sp1; //declaring sp1 and sp2 sp stands for space
    float sp2;
    
    float selfD = random(30,40);//declares selfD and sets it to random. selfD is the diameter of the current ellipse
    
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
    float selfY = random(originY,originY+sp2/2);
    
    //adds the ellipse to cloudy
    clouds.add(new Cloudy(selfX,selfY,selfD,currentW));
  }
  
  
}

void flickr(){

  //this float determines which window is flickered
  float winWhichf = random(1,9);
  //convert float to int
  int winWhich = int(winWhichf);
  //switch checking for which window to flickr
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

class Cloudy{ //class cloudy
  
 float x,y,d,col,opa,xmo; //initializes instance variables
 
 Cloudy(float px, float py, float pd, String cw){
   //sets instance variables to paramters
   x=px;
   y=py;
   d=pd;
   xmo=1;
   
   opa=random(50,240); //a random opacity is chosen for each ellipse
  
 }
 
 void run(){//runs all functions
   cloudgen();
   mover();
 }
 
 
 void cloudgen(){//makes a single white ellipse based on parameters
   
   noStroke();
   fill(255,opa);
   
   ellipse(x,y,d,d);
   
}
  
 void mover(){ //moves the cloud horizontally
   
   
   x+=xmo;
   
   
 }
  
}


