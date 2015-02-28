
/* GAZING FROM AFAR
John finally met the girl of his dreams, too bad the feelings aren't mutual.
Use the arrow buttons to stay close to Dottie to feed on her presence but get too close,
and she wil think you're being stalkery.
*/

//ints for positioning the text
int x = 15;
int y = 20;

//Loading the classes
PlayerDot p;

NonPlayerDot n;

//Initialising the ArrayList for the speaks (reactions when you get too close)
ArrayList s;

//boolean that makes sure that only one textstring (from ArrayList) is showing at a time
boolean speakIsOn = false;


/*The setup initialises the classes and sets size of screen*/
void setup() {
  size(800,500);
  
  s = new ArrayList();

  p = new PlayerDot();
  n = new NonPlayerDot(random(0,width),random(0,height));
  
 
}


/*The draw() displays all the different components of this program
- instructions/background text
- displaying/moving PlayerDot and NonPlayerDot
- Activating the speak and removing it*/

void draw() {
  background(100);
  
 //The background text
  fill(0);
  text("John didn't have much luck at the speeddating the other day...", x, y);
  text("But on the way home, he gazed upon Dottie, a random passenger on the subway.", x, y+20);
  text("As he 'followed' her home, he found out that she lived just two blocks away.", x, y+40);
  text("'Oh, Dottie,' he thought. 'I love you and spotty face!'", x, y+60);
  text("Ogle her without getting too close or else she will notice you and think you're creepy.", x, y+80);
  
  //functions for the PlayerDot
  p.display();
  p.move();
  p.feeding(n);
  p.collision(n, speakIsOn);
  
  //Function for the NonPlayerDot
  n.move();
  n.display(); 
  
 //Calling a function from below
  activateSpeak();
  
 //Displaying a speak
  for (int i = 0; i < s.size(); i++) {
    Speak speak = (Speak) s.get(i);
    speak.display();
    
    //Removing a speak, once the timer has run out. Sets speakIsOn = false as it is not on
    if (speak.timer()) {
      s.remove(i);
      speakIsOn = false;
    }
  }
}

/*This function add a new Speak to the s array,
by checking collision between the two dots(or dot/square) also checks
whether the speakIsOn is false, if it is false a new Speak is added,
otherwise nothing happens.

The boolean is there to prevent the program to keep adding Speaks when the collision is true
This way you get one speak per collision (rather than collision per frame)*/
void activateSpeak() {
  if (p.collision(n, speakIsOn)) {
    s.add(new Speak(2000));
    speakIsOn = true;
  }
}


