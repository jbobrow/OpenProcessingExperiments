
/* @pjs font = "Raleway-Light.ttf"; *///Required for Javascript to load font


//  _______  __        ______   .______        ___       __      
// /  _____||  |      /  __  \  |   _  \      /   \     |  |     
//|  |  __  |  |     |  |  |  | |  |_)  |    /  ^  \    |  |     
//|  | |_ | |  |     |  |  |  | |   _  <    /  /_\  \   |  |     
//|  |__| | |  `----.|  `--'  | |  |_)  |  /  _____  \  |  `----.
// \______| |_______| \______/  |______/  /__/     \__\ |_______|
//

PFont rh;          //For loading font
PImage img;

//     _______. _______ .___________. __    __  .______   
//    /       ||   ____||           ||  |  |  | |   _  \  
//   |   (----`|  |__   `---|  |----`|  |  |  | |  |_)  | 
//    \   \    |   __|      |  |     |  |  |  | |   ___/  
//.----)   |   |  |____     |  |     |  `--'  | |  |      
//|_______/    |_______|    |__|      \______/  | _|      
//

void setup() {

  //setup for the the product on the page
  frameRate(50);      //setting framerate to 100
  size(600, 400);        //canvas size 600 by 400
  rh = createFont("Raleway-Light.ttf", 240); //instantiating font
  img = loadImage("image.jpg");
  transparency = 0;
  acre = 38926;
  percentage = 30.1;
  population = 2500;
  result = 25.5;
  counter = 0;
  counter2 = 0;
  counter3 = 0;
  counter4 = 0;
}


// _______  .______          ___   ____    __    ____ 
//|       \ |   _  \        /   \  \   \  /  \  /   / 
//|  .--.  ||  |_)  |      /  ^  \  \   \/    \/   /  
//|  |  |  ||      /      /  /_\  \  \            /   
//|  '--'  ||  |\  \----./  _____  \  \    /\    /    
//|_______/ | _| `._____/__/     \__\  \__/  \__/   
//

void draw() {
  image(img,0,0);
  textFont(rh, 30);                //loading font raleway heavy at size 200
  fill(0,transparency);
  transparency+=2;
  counter++;
  counter2+=.5;
  counter3+=10;
  counter4++;
  
//  text("NipperSink has: "+counter+" thousand acres", 10, height/2);   //drawing text on canvas Nippersink
//  text("in watershed", 10, height*.6);
//  if (counter >= acre/1000){
//    counter = acre/1000-1;
//  }
  
//  text("Which makes it "+counter+"% water", 10, height/2);   //drawing text on canvas Nippersink
//  if (counter >= percentage ){
//    counter = percentage;
//  }
  
//  text("We've sampled "+counter3+" people", 10, height/2);   //drawing text on canvas Nippersink
//  if (counter3 >= population ){
//    counter3 = population-10;
//  }
 
//  text("Giving us a "+counter4+"% in response rate", 10, height/2);   //drawing text on canvas Nippersink
//  if (counter4 >= result){
//    counter4 = result;
//  }
}



