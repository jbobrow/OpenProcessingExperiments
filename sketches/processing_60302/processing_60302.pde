
float y = random(200);
float x = random(300);
 
float vel = 1;
float acel = 0.6;

PFont font;

PImage picture;

void setup()
{
      size(600,400,P3D);
      background(255);
      frameRate(10);
      smooth();
      noStroke();
     // ellipseMode(CENTER);
}
 
void draw(){
 
   
   picture = loadImage ("fatsmile.jpg");
   image(picture, 0,0);
   tint(150,50,150,10);
   
   //for(int i=0 ; i<5000 ; i++){
   fill(255,255,255);
   font =loadFont("Zenda-48.vlw");
   textFont(font, 48);
   text("Nice Big Fat Smile", y,x);
   
    float radio = random (30,100);
    float mycolor = random (100,200);
    fill(100,0.5);
   // rect(0,0,width, height); // "refresh"
     
    fill(190,85,10);
    //ellipse(x,y,radio,radio);
    vel += acel;
    if (vel > 6){
      vel = vel-2*acel;
    }
    
    
      
    if ((y >= height) || (x >= width) ){
      x = x-20*radio;
      y = y-20*radio;
    }
    if ((y <= 0 ) || (x <= 0 )){
      x = -x+20*radio;
      y = -y+20*radio;
    }
    if ((y <= 0 ) && (x >= width)){
      x = x-20*radio;
      y = -y+20*radio;
    }
    if ((x <= 0 ) && (y >= height)){
      x = -x+20*radio;
      y = y-20*radio;
    }
     
    else{
      y+=random(-60*vel,60*vel);
      x+=random(-60*vel,60*vel);
    }
    //saveFrame("video_"+ nf(i,3) +".jpg");
  //}
   
}


