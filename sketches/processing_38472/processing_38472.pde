
//Will Cordes
//Computational Methods, ARCH 4050, Fall 2011
//Project One, Delta Lab

//The following composition is a rough representation and
//reworking of a sketch for my current studio assignment.
//Certain volumes slide or shift to allow for a more open
//spacial analysis in plan.


void setup() {
  size(500, 500);
  background(75);
  smooth();
  stroke(255);
  colorMode(HSB);
}

void draw() {
}

void mousePressed() {
  background(75);
  stroke(random(240, 255));
  strokeWeight(random(3));
  line(25, height/2, width-25, height/2);
  line((width/2)+25, 100, (width/2)+25, height-125);
  
  noStroke();
  fill(random(200),random(200),random(200),random(150));
  
  rectMode(CENTER);
  fill(random(200),random(200),random(200),random(150));
  
  rect(((width/2)-5)+random(25), ((height/2)-15)+random(25), 25, 25);
    //rect with random x and y central coordinates
  fill(random(200),random(200),random(200),random(150));
  rect(((width/2)-5)+random(25), ((height/2)-15)+random(25), 10, 10);
    //rect with random x and y central coordinates
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)-12.5, (height/2)-38, 5, 15);
  fill(random(200),random(200),random(200),random(150));
  rect((width/2), (height/2)-38, 15, 15);
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)-35, (height/2)-15, 25, 25);
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)-20, ((height/2)+10)+random(10), 55, 12.5);
    //rect with random y central coordinate
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)+17, (height/2)-34, 10, 100);
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)+47, ((height/2)-34)+random(50), 10, 100);
    //rect with random y central coordinate
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)+57, ((height/2)-87.5)-random(75), 5, 75);
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)+67, (height/2)-41, 5, 75);
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)+71.5, (height/2)-59.5, 5, 37.5);
  fill(random(200),random(200),random(200),random(150));
  rect(((width/2)+71.5)+random(25), (height/2)-15, 5, 5);
    //rect with random x central coordinate
  fill(random(200),random(200),random(200),random(150));
  rect((width/2)+47.5, (height/2)+62.5, 3.5, 3.5);
}

