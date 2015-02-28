

//Sketch uses Custom Classes, Mouse interaction, iteration, external library(image), ArrayList//



ArrayList snflake = new ArrayList(); //new arraylist
PImage snowylandscape; // adds image file
snflake f; // the snowflakes


void setup() {
  size(750,550); // size of sketch
  smooth(); // smoothes out drawing
  snowylandscape = loadImage("winterLandscape.jpg"); //loads landscape image
}

void draw() {

  image(snowylandscape,0,0,width,height); //places landscape image into sketch with its width and height dependent on size of sketch

  for(int i=0; i<snflake.size(); i++) { // repeat the snflake arraylist
    snflake f=(snflake)snflake.get(i); //get snowflake
    f.render();// draw snowflake
    f.move(); // add movement (velocity and gravity) to the snowflakes
  }

//cloud shape

  stroke(0,10,250,0); //outline of ellipse
  fill(200,200,230,100); // filled colour of clouds
  for(int c=0; c<5; c++) { //iterates the cloud shapes
    ellipse(mouseX,mouseY, 200, 80); // each individual ellipse combines to create cloud shape
    ellipse(mouseX+100, mouseY, 160,70); // x & y positioning dependent on mouse co-ordinates
    ellipse(mouseX-100, mouseY, 160,70);
    ellipse(mouseX+50,mouseY-40, 120,40);
    ellipse(mouseX-50,mouseY-40, 120,40);
    ellipse(mouseX,mouseY-60, 60,30);
  }
}

void mousePressed() { //when mouse pressed do this -->>
  snflake f= new snflake(new PVector(mouseX,mouseY), color(random(0,255),random(240,255),random(240,255)),random(2,5));
  // getting out class snflake with its variables ( PVector, colour, size)
  snflake.add(f); // add the new snowflakes to bucket
}


