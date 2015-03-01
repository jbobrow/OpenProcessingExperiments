


/*Declare six PImage variable types*/

PImage forest;
PImage neptune;
PImage peak;
PImage sand;
PImage sculpture;
PImage street;

/*Declare some variables which we'll need*/

int x=100; //Position of the number of each picture
int c=0; //Counter

/*Load six images from HDD*/

void setup () {
  size (1000, 700);  
  background(#5DF2E7);
  forest = loadImage("Forest.jpg");
  neptune = loadImage("Neptune.jpg");
  peak = loadImage("Peak.jpg");
  sand = loadImage("Sand.jpg");
  sculpture = loadImage("Sculpture.jpg");
  street = loadImage("Street.jpg");
}


void draw () {
  
  /*Write the text*/

  PFont tahoma = loadFont("tahoma.vlw");
  textFont(tahoma);
  fill(#000000);
  textSize(20);
  textAlign(CENTER);
  text("Gran Canaria has a lot of interesting sights.\n Type the number of any of these pictures to see them enlarged.", width/2, 25);

  /*Draw the miniatures of the images to the screen*/

  image(forest, 100, 60, 77, 58);
  image(neptune, 250, 60, 77, 58);
  image(peak, 400, 60, 77, 58);
  image(sand, 550, 60, 77, 58);
  image(sculpture, 700, 60, 77, 58);
  image(street, 850, 60, 77, 58);
  
   /*Write the number of each image*/
        while (c < 6) {
         c++;
         text(c, x+39, 135);
         x=x+150;
        } 
  
}
 void keyReleased() {

  /*Set the font*/
   
  PFont tahoma = loadFont("tahoma.vlw");
  textFont(tahoma);
  fill(#000000);
  textSize(20);
  textAlign(LEFT);
  
  /*Allow screenshots*/
   
  if (key=='s' || key=='S') saveFrame("screenshot.png"); 
  
  /*Delete the picture*/
   
  if (key == DELETE || key == BACKSPACE) {
    background(#5DF2E7);
    
    /*Rewrite the numbers whenever we delete something*/
    
    x=100;
    c=0;
           while (c < 6) {
            c++;
            text(c, x+39, 135);
            x=x+150;
          }  
  }
 
  /*What the program writes and shows whenever a choice is made*/
 
  switch(key){
      case '1':
        background(#5DF2E7);
        image(forest, 500, 150, 406, 539);
        text("A pine forest, near the summit of the island.\n\n\n\n\nPress SUPR or Backspace to erase.\nPress 'S' to take a screenshot.\nPress another number to see other pictures.", 100, 400);
      break;
      case '2':
        background(#5DF2E7);
        image(neptune,  500, 250, 462, 348);
        text("A sand statue of a mermaid and Neptune,\nGod of the Sea, at Playa de las Canteras.\n\n\n\nPress SUPR or Backspace to erase.\nPress 'S' to take a screenshot.\nPress another number to see other pictures.", 100, 400);
      break;
      case '3':
        background(#5DF2E7);
        image(peak,  500, 250, 462, 348);
        text("The summit of the island. \n\n\n\n\nPress SUPR or Backspace to erase.\nPress 'S' to take a screenshot.\nPress another number to see other pictures.", 100, 400);
      break;
      case '4':
        background(#5DF2E7);
        image(sand, 500, 250, 462, 348);
        text("The Maspalomas sand dunes,\n in the southern part of the island.\n\n\n\nPress SUPR or Backspace to erase.\nPress 'S' to take a screenshot.\nPress another number to see other pictures.", 100, 400);
      break;
      case '5':
        background(#5DF2E7);
        image(sculpture, 500, 150, 406, 539);
        text("A mobile sculpture,\nnear Playa de las Canteras.\n\n\n\nPress SUPR or Backspace to erase.\nPress 'S' to take a screenshot.\nPress another number to see other pictures.", 100, 400);
      break;
      case '6':
        background(#5DF2E7);
        image(street, 500, 150, 406, 539);
        text("A small town, on a Saturday afternoon.\n\n\n\n\nPress SUPR or Backspace to erase.\nPress 'S' to take a screenshot.\nPress another number to see other pictures.", 100, 400);
      break;       
       }  
        /*Rewrites the numbers*/
        x=100; //Position of the numbers
        c=0; //Counter


        while (c < 6) {
         c++;
         text(c, x+39, 135);
         x=x+150;
         } 
         
 
}



