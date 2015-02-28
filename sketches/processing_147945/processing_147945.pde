
PImage overview;
float x=mouseX;
float y=mouseY;
PImage[] scienceArray=new PImage[4];
PImage[] olinArray=new PImage[4];
PImage[] jewettArray=new PImage[4];
PImage[] maxeyArray=new PImage[4];
PImage[] libraryArray=new PImage[9];
PImage[] theaterArray=new PImage[4];
PImage[] memorialArray=new PImage[4];
PImage[] cordinerArray=new PImage[4];
PImage[] reidArray=new PImage[4];
PImage[] tennisArray=new PImage[4];
int startSecond;
int stopSecond;
int dis_s;
int time;
boolean startcount=false;
void setup(){
  size(1200,900);
  scienceArray[0]= loadImage("Baveria.jpg");
  scienceArray[1]= loadImage("Calvin and Hobbes.jpg");
  scienceArray[2]= loadImage("night_sky Wallpaper.jpg");
  scienceArray[3]= loadImage("night_sky Wallpaper2.jpg");
  olinArray[0]= loadImage("Baveria.jpg");
  olinArray[1]= loadImage("night_sky Wallpaper.jpg");
  olinArray[2]= loadImage("Seattle waterfront.jpg");
  olinArray[3]= loadImage("night_sky Wallpaper2.jpg");
  jewettArray[0]= loadImage("Baveria.jpg");
  jewettArray[1]= loadImage("night_sky Wallpaper.jpg");
  jewettArray[2]= loadImage("Seattle waterfront.jpg");
  jewettArray[3]= loadImage("night_sky Wallpaper2.jpg");
  maxeyArray[0]= loadImage("Baveria.jpg");
  maxeyArray[1]= loadImage("night_sky Wallpaper.jpg");
  maxeyArray[2]= loadImage("Seattle waterfront.jpg");
  maxeyArray[3]= loadImage("night_sky Wallpaper2.jpg");
  libraryArray[0]= loadImage("LibraryCover.jpg");
  libraryArray[1]= loadImage("Library Statue.jpg");
  libraryArray[2]= loadImage("LibraryDisplay.jpg");
  libraryArray[3]= loadImage("CanoeLibrary.jpg");
  libraryArray[4]= loadImage("LibraryView.jpg");
  libraryArray[5]= loadImage("LibraryQuiet.jpg");
  libraryArray[6]= loadImage("LibraryBasement.jpg");
  libraryArray[7]= loadImage("LibraryPainting.jpg");
  theaterArray[0]= loadImage("Baveria.jpg");
  theaterArray[1]= loadImage("night_sky Wallpaper.jpg");
  theaterArray[2]= loadImage("Seattle waterfront.jpg");
  theaterArray[3]= loadImage("night_sky Wallpaper2.jpg");
  memorialArray[0]= loadImage("Baveria.jpg");
  memorialArray[1]= loadImage("night_sky Wallpaper.jpg");
  memorialArray[2]= loadImage("Seattle waterfront.jpg");
  memorialArray[3]= loadImage("night_sky Wallpaper2.jpg");
  cordinerArray[0]= loadImage("Baveria.jpg");
  cordinerArray[1]= loadImage("night_sky Wallpaper.jpg");
  cordinerArray[2]= loadImage("Seattle waterfront.jpg");
  cordinerArray[3]= loadImage("night_sky Wallpaper2.jpg");
  reidArray[0]= loadImage("Baveria.jpg");
  reidArray[1]= loadImage("night_sky Wallpaper.jpg");
  reidArray[2]= loadImage("Seattle waterfront.jpg");
  reidArray[3]= loadImage("night_sky Wallpaper2.jpg");
  tennisArray[0]= loadImage("Baveria.jpg");
  tennisArray[1]= loadImage("night_sky Wallpaper.jpg");
  tennisArray[2]= loadImage("Seattle waterfront.jpg");
  tennisArray[3]= loadImage("night_sky Wallpaper2.jpg");
  overview= loadImage("overview.jpg");
//  LibraryCover.resize(1200,900);
//  LibraryPainting.resize(1200,900);
//        LibraryDisplay.resize(1200,900);
//          LibraryBasement.resize(1200,900);
//            Library_Statue.resize(1200,900);
//              CanoeLibrary.resize(1200,900);
//                LibraryView.resize(1200,900);
  image(overview,0,0);
  overview.resize(1200,900);
  frameRate(30);
  background(overview);
}
void draw(){
  mousePressed();
  if (key==' ' && keyPressed==true){
  background(overview);}
}
void mousePressed(){
if (mousePressed){
  println(mouseX,mouseY);}
if (mouseX<=370 && mouseX>=525 && mouseY>=90 && mouseY<=200){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  science();}
if (mouseX>=579 && mouseX<=835 && mouseY>=8 && mouseY<=90){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  olin();}
if (mouseX>=875 && mouseX<=1010 && mouseY>=13 && mouseY<=65){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  jewett();}
if (mouseX>=785 && mouseX<=970 && mouseY>=321 && mouseY<=385){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  maxey();}
if (mouseX>=470 && mouseX<=570 && mouseY>=250 && mouseY<=345){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  library();}
if (mouseX>=275 && mouseX<=410 && mouseY>=250 && mouseY<=340){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  theater();}
if (mouseX>=470 && mouseX<=570 && mouseY>=425 && mouseY<=465){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  memorial();}
if (mouseX>=80 && mouseX<=230 && mouseY>=450 && mouseY<=530){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  cordiner();}
if (mouseX>=157 && mouseX<=267 && mouseY>=630 && mouseY<=715){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
  reid();}
if (mouseX>=625 && mouseX<=747 && mouseY>=305 && mouseY<=438){
  noStroke();
  fill(#1D84DB,5);
  rect(mouseX,mouseY,20,20);
    tennis();}
}
void science(){
   int x=0;
   int time=frameCount;
   println(time);
   if (time>=10 && time<=19){
      x=1;}
    else if (time>=20 && time<=29){
        x=2;}
    else if (time>=30 && time<=39){
          x=3;}
    else if (time>=40 && time<=49){
            x=0;}
    else if (time>50){
      background(overview);}
    image(scienceArray[x],0,0);}
void olin(){
      int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(olinArray[x],0,0);}
void jewett(){
  int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(jewettArray[x],0,0);}
void maxey(){
  int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(maxeyArray[x],0,0);}
void library(){
   if (mouseX>=470 && mouseX<=570 && mouseY>=250 && mouseY<=345){
        if (mousePressed){
           if (mouseX>=470 && mouseX<=570 && mouseY>=250 && mouseY<=345){
  int x=0;
  if (mousePressed=true){
 startcount=true;}
 calculate();
// startSecond=millis()/1000;
// if (startcount){
//   stopSecond=millis()/1000;
//   int diff= stopSecond-startSecond;
//     diff=time;}

   println(time);
 if (time>=10 && time<=19){
      x=1;}
    else if (time>=20 && time<=29){
        x=2;}
    else if (time>=30 && time<=39){
          x=3;}
    else if (time>=40 && time<=49){
            x=4;}
    else if (time>=50 && time<=59){
      x=5;}
      else if (time>=60 && time<=69){
        x=6;}
        else if (time>=70 && time<=79){
          x=7;}
          else if (time>80){
           image(overview,0,0);}
 image(libraryArray[x],0,0);}}}}
void theater(){
  int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(theaterArray[x],0,0);}   
void memorial(){
  int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(memorialArray[x],0,0);}
void cordiner(){
  int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(cordinerArray[x],0,0);}   
void reid(){
  int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(reidArray[x],0,0);}
void tennis(){
  int x;
    x=0;
    if (keyCode==LEFT){
      x=1;}
      else if (keyCode==RIGHT){
        x=2;}
        if (keyCode==UP){
          x=0;}
          if (keyCode==DOWN){
            x=3;}
    image(tennisArray[x],0,0);}   
void mouseReleased(){ 
 if (mouseX>=470 && mouseX<=570 && mouseY>=250 && mouseY<=345){
  int x=0;
  if (mousePressed=true){
 startcount=true;}
 calculate();
// startSecond=millis()/1000;
// if (startcount){
//   stopSecond=millis()/1000;
//   int diff= stopSecond-startSecond;
//     diff=time;}

   println(time);
 if (time>=10 && time<=19){
      x=1;}
    else if (time>=20 && time<=29){
        x=2;}
    else if (time>=30 && time<=39){
          x=3;}
    else if (time>=40 && time<=49){
            x=4;}
    else if (time>=50 && time<=59){
      x=5;}
      else if (time>=60 && time<=69){
        x=6;}
        else if (time>=70 && time<=79){
          x=7;}
          else if (time>80){
           image(overview,0,0);}
 image(libraryArray[x],0,0);}}
 void calculate(){
   if (startcount){
     stopSecond=second();
     int diff= stopSecond-startSecond;
      int time=diff;
   }}



