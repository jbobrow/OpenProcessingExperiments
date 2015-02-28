
//Homework 7.1: Objects
//Created by Adrianne Blossom
//October 5, 2011

//I have used class to create a population where people are represented by dots


int growth = 10; //Controls rate in whichh population grows
Population[] myPopulation = new Population[growth]; //Declare object
color[]myColors = new color[2];

void setup() {
  size(500, 500);
  background(100);

  myColors[0] = color(250, 125, 170); //colors for array
  myColors[1] = color(95, 215, 245);

  for (int i=0;i<myPopulation.length;i++) { //seeding
    myPopulation[i] = new Population();
  }
}

void draw() {
  for (int i=0; i < myPopulation.length; i++) {
    myPopulation[i].update();
    myPopulation[i].draw();
  }
}



class Population {
  float x1 = random(0, width);
  float y1 = random(0, height);
  float x2 = random(0, width);
  float y2 = random(0, height);
  color gender = myColors[floor(random(0,2))];

  Population() {
  }

  void update() {
    x1 = x1 + random(-10, 10); //1's regulate the amount of area coverd by females
    y1 = y1 + random(-20, 20);
    x2 = x2 + random(-25, 25); //2's regulate the amount of area covered by males
    y2 = y2 + random(-15, 15);
  }


void draw(){ //draw dots or people in population
    stroke(gender); //color relates to gender
    strokeWeight(random(3, 5)); //female population
    point(x1, y1);
    strokeWeight(random(7)); //male population
    point(x2, y2);
}
}




