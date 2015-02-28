
// Static Void - a simulation visualization thing by Jim Palmeri
// Run the sketch to view the instructions!

// global variables
int mode = 0; // Current state of the project; 0 = menu, 1 = experiment mode, 2 = artsy mode
PImage bg, plus, minus; // Imported images
ArrayList<Charge> charges; // array of all charges
float f = 10.0; // electrostatic force (constant)
int help = 255; // visibility of help screen;

// setup function
void setup() {
  size(800, 600);
  background(0);
  imageMode(CENTER);
  // import images for background and positive and negative charges
  bg = loadImage("staticvoid.png");
  plus = loadImage("staticvoidplus.png");
  minus = loadImage("staticvoidminus.png");
  // create ArrayList charges
  charges = new ArrayList<Charge>();
}

// draw loop
void draw()
{
  // clear screen if on mode 0 or 1
  if (mode == 0 || mode == 1)
  {
    background(0);
  }
  // if on menu (mode 0), show intro image
  if (mode == 0)
  {
    image(bg, width/2, height/2);
    fill(0, 0, 0, 255-help);
    rect(0, 0, width, height); // make help background fade away
  }

  // if mode isn't 0, then move charges

  if (mode != 0)
  {
    for (int i = charges.size()-1; i >= 0; i--)
    {
      Charge charge = charges.get(i);
      charge.move();
      if (charge.offScreen())
      {
        charges.remove(charge);
      }
    }
  }

  // if mode is 0 or 1 (i.e., not Artsy mode) then display charges
  if ((mode == 0 || mode == 1) && charges.size() > 0)
  {
    for (int i = charges.size()-1; i >= 0; i--)
    {
      Charge charge = charges.get(i);
      charge.display();
    }
  }

  // if mode is 1 or 2, draw lines between charges
  if ((mode == 1 || mode == 2) && charges.size() > 0)
  {
    for (int i = charges.size()-1; i >= 0; i--)
    {
      for (int j = charges.size()-1; j >= 0; j--)
      {
        if (i != j)
        {
          strokeWeight(2);
          Charge charge1 = charges.get(i);
          Charge charge2 = charges.get(j);
          float alpha = min(255 - min(255, dist(charge1.x, charge1.y, charge2.x, charge2.y)), 50);
          stroke(255, alpha);
          line(charge1.x, charge1.y, charge2.x, charge2.y);
        }
      }
    }
  }
}

// on menu, add charges on left and right clicks
void mousePressed() {
  if (help > 0) help -= 51; // make help more invisible
  if (mouseButton == LEFT)
  {
    // add positive charge at mouse location and add it to array "charges"
    Charge newCharge = new Charge(true, mouseX, mouseY);
    charges.add(newCharge);
  } 
  else if (mouseButton == RIGHT)
  {
    // add negative charge at mouse location and add it to array "charges"
    Charge newCharge = new Charge(false, mouseX, mouseY);
    charges.add(newCharge);
  }
}

// interpret key presses
void keyPressed() {
  if (key == '1' && mode == 0) mode = 1; // start mode 1;
  if (key == '2' && mode == 0) { // clear screen and start mode 2;
    background(0); 
    mode = 2;
  }
  if (key == ' ' && (mode == 1 || mode == 2)) { // set mode to 3 to stop everything
    mode = 3;
  }
  if (key == 'r') // clear charges and reset mode and help
  {
    for (int i = charges.size()-1; i >= 0; i--)
    {
      charges.remove(charges.get(i));
    }
    mode = 0;
    help = 255;
  }
  if (key == 's') // save screenshot
    {
      saveFrame("StaticVoid-######.png");
      println("Saved");
    }
}

class Charge {
  boolean isPositive; // true if positive charge, false if negative
  float x, y, vx, vy, ax, ay; // x and y positions, velocities, and accelerations

  // constructor
  Charge(boolean isPositiveTemp, float xTemp, float yTemp) {
    isPositive = isPositiveTemp;
    x = xTemp;
    y = yTemp;
    vx = 0;
    vy = 0;
  }

  // display charge
  void display()
  {
    if (isPositive)
    {
      // draw positive charge
      image(plus, x, y, 20, 20);
    } 
    else {
      // draw negative charge
      image(minus, x, y, 20, 20);
    }
  }

  // move charge
  void move()
  {
    // calculate force based on distance to other charges
    ax = 0; // x acceleration
    ay = 0; // y acceleration
    for (int i=0; i<charges.size(); i++)
    {
      float xForce, yForce;
      Charge testCharge = charges.get(i);
      float d = dist(x, y, testCharge.x, testCharge.y);
      if (d > 1)
      {
        // force between testCharge and current charge

        float theta = atan2(testCharge.y - y, testCharge.x - x);
        xForce = min(1, f * cos(theta)/(100/d));
        yForce = min(1, f * sin(theta)/(100/d));

        // negate force (make objects repel) if charges are the same
        if ((testCharge.isPositive == isPositive))
        {
          xForce *= -1;
          yForce *= -1;
        }

        // add force to total acceleration
        ax += xForce;
        ay += yForce;
      }
      // if charges are touching, stop them #yolo
      if (d < 1)
      {
        vx = 0;
        vy = 0;
      }
    }

    // change velocity based on acceleration
    vx += ax;
    vy += ay;

    // change distance based on velocity
    x += vx;
    y += vy;

    // friction
    vx *= .8;
    vy *= .8;
  }

  boolean offScreen() {
    if (x < 0 || x > width || y < 0 || y > height)
    {
      return true;
    }
    return false;
  }
}



