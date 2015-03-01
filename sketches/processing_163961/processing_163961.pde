
int x;
int y;
int r;
float angle;
int sunX=x+400;
int sunY=y+400;


void setup(){
  size (800,800);
  smooth();
  int x=width/2;
  int y=height/2;

}

void draw(){
background(255);


//MY SOLAR SYSTEM

  orbits();

  sun();
  mercury();
  // pushMatrix();
  
  // angle = angle+0.5;
  // rotate(radians(angle));
   venus();
  // popMatrix();
  
 
  earth();
  mars();
  saturn();
  uranus();
  jupiter();  

}

// FUNCTIONS

// draw orbits

void orbits(){  
   for (int i=480; i>0; i=i-60){
   ellipseMode(CENTER);
   fill(0);
   stroke(69, 140, 204, 120);
   ellipse(width/2,height/2,i,i);
  }
} 

// DRAW SUN

void sun (){
ellipseMode(CENTER);
noStroke();
fill(255,205,3);
ellipse(sunX,sunY,r+75,r+75);

}

//DRAW PLANETS:

//DRAW MERCURY:

void mercury (){
pushMatrix();
translate(width/2,height/2);  
angle = angle+0.05;
rotate(radians(angle));
ellipseMode(CENTER);
noStroke();
fill(74,193,164);
ellipse(x+60,y,15,15);
popMatrix();
}


//DRAW VENUS


void venus () {
  

pushMatrix();
translate(width/2,height/2);  
angle = angle+0.0005;
rotate(radians(angle));
  
noStroke();
fill(216,119,70);
ellipse(x+75,y-50,23,23);
popMatrix();

}

//DRAW EARTH


void earth (){
  pushMatrix();
translate(width/2,height/2);  
angle = angle+0.005;
rotate(radians(angle));
  
 noStroke();
fill(96,157,218);
ellipse(x-70,y-95,37,37);
//EARTH DETAILS
//left
fill(81,153,64);
ellipseMode(CENTER);
ellipse(x-70,y-110,15, 7);
//right
fill(81,153,64);
ellipseMode(CENTER);
ellipse(x-68,y-89,10,15);
//upper
fill(81,153,64);
ellipseMode(CENTER);
ellipse(x-84,y-95,8, 12);
popMatrix();    
}

// MARS

void mars (){
  pushMatrix();
translate(width/2,height/2);  
angle = angle+0.05;
rotate(radians(angle));
  
noStroke();
fill(209,37,2);
ellipse(x+120,y+90,37,37);
//MARS DETAILS
fill(180,4,4);
ellipse(x+130,y+90,12,15);
popMatrix();
}


//JUPITER

void jupiter (){
    pushMatrix();
translate(width/2,height/2);  
angle = angle+0.005;
rotate(radians(angle));
noStroke();
fill(107,7,216);
ellipse(x-155,y+90,36,36);
stroke(255,255,255);
strokeWeight(2);
line(x-175,y+105,x-137,y+75);
popMatrix();
}


// DRAW SATURN+CIRCLE

void saturn (){
pushMatrix();
translate(width/2,height/2);  
angle = angle+0.0005;
rotate(radians(angle));

noStroke();
fill(252,242,125);
ellipse(x+80,y-195,45,45);
popMatrix();

//SATURN CIRCLE
pushMatrix();

rotate(-.25);
fill(87, 6, 140);
ellipse(x-273,y-568,80,12);
popMatrix();

}

// URANUS

void uranus (){
  pushMatrix();
translate(width/2,height/2);  
angle = angle+0.005;
rotate(radians(angle));
noStroke();
fill(15,255,221);
ellipse(x,y+240,45,45);
popMatrix();
}






//rotate planets
// void spin (){
  
//   pushMatrix();
// angle = angle+0.5;
// rotate(radians(angle));
// popMatrix();
// }
  


