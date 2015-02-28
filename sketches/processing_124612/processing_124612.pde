
//E.V.
//Fall 2013
//MA497

//An example of the Processing/Twitter4j project
//The strings in the array have mgs that were pulled from the Twitter API

//Global Variables
int textSpecs = 7; //number of Strings that will display
float [] [] f = new float [textSpecs][4]; //IF textSpecs was a class, it would have four fields
String [] words; 

void setup()
{
  frameRate(60);
  size(800, 800); //size of the display of sketch
  //strokeWeight();


  PFont fontType;
  fontType = createFont("Rockwell", 16, true);
  textFont(fontType, 18); //font variable, font size
  fill(64, 128, 187, 100); 

  for (int k = 0; k < textSpecs; k++)
  {
    //the four fields of textSpecs
    f[k] [0] = random(width); //X
    f[k] [1] = random(height); //Y
    f[k] [2] = random(-.6, .6); //X Speed
    f[k] [3] = random(-.6, .6); //Y Speed
  }

  words = new String [5];
  //strings pulled from twitter API
  //an example of what the tweets might look like as the project progresses
  words[0] = "Pretty red piggies for the ho ho holidayssss!" + "\n<3 #toesies #pretty #tan #red #christmasiscoming #hohoho #falalalala";
  words[1] = "Well that was easy!! Just changed my oil." + "\nWhat was I thinking paying someone to ever do that. #DirtyHands #LikeAMan";
  words[2] = "And then take pictures of your sheetless mattress laying on the floor #dirty";
  words[3] = "Haven't throw up this much since Chance broke up with me" + "\n#wow #memories #allaloneinthemoonlight #imdone";
  words[4] = "my night is coming to an end." + "\n#lifted #wine #cookies #moscato #skin #tunes";
}  


void draw() {
  background(0);

  for (int k =0; k < textSpecs; k++) {

    // randomly selects an index from words[]

    text(words[k%5], f[k][0], f[k][1]);
    fill(255); //color of text
    //the speed + direction
    f[k][0] +=f[k][2]; //x += x speed
    f[k][1] +=f[k][3]; //y += y speed

    //if the text is going off the canvas, this moves it to the other side
    if ( f[k] [0] < -f[k] [0] ) {
      f[k] [0] = width;
    }
    if ( f[k] [0] > width ) {
      f[k] [0] = 0;
    } 
    if (f[k] [1] < -f[k] [1] ) {
      f[k] [1] = height;
    }
    if ( f[k] [1] > height) {
      f[k] [1] = 0;
    }
  }
}

//used tutorial for some help- http://processingjs.org/sketches/bannerSketch.pde



