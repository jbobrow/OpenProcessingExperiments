
/* @pjs font = "Raleway-Light.ttf"; *///Required for Javascript to load font


//  _______  __        ______   .______        ___       __      
// /  _____||  |      /  __  \  |   _  \      /   \     |  |     
//|  |  __  |  |     |  |  |  | |  |_)  |    /  ^  \    |  |     
//|  | |_ | |  |     |  |  |  | |   _  <    /  /_\  \   |  |     
//|  |__| | |  `----.|  `--'  | |  |_)  |  /  _____  \  |  `----.
// \______| |_______| \______/  |______/  /__/     \__\ |_______|
//

PFont rh;          //For loading font
int x = 300;      //Rose's Code

//All Arrays go by: [Acres in Water Shed],[ % of Watershed Acres], [Subwatershed population], [Response rate].
var SC = new Array(12010, 9.3, 17527, 42.3, 1000, 25.8/100);        //Silver Creek
var NS = new Array(6600, 5.1, 472, 1.1, 400, 17.8/100);             //Nippersink
var LNS = new Array(12432, 9.6, 6620, 16.0, 500, 30.8/100);          //Lower Nippersink
var WL = new Array(7884, 6.1, 6800, 16.4, 600, 20.3/100);            //Wonderlake
var multi = new Array(SC, NS, LNS, WL);                              //Creating a compilation of all arrays to create a multidimensional array


//     _______. _______ .___________. __    __  .______   
//    /       ||   ____||           ||  |  |  | |   _  \  
//   |   (----`|  |__   `---|  |----`|  |  |  | |  |_)  | 
//    \   \    |   __|      |  |     |  |  |  | |   ___/  
//.----)   |   |  |____     |  |     |  `--'  | |  |      
//|_______/    |_______|    |__|      \______/  | _|      
//

void setup() {

  //setup for the the product on the page
  frameRate(100);      //setting framerate to 100
  size(600, 400);        //canvas size 600 by 400
  rh = createFont("Raleway-Light.ttf", 240); //instantiating font
  rectLength = 0; //rectangle lenght = 0

    for (int i = 0; i<multi.length; i++) {                         //testing to print through control through the array //first level in array
    for (int j=0; j<multi[i].length; j++) {                     //seconds level in array 
      println("position "+i+" in "+j+": "+multi[i][j]);
    }
  }  
  //printing to console to test array by name
  /*
  println("SilverCreek: "+SC);
   println("Nippersink: "+NS);
   println("Lower Nippersink: "+LNS);
   println("Wonderlake: "+WL);
   */
}


// _______  .______          ___   ____    __    ____ 
//|       \ |   _  \        /   \  \   \  /  \  /   / 
//|  .--.  ||  |_)  |      /  ^  \  \   \/    \/   /  
//|  |  |  ||      /      /  /_\  \  \            /   
//|  '--'  ||  |\  \----./  _____  \  \    /\    /    
//|_______/ | _| `._____/__/     \__\  \__/  \__/   
//

void draw() {
  //  background(100);                  //setting background color
  //  textFont(rh, 200);                //loading font raleway heavy at size 200
  //  text("NipperSink", x, height/2);   //drawing text on canvas Nippersink
  //  x--;                              //moving text left on canvas
  //  if (x < -400) {                    //if text at limit
  //    x = 300;                        //x returns back to original position
  //  } 
  
  rectLength++;
  rect(0,0,rectLength,15);
  if (rectLength == width/2){
  }
}

