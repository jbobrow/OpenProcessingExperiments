
void setup(){
  size(600,600);
  frameRate(10);
  // light gray background, like canvas
  background(#EDF0DC);
  
}

//timer variable
int iterations = 0;

// this creates random values for location
float randPlace(){
  float point = moreNoise(random(25, 575));
  return point;
}

// this function creates random values for size

float randSize(){
  float newVal = random(30, 200);
  return newVal;
}

// this function can be called to create a random RGB-A color value
int randColor(){
  
  color New = color(int(random(0, 255)),int(random(0, 255)),int(random(100, 200)));
  return New;
}

// this function can be called to add additional variation

float moreNoise(float oldVar){
  float newVar = oldVar + random(-70, 70);
  return newVar;
}

void draw(){
  
  iterations += 1;
  // limits the shapes drawn
  if(iterations == 30){
    noLoop();
  }
  else
  {
    // draws 5 triangles
    if(iterations < 5){
      noStroke();
      fill(randColor());
      triangle(random(-100,700), random(-100,700), random(-100,700), random(-100,700), random(-100,700), random(-100,700));
    }
    if(iterations > 10){
      // iterator variable
      int i;
    
      //these variables will allow the elements to be redrawn in new locations
    
      float X = randPlace();
      float Y = randPlace();
      // draws 20 rectangles
      noStroke();
      // creates new color
      fill(randColor());
      rect(X, Y, randSize(), randSize());
    }
    
    // draws 10 quadrangles
    if(iterations > 20){
      fill(randColor(), random(0,255));
      quad(randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace());
    }
    
    // draws 15 curves on top of everything
    if(iterations == 29){
      int i;
      for(i=0;i<30;i++){
        float X = random(0, 600);
        stroke(randColor(),200);
        strokeWeight(3);
        line(X, randPlace(), X, randPlace());
      }
      
      for(i = 0; i < 15; i++){
        fill(0,0,0);
        noStroke();
        curve(randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace());
      }
      
      // draws random ellipses that have a second ellipse translated slightly from their position
      for(i = 0; i < 20; i++){
        float size = random(5, 30);
        float place = randPlace();
        noStroke();
        fill(5*i,5*i,5*i);
        ellipse(place, place, size, size);
        ellipse(moreNoise(place)+10,moreNoise(place)-20,moreNoise(size),moreNoise(size));
      }
      
      // draws 15 more curves w/o fill
      for(i = 0; i < 15; i++){
        strokeWeight(5);
        noFill();
        stroke(220,220,220);
        curve(randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace(),randPlace());
      }      
    }
  }
}


