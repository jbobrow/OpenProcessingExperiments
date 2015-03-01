
int wingcount=0;
int flap=1;
float treex=-150;
float cloudx=-150;

void setup(){
  size(500,500);
  smooth();
}
void draw(){
background(0,209,234); //sky
fill(0,193,66);
noStroke();
rect(0,375,500,125); //grass
flap += 1; //increases the flap count every iteration
stroke(0);
strokeWeight(2);

//the program has two main sections: the "if wingcount<100" section,
//and the else section. at the beginning, wingcount=0. the program
//plays the <100 section (first section). every time you click, the
//bird's wings flap, and the wingcount increases. when you flap
//the wings enough, the wingcount goes over 100, and the "else"
//seciton plays. in that section, the bird is higher, and the tree
//and cloud start moving by.


if(wingcount<100){ //initial section: wings not flapped enough
  //body
  beginShape();
    fill(244,0,4);
    vertex(315,400); //tail corner
    vertex(310,420); //inside tail point
    vertex(300,390); //belly
    vertex(230,380); //breastbone
    vertex(200,330); //jaw
    vertex(150,320); //beak
    vertex(200,280); //crown
    vertex(235,340); //base of neck
    vertex(300,340); //butt
    vertex(330,420); //outside tail point
    vertex(315,400); //tail corner
  endShape();

  //eye
  fill(0);
  ellipse(190,305,10,10);

  //legs
  line(250,384,250,420);
  line(260,386,260,420);
  fill(247,220,5);
  triangle(260,420,250,426,262,426);
  triangle(250,420,240,426,252,426);
  
  if(mousePressed){ //the flapping. wings up
    fill(152,0,0);
    triangle(235,340,250,260,295,340);
    wingcount=wingcount+1; //increases wingcount
  } else {
    fill(152,0,0); //wings down
    arc(265,341,50,60,0,PI);
  }
  
  
  
  
  
  
} else { //second part of program: flying 
  //cloud
  cloudx += 0.3; //increases the cloud's x by 0.3 every iteration
  if(cloudx>650){ //resets cloud when it leaves the screen
    cloudx=-150;
  }
  stroke(255);
  fill(255);
  ellipse(cloudx-50,150,75,50);
  ellipse(cloudx,125,125,100);
  ellipse(cloudx+50,150,75,50);
  stroke(0);
  
  //tree
  treex += 1; //increases the tree's x by 0.3 every iteration
  if(treex>650){ //resets tree when it leaves the screen
    treex=-150;
  }
  fill(126,67,4);
  rect(treex,250,25,200);
  fill(75,126,4);
  ellipse(treex+12.5,200,200,200);
  

  
  translate(0,-150); //moves the bird up
  //body
  beginShape();
    fill(244,0,4);
    vertex(315,400); //tail corner
    vertex(310,420); //inside tail point
    vertex(300,390); //belly
    vertex(230,380); //breastbone
    vertex(200,330); //jaw
    vertex(150,320); //beak
    vertex(200,280); //crown
    vertex(235,340); //base of neck
    vertex(300,340); //butt
    vertex(330,420); //outside tail point
    vertex(315,400); //tail corner
  endShape();

  //eye
  fill(0);
  ellipse(190,305,10,10);
  
  //legs
  line(250,384,270,395);
  line(260,386,280,395);
  fill(247,220,5);
  triangle(280,395,270,401,282,401);
  triangle(270,395,260,401,272,401);
  
  //flaps the wings: if flap count is less than 5 mod 10, wing is up
  //the mod 5 part makes the flapping less vigorous
  if(flap%10<5){
    fill(152,0,0);
    triangle(235,340,250,260,295,340);
  } else {
    fill(152,0,0);
    triangle(235,340,250,422,295,340);
  }
  
}



}

