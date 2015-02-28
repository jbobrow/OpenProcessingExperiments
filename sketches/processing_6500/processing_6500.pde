
// ----text editor ---------- //

PFont font;
String letters = "";
boolean drawtext = false;

//-----end------------------//


Circle[] circles = new Circle[100000];
Circle[] circlesTwo = new Circle[100000];


//counter
int count = 0;
int countTwo = 0;
int restartCounter = 0;
int restartMaximum = 10;
int endCounter = 0;
int endCounterMaximum = 75;


//image
PImage textImage;
float textColor;
color c;
int checkX, checkY;


//utilities
float f = 0;
int randomPoint = 0; 

int h = int ( screen.height*0.9);
int w = int ( screen.width*0.9);

float textsize = h*.5;


void setup() {

  size(w, h);
  smooth();

  font = loadFont("Arial-BoldMT-200.vlw");
  textFont(font, textsize);

  noStroke();
  circles[0] = new Circle();
  circles[0].inside();
  count++;  
}



void draw() {

  //write text and captur image
  if ( drawtext == false){

    background(255);
    stroke(0);
    strokeWeight (3);
    fill (0);
    float cursorposition = textWidth(letters)/2 + width/2;

    textAlign (CENTER, CENTER);
    //line(cursorposition , height/2 + textsize/2 , cursorposition , height/2 - textsize/2);
    text(letters, width/2, height/2);


    noStroke();
    strokeWeight (1);
    noFill ();
  }


  //run script
  if (drawtext == true){

    // draws circles (snakeMode)   
    if (restartCounter < restartMaximum && count < circles.length){
      randomPoint = 1;
      circles[count] = new Circle(circles[count-randomPoint]); //calls Class  
    }

    // if snake got stuck: chooses another circle in row to continue with
    else if (count < circles.length){ 
      f = random (1, count-1);
      randomPoint = int(f);
      circles[count] = new Circle(circles[count-randomPoint]);
    }

    // loop to check conditions
    for (int i=0; i<count; i++) {

      // don´t overlap
      float d = dist(circles[i].x, circles[i].y, circles[count].x, circles[count].y);
      if (d < circles[i].radius + circles[count].radius) {
        circles[count] = null; 
        break; // gets out of loop
      }


      // stay in frame
      float x_circle = circles[count].x ; 
      float y_circle = circles[count].y;
      float up = 100 + circles[count].radius;
      float down = (height-100) - circles[count].radius; 
      float right = (width-100) - circles[count].radius;
      float left = 100 + circles[count].radius;

      if ((x_circle < left) || (x_circle > right) || (y_circle < up) || (y_circle > down)) {
        circles[count] = null;
        break; 
      }

      // check color of Background
      checkX = int(circles[count].x);
      checkY = int(circles[count].y);   

      c = textImage.get(checkX, checkY);
    }


    // if circle fits conditions

    // circles above letters
    if (circles[count] != null && c == -16711423) {

      circles[count].inside(); 
      restartCounter = 0;
      count++;
    }  

    // circles next to letters
    else if (circles[count] != null && c != -16711423) {

      circles[count].outside(); 
      restartCounter = 0;
      count++;


      //curves
      if (count > 30) {

        for (int i=2; i<30; i++) {  

          stroke (255,30);
          strokeWeight(.5);
          f = random (count-5, count-2);
          randomPoint = int(f);    

          beginShape();
          curveVertex(circles[i].x, circles[i].y);
          curveVertex(circles[count-10].x, circles[count-10].y);
          curveVertex(circles[randomPoint].x+5, circles[randomPoint].y+5);
          curveVertex(circles[count-2].x-5, circles[count-2].y-5); 
          curveVertex(circles[count-1].x, circles[count-1].y);
          endShape();
        }
      }
    }

    else if (circles[count] == null){
      restartCounter++;
      endCounter ++;
    }

    // redraw circles
    if (endCounter == endCounterMaximum){

      for (int i = 0; i < count; i++) {

        checkX = int(circles[i].x);
        checkY = int(circles[i].y);   

        c = textImage.get(checkX, checkY);


        if (circles[i] != null && c == -16711423) {

          circles[i].redrawCircles();
          endCounter = 0;
        }
      }
    }
  }  
}


// save jpg
void mouseReleased() {
  saveFrame("filename-####.jpg");
}


void keyPressed (){

  if (drawtext == false){

    if( key == BACKSPACE){
      if ( letters.length() > 0) {
        letters = letters.substring (0, letters.length()-1);
      }
    }
    else if (textWidth(letters+key) < width*.9){
      letters = letters+key;
    }
  }
  
  
  if (key == ENTER){

    stroke(0);
    strokeWeight (3);

    float cursorposition = textWidth(letters)/2 + width/2;

    //line(cursorposition , height/2 + textsize/2 , cursorposition , height/2 - textsize/2);

    textImage = get(0, 0, width, height);
    background(0);
    drawtext = true;
  }

  else if (key == '`') {
    tint (255,255,255,50);
    image(textImage, 0, 0);
  }

}






























