
import processing.pdf.*;

PFont font, font2;
boolean looop = false; 
PImage[] images;
int position = 0;
String rand = "";
boolean record = false;
String prnt = "PRINT";
////////////////////////////
// DRAW Contants
///////////////////////////  


////////////////////////////
// STart Getting Count
////////////////////////////

//Get the VARS


////////////////////////////
// STart Setup
////////////////////////////

void setup() {
  XMLElement xml = new XMLElement(this, "entries.xml");
  int count = xml.getChildCount();//counts songs
  size(500, 400); 
  //   size(1280, 708); 
  background(255);
  colorMode(RGB, 255, 255, 255, 100);
  font = loadFont("DIN.vlw"); 
  font2 = loadFont("Georgia-48.vlw"); 
  frameRate(5);


  ///////////////////////
  //Load Images... just once
  ///////////////////////

  images = new PImage[100];

  for (int i= 1; i < count; i++) {
    int imgkey = i;
    images[imgkey] = loadImage(i + ".jpg");
  }//END FOR
} 



void draw() {   

  fill(255);
  rect(0,0,width,height);
  
  int rn = int(random(1, 100));

  ////////////////////////////
  // DRAW Contants
  ////////////////////////////


  int count = 80;
  int[] countarr;
  countarr = new int[80];
  for (int i= 0; i < count; i++) {
    countarr[i] = 0;
  }

  //Recording
  if (record) {
    //   background(255);
  } 

  if (!looop) {   

    ////////////////////////////
    // Load the Info
    ////////////////////////////   

    // Declare 2D array
    String[][] distances;
    distances = new String[width][height];

    for (int i= 0; i < count; i++)
    {
     
      int attCount = 5;
      for (int j = 0; j < attCount; j++)
      {
        String content = "";
        String name = "";
        distances[i][j] = content; 

      }//END 2nd FOR
    }//END FOR  

    ////////////////////////////
    // DRAW EVERYTHING
    ////////////////////////////

    //Draw every instance
    //The Loop

    int displayedcount = 0;
    float xaxis = 0;
    float yaxis = 0;

    float yaxisPrev = 0;
    float xaxisPrev = 0;

    for (int i= 0; i < count; i++) {       
      generate_rand(i, countarr, count);  
      distances[i][6] = rand;
    }

    //Start Loop
    for (int i= 0; i < count; i++) {     

      yaxis = (i * (width/ (count * 2))) + 20;
      yaxis = height/2; 

      float multi1 = height; 
      float multi2 = 792 * 2;
      float multi =  multi1 /multi2; 
      multi = 0.5;

      //Get the difference in time

      // What was here before???

      xaxis = float(distances[i][6]) * (width/40 * multi) + 20;

      //Draw a line to the previous one
      if (i > 0) {
        strokeWeight(0.5);
        //Turn this into a curve
        //  line(xaxis, yaxis, xaxisPrev, yaxisPrev);   

        //Begin Curve (This is currently disabled)
        strokeWeight(0.5);
        beginShape();
        noFill();
        curveVertex(xaxis, abs(yaxis + (abs(xaxisPrev - xaxis) * 2)));  
        curveVertex(xaxis, yaxis);  
        curveVertex(xaxisPrev, yaxisPrev);  
        curveVertex(xaxisPrev, -abs(yaxisPrev + (abs(xaxisPrev - xaxis) * 2)));  
        endShape();

        strokeWeight(0.5);
        stroke(200, 200, 200, 20);
        //line(xaxis, yaxis, xaxis, 0); //(Currently Disabled)
      }

      //Draw Point and display Text
      stroke(0, 0, 0, 20);
      strokeWeight(0.5);
      fill(0);
      point(xaxis, yaxis) ;
      
      //Setup some sizes
      float Ximgstart = xaxis + 20;
      float Yimgstart = yaxis + 80;

      float Ximgsize = height/2.5;

      //Dispaly Text
      textFont(font, 6);
      fill(150);
      text("#" + i + " / " + distances[i][1], xaxis + 5, yaxis, Ximgsize, 200);
      fill(0);
      text(distances[i][2], xaxis + 5, yaxis + 25, Ximgsize, 200);


      //Display Image

      int imgI = i; 
      
        if (images[imgI] != null) {
          float Yimgsize = Ximgsize * (float(images[imgI].height)/float(images[imgI].width));         
          //float Yimgsize = 600;

          //println(float(images[i].height) + " / " + float(images[i].width));
          image(images[imgI], Ximgstart, Yimgstart, Ximgsize, Yimgsize);
          
          println(i + " / " + imgI);
        }



      yaxisPrev = yaxis; 
      xaxisPrev = xaxis;
    }
  }
  else {

    //What Happens if the Loop isnt Playing?
  }


}

void generate_rand(int index, int countarr[], int count) {

  position = int(random(0, count));
  if (countarr[position] == 0) {
    //Set up the RAND string
    rand = position + "";

    //Remove this Y Position from Posibilities
    countarr[position] = 1;
  }
  else {
    //Generate a Posibility
    generate_rand(index, countarr, count);
  }
}

void keyPressed() {

  if (key == ' ') {
    record = true;
    draw();
  }
}

void mousePressed(){
 noLoop(); 
}





