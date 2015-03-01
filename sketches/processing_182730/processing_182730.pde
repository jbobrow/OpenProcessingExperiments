
/*
Kaito Gengo
Create a sketch that responds to one or more of the following kinds of user input:
"poke": short, sharp press (mouseClick)
"rub":  sustained press with continuous motion (MousePressed)
"tickle": rapid, repeated rubbing (Mouse Pressed)

Your sketch should encourage exploration and interaction,
and respond in an engaging, surprising, and/or delightful
manner. Use image and sound to effectively indicate 
affordances, provide feedback, and communicate state. 
Explicit or written instructions are not to be used. 
The most successful sketches will create a satisfying experience 
that invites sustained and/or repeated interaction.

line falls like rain, and everytime an
user click the string makes more rain
when user pressed mouse, hopefully change the direction of the rain
*/

float easing = 0.015;//easing motion
int dropCount = 0; // counts the number of ellipse that drops
float lastLocX = 0;// last Y postin of the stars
float lastLocY = 0;// last Y postin of the stars
float destX, destY; // destination location of x and y cordinates
float exponent = 4;   // Determines the curve
float[] appearX = new float[0]; // sets temporary array form for where the star will appear
float[] appearY = new float[0]; // sets temporary array form for where the star will appear
float[] ellipSize = new float[0]; // sets temporary array form for the size of star
PImage wandNorm, wandClick, DarkMickey;


void setup(){
  size (500, 500);//sets the canvas size
  smooth();
  background(0);
  frameRate(100);
  destY = height + 5;// destination of the Y cordinate
  
  wandNorm = loadImage("wandNorm.png");//loads the image for wand
  wandClick = loadImage("wandClick.png");//loads the image for wand
  imageMode(CENTER);
}

void draw(){
  if(mousePressed == true){
    cursor(wandClick);//sets the cursor when clicked
  } else {
    cursor(wandNorm);
  }
  
  //delete the last location of the star 
  for(int i = 0; i < dropCount; i++){
    
    noStroke();
    lastLocY = appearY[i]; // sets the location to delete
    fill(0);
    ellipse(appearX[i], lastLocY, ellipSize[i] + .1, ellipSize[i] + .1);
    
    //delete a star when it hits the ground
    if (appearY[i] > height - ellipSize[i]){
      appearY[i] = 0;
    }

    // draws droping stars
    appearY[i] += (height + 5 - appearY[i]) * easing;// easing
    fill(255, 200, 110, 90); //set color of the ellipse
    ellipse(appearX[i] + destX, appearY[i], ellipSize[i], ellipSize[i]);
    fill(255, 255, 120, 20);
    ellipse(appearX[i], appearY[i], ellipSize[i] - 2, ellipSize[i] - 3);  
    ellipse(appearX[i], appearY[i], ellipSize[i] - 3, ellipSize[i] - 5);
    ellipse(appearX[i], appearY[i], ellipSize[i] - 5, ellipSize[i] - 8);  
    
    //creates line
    noFill();
    stroke(255, 255, 120, 1);
    line(appearX[i], 0, appearX[i], appearY[i]);
  }

  
}

void mouseDragged(){
  mouseAction();
}

void mouseClicked(){
  mouseAction();
}

void mouseAction(){
  appearX = append(appearX, random(width));
  appearY = append(appearY, random(-20, 0));
  ellipSize = append(ellipSize, random(5, 12));
  dropCount++;
}


    


