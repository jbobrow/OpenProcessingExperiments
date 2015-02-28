
/* serielle übung  -  linie / dreieck / viereck / kreis  -  holger lippmann 2012   www.e-art.co
 * LINE_1 (linie 1)
 * made with processing www.processing.org
 */


float rr,r,sw,ws;
PImage img;
float x=0,y=0;
float diax = 0; //137; //68.5
float diay = 120; //67.3; //135;
float diamx;
float diamy;
float abstand=10;
boolean onOff = true;       //color / blackwhite

String pictures[] = {
  "map2.jpg"};

void setup() 
{
  size(1920, 1080);  
  background(255);  //#8e8e8e
  frameRate(60);
  img = loadImage( pictures[int(random(pictures.length))] );
  img.resize(width, height);
  diamx = diax;
  diamy = diay;
}

void draw() 
{
  translate(-14,0);

  int x2 = int(random(img.width));
  int y2 = int(random(img.height));
  color pix = img.get(x2, y2);

  r=random(100);
  if (r<50){
    sw=254;
  }
  else{
    sw=0;
  }

  ////////////////////////////////////////////// SHUTTER
  //  fill(#8e8e8e,4);
  //  noStroke();
  //  rect(0,0,width,height);
  // fill(pix);


  int[] myArray = {
    1,3,5,7,9,11,13,15,17,19    }; //___________________________________ line width
  int w =  myArray[int(random(myArray.length))] ;

  strokeWeight(random(10));
  strokeCap(SQUARE);


  strokeWeight(21);
  stroke(255);
  line(x, y, x,diamy); 

  strokeWeight(w);

  if ( onOff )
  {
    stroke(random(250)+5);
  }
  else
  {
    stroke(pix);
  }



  line(x, y, x,diamy);  



  x=x+abstand;
  if(x>width){

    onOff = !onOff; // this switches it to the opposite state
    //println(onOff); // just to check...


    x=0;
    y=y+diay;
    diamy=diamy+diay;
    //translate(1,diamy);
  }
  if (y>=height) { 
    diamy=diay;
    y=0;
  }
} 



