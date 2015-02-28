
//Madison Cole 
//Introspection
//ARTD 252 MW 4-6pm
//Nika

/*Artist Statement: As I searched for a set of personal data to explore, I 
decided to continue the theme of poetry and my journal.  I've had my journal for
six years now and I find myself in awe of the collection of poetry, prose and 
short stories.  Since I see my poetry as insight into my my mind and feelings in 
a certrain moment, I wanted to use this information and reflect on it for this 
project.

I went through my whole journal and categorized what the theme of each poem was,
whether it be about being sad, hopeful, angry or any of range of human emotion.
I then wrote our the words in a font that reflected the emotional and raw feeling
I get when re-reading my poetry.  They are scaled to represent the quanitity of 
poems of that type and then the lines that appear are stitched across the screen
in a representative color to the actual date on the timeline. 

The interactive element of my piece was chosen as a means of easy access to the 
viewer rather than to show a correlation between the letter and the word.  Having
this element be arbitrary in that sense is to make the interface smooth and less
distracting from the actual content.  I want the user to be able to maneuver through
the words with a sense of flow and control with one hand and enjoy their experience
with the content.  I am revealing a lot of personal, introspective information
to the viewer that makes me feel vunerable.  I see this project as a release of
my past and the emotions that have been hidden between the pages of my journal.*/

PImage main;
PImage sad;
PImage passion;
PImage nature;
PImage morbid;
PImage lust;
PImage love;
PImage lonely;
PImage hurt;
PImage humorous;
PImage hopeful;
PImage dreams;
PImage death;
PImage angry;
PImage all;

void setup() {
  //must call in all images
  size(1200, 750);
  main = loadImage("static.jpg");
  sad = loadImage("sad.jpg");
  passion = loadImage("passion.jpg");
  nature = loadImage("nature.jpg");
  morbid = loadImage("morbid.jpg");
  lust = loadImage("lust.jpg");
  love = loadImage("love.jpg");
  lonely = loadImage("lonely.jpg");
  hurt = loadImage("hurt.jpg");
  humorous = loadImage("humorous.jpg");
  hopeful = loadImage("hopeful.jpg");
  dreams = loadImage("dreams.jpg");
  death = loadImage("death.jpg");
  angry = loadImage("angry.jpg");
  all = loadImage("all.jpg");
  //have main image show in background
  image(main, 0, 0);
}

void draw() {
  //make if and else if statements for keyPressed
  //if statements with keyPressed and key == are from References on Processing.org
  if (keyPressed) {
    if (key == 'q' || key =='Q') {
      image(angry, 0, 0);
    } else if (key == 'w' || key =='W') {
      image(lust, 0, 0);
    } else if (key == 'e' || key == 'E') {
      image(dreams, 0, 0);
    } else if (key == 'r' || key == 'r') {
      image(sad, 0, 0);
    } else if (key == 'a' || key == 'A') {
      image(morbid, 0, 0);
    } else if (key == 's' || key == 'S') {
      image(death, 0, 0);
    } else if (key == 'd' || key == 'D') {
      image(passion, 0, 0);
    } else if (key == 'f' || key == 'F') {
      image(lonely, 0, 0);
    } else if (key == 'z' || key == 'Z') {
      image(nature, 0, 0);
    } else if (key == 'x' || key == 'X') {
      image(hurt, 0, 0);
    } else if (key == 'c' || key == 'C') {
      image(humorous, 0, 0);
    } else if (key == 'v' || key == 'V') {
      image(love, 0, 0);
    } else if (key == 'b' || key == 'B') {
      image(hopeful, 0, 0);
    }//g will show all of the threads at once 
    else if (key == 'g' || key == 'G') {
      image(all, 0, 0);
    }//shift is the reset to main image
    else if (keyCode == SHIFT) {
      image(main, 0, 0);
    }
  }
}


