
//
// Draws a space-filling hilbert curve, varying the color along its length
//

int LEVELS = 7;
int SIZE   = 512;
int k = 0;

void setup()
{
  size(SIZE + 10, SIZE + 10);

  colorMode(HSB, 16*1024, 8*1024, 1024);
  background(0);
}

void draw()
{
  translate(5,5); // Move things away from the edge
  strokeWeight(1);
  RainbowTurtle hilbert = new RainbowTurtle(k);
  hilbert.setAxiom("L");
  hilbert.addRule("L", "+RF-LFL-FR+");
  hilbert.addRule("R", "-LF+RFR+FL-"); 
  hilbert.setMagnitude(SIZE/(int)pow(2, LEVELS));
  hilbert.run(LEVELS);
  k+=64;
}


// Implements a 90 L-system turtle
// Understands the commands:
//   +: rotate 90 deg
//   -: rotate -90 deg
//   F: move forward
// Anything else is interpreted as a string replacement rule. If the rule is not
// found, then the character is ignored.

class LSystemTurtle
{
  String axiom;
  Hashtable rules;
  int[] xVec = new int[] {1,0,-1,0};
  int[] yVec = new int[] {0,1,0,-1};
  int direction;
  int magnitude;
  boolean penDown;
  int posX;
  int posY;

  LSystemTurtle()
  {
    axiom = "";
    rules = new Hashtable();
    direction = 0;
    magnitude = 15;
    posX = posY = 0;
    penDown = true;
  }

  void run(int depth)
  {
    run(axiom, depth);
  }

  void run(String script, int depth)
  {
    for (int i = 0; i < script.length(); i++)
    {
      String inst = new String(new char[] {script.charAt(i)});
      if (inst.equals("+"))
        rotateCCW();
      else if (inst.equals("-"))
        rotateCW();
      else if (inst.equals("F"))
        forward();
      else if (rules.containsKey(inst) && depth > 0)
      {
        run(rules.get(inst).toString(), depth - 1);
      }
    }
  }

  void setAxiom(String ax)
  {
    axiom = ax;
  }

  void setMagnitude(int m)
  {
    magnitude = m;
  }

  void addRule(String lhs, String rhs)
  {
    rules.put(lhs, rhs);
  }

  void setDirection(int d)
  {
    direction = d % 4;
  }

  void rotateCCW()
  {
    direction = (direction + 1) % 4;
  }

  void rotateCW()
  {
    direction = (direction + 3) % 4;
  }

  void penDown()
  {
    penDown = true;
  }

  void penUp()
  {
    penDown = false;
  }

  void forward()
  { 
    if (penDown)
      line(posX, posY, posX + xVec[direction] * magnitude , posY + yVec[direction] * magnitude);
    
    posX += xVec[direction] * magnitude;
    posY += yVec[direction] * magnitude;

  }

}

class RainbowTurtle extends LSystemTurtle
{
  int sequence;
  
  RainbowTurtle()
  {
    sequence = 0;
  }
  
  RainbowTurtle(int n)
  {
     sequence = n;
  }
  
  void forward()
  {
    sequence++;
    stroke(sequence % (16*1024), 8 * 1024 - sequence % 2048, 256 + sequence % 1024);
    super.forward();
  }
  
}

