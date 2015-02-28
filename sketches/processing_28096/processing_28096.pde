
RabbitPair adamAndEveRabbits;
ColorManager colManager;
int numPairs, month;
int rabbitWidth, rabbitHeight, vertSpacing;
ArrayList<Integer> numRabbitPairsByGeneration; //needed for horizontal positioning
ArrayList<Integer> numRenderedByGeneration;

class RabbitPair {
  //private static int population = 0;
  private ArrayList<RabbitPair> children;
  private color clr;
  private int locX, locY;
  private boolean mature;
  private int generation;
  private RabbitPair parent;
  
  public RabbitPair(color c, int gen) {
    clr = c;
    generation = gen;
    children = null;
    mature = false;
    numPairs++; //update population counter
    children = new ArrayList<RabbitPair>();
    parent = null;
    
    //update numRabbitPairsByGeneration
    if ( numRabbitPairsByGeneration.size() - 1 >= generation ) {
      Integer newCount = numRabbitPairsByGeneration.get(generation) + 1;
      numRabbitPairsByGeneration.set(generation, newCount);
    } else { //new generation
      numRabbitPairsByGeneration.add( new Integer(1) );
    }
  }
  
  public void setParent(RabbitPair r) {
    parent = r;
  }
  
  //increase age by one unit:
  //* make immature rabbit pair mature (mating age)
  //* recursively age each child
  //* give them another child pair
  public void age() {
    if ( mature ) {
      for( RabbitPair r : children ) {
         r.age();
      }
      RabbitPair child = new RabbitPair( colManager.nextColor(), generation + 1 );
      child.setParent( this );
      children.add( child );
    } else { //immature pair
      mature = true;
    }
  }

  void drawRabbit(int x, int y, color fillCol, double rabbitScale) {
    int headWidth = (int)(rabbitScale * 32);
    int headHeight = (int)(.6*headWidth);
    stroke(0);
    fill(fillCol);
    ellipseMode(CENTER);
  
    //body
    fill(fillCol);
    ellipse(x-(int)(.5*headWidth),y+(int)(.4*headWidth),(int)(1.5*headWidth),headWidth);
  
    //left & right ears
    ellipse(x-(int)(.16*headWidth),y-(int)(.5*headWidth),(int)(.25*headHeight),(int)(.8*headWidth));
    ellipse(x+(int)(.16*headWidth),y-(int)(.5*headWidth),(int)(.25*headHeight),(int)(.8*headWidth));
  
    //head
    ellipse(x,y,headWidth,headHeight);
  
    //eyes
    fill(0); 
    ellipse(x-(int)(.15*headWidth),y-(int)(.12*headWidth),(int)(.1*headWidth),(int)(.1*headWidth));
    ellipse(x+(int)(.15*headWidth),y-(int)(.12*headWidth),(int)(.1*headWidth),(int)(.1*headWidth));
    
    //left whiskers
    stroke(0);
    line(x-(int)(.1*headWidth),y+(int)(.07*headWidth),x-(int)(.6*headWidth),y);
    line(x-(int)(.1*headWidth),y+(int)(.11*headWidth),x-(int)(.6*headWidth),y+(int)(.11*headWidth));
    line(x-(int)(.1*headWidth),y+(int)(.15*headWidth),x-(int)(.6*headWidth),y+(int)(.22*headWidth));  
  
    //right whiskers  
    line(x+(int)(.1*headWidth),y+(int)(.07*headWidth),x+(int)(.6*headWidth),y);
    line(x+(int)(.1*headWidth),y+(int)(.11*headWidth),x+(int)(.6*headWidth),y+(int)(.11*headWidth));
    line(x+(int)(.1*headWidth),y+(int)(.15*headWidth),x+(int)(.6*headWidth),y+(int)(.22*headWidth));  
    
    //nose
    ellipse(x,y+(int)(.05*headWidth),(int)(.16*headWidth),(int)(.16*headWidth));

  }


  //render thyself and thy children too
  public void render() {
    fill(clr);
    stroke(0);
    locY = generation*(rabbitHeight + vertSpacing) + (int)(.3f*vertSpacing);
    int numPairsThisGen = numRabbitPairsByGeneration.get(generation);
    double horizSpacing = (double)width/(numPairsThisGen + 1);
    int numRenderedThisGen = numRenderedByGeneration.get(generation);
    locX = (int)(horizSpacing * (numRenderedThisGen + 1) + .5);
    numRenderedByGeneration.set(generation,numRenderedThisGen + 1);
        
    //int rHeight = rabbitHeight;
    //if ( ! mature ) { rHeight /= 2; } 
    
    double rabbitScale = 1.0;
    if ( ! mature ) {
      rabbitScale = .68; //immature pairs are short!
    }

    //draw edge from me to my parent, if I have one
    if ( parent != null ) {
      stroke(parent.clr);
      line(locX, locY + 9, parent.locX, parent.locY + 25);
    }
    
    //draw pair of rabbits
    drawRabbit(locX + (int)(rabbitScale*18), locY + (int)(rabbitScale*9), clr, rabbitScale);
    drawRabbit(locX, locY + (int)(rabbitScale*14), clr, rabbitScale);
    
    //ask my children to render themselves
    for( RabbitPair child : children ) {
      child.render();
    }
  }
} 

//keeps track of current color values, gives a next color when
//asked, and then increments the color
class ColorManager {
  private int r;
  private int g;
  private int b;
  private int colorStep = 90;
  
  public ColorManager() {
    reset();
  }
  
  private void reset() {
    r = 210; g = 150; b = 0;
  }
  
  public color nextColor() {
    b += colorStep;
    if ( b > 255 ) {
      b %= 255;
      g += colorStep;
    }
    if ( g > 255 ) {
      g %= 255;
      r += colorStep;
    }
    if ( r > 255 ) {
      r %= 255;
    }
    
    return color(r,g,b); 
  }
}

void setup() {
  colManager = new ColorManager();
  color col = colManager.nextColor();
  
  rabbitWidth = 10;
  rabbitHeight = 12;
  vertSpacing = 70;
  numPairs = 0;
  month = 0;
  numRabbitPairsByGeneration = new ArrayList<Integer>();
  numRabbitPairsByGeneration.add(0);
  numRenderedByGeneration = new ArrayList<Integer>();
  numRenderedByGeneration.add(0);
  adamAndEveRabbits = new RabbitPair(col, 0);


  size(800,600);
  smooth();
  noLoop(); //don't continuously call draw()
  rectMode(CENTER);

}

void draw() {
 background(255);
 fill(127,0,127);
 text("numPairs = " + numPairs + "\nmonth = " + month, (int)(.8*width),(int)(.25*vertSpacing));
 adamAndEveRabbits.render();

 //number of pairs of rabbits will now potentially increase
 adamAndEveRabbits.age();
 month++;
 
 fill(0,127,127);
 text("Press [r] to reset and any other key or click\nto advance one month.", 10,(int)(.25*vertSpacing));
 
 numRenderedByGeneration = new ArrayList<Integer>();
 for ( int i = 0 ; i < numRabbitPairsByGeneration.size() ; i++ ) {
   numRenderedByGeneration.add( new Integer(0) );
 }

}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if ( key == 'R' || key == 'r' ) {
    setup();
  }
  redraw();
}

