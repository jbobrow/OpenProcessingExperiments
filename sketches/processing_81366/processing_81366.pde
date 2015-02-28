
/*
 Program Title: IAT 800 Project 3
 Program Description: 
 Take care of the plants on the table by watering them when they get dry! 
 Click the watering can to pick it up, and click again to put it back.
 Plants will become yellow or brown in color when they are too dry. 
 If you killed a plant, a reset button will appear.
 If you want to see how your plants are doing, move your mouse over them.
 To save your progress, click the floppy disk in the bottom right corner.
 
 Other commentary: 
 Save data loads automatically. 
 All graphics by me, except for the beautiful gif outside the window - I was unable to find the name of the artist.
 Also the christmas lights, those are by Drache-Lehre on deviantart.
 Music is from Animal Crossing: City Folk (wii game)
 I sped up the plant growing process - It loses water every 10 seconds, and ages every minute.
 
 By Amber Choo, November 18th, 2012 
 */

PFont f = createFont("Tahoma", 100, true); //set the font characteristics for alllll the things!
import gifAnimation.*; //import gifAnimation from library
import ddf.minim.*; //import minim
Minim animalXing; //declares animalXing as audio
AudioPlayer animalCrossing; //declares animalCrossing as an AudioPlayer 

void setup() {
  size(400, 200); //screen is 400x200 pixels
  //attach .gif files to all of the declared gifs above, and make the animated ones play automatically when called
  light = new Gif(this, "Drache-Lehre-Deviantart.gif");
  light.play();
  reset = new Gif(this, "reset.gif");
  saved = new Gif(this, "save.gif");
  wall = new Gif(this, "wall.gif");
  wall.play();
  pot = new Gif(this, "pot.gif");
  table = new Gif(this, "table.gif");
  sparkles = new Gif(this, "sparkles.gif");
  sparkles.play();
  wateringcan2 = new Gif(this, "wateringcan.gif");
  wateringcanwatering = new Gif(this, "wateringcanwatering.gif");
  wateringcanwatering.play();
  dead = new Gif(this, "dead.gif");
  plant0 = new Gif(this, "plant0.gif");
  plant0.play();
  plant1 = new Gif(this, "plant.gif");
  plant1.play();
  plant1dry = new Gif(this, "plantdry.gif");
  plant1dry.play();
  plant2 = new Gif(this, "plant2.gif");
  plant2.play();
  plant2dry = new Gif(this, "plant2dry.gif");
  plant2dry.play();
  plant3 = new Gif(this, "plant3.gif");
  plant3.play();
  plant4 = new Gif(this, "plant4.gif");
  plant4.play();
  plant4dry = new Gif(this, "plant4dry.gif");
  plant4dry.play();

  plant0v2 = new Gif(this, "plant0v2.gif");
  plant0v2.play();
  plant1v2 = new Gif(this, "plant1v2.gif");
  plant1v2.play();
  plant1v2dry = new Gif(this, "plant1v2dry.gif");
  plant1v2dry.play();
  plant2v2 = new Gif(this, "plant2v2.gif");
  plant2v2.play();
  plant2v2dry = new Gif(this, "plant2v2dry.gif");
  plant2v2dry.play();
  plant3v2 = new Gif(this, "plant3v2.gif");
  plant3v2.play();
  plant4v2 = new Gif(this, "plant4v2.gif");
  plant4v2.play();
  plant4v2dry = new Gif(this, "plant4v2dry.gif");
  plant4v2dry.play();

  animalXing = new Minim(this); //declare animalXing as a new Minim
  animalCrossing = animalXing.loadFile("data/animalcrossingcityfolk4pm.mp3", 2048); //apply .mp3 file to animalCrossing AudioPlayer
  animalCrossing.loop(); //loop this audio forever

loadPlease(); //call function to load data from save file, if it's there

}

void loadPlease(){
    try { //try loading the save data text file if it exists
    String lines[] = loadStrings("data/hello.txt"); //loads data automatically if the text file exists.
    for (int i =0 ; i < lines.length; i++) { //move along the length of the array
      plantWater = int(lines[0]); //convert the string in this part of the array (plantWater's value) into an int and apply it to plantWater
      plantAge = int(lines[1]); //convert the string in this part of the array (plantAge's value) into an int and apply it to plantAge
      plant2Water = int(lines[2]); //convert the string in this part of the array (plantWater's value) into an int and apply it to plantWater
      plant2Age = int(lines[3]); //convert the string in this part of the array (plantAge's value) into an int and apply it to plantAge
      println("Data loaded! Welcome back!");
    }
  }
  catch(NullPointerException e) { //if the text file doesn't exist, that's okay
    println("No save data available. Plants will start with full water at 0 minutes of age.");
  }
}

void draw() { 
  image(wall, 0, 0); //load the wall gif (includes outdoor rain/tree graphics)
  image(table, 30, height-86); //load the table and place it on the bottom of the screen
  image(saved, width-20, height-20); //load the save icon and stick it in the bottom right corner
  leafy = new Leafy(0, 0, 0, 10); //declare a new leafy of Leafy class. x and y pos are overwritten later. age = 0, water = 10
  leafy2 = new Leafy2(0, 0, 0, 10); //declare a new leafy of Leafy class. x and y pos are overwritten later. age = 0, water = 10
  leafy.growTime(); //call growTime() in Plant
  leafy2.growTime(); //call growTime() in Plant

  leafy.draw(); //call draw() in leafy
  leafy2.draw(); //call draw() in leafy

  wateringcan = new Wateringcan(0, 0); //declare a new wateringcan of Wateringcan class
  wateringcan.draw(); //call draw() in wateringcan

  decorationsTime = new Decorations(0, 0); //decorations with xpos and ypos set
  decorationsTime2 = new Decorations(); //decorations with no set variables
  decorationsTime3 = new Decorations(3); //decorations with ypos set only
  decorationsTime.draw(); //draw the above decorations
  decorationsTime2.draw();
  decorationsTime3.draw();

  if (mouseX > width-20 && mouseX < width-5 && mouseY > height-20 && mouseY < height-5) { //if the mouse is over the save icon
    if (mousePressed) { //and the mouse is pressed
      print("Data saved!");
    }
    color[] nums = { //create an array called nums to save my variables inside. Used color to avoid error 'cannot convert from int to String.'
      plantWater, plantAge, plant2Water, plant2Age //save plantWater and plantAge
    };
    saveStrings("data/hello.txt", str(nums)); //save data to the data folder and convert my nums array into String
  }
}

abstract class Plant {
  int plantxPos; //x position of plant is abstract. Will define in extended classes.
  int plantyPos; //y position of plant is abstract. Will define in extended classes.
  int milli = millis(); //milliSecWater = milliseconds that have passed by
  int secondsForWater = milli/1000; //milliseconds converted to seconds in interger secondsForWater
  int minuteAge =  milli/60000; //converts to minutes
  Plant(int xPos, int yPos, int age, int water) { //plants consist of x and y position, their age, and water level
    xPos = plantxPos;  
    yPos = plantyPos;
    age = plantAge;
    water = plantWater;
  }
  void growTime() { //controls plant growth
    image(pot, plantxPos-9, plantyPos+5); //draw the pot the plant sits in
    if (plantWater <= 0) { //if the plant has 0 or less water 
      plantIsDead = true; //the plant is dead!
      image(dead, plantxPos, plantyPos); //change the plant's image to the dead plant image
    }
    if (plantIsDead == false) { //if the plant isn't dead,
      if (plantAge == 0) { //and if the plant's age is between 0 and 1 minutes
        image(plant0, plantxPos, plantyPos-3); //draw the tiny plant of 0 minutes of age
      }
      if (plantAge == 1) { //if the plant's age is between 1 and 2 minutes
        if (plantWater >5) { //and if the plant's water level is greater than 5
          image(plant1, plantxPos, plantyPos); //draw the plant of 1 minutes of age
        }
        else { //however if it's water level is low
          image(plant1dry, plantxPos, plantyPos-3); //draw the dry plant of 1 minutes of age
        }
      }
      if (plantAge == 2) { //if the plant's age is between 2 and 3 minutes
        if (plantWater >5) { //and if the plant's water level is greater than 5
          image(plant2, plantxPos-10, plantyPos+6); //draw the plant of 2 minutes of age
        }
        else { //however if it's water level is low
          image(plant2dry, plantxPos-10, plantyPos+6); //draw the dry plant of 2 minutes of age
        }
      }
      if (plantAge == 3) { //if the plant's age is between 3 and 4 minutes
        if (plantWater >5) { //and if the plant's water level is greater than 5
          image(plant3, plantxPos-10, plantyPos-22); //draw the plant of 3 minutes of age
        }
        else { //however if it's water level is low
          image(plant4dry, plantxPos-10, plantyPos-22); //draw the dry plant of 4 minutes of age
        }
      }
      if (plantAge >= 4) { //if the plant's age 4 minutes or greater (the biggest plant)
        if (plantWater >5) { //and if the plant's water level is greater than 5
          image(plant4, plantxPos-10, plantyPos-22); //draw the plant of 3 minutes of age
        }
        else { //however if it's water level is low
          image(plant4dry, plantxPos-10, plantyPos-22); //draw the dry plant of 4 minutes of age
        }
      }
    }
  }
  void draw() { 
    textFont(f, 11); //font size = 11
    fill(255); //white
    if (secondsForWater == resetPlease) { //if the timer is up (10 seconds = 10 seconds)
      plantWater = plantWater-1 ; //subtract one water from the plants
      plant2Water = plant2Water-1 ;
      println("Plants got a little drier.");
      resetPlease = resetPlease+10; //reset the timer so it will ping in another 10 seconds
    }
    if (minuteAge == resetPlease2) { //if one minute has passed since the last aging of plant
      plantAge = plantAge+1 ; //age the plant by one minute
      plant2Age = plant2Age+1 ; //age the plant by one minute
      println("Age up!");
      resetPlease2 = resetPlease2+1; //reset the reset variable to begin the countdown again
    }
    if (plantIsDead == true) { //if plant is dead
      image(reset, leafy.plantxPos, leafy.plantyPos-5); //reveal the reset button above the dead plant
      if (mouseX >leafy.plantxPos && mouseX < leafy.plantxPos+40 && mouseY < leafy.plantyPos+10 && mouseY > leafy.plantyPos-10) { //if the mouse is over the reset button
        if (mousePressed) { //and if the mouse is pressed
          plantWater = 10; //reset all of the variables related to the plant
          plantAge = 0;
          milli = 0;
          plantIsDead = false; //un-declare the plant's death
        }
      }
    }
    if (plant2IsDead == true) { //if plant is dead
      image(reset, leafy2.plantxPos, leafy2.plantyPos-5); //reveal the reset button above the dead plant
      if (mouseX >leafy2.plantxPos && mouseX < leafy2.plantxPos+40 && mouseY < leafy2.plantyPos+10 && mouseY > leafy2.plantyPos-10) { //if the mouse is over the reset button
        if (mousePressed) { //and if the mouse is pressed
          plant2Water = 10; //reset all of the variables related to the plant
          plant2Age = 0;
          milli = 0;
          plant2IsDead = false; //un-declare the plant's death
        }
      }
    }
    if (mouseX > leafy.plantxPos && mouseX < leafy.plantxPos+60 && mouseY > leafy.plantyPos && mouseY < leafy.plantyPos+60) { //if the mouse is over the plant
      text("Minutes old: " + plantAge, leafy.plantxPos-14, leafy.plantyPos+55); //print the age of the plant below the pot
      if (plantIsDead == false) { //if the plant isn't dead
        text("Water level: " +plantWater +"/10", leafy.plantxPos-14, leafy.plantyPos+70); //print this below the pot
      }
      else {  //but if the plant IS dead,
        text("This plant is dead!", leafy.plantxPos-14, leafy.plantyPos+70); //print this below the pot
      }
    }
    if (mouseX > leafy2.plantxPos && mouseX < leafy2.plantxPos+60 && mouseY > leafy2.plantyPos && mouseY < leafy2.plantyPos+60) { //if the mouse is over the plant
      text("Minutes old: " + plant2Age, leafy2.plantxPos-14, leafy2.plantyPos+55); //print the age of the plant below the pot
      if (plant2IsDead == false) { //if the plant isn't dead
        text("Water level: " +plant2Water +"/10", leafy2.plantxPos-14, leafy2.plantyPos+70); //print this below the pot
      }
      else { //but if the plant IS dead,
        text("This plant is dead!", leafy2.plantxPos-14, leafy2.plantyPos+70); //print this below the pot
      }
    }
  }
}

class Leafy extends Plant {
  Leafy(int xPos, int yPos, int age, int water) {  //inherit variables from Plant
    super(xPos, yPos, age, water); 
    plantxPos = 80; //set the x position of plant
    plantyPos = 90; //set the y position of plant
  }
}

class Leafy2 extends Plant {
  Leafy2(int xPos, int yPos, int age, int water) {  //inherit variables from Plant
    super(xPos, yPos, age, water); 
    plantxPos = 180; //set the x position of plant
    plantyPos = 90; //set the y position of plant
  }
  void growTime() { //override the original growTime 
    image(pot, plantxPos-9, plantyPos+5); //draw the pot under the plant
    if (plant2Water <= 0) { //if plant has 0 or less water,
      plant2IsDead = true; //then the plant is dead!
      image(dead, leafy2.plantxPos, leafy2.plantyPos); //draw the image of the dead plant
    }
    if (plant2IsDead == false) { //if the plant is not dead,
      if (plant2Age == 0) { //if the plant's age is between 0 and 1,
        image(plant0v2, plantxPos, plantyPos-3); //draw the plant at 0 minutes of age
      }
      if (plant2Age == 1) { //if the plant's age is between 1 and 2,
        if (plant2Water >5) { //and the plant's water is greater than 5,
          image(plant1v2, plantxPos, plantyPos); //draw the plant at 1 minute of age
        }
        else { //if the plant is dry,
          image(plant1v2dry, plantxPos, plantyPos-3); //draw the dry plant at 1 minute of age,
        }
      }
      if (plant2Age == 2) { //if the plant's age is between 2 and 3,
        if (plant2Water >5) {//and the plant's water is greater than 5,
          image(plant2v2, plantxPos-10, plantyPos+6); //draw the plant at 2 minutes of age,
        }
        else { //if the plant is dry,
          image(plant2v2dry, plantxPos-10, plantyPos+6); //draw the dry plant at 2 minute of age,
        }
      }
      if (plant2Age == 3) { //if the plant's age is between 3 and 4,
        if (plant2Water >5) {//and the plant's water is greater than 5,
          image(plant3v2, plantxPos-10, plantyPos-22); //draw the plant at 3 minutes of age,
        }
        else { //if the plant is dry,
          image(plant4v2dry, plantxPos-10, plantyPos-22); //draw the dry plant at 4 minute of age,
        }
      }
      if (plant2Age >= 4) { //if the plant's age is 4 or greater,
        if (plant2Water >5) {//and the plant's water is greater than 5,
          image(plant4v2, plantxPos-10, plantyPos-22); //draw the plant at 4 minutes of age,
        }
        else { //if the plant is dry,
          image(plant4v2dry, plantxPos-10, plantyPos-22); //draw the dry plant at 4 minute of age.
        }
      }
    }
  }
}

class Wateringcan { //new class for watering can
  Wateringcan(int xPos, int yPos) {
    xPos = 250; //x position of watering can
    yPos = 95; //y position of watering can
  }
  void draw() {
    int xPos = 250; //x position of watering can
    int yPos = 95; //y position of watering can
    if (mousePressed) { //if the mouse is pressed
      if (isPickedUp == false && mouseX > xPos && mouseX < xPos+69 && mouseY > yPos && mouseY < yPos+42) { //and if the mouse is over the watering can and not already picked up
        isPickedUp = true; //pick up the watering can
      }
      else { //otherwise
        isPickedUp = false; //drop the watering can, just in case it's being held
      }
    }
    if (isPickedUp == false) { //if the watering can is currently not picked up
      image(wateringcan2, xPos, yPos); //show the image of the watering can sitting on the table
    }
    if (isPickedUp == true) { //if the watering can is picked up
      xPos = mouseX-5; //change the xPos and yPos locations of the watering can to the mouse locaation, so the player can move the can around
      yPos = mouseY-5;
      image(wateringcanwatering, xPos, yPos); //change the image to the watering can watering
      if (plantIsDead == false) {
        if (xPos+60 > leafy.plantxPos && xPos+60 < leafy.plantxPos+60 && yPos >leafy.plantyPos-60 && yPos < leafy.plantyPos-40) { //if the watering can is watering above the pot
          image(sparkles, leafy.plantxPos-5, leafy.plantyPos+5); //make sparkles appear around the plant to provide visual feedback of it's water regeneration
          plantWater=10; //restore leafy to 10/10 water
          println("Water for plant 1 restored to 10/10.");
        }
      }
      if (plant2IsDead == false) {
        if (xPos+60 > leafy2.plantxPos && xPos+60 < leafy2.plantxPos+60 && yPos >leafy2.plantyPos-60 && yPos < leafy2.plantyPos-40) { //if the watering can is watering above the pot
          image(sparkles, leafy2.plantxPos-5, leafy2.plantyPos+5); //make sparkles appear around the plant to provide visual feedback of it's water regeneration
          plant2Water=10; //restore leafy to 10/10 water
          println("Water for plant 2 restored to 10/10.");
        }
      }
    }
  }
}

class Decorations { //I threw some decorations in here to include overloading
  int xPos; //x position of light decorations
  int yPos; //y position of light decorations
  Decorations(int xPosition, int yPosition) {
    xPos = xPosition; //x position of light decorations
    yPos = yPosition; //y position of light decorations
  }
  Decorations() { //overloading, because reasons
    xPos = 140; //x position of lights
    yPos = 1; //y position of lights
  }
  Decorations(int yPosition) { //overloading, because reasons
    xPos = 280; //x position of lights
    yPos = yPosition; //y position of lights set externally
  }
  void draw() { 
    image(light, xPos, yPos); //draws lights
  }
}


