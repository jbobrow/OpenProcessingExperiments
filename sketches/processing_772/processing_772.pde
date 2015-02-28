
String[] Un  = {
  "U","n","n","a","m","e","d"};
String[] Lab = {
  "L", "a", "b", "o", "r", "a", "t", "o", "r", "y"};
int Unkern;
int Labkern;
color OverRed = color(255,0,0,130);
int argyle;

void setup()  {
  size (526,265); //526 265

  textFont(loadFont ("Museo-700-78.vlw"));

  argyle = 0;
  
  frameRate(3);
  smooth();

}

void draw(){
  background(255);

translate(50,50);

  fill (0);

  text("Unnamed",40,90);
  text("Laboratory",40,168);

  int Unkern = 90;
  int Labkern = 168;

  if (argyle >= 0)  {

    if(argyle == 0)  {

      fill (OverRed);
      text(Un[0],40,Unkern);
    }

    if(argyle == 1)  {
    fill (OverRed);
    text(Un[1],98,Unkern);
    }
    
    if(argyle == 2)  {
    fill (OverRed);
    text(Un[2],148,Unkern);
    }
    
    if(argyle == 3)  {
    fill (OverRed);
    text(Un[3],198,Unkern);
    }
    
    if(argyle == 4)  {
    fill (OverRed);
    text(Un[4],242,Unkern);
    }
    
    if(argyle == 5)  {
    fill (OverRed);
    text(Un[5],316,Unkern);
    }
    
    if(argyle == 6)  {
    fill (OverRed);
    text(Un[6],359,Unkern);
    }
    
    if(argyle == 7)  {
    fill (OverRed);
    text(Lab[0],40,Labkern);
    }
    
    if(argyle == 8)  {
    fill (OverRed);
    text(Lab[1],84,Labkern);
    }
    
    if(argyle == 9)  {
    fill (OverRed);
    text(Lab[2],128,Labkern);
    }
    
    if(argyle == 10)  {
    fill (OverRed);
    text(Lab[3],176,Labkern);
    }
    
    if(argyle == 11)  {
    fill (OverRed);
    text(Lab[4],225,Labkern);
    }
    
    if(argyle == 12)  {
    fill (OverRed);
    text(Lab[5],257,Labkern);
    }
    
    if(argyle == 13){
    fill (OverRed);
    text(Lab[6],301,Labkern);
    }
    
    if(argyle == 14)  {
    fill (OverRed);
    text(Lab[7],330,Labkern);
    }
    
    if(argyle == 15)  {
    fill (OverRed);
    text(Lab[8],379,Labkern);
    }
    
    if(argyle == 16)  {
    fill (OverRed);
    text(Lab[9],411,Labkern);
    }
  argyle++;
  if (argyle >= 18)  {
    noLoop();
  }
  }
//  saveFrame("dream#.png");
}






