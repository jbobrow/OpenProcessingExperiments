
float xpos,ypos;

float xspeed=1.8;
float yspeed=3;

int xdirection=1;
int ydirection=1;

void setup(){

//set canvase
  size (800,510);
  frameRate(30);  
  smooth();

  xpos=255;
  ypos=305;
}

void draw(){
  
  background (172,211,115);
  xpos=xpos+(xspeed*xdirection);
  ypos=ypos+(yspeed*ydirection);
  
  if (xpos>width-74.5|xpos<74.5){
    xdirection *=-1;
  }
  if (ypos>390|ypos<120){
    ydirection *=-1;
  }
  
 //shadow
 fill(120,ypos/4.5);
 ellipse(xpos,475,40000/(ypos+1),25);
 
  //elephant's legs
//rear legs
fill(100);
noStroke();
rect(xpos-30,ypos+20,20,40);
rect(xpos+15,ypos+20,20,40);
arc(xpos-20, ypos+50, 27.5, 30,PI/4, PI-PI/4);
arc(xpos+25, ypos+50, 27.5, 30,PI/4, PI-PI/4);
//forelegs
fill(120);
noStroke();
rect(xpos-40,ypos+30,20,40);
rect(xpos+22.5,ypos+30,20,40);
arc(xpos-30, ypos+60, 27.5, 30,PI/4, PI-PI/4);
arc(xpos+32.5, ypos+60, 27.5, 30,PI/4, PI-PI/4);


//main body lower circle shadow-bigger belly
fill(0);
noStroke();
ellipse(xpos+2.5,ypos,100,100);
//main body lower circle-bigger belly
fill(140);
noStroke();
ellipse(xpos,ypos,100,100);

//belly ellipse shadow
fill(0);
noStroke();
ellipse(xpos, ypos+10,50,80);
//belly ellipse
fill(200);
noStroke();
ellipse(xpos, ypos+5,50,80);

//horizontal upper ellipse shadow
fill(0);
noStroke();
ellipse(xpos+0.5,ypos-73,150,50);
//horizontal upper ellipse
fill(100);
noStroke();
ellipse(xpos,ypos-75,150,50);

//main body upper vertical ellipse shadow
fill(0);
noStroke();
ellipse(xpos+2.5,ypos-60,60,100);
//mail body upper vertical ellipse
fill(168);
noStroke();
ellipse(xpos,ypos-60,60,100);

//vertical upper ellipse shadow-nose
fill(0);
noStroke();
ellipse(xpos,ypos-45,20,120);
//vertical upper ellipse
fill(80);
noStroke();
ellipse(xpos,ypos-50,20,120);

//strike circle
stroke(0);
noFill();
strokeWeight(2.5);
ellipse(xpos,ypos-80,20,20);

//center bar
noStroke();
fill(125);
rect(xpos-3,ypos-120,5,150);
//bar shadow
fill(0);
quad(xpos+2,ypos-120,xpos+4.5,ypos-117.5,xpos+4.5,ypos+27.5,xpos+2,ypos+30);

}
