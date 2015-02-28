
int r=1000;
float angle= -90;
PFont font;
int s;
int counter=300;
PImage film;



void setup() {

 
  size(800, 460);
  frameRate(60);
  film = requestImage("film.png");  //requestImage
  
}

void draw() {
  background(128,157,169);
  
  fill(random(150,181),random(159,167),random(143,173));
  rect(0,0,width,height);
 
     
  circle();
  if(angle==270 ){
  circle();
  angle=-90;
  }

//--------------------------two circles---------------------------  
  stroke(255);
  noFill();
  arc(width/2,height/2,300,300,radians(0),radians(360));
  arc(width/2,height/2,330,330,radians(0),radians(360));
  
//---------------------------timecounter---------------------------
  font = loadFont("AbadiMT.vlw");
  textSize(250);
  fill(0);
  timeCounter();
  text(s,width/2-85,height/2+90);
  
//---------------------------two lines-------------------------------  
  stroke(50);
  strokeWeight(1);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  
  
   filmDamage();

//---------------------------film image------------------------------  
  if (film.width == 0) {
    // Image is not yet loaded
  } else if (film.width == -1) {
    // This means an error occurred during image loading
  } else {
    // Image is ready to go, draw it
    image(film, 0, 0);
  }
  
// I found the function from processing.org  
// which loads image on a separate thread so that the sketch doesn't freeze while images load during setup.

  

  
}


void circle(){
  float deg = radians(angle);
  angle+=6;
  float x = cos(deg)*r+width/2;
  float y = sin(deg)*r+height/2;
  fill(255,255,255,50);
  arc(width/2,height/2,2*r,2*r,radians(-90),deg);
  
}

void timeCounter(){
     
         counter--;
     
     if(counter <= 300 && counter > 240 ){
       s=5;
     };
     if(counter <= 240 && counter >180 ){
       s=4;
     };
     if(counter <= 180 && counter >120){
       s=3;
     };
     if(counter <= 120 && counter >60){
       s=2;
     };
     if(counter <= 60 ){
       s=1;
     };
     
}


void filmDamage(){

     
     float lineX1=random(0,width);
     float lineY1=0;
     float lineX2=random(0,width);
     float lineY2=random(0,height);
     stroke(100);
     
     line(lineX1,lineY1,lineX1,lineY2);
     
     float lineX3=random(0,width);
     float lineY3=height;
     float lineX4=random(0,width);
     float lineY4=random(0,height);
     stroke(100);
     
     line(lineX3,lineY3,lineX3,lineY4);




}

