
int numObj = 10;
int passes = 5;
int maxIngredients = 4;
int r = 5; //controls the width of the ingredient ring (aka radius of ring?)

// The width and height of the boxes
float ingW = 40;
float ingH = 40;
boolean hold = false;

PImage pizzabg;
PImage[] top1 = new PImage[3];
PImage[] top2 = new PImage[3];
PImage[] top3 = new PImage[3];
PImage[] top4 = new PImage[3];
String[] top = { "gp", "m", "pep", "s" };
PImage[][] allIng = { top1, top2, top3, top4 };


//each ingredient will be an array of several photos, use random to choose one when generating

void setup() {
  pizzabg = loadImage("pizzasm.jpg");
  
  for (int i = 0; i< top1.length; i++) //gp
  {
    top1[i] = loadImage( top[0] + i + ".png" ); // Images must be in the "data" directory to load correctly
  }
  for (int i = 0; i< top2.length; i++) //mushrooms
  {
    top2[i] = loadImage( top[1] + i + ".png" ); // Images must be in the "data" directory to load correctly
  }
  for (int i = 0; i< top3.length; i++) //pepperoni
  {
    top3[i] = loadImage( top[2] + i + ".png" ); // Images must be in the "data" directory to load correctly
  }
  for (int i = 0; i< top4.length; i++) //sausage
  {
    top4[i] = loadImage( top[3] + i + ".png" ); // Images must be in the "data" directory to load correctly
  }
  size(933, 700);
  smooth();
}

void draw() {
  if (!hold)
  {
    background(pizzabg);
    translate(width/2, height/2);
    //noFill();
    //stroke(0);
    //ellipse(0, 0, width-50, height-50);

    rings();
    hold = true;
  }
}

void rings()
{

  int ingredient = 1;  

  for (int j = 0; j<passes; j++)
  {
    for (int i = 0; i < numObj; i++) {
      float objSizeX = random(15,50);
      float objSizeY = random(15,50);
      int ingSel = int(random(0,3));

      pushMatrix();
      translate(0,0);
      println(mouseX + ", " + mouseY);
      rotate(random(0,60)); //randomizes ingredient rotation
   
      //TODO switch statement for ingredient selection?


      ////////////////////////////////
      //seperate method draws each ingredient? toggle on and off, specify respective size for different ingredients
      //use radius/max distance from center rather than sin/cos
      ///////////////////////////////
      
      //image(top1[ingSel], ingW, ingH, objSizeX, objSizeY);
      image(allIng[ingredient][ingSel], random(0,250), random(0,200), objSizeX, objSizeY);
      popMatrix();
      
    }

    ingredient = int(random(0, maxIngredients));

    r = int(random(10, width-100));
    numObj = r/10;
  }
}

void mouseClicked()
{
  hold = false;
}



