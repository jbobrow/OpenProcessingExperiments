
int d=80;
float xpos=random(d,width);
float ypos=random(d,height);
float xvel=random(8);
float yvel=random(8);
PFont myfirstfont;
PFont mysecondfont;
int fontx=150;
int fonty=150;




void setup() {
  size(500,500);
  background(255);
  myfirstfont=loadFont("AppleCasual.vlw");
  mysecondfont=loadFont("Bauhaus.vlw");
 
  
}

void draw() {

  float cl1=random(0,255);
  float cl2=random(0,255);
  float cl3=random(0,255);
  background(255);

  xpos=xpos+xvel;
  ypos=ypos+yvel;
  
   
   if(mouseY<=250){
     textFont(myfirstfont);
     text("HI",width-fontx,height-fonty);}
     
   else{
    textFont(mysecondfont);
    text("HI",fontx,fonty);
    
   }

  
  

  
if (xpos>width-(d+10)/2) {
    xvel=-xvel;
    fill(cl1,cl2,cl3);
    yvel=yvel+5;
    println("east wall: change color");
   
  }

if (xpos<(d+10)/2) {
  xvel=-xvel;
  yvel=yvel-5;
  println("west wall: increase speed");

}

if (ypos>height-(d+10)/2) {
    yvel=-yvel;
    d=d-5;
    println("south wall: smaller size");
     
 
  }
if ( ypos<(d+10)/2) {
    yvel=-yvel;
    stroke(cl1,cl2,cl3);
    strokeWeight(10);
    println("north wall: stroke");
  
    
  }

  ellipse(xpos, ypos, d, d);
}


