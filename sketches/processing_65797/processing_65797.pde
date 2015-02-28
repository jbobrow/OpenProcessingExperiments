
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65622*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
  Reading in fake survey data via three txt files (10 people). Storing the data in 10 Person objects. 
 Visualizing each person in a circle. Drawing lines between similar answers. Hover over to see name.
 M. Kontopoulos, 2012, Example for ID2, Summer 2012
 */

int numPeople = 20; //simple int
PFont h;
PFont hb;
PFont title;
//These arrays will store the age, name and response data from 3 txt files (in the data folder)
int[] ages;
int[] answers;
int[] term;

/*An array of Person objects. 10 Person object total. Each person object will have
 name, age and response fields, plus x and y fields to position it, etc. */
Person[] people = new Person[numPeople];

void setup()
{
  size(400, 600); 
  smooth();
  h = loadFont("Helvetica-10.vlw");
  hb = loadFont("Helvetica-Bold-21.vlw");
  title = loadFont("Helvetica-Bold-42.vlw");
  //textFont(h);
  //I moved this to a function to "clean up" the setup a bit. Makes it easier to read...
  initializePeople();
}

void draw()
{
  background(255);
  textAlign(CORNER);
  //A loop to display and update all Person objects.
  strokeCap(SQUARE);
  pushMatrix();
  translate(width/2, (height/3));
  scale(0.7);
  rotate(5.5);

  for (int i=0; i<numPeople; i++)
  {
    //Display and check against mouse. This only needs to happen once for every Person. 

    people[i].display();
    //    people[i].checkHover();
  }
  fill(255, 195, 0);
  stroke(255, 195, 0);
  //strokeWeight(1);
  line(-width/2-50, 0, width/2+70, 0);
  ellipse(0, 0, 100, 100);

  textFont(hb);
  text("YES", -width/2-50, 21);
  //fill(0);
  text("NO", width/2+42, -5);
  fill(255);
  ellipse(0, 0, 50, 50);
  popMatrix();
  fill(0,120);
  textFont(h);
  textAlign(CORNER);
  text("As an experiment, 20 Art Center College of Design students were asked if ", width/2+20, (height/3)+100, (width/3)-25, height-20);
  textFont(hb);
  fill(255, 195, 0);  
  text("Art Center was worth their time.", width/2+20, (height/3)+160, (width/3)-10, height-20);
  textFont(title);
  fill(0,120);
  textAlign(CENTER);
  text("THE REFERENDUM", width/2, height-145);
  noFill();
  
  rectMode(CENTER);
  rect(width/2,height/2,width-20,height-20);
  rectMode(CORNER);
}


void initializePeople()
{
  //Use loadStrings to load each text file into an array. Cast each array to the appropriate data type too.
  ages = int(loadStrings("age20.txt"));
  answers = int(loadStrings("answers20.txt"));
  term = int(loadStrings("term20.txt"));
  /*
   names[n], ages[n] and answers[n] correspond with one person's data, soooo we'll pass those three values
   into a Person object, which will keep track of them, and keep them together. Each person object now
   represents one of our interviewees. We could then visualize a person as a bar, ellipse, point, scaled svg... 
   Whatever you imagine doing with people's data, you can now do!
   */
  for (int i=0; i<numPeople; i++)
  {
    //Construct a new person (10 times). Pass in each row of data from the lists. 
    people[i] = new Person(i, term[i], ages[i], answers[i]);
  }
}


