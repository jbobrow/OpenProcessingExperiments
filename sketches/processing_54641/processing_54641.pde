
/**
 * Sinus Worlds by kof 2012
 */

color c;
float t,d,X,Y;
int x,y;

void setup(){
  size(320,240,P2D);
  frameRate(100);
  loadPixels();
}



void draw(){
  //theoretical center of universe
  X = width/2;
  Y = height/2;

  for(int i =0  ; i < pixels.length;i++){

    // let's define some variables to play with
    x = i%width;
    y =  (int)(i/(width+1.0));
    t  = atan2(y-Y,x-X);
    d  = dist(X,Y,x,y);

    //black magic block --v
    c = color(
        (( sin(
            t+frameCount*3.3 / sin(cos(frameCount / 300.11 + x / 700.0) * 1.437 + (frameCount + d) / 300.0)
            ) + 1.0
         )) * (127.0 - d * .76)

        );
    //black magic block --^

    set(x,y,c);
  }
}

