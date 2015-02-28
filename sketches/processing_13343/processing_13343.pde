
float y = random(400);
float x = random(600);

float vel = 0;
float acel = 0.01;

void setup()
{
      size(600,400,P3D);
      background(0);
      frameRate(60);
      smooth();
      noStroke();
      ellipseMode(RADIUS);
}

void draw(){
 //for(int i=0 ; i<5000 ; i++){
    float radio = random (5,25);
    float mycolor = random (0,255);
    fill(0,0.5);
    rect(0,0,width, height); // "refresh"
    
    fill(0,215,255);
    ellipse(x,y,radio,radio);
    vel += acel;
    if (vel > 3){
      vel = vel-2*acel;
    }
     
    if ((y >= height) || (x >= width) ){
      x = x-2*radio;
      y = y-2*radio;
    }
    if ((y <= 0 ) || (x <= 0 )){
      x = -x+2*radio;
      y = -y+2*radio;
    }
    if ((y <= 0 ) && (x >= width)){
      x = x-2*radio;
      y = -y+2*radio;
    }
    if ((x <= 0 ) && (y >= height)){
      x = -x+2*radio;
      y = y-2*radio;
    }
    
    else{
      y+=random(-20*vel,20*vel);
      x+=random(-20*vel,20*vel);
    }
    //saveFrame("video_"+ nf(i,3) +".jpg");
  //}
  
}

