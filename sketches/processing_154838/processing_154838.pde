
//RIP in peace, file reader

//made by jonathan and thomas

//basic image up for editing
PImage baseImage;

PImage background = loadImage("http://nanobitwallpaper.com/wp-content/uploads/notebook-paper.jpg");
PImage pencil = loadImage("http://i.imgur.com/HFRmGl4.png");

String[] adjective = {
  "red", "green", "blue", "yellow", "purple", "cyan", "orange", "big", "small", "tall", "short", "skinny", "fat"
};

String[] noun = {
  "cat", "dog", "man", "woman", "boy", "girl", "fish", "bird", "car", "plane", "spaghetti"
};

String[] verb = {
  "ran", "flew", "jumped", "swam", "smiled", "frowned"
};

String mostlyWord = "";
ArrayList<String> tokens = new ArrayList<String>();

int state = 0;

int partOfSpeech = 0;

int numNoun = -1;
int numAdj = -1;
int numVerb = -1;

int imageX = 200;
int imageY = 200;

float multiplyX = 1;
float multiplyY = 1;

int gravityToll = 1;
int Velocity = 0;


int waterY = 800;


boolean rising = true;


void setup()
{
  //size(baseImage.width, baseImage.height);
  size(800, 800);

  background(255);
}

void draw()
{
  if(state == 3)
  {
    image(background, 0, 0);
    image(pencil, 600, 100, 220, 500);
    fill(0);
    textSize(32);
    text("            Library:\n            Useable Adjectives: red, green, blue,\n            yellow, purple,cyan, orange, big, small,\n            tall, short, skinny, fat.\n            Useable Nouns: cat, dog, man, woman,\n            boy, girl, fish, bird, car, plane, spaghetti.\n            Useable Verbs: ran, flew, jumped,\n            swam, smiled, frowned.\n\n            Press space to return to start screen!", 10, 105);
  }
  
  
  if (state == 0)
  {

    image(background, 0, 0);
    image(pencil, 600, 100, 220, 500);
    fill(0);
    textSize(32);
    text("            Welcome to Sentence Creator!\n            Pick words from our library and bring\n            them to life.\n\n\n            Press tab for our word library.\n            Enter words using space.\n            Unrecognized words will be set\n            to random.", 10, 105);
    text("            " + mostlyWord, 10, 610);
  }
  //state removes all extraneous words that the program does not need
  if (state == 1)
  {
    for (int i = 0; i < tokens.size (); i++)
    {
      if (tokens.get(i).equals("a"))
        tokens.remove(i);

      if (tokens.get(i).equals("the"))
        tokens.remove(i);

      if (tokens.get(i).equals("A"))
        tokens.remove(i);

      if (tokens.get(i).equals("The"))
        tokens.remove(i);
    }

    {
      if (partOfSpeech == 0)
      {
        //checks word in sentence against list of all adjectives
        for (int i = 0; i < adjective.length; i++)
        {
          if (tokens.get(0).equals(adjective[i]))
            numAdj = i;
        }
        //checks if word isnt recognized and adds random adjective if so
        if (numAdj == -1)
          numAdj = (int)random(adjective.length - 1);
        //says that the next word that will be read will be a noun
        partOfSpeech = 1;
      }  

      if (partOfSpeech == 1)
      {
        //checks word in sentence against list of all nouns      
        for (int i = 0; i < noun.length; i++)
        {
          if (tokens.get(1).equals(noun[i]))
            numNoun = i;
        }
        //checks if word isnt recognized and adds random noun if so
        if (numNoun == -1)
          numNoun = (int)random(noun.length - 1);

        //preps for verb reading
        partOfSpeech = 2;
      }

      if (partOfSpeech ==2)
      {
        //checks word in sentence against list of all nouns      
        for (int i = 0; i < verb.length; i++)
        {
          if (tokens.get(2).equals(verb[i]))
            numVerb = i;
        }
        //checks if word isnt recognized and adds random noun if so
        if (numVerb == -1)
          numVerb = (int)random(verb.length - 1);

        //preps for verb reading
        partOfSpeech = 0;
        state = 2;
        tokens.clear();
      }
    }
  }



  if (state==2)
  {
    //loads corresponding image
    switch(numNoun)
    {
    case 0:
      loadCat();
      break;
    case 1:
      loadDog();
      break;
    case 2:
      loadMan();
      break;
    case 3:
      loadWoman();
      break;
    case 4:
      loadBoy();
      break;
    case 5:
      loadGirl();
      break;
    case 6:
      loadFish();
      break;
    case 7:
      loadBird();
      break;
    case 8:
      loadCar();
      break;
    case 9:
      loadPlane();
      break;
    case 10:
      loadSpaghetti();
      break;
    }
    //loads corresponding adjective
    switch(numAdj)
    {
    case 0:
      redColor();
      break;
    case 1:
      greenColor();
      break;
    case 2:
      blueColor();
      break;
    case 3:
      yellowColor();
      break;
    case 4:
      purpleColor();
      break;
    case 5:
      cyanColor();
      break;
    case 6:
      orangeColor();
      break;
    case 7:
      imageBig();
      break;
    case 8:
      imageSmall();
      break;
    case 9:
      imageTall();
      break;
    case 10:
      imageShort();
      break;
    case 11:
      imageSkinny();
      break;
    case 12:
      imageFat();
      break;
    }
    //  "run", "fly", "jump", "swim", "smile", "frown"
    switch(numVerb)
    {
    case 0:
      runImage();
      break;
    case 1:
      flyImage();
      break;
    case 2:
      jumpImage();
      break;
    case 3:
      swimImage();
      break;
    case 4:
      smileImage();
      break;
    case 5:
      frownImage();
      break;
    }
  }
}



//Dictionary (word library)

//color filter methods
//adjective based

void greenColor() {
  tint(0, 255, 0);
}
void redColor() {
  tint(255, 0, 0);
}
void blueColor() {
  tint(0, 0, 255);
}
void yellowColor() {
  tint(255, 255, 0);
}
void purpleColor() {
  tint(255, 0, 255);
}
void cyanColor() {
  tint(0, 255, 255);
}
void orangeColor() {
  tint(204, 102, 0);
}


//size related adjectives
void imageBig()
{
  multiplyX = 2;
  multiplyY = 2;
}
void imageSmall()
{
  multiplyX = 0.5;
  multiplyY = 0.5;
}
void imageTall()
{
  multiplyY = 2;
}

void imageShort()
{
  multiplyY = 0.5;
}
void imageSkinny()
{
  multiplyX = 0.5;
}
void imageFat()
{
  multiplyX = 2;
}


//picture loading
void loadBird()
{
  baseImage = loadImage("http://i.imgur.com/HlLFMe4.png");
}
void loadCat()
{
  baseImage = loadImage("http://i.imgur.com/OBhpd8i.png");
}
void loadFish()
{
  baseImage = loadImage("http://i.imgur.com/8uzlv4u.png");
}
void loadWoman()
{
  baseImage = loadImage("http://i.imgur.com/pJS593V.png");
}
void loadSpaghetti()
{
  baseImage = loadImage("http://i.imgur.com/CpFPRlu.png");
}
void loadPlane()
{
  baseImage = loadImage("http://i.imgur.com/mGbhphA.png");
}
void loadMan()
{
  baseImage = loadImage("http://i.imgur.com/42sPRRL.png");
}
void loadGirl()
{
  baseImage = loadImage("http://i.imgur.com/7aun2sZ.png");
}
void loadDog()
{
  baseImage = loadImage("http://i.imgur.com/ktREWMj.png");
}
void loadBoy()
{
  baseImage = loadImage("http://i.imgur.com/ePOIAmo.png");
}
void loadCar()
{
  baseImage = loadImage("http://i.imgur.com/5eoANoZ.png");
}


//animations/verbs
void runImage()
{
  imageX+=10;
background(255);
  image(baseImage, imageX, imageY, baseImage.width * multiplyX, baseImage.height * multiplyY);
}
void flyImage()
{
  if (rising = true)
  {
    imageY-= 10;
    if (imageY <= 200)
      rising = false;
  } else
  {
    imageY+=10;
    if (imageY >= 400)
      rising = true;
  }

  imageX +=5;
background(255);
  image(baseImage, imageX*(1/multiplyX), imageY *(1/multiplyY), baseImage.width * multiplyX, baseImage.height * multiplyY);
}

void jumpImage()
{

  Velocity = Velocity + gravityToll;
  imageY =  imageY + Velocity;
  if (imageY >= 400)
    Velocity = -25;
background(255);
  image(baseImage, imageX, imageY, baseImage.width * multiplyX, baseImage.height * multiplyY);
}

void swimImage()
{


  image(baseImage, 200 *(1/multiplyX), 200*(1/multiplyY), baseImage.width * multiplyX, baseImage.height * multiplyY);
  fill(0, 0, 255, 75);
  noStroke();
  rect(0, waterY, 800, 800 - waterY);
  waterY -= 10;
}

void smileImage()
{
  image(baseImage, 200 *(1/multiplyX), 200*(1/multiplyY), baseImage.width * multiplyX, baseImage.height * multiplyY);
  fill(255);
  arc(400, 400, 50, 50, 0, PI, PIE);
}
void frownImage()
{
    image(baseImage, 200 *(1/multiplyX), 200*(1/multiplyY), baseImage.width * multiplyX, baseImage.height * multiplyY);
  fill(0);
  arc(400, 430, 50, 50, PI, TWO_PI);
}

//key controls
void keyPressed() 
{

  if (state == 0)
  {
       if (keyCode == TAB)
        state = 3;
    
    
    if (key == ' ')
    {
      tokens.add(mostlyWord);
      mostlyWord = "";
    } 
    else if (key == '.')
    {
      tokens.add(mostlyWord);
      mostlyWord = "";
      state = 1;
    } 
    else if(keyCode == BACKSPACE)
    {
    if(mostlyWord.length() == 0)
    mostlyWord = "";
    else
    mostlyWord = mostlyWord.substring(0,mostlyWord.length()-1);
    }
    else
      mostlyWord = mostlyWord + key;
  }
  if (state == 2)
  {
    if (key == ' ')
    {
      state = 0;


      partOfSpeech = 0;

      numNoun = -1;
      numAdj = -1;
      numVerb = -1;

      imageX = 200;
      imageY = 200;

      multiplyX = 1;
      multiplyY = 1;

      gravityToll = 1;
      Velocity = 0;

      noTint();

      waterY = 800;
    }
  }

  if (state == 3)
  {
    if (key == ' ')
    {
      state = 0;
    }
  }
}




/*
nouns
 cat, dog, man, woman, boy, girl, fish, bird, car, plane, spaghetti  11
 
 adjectives
 *red, *green, *blue, *yellow, *purple, *cyan, *orange, big, small, tall, short, skinny, fat,  
 
 verbs
 run, fly, jump, swim, smile, frown 
 */
