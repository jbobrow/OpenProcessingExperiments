
/* A mini quiz where the user is asked to find what country is
shown in a random photo*/

//Global variables
PImage photo;
float r;
int h;
String i;
int n =1;

void setup () {
  size(1000,800);
  background (0);
  smooth();
  imageMode(CENTER);
  textSize(18);
  textAlign(CENTER); 
  //create random number, convert it to integer and add it to string
  r = random (1,9);
  h = int(r);
  i = h  + ".jpg";
  photo = loadImage(i);
 
  }

void draw (){
  //informationtext for user interaction
 text("What country is this?  Type the corresponding number", width/2, 30);
 text( "1",  width/2-350, 60);
 text("China,",width/2-300, 60);
 text( "2",  width/2-250, 60);
 text("Dubai,",width/2-200, 60);
 text( "3",  width/2-150, 60);
 text("Easter Isle,",width/2-80, 60);
 text( "4",  width/2-10, 60);
 text("Egypt,",width/2+40, 60);
 text( "5",  width/2+100, 60);
 text("France,",width/2+150, 60);
 text( "6",  width/2+200, 60);
 text("Greece,",width/2+250, 60);
 text( "7",  width/2+300, 60);
 text("Rio,",width/2+340, 60);
 text( "8",  width/2+380, 60);
 text("USA",width/2+420, 60);

//load the random photo
  image(photo, width/2, height/2, 600, 450);
}

//get input from the numbers the user types and give feedback
  
  void keyPressed () {
     background (0);
      redraw();
    
 if (h == 1 && key == '1' || h == 2 && key == '2' ||
   h == 3 && key == '3' || h == 4 && key == '4' || h == 5 && key == '5' 
   || h == 6 && key == '6' || h == 7 && key == '7' || h == 8 && key == '8' ) {
     text( "Correct! Refresh browser to try again!", width/2, 100);
    
  } else {
       text ("Wrong guess. Try again!", width/2, 100);
 
  }
 

    
    
  }
  
  



