
class Cape {

  import traer.physics.*;

  ParticleSystem myPhysics;
  Particle[][] myParticles;
  Particle myMouse;

  //class variables  


  float myColorR, myColorG, myColorB, myAlpha, mySizeValue, mySizeValue1, mySPRING_STRENGTH, mySPRING_DAMPING;

  int myXWidth, myYHeight, myAttractionValue, myNumNodes;




  //Class definition
  Cape(int xWidth, int yHeight) {
    myColorR = random(0,255);
    myColorG = random(0,255);
    myColorB = random(0, 255);
    myAlpha = random(0,50);

    myAttractionValue = int(random(25,65));

    myXWidth = xWidth;
    myYHeight= yHeight;
    mySizeValue = random(0, myXWidth/4);
    mySizeValue1 = random(0, myYHeight/4);

    mySPRING_STRENGTH = 0.188;
    mySPRING_DAMPING = 0.1;



    myNumNodes = int(random(4,15));
  }

  //Create a new Cape instance
  public void create() {
    myPhysics = new ParticleSystem(0, 0.099);
    myParticles = new Particle[myNumNodes][myNumNodes];
    myMouse = myPhysics.makeParticle();
    myMouse.makeFixed();

    //Make the particles and attraction/springs between them in a 2D grid.
    for (int i = 0; i < myParticles.length; i++)
    {
      for (int j = 0; j < myParticles.length; j++)
      {
        myParticles[i][j] = myPhysics.makeParticle(0.2, random(0, width), random(0,height), 0.0);
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
        if (j > 0)
        {
          myPhysics.makeSpring(myParticles[i][j - 1], myParticles[i][j], mySPRING_STRENGTH, mySPRING_DAMPING, mySizeValue);
          myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
        }
      }
    }

    for (int j = 0; j < myParticles.length; j++)
    {
      for (int i = 1; i < myParticles.length; i++)
      {
        myPhysics.makeSpring(myParticles[i - 1][j], myParticles[i][j], mySPRING_STRENGTH, mySPRING_DAMPING, mySizeValue1);
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
      }
    }

    myParticles[0][0].makeFree();
    myParticles[0][myNumNodes - 1].makeFree();
  }

  //Draw the Cape instances to the screen with each frame.
  void display() {

    myPhysics.tick(); //time in this particular physics library
    myMouse.position().set( mouseX, mouseY, 0 ); //position of mouseParticle set to mouse location
    
    
    pushMatrix();
    
    //Color the object
    fill(myColorR, myColorG, myColorB, myAlpha);
    stroke(myColorR+30, myColorG+100, myColorB+50, 100);
    strokeWeight(2);

//Update position and attraction then draw to screen
    for (int i = 0; i < myNumNodes; i++)
    {
      beginShape();
      curveVertex(myParticles[i][0].position().x(), myParticles[i][0].position().y());
      myPhysics.makeAttraction( myMouse, myParticles[i][0], myAttractionValue, 50 );
      for (int j = 0; j < myNumNodes; j++)
      {
        curveVertex(myParticles[i][j].position().x(), myParticles[i][j].position().y());
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
      }
      curveVertex(myParticles[i][myNumNodes - 1].position().x(), myParticles[i][myNumNodes - 1].position().y());
      myPhysics.makeAttraction( myMouse, myParticles[i][myNumNodes - 1], myAttractionValue, 50 );
      endShape(CLOSE);
    }
    for (int j = 0; j < myNumNodes; j++)
    {
      beginShape();
      curveVertex(myParticles[0][j].position().x(), myParticles[0][j].position().y());
      myPhysics.makeAttraction( myMouse, myParticles[0][j], myAttractionValue, 50 );
      for (int i = 0; i < myNumNodes; i++)
      {
        curveVertex(myParticles[i][j].position().x(), myParticles[i][j].position().y());
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
      }
      curveVertex(myParticles[myNumNodes - 1][j].position().x(), myParticles[myNumNodes - 1][j].position().y());
      myPhysics.makeAttraction( myMouse, myParticles[myNumNodes - 1][j], myAttractionValue, 50 );
      endShape(CLOSE);
    }
    popMatrix();
  }

//Increase size of Cape object
  void grow() {

    mySizeValue = mySizeValue + 10;

    for (int i = 0; i < myParticles.length; i++)
    {
      for (int j = 0; j < myParticles.length; j++)
      {

        myParticles[i][j] = myPhysics.makeParticle(0.2, myParticles[i][j].position().x(), myParticles[i][j].position().y(), 0.0);
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
        if (j > 0)
        {
          myPhysics.makeSpring(myParticles[i][j - 1], myParticles[i][j], mySPRING_STRENGTH, mySPRING_DAMPING, mySizeValue);
          myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
        }
      }
    }

    for (int j = 0; j < myParticles.length; j++)
    {
      for (int i = 1; i < myParticles.length; i++)
      {
        myPhysics.makeSpring(myParticles[i - 1][j], myParticles[i][j], mySPRING_STRENGTH, mySPRING_DAMPING, mySizeValue1);
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
      }
    }

    myParticles[0][0].makeFree();
    myParticles[0][myNumNodes - 1].makeFree();
  }


//Decrease size of Cape object
  void shrink() {

    mySizeValue = mySizeValue - 10;

    for (int i = 0; i < myParticles.length; i++)
    {
      for (int j = 0; j < myParticles.length; j++)
      {

        myParticles[i][j] = myPhysics.makeParticle(0.2, myParticles[i][j].position().x(), myParticles[i][j].position().y(), 0.0);
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
        if (j > 0)
        {
          myPhysics.makeSpring(myParticles[i][j - 1], myParticles[i][j], mySPRING_STRENGTH, mySPRING_DAMPING, mySizeValue);
          myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
        }
      }
    }

    for (int j = 0; j < myParticles.length; j++)
    {
      for (int i = 1; i < myParticles.length; i++)
      {
        myPhysics.makeSpring(myParticles[i - 1][j], myParticles[i][j], mySPRING_STRENGTH, mySPRING_DAMPING, mySizeValue1);
        myPhysics.makeAttraction( myMouse, myParticles[i][j], myAttractionValue, 50 );
      }
    }

    myParticles[0][0].makeFree();
    myParticles[0][myNumNodes - 1].makeFree();
  }

//Turn object from color to white
  void blackWhite() {

    myColorR = (255);
    myColorG = (255);
    myColorB = (255);
    myAlpha = random(0,50);
  }

//Change object from color to black fill
  void whiteBlack() {
    myColorR = (0);
    myColorG = (0);
    myColorB = (0);
    myAlpha = random(0,50);
  }


//Change color of the object
  void revertColor() {

    myColorR = random(0,255);
    myColorG = random(0,255);
    myColorB = random(0, 255);
    myAlpha = random(0,50);
  }
}





