
//Madeline Chan mchan1
//HW 10
//Copyright images Madeline Chan 2013 
//Put yourself in the shoes of a design student: 
//Move the dot to different times to see what activity is being done. 

float [ ] data = {9,12,3,6,8,10};
PImage [ ] pics;

String [ ] activity= {"Morning Coffee", "Bike to School", "Draw & Brainstorm", "Group Brainstorm", "Take Photos", "Implement Design!"};
String [ ] hour= {"9 AM", "12 PM", "3 PM", "6 PM", "8 PM", "10 PM"};
int [ ] time = {9,12,3,6,8,10};
int sliderX, sliderY, sliderWd, sliderHt;
int barX, barWd;
int index;


void setup( )
{
  size( 400, 400 );
  textSize(24);
  textAlign( CENTER, CENTER );
  imageMode( CENTER );
  noStroke( );
  sliderX = width/2;
  sliderY = int(height*.9 );
  sliderWd = int( width*.7 );
  sliderHt = int( height*.1 );

  barWd = int(sliderWd*.03 );
  barX = sliderX ;
  
  pics = new PImage [ 6 ];
  loadImages( );  

}

void draw( )
{
   background( 34,36,38 );
   checkSlider( );
   showSlider( );
   showData( );
   showImage( );
   textSize(15);
   text(activity[index], width*.5, height*.7, width*.5);
   textSize(12);
}


void showSlider( )
{
   fill( 34,36,38 ); //background bar
   rect( sliderX, sliderY, sliderWd, sliderHt);
   fill( 246, 205, 197 ); //sliding bar
   ellipse(barX, sliderY,  15, 15 );
}

void checkSlider( )
{
   if ( mouseY >= sliderY- sliderHt/2 && 
        mouseY <= sliderY+ sliderHt/2 &&
        mouseX >= sliderX- sliderWd/2 &&
        mouseX <= sliderX+ sliderWd/2 
       )  
      {
         barX = constrain(    mouseX, 
                              sliderX- sliderWd/2,
                              sliderX+ sliderWd/2 );
         index = constrain(
                              int( map( mouseX, sliderX- sliderWd/2,
                              sliderX+ sliderWd/2,
                              0, data.length) ),
                              0, data.length-1);
      } 
}

void showData( )
{
    textSize(12);
    fill( 215, 180, 175 );
    
    text("Time:" + hour[index], width*.5, height*.20);
    //text("Activity: ", width*.5, height*.2);
    
    text("9 AM", width*.14, height*.8);
    text("12 PM", width*.29, height*.8);
    text("3 PM", width*.43, height*.8);
    text("6 PM", width*.57, height*.8);
    text("8 PM", width*.7, height*.8);
    text("10 PM", width*.85, height*.8);
    textSize(20);
    text("A Day In Design School", width*.5, height*.1);
}

void showImage( )
{
   image( pics[index],  width*.5, height*.5, 200, 200);
}

void loadImages( )
{
  for( int i= 0; i < pics.length; i++)
  {
    String name = "a" + i + ".png";
    pics[i] = loadImage( name );
  }
}

void printStringToInts(String s) {
  for (int i=0; i<s.length(); i++) {
    print(int(s.charAt(i)) + ",");
  }
}



