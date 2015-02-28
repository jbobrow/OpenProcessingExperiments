
/* @pjs font="Raleway-Regular.ttf"; */
PFont ralereg ;
PImage bgimage ;
float state = 0 ;
int opacity= 0;
int counter =0;
int counter2 = 0;
int counter3 = 0;

void setup() {
  frameRate(24) ;
  size(800, 620) ;
  ralereg = createFont("Raleway-Regular.ttf", 256) ;
  bgimage = loadImage("river3.jpg") ;
  noStroke();
  smooth();

  acre = 39;
  percentage = 30.1;
  population = 2500;
  result = 25.5;
}

void draw() {
  background(#333333) ;
  image(bgimage) ;
  fill(0, 40);
  rect(0, height-250, 800, 250);

  switch(state) {
  case 0:    

    opacity+=5;
    counter+=1;
    fill(255, opacity);
    textFont(ralereg, 200) ;
    text(acre, 10, height/2);
    textFont(ralereg, 45) ;
    text("NipperSink has about "+counter, 10, height*.7);
    text("thousand acres", 10, height*.8);
    text("in watershed", 10, height*.9);

    if (counter >= acre) { 
      counter = acre;
      opacity = 0;
      state++;
    }
    break;

  case 1:
    println("state1");


    opacity+=5;
    counter2+=25;
    fill(255, opacity);
    textFont(ralereg, 200) ;
    text(population, 10, height/2);
    textFont(ralereg, 45) ;
    text("We've sampled "+counter2+" people", 10, height*.7);
    text("to get some of these results", 10, height*.8);
    if (counter2 >=population) {
      counter2 = population;
      opacity = 0;
      state++;
    }
    break;

  case 2:
    println("state2");




    opacity+=5;
    counter3+=1;
    println(counter3);
    fill(255, opacity);
    textFont(ralereg, 200) ;
    text("26%", 10, height/2);
    textFont(ralereg, 45) ;
    text("Giving us a "+counter3+"% in response rate", 10, height*.7);

    if (counter3 >=result) {
      counter3 = base(result);
    }
    break;
  }
}



