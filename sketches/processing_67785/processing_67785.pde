
/* serielle übung  -  linie / dreieck / viereck / kreis  -  holger lippmann 2012   www.e-art.co
 * LINE_1 (linie 1)
 * made with processing www.processing.org
 */

float r,sw;
float x=0,y=0;


float diax = 0; 
float diay = 135; // length of lines 
float diamx;
float diamy;
float abstand=50; // distance in between the lines



void setup() 
{
  size(1920, 1080); // full HD 
  background(255);  //#8e8e8e
  frameRate(30);
  diamx = diax;
  diamy = diay;
}

void draw() 
{
  translate(-14,0); //___________________________________________slight correction of stage position

  //_____________________________________________________________ random black&white
  r=random(100);
  if (r<50){
    sw=254;
  }
  else{
    sw=0;
  }


  //______________________________________________________________line width, uneven value array for symmetry    
  int[] myArray = {1,3,5,7,9,11}; 
  int w =  myArray[int(random(myArray.length))] ;

  strokeCap(SQUARE);

  //______________________________________________________________ white line for covering the previous one
  strokeWeight(13);
  stroke(255);
  line(x, y, x,diamy); 

  //______________________________________________________________ line
  strokeWeight(w);
  stroke(0);
  //stroke(random(250)+5); //______________________________________ random greyscale
  line(x, y, x,diamy);  



  x=x+abstand;
  if(x>width){
    x=0;
    y=y+diay;
    diamy=diamy+diay;
  }
  if (y>=height) { 
    diamy=diay;
    y=0;
  }
}



