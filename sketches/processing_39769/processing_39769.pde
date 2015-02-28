
//snow day 

int num=50;
float[] yaxis= new float[num]; //determines where the snowflake ends up on the y axis

color [] myColors= new color[3]; //creating 3 random color variables

color turquoise = color(0, 277, 255);
color sun= color(255, 217, 0);
color grass= color(131, 255, 0);

void setup() {
  size(300, 300);

  myColors[0]= color(255, 217, 0);
  myColors[1]= color (255, 234, 0);
  myColors[2]= color(255, 115, 0); 

  for (int a=0; a < yaxis.length; a++) { //determines where the snowflake falls on the y axis
    yaxis[a]= random(height); 
  }
}


void draw() {
  color [] myColors= new color[3];
  fill (turquoise);
  rect(0, 0, width, height*.75); //creates blue background
  fill(sun);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 30); //creates sun

  for (int i=0; i< yaxis.length; i++) {
    stroke(pickAColor());
    line((width/yaxis.length)*i, yaxis[i], 10, 10); //draw sun ray based on yaxis variable
    fill(255);
    noStroke();
    ellipse((width/yaxis.length)*i, yaxis[i], 10, 10); //snowflake based off yaxis variable
    yaxis[i]=yaxis[i]+1; //update the yaxis variable in the array to move snowflake and sun ray
    if (yaxis[i]>height)yaxis[i]=0; // test of the yaxis
  }
  fill(grass);
  rect(0, height-75, width, height); //draws the grass
}

color pickAColor() {
  int c = int(random(3)); //determines which of the three random colors will be chosen
  return myColors[c];
}


