


Evil[] eballs; //creat a new array of objects with eballs contained inside of it, defining the enemy class
Good gballs;// create a new class called good to define the interactive moving, "good", ball
Thing boxe; //create a new class called Thing with boxe contained within it, defining the "portal" to the next level

float xlocg; //create a global x-location variable for the 'gballs' to increase ease of access to the variable
float ylocg; //create a global y-location variable for the 'gballs' to increase ease of access to the variable

int thatthing;//defines the "level" and the score of the player

boolean gameover; //this boolean defines if the game is over or not
boolean gamefinish;

String a1; //these strings define the line of text that are displayed in the first 3 levels of the game (a1:level 1, b1:level 2,c1:level 3)
String b1; 
String c1; 











void setup() {
  a1= "go to the box (if you would please), the arrow keys may be of help in this task"; // these strings give a general gyst of the game to the player, the goals and the feel of the game
  b1= "thank you";
  c1= "that was very gracious of you";
  
  
  
eballs = new Evil[100];  //initialize the array to have exactly 100 objects
gballs = new Good(); //initialize the object type gballs, passing no variables into the class
boxe = new Thing();// initialize the object type thing, passing no variables into the class
  size(1000,500);// give a landscape type view to the game
  
 for(int i=0; i<100; i++) {
   eballs[i] = new Evil(random(0,width), random(0,height),random(80,100));//pass three variables into each object of this array (the random x and y locations and the random speed)
 }
 
 ylocg = height/2; //this x and y coordinates places the g-ball at the center of the screen
 xlocg= width/2;

thatthing=0;//initialize the levels to start at the first level
rectMode(CENTER);//the only rectangle in the program is centered
gamefinish=false; //these two booleans make it such that the game is neither finished nor over at the initiation of the game
gameover=false;
}
























void draw()
{

  background(90);//gray background
if(thatthing==100) { //after the 99th level the game will end, beginning the void gamefinish
 gamefinish();

 }
 
  if(gameover==false && gamefinish==false) { //this means that the game runs if the boolean values of game over and game finish are not true
  
  
     if(thatthing==0) { // these three if statements define that during the firs,second, and third levels text is displayed behind all else on the screen (other than the background) in the center of the screen 
    text(a1,width/2,height/2);
  }
    if(thatthing==1) {
    text(b1,width/2,height/2);
  }
    if(thatthing==2) {
    text(c1,width/2,height/2);
  }
 gballs.display();//display the object that defines the gball
 gballs.go(); //move the refferance point for the displayed object as defined by the void go program


   
  for(int k=0;k<thatthing; k++) {//this allows for modification of the array values of the objects 1-thathing
    eballs[k].display();//display the objects for the eballs
   

    
     eballs[k].flow(); //cause the eballs to move
     
     if(dist(eballs[k].xloc,eballs[k].yloc,xlocg,ylocg)<=eballs[k].siiz/2+5) {// if the the radii of gballs and eballs intersect then the game is over, run void gameover
 
  gameover();
     }
 
  
  

  }
    if(abs(xlocg-boxe.rand1)<=15 && abs(ylocg-boxe.rand2)<=15) { //if the box(e) intersects with the gball then pass into the next level
nexts();
}   
 
 
boxe.show();// show the box as in its true boxlike form
 
  

textAlign(CENTER);// allows ease of text modification

text(thatthing,120,10);//show the score and the actual words "score"
text("score:",90,10);
} else if(gameover==true){ //if gameover=true then run gameover (this might be more logical with a more complex gameover sequence)
  gameover();
}


 }


























class Evil{

float xloc;//define the x location of every object

float yloc;//defines the y location of every object

float v; //define the division factor of the velocity
float d;// the distance on the x axis between the object and the g-ball
float g;// the distance on the y axis between the object and the g-ball

float vstuff;//a variable to give a more natural flow of motion
float vconst;//a variable to sustain the original value of the velocity
float divide;//the distance between the g-balls and the eball in question
float siiz;//defines a random size of the e ball

  Evil(float xloc1, float yloc1, float v1) {// bring down the random variable from the setup
    xloc=xloc1;
    yloc=yloc1;
    v=v1;// this will be modified while the one bellow will allow the v to come back to its original value
    vconst=v1;

    siiz= random(5,30);
    
  }
  
void display() {
fill(90);//gray orb
ellipse(xloc,yloc,siiz,siiz);// siiz is the diameter of the circle
fill(#EA0707);// this makes the center red
ellipse(xloc,yloc,3,3);
fill(255);
}
   
   
   
   
   void flow() {
     divide=dist(xloc,yloc,xlocg,ylocg);// define divide
   vstuff=random(-1,1);// vstuff will add or subtract or add to v allowing the object to speed up or slow down
     d=xlocg-xloc;
     xloc=xloc+d/(divide*v*.01);//this is the x movement of the eball
     
     g=ylocg-yloc;
     yloc=yloc+g/(v*.01*divide);//this is the y movement of the eball
   
   v=v+vstuff;// this is the modification of the v value
   if(abs(v-vconst)>=30) {// this snapps the value back the original value if it strays to much
     v=vconst;
   }
   }
   
   
   
   void reset() {//reset the x and y locations of the eball as well as the speed
     yloc=random(0,height);
     xloc=random(0,width);
     vconst= random(80,100);
   }

}


























class Good { //this is the interactive character
  float vx;// this is the x velocity
 
  float vy;//this is the y velocity
  
  Good() {
    vx=0;
    vy=0;
    
  }
  
  void display() {
    fill(90); // gray circle
    ellipse(xlocg, ylocg, 12,12);
    fill(#55D10F);//internal green circle
    ellipse(xlocg,ylocg,3,3);

    fill(255);//return all other fills to white
  }
  
  
  void go() {// the movement of the g ball
    
  
    xlocg= xlocg+vx;// this movement, adding a velocity rather than one value, makes the object accelerate, both the x and y motion are defined in this fasshion
  if(keyCode == RIGHT && keyPressed== true) {
    vx= vx+.1;
  }
  else if(vx>0) {
    vx=vx-.05;
  }
  
    if(keyCode == LEFT && keyPressed== true) {
    vx= vx-.1;
  }
  else if(vx<=0) {
    vx=vx+.05;
    
   
  }
   if(abs(xlocg-(width/2))>=(width/2)) {
      vx= vx*-1;
      xlocg=width/2+(abs(xlocg-width/2)/(xlocg-width/2))*width/2;
    }
     if(abs(ylocg-(height/2))>=(height/2)) {
      vy= vy*-1;
      ylocg=height/2+(abs(ylocg-height/2)/(ylocg-height/2))*height/2;
    }
    
     ylocg= ylocg+vy;//this is the same type of movement as the x motion
  if(keyCode == DOWN && keyPressed== true) {
    vy= vy+.1;
  }
  else if(vy>0) {
    vy=vy-.05;
  }
  
    if(keyCode == UP && keyPressed== true) {
    vy= vy-.1;
  }
  else if(vy<=0) {
    vy=vy+.05;
  } 
  

    
}
    

}
















class Thing {//this is the box
  float rand1;//these define both the x and y locations of the boxes
  float rand2;
  
  Thing() {
      rand1=random(0,width);//the box starts at a random locaiton   
    rand2=random(0,height);
    
    
  }
  
  void show() {
    fill(#189BC9);//show a blue box
    noStroke();
    rect(rand1,rand2,20,20);
    fill(255);
    stroke(0);
  }
  
  void breset() {//when the box is reset move the x and y locations are randomly generated again
    rectMode(CENTER);
    rand1=random(0,width);
    rand2=random(0,height);
}
}





















void nexts() { // this brings one to the next level
  thatthing=thatthing + 1;// the score and the level number change by 1
   ylocg = height/2;//the g-ball is brought back to center
   xlocg= width/2;
   boxe.breset(); // reset the boxes location
   for(int that=0;that<thatthing;that++) {//reset the location of all eballs
     eballs[that].reset();
   }
}



void gamefinish() {//this defines the end of the game

  gamefinish=true;//the game is true to be finished
  text("good job (i'm happy for you)", width/2, height/2);//text a complement to the winner
}


void gameover() {//this defines the game is over
  gameover=true; // the game is mayed to bge over
  text("game over (i'm so very sorry) ", width/2, height/2);//display text in the screen center
  if(mousePressed==true) {
    gameover=false;
    thatthing=0;
  }
}


