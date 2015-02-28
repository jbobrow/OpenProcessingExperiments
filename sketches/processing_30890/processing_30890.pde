
// Natural Time / Roman Random, July 2011
// Analog clock code taken from:
// Clock by Charles Cave - 6th August 2010
// charles.cave@gmail.com

Reloj clock;
int M, H, S, secs, sex;  //sex is the altered time
boolean realTset=true;
int checkTframe=int(random(600));
int secFrame=60;    // frame at which a second is added
float speed=random(-10, 10);
void setup() {
  size(300, 300);
  smooth();
  clock = new Reloj();
}

void draw() {

  if (realTset==true) {
    H=hour();      //current time into H:M:S
    if (H>12) {
      H-=12;
    }
    M=minute();
    S=second();    
    // convert to seconds
    secs=S+M*60+H*3600;
    if (frameCount==1) {
      sex=secs;      //set the clock time to local time on first frame
    } 
    else if (sex>=secs)
    {
      speed=random(-15, 0);
      //print("fast!");
    }
    else
    {
      speed=random(0, 15);
      //print("slow!");
    }
  }

  clock.sec=sex;
  clock.display();

  if (frameCount==secFrame)
  {

    sex++;
    secFrame+=(2*60)-int(frameRate+speed);  // every 60 frames + framerate variation compensation + randomness
    //println(speed);
  }

  if (frameCount==checkTframe) {
    realTset=true;
    checkTframe+=random(600, 1200);
  }
  else {
    realTset=false;
  }
}


