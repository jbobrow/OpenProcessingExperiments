
PImage wow;

void setup(){
  size(500,600);
  smooth();
  wow = loadImage("asdfdsf.png");
}
void draw(){
  image(wow,0,0,width,height);
  strokeWeight(12);
  fill (100);
  String[]data = loadStrings("earthquakes.txt");
  for(int i=1;i<data.length; i++){
    String[]pieces=split(data[i],",");
    float x=parseFloat(pieces[6]);
    float y=parseFloat(pieces[7]);
    rect(x+100,y+200,5,5);
      text(pieces[11],x+100,y+200);
  } fill(0);{
      text("I have no idea how to get farther than this??? or how to align it properly", 10, 400);
       // i tried to use the map excercize we did for two weeks ago and load the data from there???
     // and use tilemill, but i couldn't get it to line up so i just gave up 
      
    }
  
}

