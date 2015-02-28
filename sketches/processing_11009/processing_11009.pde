
/* The Chicken Class was created by using the Traer Physics library to simulate a more bouncy looking object, and uses the Simple Pendulum example as a basis*/

class Chicken {
  import traer.physics.*;
  //variables
  //Image variables
  PImage chickenBody, head1, head2, head3, head4, head5, head6, head7, head8, head9, instructions;
  //Fill-colour arrays
  int[] f;
  int[] f2;
  //Position variable
  float position;
  //Physics Variables
  ParticleSystem physics;
  Particle a;
  Particle a0;
  Particle a2;
  Spring s;
  Spring s2;
  Spring s3; 
  //Keyboard input variables
  char letterBig;
  char letterSmall;


  /*constructor where x is the x-position of the chicken on the screen, and B is the
   captilized letter which activates the chicken, and b is the non-capitalized letter
   which activates the chicken*/
  Chicken (float x, char B, char b){
    //fill-colour setup
    f= new int[3];
    f2= new int[3];
    //text setup
    letterBig = B;
    letterSmall = b;
    //position setup
    position = x;
    //image setup
    chickenBody = loadImage("ChickenBody.png");
    head1 = loadImage("Head-Normal.png");
    head2 = loadImage("Head-Shock.png");
    head3 = loadImage("Head-Dead.png");
    head4 = loadImage("Head-Dizzy.png");
    head5 = loadImage("Head-Ugh.png");
    head6 = loadImage("Head-Cateye.png");
    head7 = loadImage("Head-Evil.png"); 
    head8 = loadImage("Head-Cry.png");
    head9 = loadImage("Head-Horror.png");
    instructions = loadImage("Instructions.png");

    //physics setup
    physics = new ParticleSystem( 1, 1 );
    //create chicken head:
    a = physics.makeParticle( 1, x, 200, 0 );
    a.makeFree();   
    //a0 acts as the invisible particle which the user pulls upwards:
    a0 = physics.makeParticle( 1.0, x, 0, 0 );
    a0.makeFixed(); 
    //create chicken body:
    a2 = physics.makeParticle( 10, x, 300, 0 );
    //create chicken head and anchor connection:
    s = physics.makeSpring( a, a0, 0.1, 0.1, 320 );
    //create chicken body and head connection:
    s2 = physics.makeSpring (a2, a, 0.1, 0, 28);
    //create chicken body and anchor connection:
    s3 = physics.makeSpring (a2, a0, 0.1, 0001, 370);

  }

  //Chicken class method: drawChicken
  void drawChicken() {
    //Starts physics simulation:
    physics.tick();
    ellipseMode( CENTER );
    //Makes sure that images are always drawn from the center to avoid misplacement:
    imageMode(CENTER);
    //Makes line colour reddish-brown:
    stroke(121, 0, 0);
    //Makes line thicker:
    strokeWeight(3);
    //Creates line between the invisible anchor and the chicken head:
    line( a.position().x(), a.position().y(), a0.position().x(), a0.position().y() );

    //Substitues the image chickenBody.png into the particle:
    image(chickenBody, a2.position().x(), a2.position().y());
    //Makes sure that the particle of the chicken head never goes past the body:
    if (a.position().y() > a2.position().y()) {
      a.position().add(0, -30, 0);
    }

    //Creates if statement for the corresponding keys pressed
    if ((keyPressed==true) && ((key == letterBig)|| (key ==letterSmall))){
      //Changes the values of the fill when the specific keys are pressed
      f[0]=247;
      f[1]=148;
      f[2]=28;
      f2[0]=255;
      f2[1]=255;
      f2[2]=255;
      /*If corresponding key is pressed, anchor point is moved up, which in turn
       pulls the chicken head and body upwards as well*/
      a0.position().add( 0, -200, 0 );
      //Prevents chicken from shooting up and out of the page
      if (a0.position().y()< -200) {
        a0.position().add( 0, +200, 0 );
      }

      //The following section generates different expressions for each chicken when the corresponding keys are pressed
      if ((key=='A')||(key=='a')){
        image(head2, a.position().x(), a.position().y());
      }

      if ((key=='S')||(key=='s')){
        image(head3, a.position().x(), a.position().y());
      }

      if ((key=='D')||(key=='d')){
        image(head4, a.position().x(), a.position().y());
      }

      if ((key=='F')||(key=='f')){
        image(head5, a.position().x(), a.position().y());
      }

      if ((key=='G')||(key=='g')){
        image(head6, a.position().x(), a.position().y());
      }

      if ((key=='H')||(key=='h')){
        image(head7, a.position().x(), a.position().y());
      }
      if ((key=='J')||(key=='j')){
        image(head8, a.position().x(), a.position().y());
      }
      if ((key=='K')||(key=='k')){
        image(head9, a.position().x(), a.position().y());
      }

    }

    //When corresponding key is not pressed, the following code takes effect:
    else
    { 
      if ((keyPressed==false)||(key != letterBig)|| (key !=letterSmall)){
        //changes the specific values of fill back when keys are not pressed
        f2[0]=247;
        f2[1]=148;
        f2[2]=28;
        f[0]=255;
        f[1]=255;
        f[2]=255;
        //draws the normal chicken head when keys are released
        image(head1, a.position().x(), a.position().y());
        
        /*The anchor is again moved back down to its original position, causing
         the chicken to fall back down as well*/
        a0.position().add( 0, +200, 0 );
        //Makes sure that the chickens don't fall off the bottom of the page
        if (a0.position().y()> 0) {
          a0.position().add( 0, -200, 0 );
        }
      }
    }
    //Creates the circular buttons with text at the top of the page
    //Fill is also based on whether the specific key has been pressed
    fill(f[0], f[1], f[2]);
    stroke(247, 198, 28);
    //The circles are created based on the position of the chickens as well
    ellipse (position, 40, 40, 40);
    /*The colours (fill of the ellipse, and fill of the text) are inversed when the
     corresponding keys are pressed*/
    fill(f2[0], f2[1], f2[2]);
    textSize(20);//sets the size of text to 20
    text (letterBig, position-5, 45); //draws text within the ellipses
  }
}



