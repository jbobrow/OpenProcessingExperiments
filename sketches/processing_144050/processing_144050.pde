
float sw = 0.1;//Allows us to drag the mouse 
PImage baseIm;//Allows us to use and image.
PImage startpage;//
PImage baseIn;
color c; // variable for color
boolean check = true;// Checks whether true of false for startpage
boolean page = true;//checks for wheather true of false for page.
boolean nextlevel = false;
boolean yes = true;
boolean stop = true;
void setup(){
 size(1000,500);//Size of canvas
 baseIm=loadImage("maze1.png");//Image name.
 startpage=loadImage("startpage.jpg");//Image name
 baseIn=loadImage("maze2.png");
 //baseIt=loadImage("maze3.png");
  
 
}

//refer back to pixel colors determined by the position of the mouse so if the mouse is on a pixel that's out of bounds we bring back the player to level one
// help button will be at the start page.
//spacebar to restart game.
// don't really need the text when game is finished. keep it commented out. DONT DELETE.

void draw(){//Alows us to draw objects or call them. 
    
    if(check==true){//Allows the program to make decisions based on whether true of false. 
      loadPixels(); // loads the pixels.
      updatePixels(); // displays image.
      image(baseIm,0,0);
      c = pixels[mouseY*width + mouseX];    
    text( red(c)+""+green(c)+" "+blue(c), mouseX, mouseY); // text would show at (x,y)
    }
    if(page==true){//If true switch pages.
      image(startpage,0,0);//Calls startpage
    }
    if(red(c)== 0 && green(c)== 0 && blue(c)== 0 ){// goes back to startpage if the pixel color is blue
      yes =! yes;
      check = true;
    }
    if(c == color(0)){// goes back to startpage if the pixel color is black
      check = true;
    }
    if(nextlevel == true){
      image(baseIn,0,0);
    }
    //if(page==false){//If page false then dont switch pages. 
      //image(baseIm,0,0);//Calls game page.
     //if(check = false){
       //pixels = color(0);        
     //} 
    //}
           //if(yes != yes){
        //nextlevel=true;
      //}
}  


//void mousePressed(){
    //background(c); //changes to the color the pixel is on.
    //check=!check; // now check will not equal check/false.
//}

void keyPressed(){ //Allows us to press a key. 
  if (stop == true){
  if(key==CODED){//detects specific key presses. 
    if(keyCode==SHIFT){//Allows us to press the SHIFT key. 
      image(baseIm,0,0);// Calls the image. 
      page=!page;// Allows the switch of pages. 
      check =!check;
      stop =! stop; // stop the shift key from working throughout the game
      }
    }
  }
}



