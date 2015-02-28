
//Web crawler return data
int p57[] = {21,1,1,2,1,1,5,2,607,2,5,2,5,1,1,5,1,1,3,12,41,1,362,1,2,54,1,1,1,20,1,1,29,1,1,4,1,1,1,1,1,1,14,2,1,1,1,1,1,18,2,1,1,1,1,1,1,1,1,1,10,1,1,1,2,14,68,1,1,1,3,1,1,1};
//Text string.  This would normally exist as an external file, 
//but it didn't want to upload correctly
String allText ="first it was lines in the sand the tangents intersections things that never met and you with your big stick calling it geometry then numbers counting one and two until a wind blew up and everything was gone blank to the horizon less than two for me but cunning you you found a whole new starting point let it have properties and power to make things infinite or nothing or simply hold a place";
//////////////////////////////////////////////////////////////////////////////////////////////////////////


String[] tokens;//Create a string to store all of the words in the file
float att = 0;//number of attempts made for each word
int w = 0;//string posiiton of current word
float accel = .00; //accelleration rate of growth
float grey = 0; //color of word
float inc = 0; //rate of change of word color
int x = 0; //x location of counter

void setup(){
  size(800, 400);
  smooth();
  
   //Load file and chop it up
   //String[] lines = loadStrings("zero.txt");
 //  String allText = join(lines, " ");
   println(allText);
   tokens = splitTokens(allText);  
  // println(tokens);
   background(255);
}

void draw(){

  //Define font
  fill(0);
  PFont font;
  font = createFont("Serif-48.vlw", 20,true); 
 
  //Show Count
  textFont(font,15);  
  text(int(att),x,30);
  
  //establish gradation rate
  inc = 20/p57[w];

  //this rectangle fades previous frames, increase alpha to fade faster
   noStroke();
   fill(255, 100);
   rect(0,0, width, height);
    
  //Begin making and counting attempts
  if(w<74){
  //look at first word in poem, have you found it?
  if(att<p57[w]){
  //display current word at attempt size as outline
  fill(grey);
  textFont(font,att+15);  
  text(tokens[w], 150, 350);
  att = att+accel;
  accel = accel+.02;
  grey = grey+inc;
  }else if(w<73){
  //if yes,show black
  grey=0;
  fill(grey);
  textFont(font,att+15);  
  text(tokens[w], 150, 350);
  //and move on to next word
    w=w+1;
    x = x+10;
    att=0;
    accel = 0; 
    //Show credits
  }else if (grey>0){
    fill(grey);
    text("Text:  Inventing Zero by Rebecca Elson", 30, 30);
    text("poem found, one word at a time on the internet", 30, 60);
    text("word growth determined by number of attempts to find each word", 30, 90);
    text("Molly Morin - www.molymorin.com", 30, 375);
    if(grey>0){
      grey = grey-1;
    }
  }
}
}



