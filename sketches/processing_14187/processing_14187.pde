
import rita.wordnet.*;

RiWordnet wordnet;
PFont font;
String word, hypos [];
int arrayIndex = 0;


void setup()
{
  size(600,600);
  smooth();
  noLoop();

  font = loadFont("Serif-48.vlw");
  wordnet = new RiWordnet(this);
}


void draw()
{
  // get words from wordnet library
  String[] tmp = null; // set up a String we will call tmp
  while (tmp == null) { // when tmp is 0, the first time the code looks at it, do this ::
    word = wordnet.getRandomWord("n"); // gets a random word stem at "n" position :: return a String called "word"
    tmp = wordnet.getAllSynonyms(word, "n", 10); // get synonms of String word w/ posStr at "n" & number of results "3"
  }

  Arrays.sort(tmp); // sorts that array of synonmys called "tmp" in alphabetical order
  hypos = tmp; // that alphabetical ordered list is called "hypos"
  arrayIndex = 0;
  
  background(0);
  stroke (#1F7BBF, 100);
  strokeWeight(10);
  translate(width/2,height-20); // set position of first branch "the trunk" in middle of screen, towards bottom
  fill (255);
  text (word, 0, 0);
  println (word);
  branch(0);
}


void branch (int depth) // draw the branch :: depth determines how many times
// ALSO, need to depth shouldn't be a value i pick, should be based on the # of synonms in the hpos array list (hypos.length)

// make branches & tree
{

  if (depth < 15) // number of branches or times the function is called (should really be based on hypos.length
  {
    line(0,0,0,-height/10); // setting up line from prev branch to next (-height/10 :: a little bit up)

    if (depth == 0) { // only draw first word at starting 0,0 trunk point
      // replace with draw text at 0, 0
      // draw words at that starting branch position
      //text (word, 0, 0); // draws the random first "word" at 0,0 point of each new branch
    }

    {
      // start growing new branches
      translate(0,-height/10); // set as new 0, 0 point for next branch

      // set synonms to grow out of these new 0,0 points of branches
      //for (int i = 0; i < hypos.length; i++)
      // ok, so now ALL synonms are growing at new branch's 0,0 point (layered on top of each other)
      // need to break up this array list hypos so each individual index (synonm) grows at a new branch 0,0
      // if (int i > the prev i, then draw new branch...?


      //text ("synonms", 0, 0); // draws word i choose at new branch's 0, 0


        rotate(random(-0.1,0.1)); // gives a little tilt to next branch 

      if (arrayIndex < hypos.length) {
        text(hypos[arrayIndex], 0, 0);
        arrayIndex++;
      }


      if (random(1.0) < 0.6) // 60% chance of following running
      { // branching  
        rotate(0.3); // adds slight rotation
        scale(0.7); // new branch is 70% smaller than prev
        pushMatrix(); //pushMatrix

          branch(depth + 1); // function calls itself (makes copy) and repeats based off prev call
        // if > depth, function returns back to where it paused, and grows more (moves from right to left)
        popMatrix(); //popping from the right grow   
        rotate(-0.6); //rot to left
        pushMatrix(); //store current position
        branch(depth + 1);   //draw L branch
        popMatrix();
      }

      else // 40% chance
      { // continue  
        branch(depth); //depth doesnt change, so creates the longer branches
      }
    }
  }
}


void mouseReleased() {
  redraw();
}


