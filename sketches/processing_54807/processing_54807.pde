
//including the toxiclibs libraries
import toxi.physics2d.*; 
import toxi.physics2d.behaviors.*;
import toxi.geom.*; // Vec2D need this library


class Dandelion {
  //defining varibales
    VerletPhysics2D physics, floretPhysics, flyingPhysics; //physics for the stem, the florets and the flying florets

  ArrayList florets, floretSprings, flyingFlorets; //
  Floret root, stem; // defining this as particles, VerletParticle2D
  GravityBehavior wind; // difining wind as a GravityBehavior
  boolean windy; 
  PVector location; //dandelion's position

  //define constructor
  Dandelion (float x, float y) {
    location= new PVector(); //initialize location
    location.x= x; //set x
    location.y= y; //set y
    florets = new ArrayList();  
    floretSprings = new ArrayList(); 
    flyingFlorets = new ArrayList();  //new florets when wind

    //Initialize the physics
    physics = new VerletPhysics2D();
    physics.addBehavior(new GravityBehavior(new Vec2D(0, -3)));//stand up force for the stem

    floretPhysics = new VerletPhysics2D();
    floretPhysics.addBehavior(new GravityBehavior(new Vec2D(0, 0))); //no forces on the florets

    flyingPhysics = new VerletPhysics2D();
    flyingPhysics.addBehavior(new GravityBehavior(new Vec2D(0.02, -0.02))); // forces (wind) on flyingFlorets when is windy

    wind = new GravityBehavior(new Vec2D(0.02, 0)); // this wind is only for stem and florets
    windy = false;

    root = new Floret(location.x, height, 100);  // Create root
    stem = new Floret(location.x, height-location.y, 100);  // Create stem

    // Lock in place
    root.lock();
    
    VerletSpring2D stemSpring = new VerletSpring2D(root, stem, location.y, .1); // Make a spring connecting root and stem

    // Anything we make, we have to add into the physics world
    physics.addParticle(root);
    physics.addParticle(stem);
    physics.addSpring(stemSpring);

    // Creat florets and springs
    for (int i=0; i<300; i++) {  
      florets.add(new Floret(location.x, height-location.y, 3));  //creat floret and add it to arrayList
      VerletSpring2D spring = new VerletSpring2D(stem, (Floret)florets.get(i), random(5, 50), .1); // creat the spring
      floretSprings.add(spring); //add spring to arrayList
      //add to physics
      floretPhysics.addParticle((Floret)florets.get(i)); 
      floretPhysics.addSpring((VerletSpring2D)floretSprings.get(i));
      floretPhysics.addBehavior(new AttractionBehavior((Floret)florets.get(i), 20, -0.02, 0.001)); // repulsion
    }
  }

  void display () {
    // Update the physics world
    physics.update();  // root, stem
    floretPhysics.update();  //florets from the beginning
    flyingPhysics.update();  //new flying florets

    // Line between root and stem
    line(root.x, root.y, stem.x, stem.y);
    fill(255);
    stroke(150);
    ellipse(stem.x, stem.y, 15, 15);

    //draw florets
    for (int i=0; i<florets.size(); i++) {
      Floret floret = (Floret)florets.get(i);
      line(stem.x, stem.y, floret.x, floret.y);
      floret.display();
    }

    //draw flying florets (the trick!!)
    for (int i=0; i<flyingFlorets.size(); i++) {
      Floret flyingFloret = (Floret)flyingFlorets.get(i);
      flyingFloret.display();
    }
    
    if (windy) {
      windy = !windy;
      physics.addBehavior(wind);  //add wind to stem physics
      floretPhysics.addBehavior(wind); // add wind to floret physics

      float rand = random(1); 
      //when the florets are release
      if (rand>0.5 && floretSprings.size()>0) {
        int randFloret = int(random(0, floretSprings.size())-1);  
        Floret flor = (Floret)florets.get(randFloret); // casting to Floret class

        flyingFlorets.add(new Floret(flor.x, flor.y, random(5, 50)));  //create a flyingFloret in the same psotion of random floret
        flyingPhysics.addParticle((Floret)flyingFlorets.get(flyingFlorets.size()-1)); //nice trick!!, to get the last array element

        floretSprings.remove(randFloret); 
        florets.remove(randFloret);
        //print("Unlocking floret: ");
        //println(randFloret);
      }
    } 
    else if (!windy) {
      physics.removeBehavior(wind);
      floretPhysics.removeBehavior(wind);
    }  
    if (mousePressed) {
      windy = !windy;
    }
  }
}


