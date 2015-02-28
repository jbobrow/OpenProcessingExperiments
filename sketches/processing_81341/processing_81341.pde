
/*  
 * Project3: Tangible game for children----Create a Colorful World!
 * Created by Min Fan
 * Nov. 18th,  2012.
 * Email:mfan1028@gmail.com
 * This poject is inspired from the research project Utopia and my previous video work "the animated EA previs". The Utopia is a tangible educational game which allows 
 children to create objects on the map. It aims to teach children the basic concepts of resources, environment and the tradeoff between the development and 
 the development. I kinds of borrow this learning topic and set it in this game. The previs video gives me the inspiration about the art-style of this game.
 
 My research focus is tangible learning environmment for chlidren and I have great interests in how the different information mappings between 
 the physical objects and the digital information affect and support children's learning and cognitive development. Therefore, in this game, I design different kinds
 of mapping strategies: 
 (1) One Particular tangible object links to one particular digital info/object, with relation to the input position (e.g: Resource)
 (2) One Particluar tangible object links to several particluar digital object(e.g.: background change)
 (3) One Particular tangible object links to one particular digital info/object, without the relation of the input attribute(e.g. display the score)
 ......these strategies can be extended in the future. 
 
 Users can use the differnt tangible objects to create resoures on the earth. The audio will be triggered. Also, additional funcational blocks can be used to display socre, change bg 
 and child's outfit, reset and exit and game.
 
 * References: 
 (1) All the images and animation are from the previous team project in Centre for Digital Media, created by Steph, Michelle, Alex, Ben.
 (2) Audios are from  the libraris of Garage Band. 
 (3) The code about the TUIO is from the example of the TUIO library.
 
 Please use the TUIO simulator to play with it. 
 0-4 to create resources, 
 5: display score
 6: exit
 7: initialize score
 8: change bg and chidlren 
 9:save screen frame
 10: auto generate
 
 
 *Libraries:
 (1)TUIO
 (2)MINIM
 
 */

/*---------Import the required libraries----------------*/
//Import the TUIO library for tangible interaction
import TUIO.*;
//Declare a TuioProcessing client variable
TuioProcessing tuioClient;
//Import the minim library
import ddf.minim.*;


/*-----------Declare the global variables---------------*/
//Declare the reference for the audio(minim, ap)
Minim minim;
AudioPlayer apBG, apFX, ap;
/*Declare the references for different objects*/
//Declare the refernece for earth
Earth earth;
//Declare the references for kids
Child child1, child2;
//Declare the references for backgrounds
PImage bg, bg2;

//Declare the variable bgSwith for controlling the background switching
int bgSwitch=1;
//Declare the variable scoreKeyCtrl for displaying the score by keyboard
int scoreKeyCtrl=1;
//Declare the variable auto to control the auto display of all the objects
boolean auto = true;


/*Declare variables for the data input*/
//Declare the reader in the type of butterReader to read files line-by line as individual String objects.
BufferedReader reader;
//Declare line to read content in the file
String line;
//Declare the reference of the ArrayList wich is used to store all the info for score contribution from each object.
ArrayList scoreInfo;
//The number of differnt kinds of objects.
int numObject=5;
//Declare the array[] called scoreDevlp to store value from each object for development.
int[] scoreDevlp= new int[numObject];
//Declare the array[] called scorePolut to store value from each object for pollution.
int[] scorePolut= new int[numObject];
int[] numAction= new int [numObject];
//Declare the variable for store the final development score and  final pollution score.
int scoreDevTotal=0, scorePolTotal=0;



/*---------------Initilize the setup-----------------*/
void setup() {
  //Set the size of canvas
  size(680, 640);
  //Set the frameRate to 30
  frameRate(40);
  //Turn on the smooth function
  smooth();
  //Load the backgrounds 
  bg=loadImage("bg.png");
  bg2=loadImage("bg2.png");

  //Create a new Minim object
  minim = new Minim(this); 
  apBG=minim.loadFile("bg.mp3");
  apFX=minim.loadFile("fx.mp3");
  apBG.loop();
  //Create a new object of earth with the center of (320,560) and the size of 320.
  earth=new Earth(340, 620, 340);
  //Create an new obejct of the TuioProcessing client,add "this" class as an argument the TuioProcessing class expects
  tuioClient  = new TuioProcessing(this);
  //Create two kinds of child 
  child1 = new Child("Child", 53);
  child2 = new Child("File", 39);
  //Create a new Arraylist to store all the score's information.
  scoreInfo = new ArrayList();
  //The boolean of done is used to detect whether the reading action is finished. Initialize the done to false 
  boolean done=false;


  /*Open up the score.csv file and catch different unexpected problems*/
  reader = createReader("score.csv");
  /*If next statement fails, going to the "Catch" statement.*/
  try {
    //Set "line" to equal the first row of our file.
    line = reader.readLine();
  }
  //If nothing is found in the "try" method, the catch is called and the line is set to NULL.
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  //If there is not a valid file, the catch is called and println "Hey, the score file does not exist or could not be read!"
  catch(NullPointerException e)
  {
    println("Hey, the score file does not exist or could not be read!");
  }


  /*Continue to read the file until reaching the end*/
  while (!done) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    catch(NullPointerException e)
    {
      println("Hey, the score file does not exist or could not be read!");
    }
    if (line == null) {
      // Stop reading when the file is empty.
      done=true;
    } 

    else {
      //Go through "line" read from the file and assign each column a name called pieces.
      String [] pieces = split(line, ",");
      //Set category to value in column 1 (Categroy).
      String catery = (pieces[0]);
      //Set the score contributing to development to be the value in column 2 (Development).
      int devel = int (pieces[1]);
      //Set the score contributing to pollution to be the value in column 3 (Pollution).
      int polut= int (pieces[2]);
      //Add a new object of class "Data" to the Array "scoreInfor" with the parameters read from the score.csv file.
      scoreInfo.add(new Score(catery, devel, polut));
    }
  }

  //Initialize the score to 0.
  gameInit();
}



/*-------------Initialize the game-----------------*/
void gameInit() {
  //Initialize each element in numAaction array as 0.
  for  (int i=0; i<numAction.length; i++) {
    numAction[i]=0;
  }

  /* For loop to go through all the info the ArrayList. Assign the development score and pollution score to two arrays seperately*/
  for  (int i=0; i<scoreInfo.size(); i++) {
    //Make a new varible of class "Score" called "s" and set its data to what is stored in position "i" of the Arraylist.
    Score s = (Score) scoreInfo.get(i);
    //Assign the development value to scoreDevlp[i].
    scoreDevlp[i]=s.getDevlp();
    //Assign the pollution value to scorePolut[i].
    scorePolut[i]=s.getPolut();
  }
}



/*-------------Draw method to draw all the objects on canvas------------------*/
void draw() {
  //According to the action to display different backgrounds.
  switch(bgSwitch) {
    //To display the background(bg) if bgSwitch is equal to 1
  case 1:
    background(bg); 
    break;
    //To display the background(bg2) if bgSwitch is equal to -1
  case -1:
    background(bg2);
    break;
  }

  //Make the plaent turn.
  earth.turn();
  //Draw the earth
  earth.display(); 
  /*Conditional: If the bg change, change the child's outfit as well*/
  if (bgSwitch==1) {
    //Draw the child1's walking animation
    child1.display(290, 215);
  }
  //Draw the child1's walking animation
  else { 
    child2.display(290, 215);
  }

  /*Use tangible object to display the score*/
  /*Go through all the elements in the Arraylist to see whether there is the score check(tag 5), exist(tag 6) or auto display (tag 10)*/
  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0;i<tuioObjectList.size();i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
    //Conditional: If there is the tag5, display the score in the top of the screen
    switch(tobj.getSymbolID()) {
    case 149:
      //Play the sound effect
      apFX.loop();
      //Turn on the stroke function
      stroke(0);
      //Set the text size to 20
      textSize(20);
      //Calculate each object's action and their score.
      scoreDevTotal=numAction[0]*scoreDevlp[0]+numAction[1]*scoreDevlp[1]+numAction[2]*scoreDevlp[2]+numAction[3]*scoreDevlp[3]+numAction[4]*scoreDevlp[4];
      scorePolTotal=numAction[0]*scorePolut[0]+numAction[1]*scorePolut[1]+numAction[2]*scorePolut[2]+numAction[3]*scorePolut[3]+numAction[4]*scorePolut[4];
      //Display the dvelopment and the pollution score
      text("Development: "+ scoreDevTotal, 100, 30);
      if (scorePolTotal<=0) {
        text("Pollution: "+ 0, 400, 30);
      }  
      else {
        text("Pollution: "+ scorePolTotal, 400, 30);
      }
      break;
      //Conditional: if the tag is 6, exit this program
    case 150 :
      exit();
      break;
      //Conditional: if the tag is 7, intialize the game(make the development and pollution scores to 0)
    case 151:
      //Play the sound effect
      apFX.loop();
      gameInit();
      break;
      //Conditonal: if the tag is 10, let the game automatically generate objects by itself.
    case 155:
      if (auto) earth.generate();
      break;
    }
  }

  //Conditional: display the socre when scoreKeyCtrl is equal to 1 (every time when press keybaord 'd', the score display or disappear)
  if (scoreKeyCtrl==-1) {
    stroke(0);
    textSize(20);
    scoreDevTotal=numAction[0]*scoreDevlp[0]+numAction[1]*scoreDevlp[1]+numAction[2]*scoreDevlp[2]+numAction[3]*scoreDevlp[3]+numAction[4]*scoreDevlp[4];
    scorePolTotal=numAction[0]*scorePolut[0]+numAction[1]*scorePolut[1]+numAction[2]*scorePolut[2]+numAction[3]*scorePolut[3]+numAction[4]*scorePolut[4];
    text("Development: "+ scoreDevTotal, 100, 30);
     if (scorePolTotal<=0) {
        text("Pollution: "+ 0, 400, 30);
      }  
      else {
        text("Pollution: "+ scorePolTotal, 400, 30);
      }
  }
}



/*----------Allow users without tangible input to play or test it with keyboard.----------*/
void keyPressed() {
  switch(key) {
    //If pressed 't', generate a new tree at x position 320 with the rotation of -earth.a-earth.bornA. Caculate the action number.
  case 't':
    earth.addObject(new Tree(320, -earth.a-earth.bornA));
    numAction[0]++;
    break;
    //if press 'h', generate a new house and calculate the action number.
  case 'h':
    earth.addObject(new House(320, -earth.a-earth.bornA));
    numAction[1]++;
    break;
    //if press 'g', generate a new cloud and caculate the action number.  
  case 'c':
    earth.addObject(new Cloud(320, -earth.a-earth.bornA));
    numAction[2]++;
    break;
    //if press 'b', generate a new bridge and caculate the action number.
  case 'f':
    earth.addObject(new Factory(320, -earth.a-earth.bornA));
    numAction[3]++;
    break;
    //if press 'f', generate a new flower and caculate the action number.
  case 'l':
    earth.addObject(new Flower(320, -earth.a-earth.bornA));
    numAction[4]++;
    break;
    //If press 'c', change the BG
  case'b':
    bgSwitch*=-1;
    apFX.loop();
    break;
    //If press 'e', exit the game.
  case 'e':
    exit();
    break;
    //If press 'r', initialize the game with make the score as 0.
  case'r':
    //Play the sound effect
    apFX.loop();
    gameInit();
    break;
    //If press 's', save the current screenframe.
  case 's':
    apFX.loop();
    saveFrame();
    break;
    //If press 'd', display the score with changing the states of score display 
  case'd':
    //Play the sound effect
    apFX.loop();
    scoreKeyCtrl*=-1;
  }
}


/*-------This method is called when an object is added to the scene.Detect the number in the tab of object and add an appropriate object--------*/
void addTuioObject(TuioObject tobj) {
  //To map the object's x position on screen to 1-4 levels.
  float xobj=map(tobj.getScreenX(width), 0, 640, 1, 4);
  /*Conditionals: Doing different actions when putting differnet tangible objects on tabletop.*/
  switch(tobj.getSymbolID()) {
    //If the tangible object with the tag 0, add a new tree at x position 320 with the rotation of -earth.a-PI/xobj.Calculate the action numbers.
  case 144:
    earth.addObject(new Tree(320, -earth.a-PI/xobj));
    numAction[0]++;
    break;
    //If the tangible object with the tag 1, add a new house and calculate the action number
  case 145:
    earth.addObject(new House(320, -earth.a-PI/xobj));
    numAction[1]++;
    break;
    //If the tangible object with the tag 2, add a new cloud and calculate the action number
  case 146:
    earth.addObject(new Cloud(320, -earth.a-PI/xobj));
    numAction[2]++;
    break;
    //If the tangible object with the tag 3, add a new bridge and calculate the action number
  case 147:
    earth.addObject(new Factory(320, -earth.a-PI/xobj));
    numAction[3]++;
    //If the tangible object with the tag 4, add a new flower and calculate the action number
    break;
  case 148:
    earth.addObject(new Flower(320, -earth.a-PI/xobj));
    numAction[4]++;
    break;
    //If the tangible object with the tag 8, switch the BG
  case 152:
    bgSwitch*=-1;
    apFX.loop();
    break;
    //If the tangible object with the tag 9, save the current screenframe.
  case 153:
    apFX.loop();
    saveFrame();
    break;
  }
}


/*-----------------an implementation of the TUIO callback methods------------------*/
// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
}

/*These methods are called when a cursor is added to the scene. It has little relation with this programms, but it should be implentated in the TUIO class*/
// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
}


// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  redraw();
}


/* * Child.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This class will display child's walking aniatmion 
 * Email:mfan1028@gmail.com 
 */

/*Class for animating a sequence of png for child*/
class Child {

  /*-----------------Properties------------------*/
  //Declare the image array to store every frame in the animated sequence
  PImage[] images;
  //The total image numbers in the animated sequence
  int imageCount;
  //The current frame of the animated sequence
  int frame;


  /*-------------Constructor of Child----------------*/
  Child(String imagePrefix, int count) {
    //Assign the length of the animated sequence to the length of the image[] array. 
    imageCount=count;
    //Create the new array in the type of PImage with the length of the animated sequence.
    images= new PImage[imageCount];
    /*For loop to load every frame in the animated sequence into the image[] array.*/
    for (int i=0; i<imageCount;i++) {
      //Use nf() to number format 'i' into four digits
      String filename =imagePrefix +nf(i, 4)+".png";
      images[i]=loadImage(filename);
    }
  }


  /*---------Method to display each frame of the animated sequence.----------*/
  void display(float xpos, float ypos) {
    frame=(frame+1)% imageCount;
    image(images[frame], xpos, ypos);
  }

  //End of Class
}

/*  * Cloud.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This class will draw pop out/off cloud at random sizes accoring to its age
 * extends Resource Class, inherits img(profile of resource), size (size of rescource),xpos(x position of resource), angle(rotate angle), 
 age(the age of resource), disappear, remove(the alive states of rescource), ap(the audio triggered by resource).
 * Email:mfan1028@gmail.com
 */


/*Class Cloud is inheritanced from the Resource Class*/
class Cloud extends  Resource {


  /*Constructor of cloud*/
  Cloud(int xpos, float angle) {
    super(xpos, angle);
    //Generate the random height for cloud
    size = int(random(xpos/20, xpos/6));
    //Load the image for cloud
    img=loadImage("cloud.png");
    ap = minim.loadFile("audio5.mp3");
  }


  /*Override the grow method in the subclass to make cloud grows up slowly*/
  void grow() {
    if ( disappear ) {
      age=age-5;
    } 
    else {
      age=age+2;
    }
    //Conditional to change the states of cloud
    if (age < 0) remove= true;
    //Conditional to change the states of cloud
    if (age > 100) age = 100;
    //Make the cloud's height increase/decrease with the age of cloud
    int heiht = min(age, size);
    //Call the display method to draw  cloud
    display(heiht);
  }

  /*Implement the abstract display method in Resource Class*/
  void display(int s) {

    //Make cloud grow from the bottom of the earth(y=-s*4) and make it size as s*3, s*1.6
    image(img, 0, -s*4, s*3, s*1.6);
    ap.play();
  }

  //End of class
}

/* * Earth.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This earth class will display all the elements, like resources and child on the rotating earth. 
 * Email:mfan1028@gmail.com 
 */

//Class Earth to display all the resources, child on the rotating earth.
class Earth {

  /*----------------Properties---------------*/
  // center of the earth
  int x, y;   
  // angle of the earth
  float a = 0.0;      
  //rotate speed of the earth
  float speed = -PI/500;  
  // radius of the earth
  int halfsize;    
  //all the elements populating the earth
  ArrayList resources;       
  //angle where elements are generated
  float bornA=PI/4;
  //angle where elements are deleted
  float dieA =4.5*bornA;   
  //The image of the earth  
  PImage earthPic;

  /*--------------Constructors: Generate the earth with the center of x, y and radium of h-----------------*/
  Earth(int x, int y, int h) {
    this.x = x;
    this.y = y;
    this.halfsize = h;
    resources = new ArrayList();
    earthPic=loadImage("earth_high.png");
  }

  //Rotate the earth
  void turn() {
    a += speed;
    if (a > TWO_PI) a -= TWO_PI;

    //Check for end of life elements
    for (int i=0; i < resources.size(); i++) {
      Resource r = (Resource)resources.get(i);

      // Checks if it's alive and passing the disappearing point
      if ( (r.angle < -a-( dieA + r.age*speed ) ) && !(r.disappear) ) {
        r.disappear = true;
      }

      // if remove is true, remove it
      if (r.remove) resources.remove(i);
    }
  }

  //Add an element
  void addObject( Resource r) {
    resources.add(r);  // method of the ArrayList
  }

  //Clear the earth
  void clean() {
    resources.clear();
  }


  //Draw the whole earth  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(a);
    stroke(0); 
    fill(0);

    //Draw elements 
    for (int i=0; i < resources.size(); i++) {
      Resource r = (Resource)resources.get(i);
      r.display();
    }

    //Draw earth itself.
    image(earthPic, -325, -325);
    popMatrix();
  }

  //Generate different resources at random frames.
  void generate() {
    float n = frameCount;
    if (frameCount%(40*noise(n)) < 0.25) {
      // add an element
      switch ( int(noise(n*0.5)*4) ) {
      case 0:
        earth.addObject(new Tree(320, -earth.a-bornA));
        break;
      case 1:
        earth.addObject(new House(320, -earth.a-bornA));
        break;
      case 2:
        earth.addObject(new Cloud(320, -earth.a-bornA));
        break;
      case 3:
        earth.addObject(new Factory(320, -earth.a-bornA ));
        break;    
      case 4:
        earth.addObject(new Flower(320, -earth.a-bornA ));
      }
    }
  }

  //End of Class
}


/*  * Factory.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This class will draw pop out/off factory at random sizes accoring to its age
 * extends Resource Class, inherits img(profile of resource), size(size of rescource),xpos(x position of resource), angle(rotate angle), 
 age(the age of resource), disappear, remove(the alive states of rescource), ap(the audio triggered by resource).
 * Email:mfan1028@gmail.com
 */

/*Class Factory is inheritanced from the Resource Class*/
class Factory extends Resource {

  /*Constructor of factory*/
   Factory(int xpos, float angle) {
    super(xpos, angle);
    //Random generate the height of factory
    size = int(random(xpos/4, xpos/3));
    //Load the image for factory
    img=loadImage("factory.png");
    ap = minim.loadFile("audio3.mp3");
  }

  /*Implement the abstract display method in Resource Class*/
  void display(int s) {
    //Make factory grow up under the earth(y=60-s*2) and make it size as s*2
    image(img, 0, 60-s*2, s*2, s*2);
    ap.play();
  }
  //End of class
}

/*  * Flower.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This class will draw pop out/off flower at random sizes accoring to its age
 * extends Resource Class, inherits img(profile of resource), size(size of rescource),xpos(x position of resource), angle(rotate angle), 
 age(the age of resource), disappear, remove(the alive states of rescource), ap(the audio triggered by resource).
 * Email:mfan1028@gmail.com
 */


/*Class Flower is inheritanced from the Resource Class*/
class Flower extends  Resource {

  /*Constructor of flower*/
  Flower(int xpos, float angle) {
    super(xpos, angle);
    //Generate the random height for flower
    size = int(random(xpos/12, xpos/8));
    //Load the image for flower
    img=loadImage("flower.png");
    ap = minim.loadFile("audio4.mp3");
  }

  /*Override the grow method in the subclass to make flower grow up slowly*/
  void grow() {
    if ( disappear ) {
      age=age-5;
    } 
    else {
      age=age+2;
    }
    //Conditional to change the states of flowers
    if (age < 0) remove = true;
    if (age > 200) age = 200;
    //Make the flower's height increase/decrease with the age of flower
    int heiht = min(age, size);
    //Call the display method to draw flower
    display(heiht);
  }


  /*Implement the abstract display method in Resource Class*/
  void display(int s) {
    //Make flower grow up under the earth(-s*1.5) and make it size as s*1.5
    image(img, 0, -s*1.5, s*1.5, s*1.5);
    ap.play();
  }


  //End of class
}

/*  * House.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This class will draw pop out/off house at random sizes accoring to its age
 * extends Resource Class, inherits img(profile of resource), size (size of rescource),xpos(x position of resource), angle(rotate angle), 
 age(the age of resource), disappear, remove(the alive states of rescource), ap(the audio triggered by resource).
 * Email:mfan1028@gmail.com
 */

/*Class House is inheritanced from the Resource Class*/
class House extends  Resource {

  /*Constructor of house*/
  House(int xpos, float angle) {
    super(xpos, angle);
    //Generate the random height for house
    size= int(random(xpos/2, xpos/3));
    //Load the image for house
    img=loadImage("house.png");
    ap = minim.loadFile("audio2.mp3");
  }

  /*Implement the abstract display method in Resource Class*/
  void display(int s) {
    //Make house grow from the bottom the earth(y=30-s) and make it size as s
    image(img, 0, 30-s, s, s);
    ap.play();
  }

  //End of Class
}


/* * Resource.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This abstract class will draw pop out/off resource at random sizes accoring to its age
 * Email:mfan1028@gmail.com 
 */

/*Abstract class Resource draw pop out/off resource at random sizes accoring to its age.*/
abstract class Resource {

  /*Properties*/
  //The image of the resource
  PImage img;
  //The size of the resource
  int size;
  //The x position of the resource
  float xpos = 0.0;
  //The rotate angle of the resource
  float angle=0.0;
  //The age of the object
  int age = 0;
  //The alive states of resource
  boolean disappear = false;
  boolean remove = false;
  //The audio of the resource triggerd 
  AudioPlayer ap;

  /*Constructors*/
  Resource (int xpos, float angle) {
    this.xpos=xpos;
    this.angle=angle;
  }

  //Display the resource and make it grow up or disappear
  void display() {    
    pushMatrix();
    rotate(angle);
    translate(xpos, 0);
    pushMatrix();
    rotate(PI/2);
    grow();
    popMatrix();
    popMatrix();
  }

  //Method to make object grow up/disappear
  void grow() {
    if ( disappear ) {
      age=age-5;
    } 
    else {
      age=age+5;
    }
    //Conditional to change the states of the resource
    if (age < 0) remove = true;
    if (age > 200) age = 200;
    //Make the resource's height increase/decrease with the age of tree
    int heiht = min(age, size);
    //Call the display method to draw resource
    display(heiht);
  }


  /*Overload abstract display method to draw particular resource*/
  abstract void display(int s) ;

  //End of Class
}

/*  * Score.ped.
 * Score class to set and get the score contribution of each category
 * Created: Nov. 11th, 2012
 * By: Min Fan
 * Email:mfan1028@gmail.com
 */

/*Class Data*/
class Score {
  /*Properties of Data*/
  //Name of the category
  String catery;
  //Score for the devleopment
  int devlp;
  //Score for the pollution
  int polut;

  /*--------------Constructors------------*/
  public Score(String catery, int devlp, int polut) { 
    //Assign categroy from the Array to this object
    this.catery= catery;
    //Assign the developement contribution from the Array to this object
    this.devlp=devlp;
    //Assign the pollution contribution from the Array to this object
    this.polut=polut;
  }


  /*-----------------Methods to get the values of the objects--------------------*/
  //Method to get the categroy
  public String getCatery() {
    return catery;
  }

  //Method to get the score of devlepment 
  public int getDevlp() {
    return devlp;
  }

  //Method to get the score of pollution
  public int getPolut() {
    return polut;
  }

  //End of Class
}

/*  * Tree.pde
 * Created by Min Fan
 * Nov. 12th,  2012
 * This class will draw pop out/off tree at random sizes accoring to its age
 * extends Resource Class, inherits img(profile of resource), size (size of rescource),xpos(x position of resource), angle(rotate angle), 
 age(the age of resource), disappear, remove(the alive states of rescource), ap(the audio triggered by resource).
 * Email:mfan1028@gmail.com
 */


/*Class Tree is inheritanced from the Resource Class*/
class Tree extends Resource {


  /*Constructor of tree*/
  Tree(int xpos, float angle) {
    super(xpos, angle);
    //Generate the random height for tree
    size = int(random(xpos/4, xpos/3));
    //Load the image for tree
    img=loadImage("palmTree.png");
    ap = minim.loadFile("audio1.mp3");
  }


  /*Implement the abstract display method in Resource Class*/
  void display(int s) {
    //Make tree grow from the bottom of the earth(y=15-h*1.5) and make it size as s*1.5
    image(img, 0, 15-s*1.5, s*1.5, s*1.5);
    ap.play();
  }
  //End of Class
}



