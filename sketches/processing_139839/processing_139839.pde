
float w = random(25,75);
float h = random(25,75);
float x = 100;
float y = 100;
float ranOp = random(20,100);
float c = color(250,0,0, ranOp);

void setup() {
  size(600, 600);
  frameRate(10);
}

void draw() {
      background(250,250,250);
      
      //test squares (for motion)
      stroke(0);
      noFill();
      rectMode(CORNER);
      rect(10,10,580,580);
      rect(0,0,300,300);
      rect(0,300,300,300);
      rect(300,0,300,300);
      rect(300,300,300,300);
      rect(150,150,300,300);
      rect(250,250,100,100); // once the cloud reaches this square it
      //is sent randomly throughout the page. Working on the motion not having
      //to rely on this awkward jump.
      //end test squares (for motion)
      
  fill(c);
  rectMode(CENTER);
  
  for (int i = 0; i < 50; i = i+2){
  noStroke();
  rect(random(-20,20)+x,random(-20,20)+y, i, i); // CLOUD
  }

//Outer Bounding Box
if(x<=50){
 x = x+10;
} else if (x >= 550){
x = x-10;
}

if(y<= 50){
 y = y+10;
} else if (y >= 550){
y = y-10;
}


//Center Box
if ((x>=250) && (x<=450) && (y>=250) && (y<=450)){
 x = x+ random(-300,300); 
 y = y+ random(-300,300);
}

// top left box
else if ((x <= 300) && (y<=300)){
  x = x+random(-5,10);
  y = y+random(-5,10);
}


// bottom left box
else if ((x <= 300) && (y >= 300)){
  x = x+random(-10,5);
  y = y+random(-10,5);
}


// bottom right box
else if ((x >= 300) && (y>=300)){
  x = x+random(-10,5);
  y = y+random(-10,5);
}


// top right box
else if ((x >= 300) && (y<=300)){
  x = x+random(-10,5);
  y = y+random(-10,5);
}

}
//Cloud



