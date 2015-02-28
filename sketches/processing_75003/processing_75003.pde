
class Level { //Are you ready to GET CRAZY????
  int thisLevel; //This is not the crazy part. We will use this variable to label each instance as a particular level.
  ArrayList<Platform> myPlats; //Time for an ArrayList of platforms! We declare and name it. The "<Platform>" is to tell the ArrayList what kind of object it is storing, since it doesn't know otherwise.

  Level(int _thisLevel) { //Here is the constructor for the Level object. We use variable "_thisLevel" so that when we create an instance of the Level object in the main tab, we can distinguish it from other Level objects without giving it a different name. We use the variable below to draw different sets of platforms.
    thisLevel = _thisLevel; //Here we set "_thisLevel" (which exists only inside the constructor) equal to the variable we created above. This way we can use the number we enter into the constructor in contexts outside the constructor, like below.
  }

  void prep() { //Aw yeah. Things are about to get to the CRAZY I mentioned earlier.
    myPlats = new ArrayList<Platform>(); //Here we initialize the ArrayList. ArrayLists don't have a fixed size, so we don't have to give a number in brackets like in arrays. Hurray! The "<Platform>" serves the same purpose here as it did above - identifying to the ArrayList what kind of object it's storing. I'm not sure why we need to say this twice, but hey. As long as it works, amirite?
    if (thisLevel == 2) { //Yeah, baby. Here's how we create different levels and tell them apart. We create all these levels, identified by their thisLevel value. They're all ready to go from the get-go. But we only draw one at a time.
      myPlats.add(new Platform(270, 530, 80, 20)); //In this section we create specific instances of the Platform object and give them parameters through the constructor (see Platform tab). The ArrayList automatically assigns them to its elements based on the order they are listed.
      myPlats.add(new Platform(420, 470, 60, 20));
      myPlats.add(new Platform(550, 410, 60, 20));
      myPlats.add(new Platform(680, 350, 60, 20));
      myPlats.add(new Platform(490, 250, 100, 20));
      myPlats.add(new Platform(0, 170, 60, 20));
      myPlats.add(new Platform(150, 250, 60, 20));
      myPlats.add(new Platform(300, 300, 60, 20));
      myPlats.add(new Platform(450, 150, 60, 20));
      myPlats.add(new Platform(75, 75, 200, 20));
    }
    else if (thisLevel == 1) { //Oh, snap! It's a different level!
      myPlats.add(new Platform(500, 530, 80, 20));
      myPlats.add(new Platform(250, 530, 80, 20));
    }
    else if (thisLevel == 0) { //A third level? CRAZY.
      myPlats.add(new Platform(150, 200, 80, 20));
      myPlats.add(new Platform(350, 300, 80, 20));
      myPlats.add(new Platform(550, 200, 80, 20));
    }
  }

  void display() {
    for (int i = 0; i < myPlats.size(); i++) { //Here we use a for loop to iterate through all the platforms in the ArrayList. We use i to identify which element we are looking at. Note that we use "size()" instead of "length," because ArrayList has different syntax than array.
      Platform myPlatform = myPlats.get(i); //As on the main tab, we pull an object from the ArrayList so we can do something with it.
      myPlatform.drawPlatform(); //Call the drawPlatform function from the Platform tab using the specific parameters for this value of i (which is a specific element in the ArrayList).
      //fill(255); text(i, myPlatform.xPos + (myPlatform.platWidth / 2), myPlatform.yPos + (myPlatform.platHeight / 1.5)); //Debug - print the name of the element on the Platform drawn in that element, so we can easily tell which Platform is which.
    }
  }
}


