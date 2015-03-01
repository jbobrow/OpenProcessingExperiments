
//Emma's final project: Recreating the memory tile game to be much more simplified and easily modifyable. 
//It can now more easily be changed to create different arrangements of color. 
//Thanks to Maddy Nakada and Paul Nakada for all their help! 


tile[] tile ; //the array of tiles 
int numberturned; // number of tiles turned but not matched

boolean mouseclicked = false; 
tile[] turnt; // sets up the turned over tiles 

//defining the colors 
color red = color(220, 30, 30);
color blue = color(30, 40, 200);
color green = color(30, 230, 80);
color pink = color(255, 20, 147);

color[] coll = {
  red, blue, green, pink
} 
;
//assigns colors 


void setup() {

  size(500, 380); 
  tile = new tile [8]; // the list of the 8 tiles 
  turnt = new tile[2]; // the list of the 2 tiles that are turned over (references the tile objects)
  numberturned = 0; //sets the amount turned over to 0

  place(); //sets them up
}

void mouseClicked() {
  // println("in mouse clicked 2");
  mouseclicked = true;

  for (int b = 0; b < 8; b++) {
    tile[b].mouseClicked(); // enables the mouseclicked function of the tile object
  }
}


void draw() {
  // if numberturned == 2 make everything white
  if (numberturned == 2 && mouseclicked) {
    if (turnt[0].vis == turnt[1].vis) {
      turnt[0].matched = true; //makes them matched/now can't be bothered
      turnt[1].matched = true;
      turnt[0].turnt = false; //they are no longer turned over
      turnt[1].turnt = false;
    }
    for (int b = 0; b < 8; b++) {
      if (tile[b].turnt && !tile[b].matched) { //if they don't match they turn white
          tile[b].white();
      }
      numberturned = 0; //reset to 0
    }
    
  }
  //this happens if the number turned over is not yet 2 
  for (int b = 0; b < 8; b++) {
    if (tile[b].clicked) {
      //turns the tiles over with color 
      tile[b].turn();
      turnt[numberturned] = tile[b];
      numberturned++;
//println ("numberturned " + numberturned);
      
    }
      tile[b].display(); //displays them 
    }
   mouseclicked = false; 
  }



void place() {
  //this function sets up the tiles in place
  int index = 0;
  int xx = 0;
  int yy = 0;
  color colr;   

  for (int i = 0; i <8; i ++) {

    //sets the locations for 2 rows and assigns colors, currently colors are just set to matcth with the tile below it 
    if (i < 4) {
      xx = 40 + 100*i; 
      yy = 40;
      colr = coll[i];
    }
   
    else {
       xx = 40 + 100*(i-4); 
      yy = 180;
      colr = coll[i - 4];
    }
      
      



    tile[index++]= new tile(xx, yy, colr); // actually creates the tiles in the array
  }
}




//a class for creating the tiles 
class tile {
  //these are all for positioning the tiles and setting them up with colors  
  int locx; 
  int locy; 
  int farx = locx + 70;
  int fary = locy + 100; 
  int rwidth;
  int rheight; 
  color col; 
  //these are different conditions the tiles can have 
  boolean turnt;
  boolean clicked;
  boolean matched;
  color vis; 
  

  tile(int x, int y, color colo ) {
    rwidth = 70; 
    rheight = 100;
    locx = x;
    locy = y; 
    farx = locx + 70;
    fary = locy + 100;
    col = colo;

    boolean clicked = false; //tile initially has not been clicked on
    boolean matched = false; //does not have a match 
    boolean turnt = false; // and is not turned over 
    white(); //tile starts white
  }

  void white() {
   //this function makes the tile white 
      vis = 255; 
      rect(locx, locy, rwidth, rheight);

  }
//this function displays the tile 
  void display() {
    fill(vis); //vis is what's visible -- usually either white or the assigned color 
    rect(locx, locy, rwidth, rheight);
  }


boolean mouseClicked() {
//tells if the mouse is clicked 
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary) {
    clicked = true; //if the tile has been clicked inside its bounds this is true 
    // if there are two already turned over, turn them white
    // flip this tile
    println("in mouse clicked");
  }

  return clicked;
}



void turn() {
  //this function turns the tile its color
  vis = col; 
 clicked = false; //after it is turned its no longer clicked on
 turnt = true; //but its turned over 
}
}

