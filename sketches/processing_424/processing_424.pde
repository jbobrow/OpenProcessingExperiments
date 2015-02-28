
class Being {
  float xloc;
  float yloc;
  int age;
  float gestation;
  float territory;
  boolean isPregnant;
  int progeny;
  //boolean isIncest;
  //int inbreeding;

  Being() {
    xloc = random(width);
    yloc = random(height);
    age = 1800;
    gestation = 0;
    territory = 20;
    isPregnant = false;
    progeny = 0;
  }

  void wander() {
    xloc += random(-3, 3);
    yloc += random(-3, 3);
  }

  void rest() {
    isPregnant = true;
  }

  void drawMe() {
    noStroke();
    fill(0);
    ellipse(xloc, yloc, 2, 2);
  }

}

void procreate(Being being1, Being being2) {
  //move towards one another
  //new being
  Being being3 = new Being(); //how do I add this to the array human[]?
  human = (Being[]) append(human, being3);
  being3.xloc = being2.xloc;
  being3.yloc = being2.yloc;
  being3.age = 0;
  being2.isPregnant = true;
  being2.progeny++;
  /*if(isIncest) {
   being3.inbreeding++;
   }*/
}

void scan() {
  for(int i=0; i<numHumans; i++) {
    for(int j=0; j<numHumans; j++) {
     if (i != j) {
        if(dist(human[i].xloc, human[i].yloc, human[j].xloc, human[j].yloc) < human[i].territory) {
          procreate(human[i], human[j]);
        }
      }
    }
  }
}

//too much inbreeding causes a zombie outbreak
/*
void geneScreen(Being testSubject) {
 if(testSubject.inbreeding > 3) {
 outbreak();
 }
 }
 
 
 void outBreak() {
 //zomg zombies!
 }
 */


int numHumans = 15;
Being[] human = new Being[numHumans];

void setup() {
  size(400,400); 
  for(int i=0; i < human.length; i++) {  
    human[i] = new Being();
    //human[i].xloc = random(0, width);
    //human[i].yloc = random(0, height);
  }
}

void draw() {
  background(255);
  for(int i = 0; i < human.length; i++) { 
    human[i].drawMe();
    human[i].wander();
    //prevents pop explosion crash
    if(human[i].age > 4000) {
      //particle dies
    }
    if(human[i].age < 1800 || human[i].progeny > 5) {
      // do nothing 
    }
    else if(human[i].isPregnant) {
      if(human[i].gestation < 900) { 
        human[i].gestation++;
      }
      else {
        human[i].isPregnant = false;
      }
    }
    else {
      scan();
      //geneScreen(human[i]);
    }
    human[i].age++;
  }

  //noLoop();
}

//check fertility
//offspring
//rest

