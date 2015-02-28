
/**********************************************************************
 *
 *          Title:  assignment3 for IDEA9101 Lab 
 *         Shumei Li,420097376, shli3968
 *
 *    Description:   my one theme of this sketch is "A touch of romance"
 *                   A shape gathering with ellipse and rectangles,like
 *                   a wedding dress, emitting from top.
 *                  (2 different type of particle and 2 different behaviours)
 *          
 *    Reference:  --Processing.org(multiple particle systems)http://processing.org/learning/topics/multipleparticlesystems.html
 *                almost all comments made by myself, I reference it with my full understanding of the coding.
 *                and when the comment has"###", it means i changed it.
 *                 and like what the criteria wants,i changed acceleration, velocity and lifespan behaviours...pls check
 *
 *           Date:   03/04/2013
 *
 **********************************************************************/


//set main as arraylist of particleSystem
ArrayList<ParticleSystem> main;
// ### a variable type,  to hold font class
PFont font;


void setup() {
  //### create a 900*700 size canvas
  size(900, 700);
  // assign new particlesystem array to main
  main = new ArrayList<ParticleSystem>();
  //Draws all geometry with smooth (anti-aliased) edges
  smooth();
  // ### the font be loaded
  font = loadFont("Mistral-24.vlw"); 
  //### set the current font
  textFont(font);
}

void draw() {
  // with a background of dark black
  background(0);
  //### run the function of ParticleSystem
  for (ParticleSystem ps: main) {
    // run the function of ParticleSystem
    ps.run();
    //run add particle function of ParticleSystem
    ps.addParticle();
  }
  //### run main of the particlesystem in the middle of x cordinate(center top)
  main.add(new ParticleSystem(1, new PVector(width/2, 0)));

  //### fill a colour of whith to text
  fill(255);
  //### align the text in the center of coordinates
  textAlign(CENTER);
  //### text
  text("... ... ... ... ... ... ... ... Will You Marry Me ? ... ... ... ... ... ... ... ... ", width/2, height/1.46);
  //### fill colour of light grey
  fill(222);
  //### text
  text("♥ ", width/2, height/1.38);



}

