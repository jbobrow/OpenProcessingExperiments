
/*@pjs font = "The Amazing Spider-Man.ttf";*/
int myState = 0;
PImage myImage;
PFont myFont;
String a="WHO AM I?";
String b="ARE YOU SURE YOU WANT TO KNOW?";
String c="IF SOMEONE TOLD YOU I WAS JUST YOUR AVERAGE ORDINARY GUY WITHOUT A CARE IN THE WORLD, SOMEBODY LIED . . .";
String d="THE TRUTH IS IT WASN'T ALWAYS LIKE THIS.";
String e="THERE WAS A TIME WHEN LIFE WAS A LOT LESS COMPLICATED.";
 
 
void setup (){
  size(1000,666);
  myImage = loadImage("spider.jpg");
  myFont = createFont("The Amazing Spider-Man.ttf", 200);
}
 
 void draw (){
  background(0);
   
  switch(myState){
    case 0:
    textAlign(LEFT);
    textFont(myFont, 65);
    fill(#A20522);
    image(myImage, 0, 0, width, height);
    text(a, 45, 45, 300, 400);
    break;
     
    case 1:
    textAlign(LEFT);
    textFont(myFont, 55);
    fill(#A20522);
    image(myImage, 0, 0, width, height);
   text(b, 45, 45, 500, 400);
    break;
     
    case 2:
    textAlign(LEFT);
    textFont(myFont, 40);
    fill(#A20522);
      image(myImage, 0, 0, width, height);
    text(c, 45, 45, 500, 400);
    break;
     
    case 3:
    textAlign(LEFT);
    textFont(myFont, 45);
    fill(#A20522);
     image(myImage, 0, 0, width, height);
    text(d, 45, 45, 500, 400);
    break;
     
    case 4:
    textAlign(LEFT);
    textFont(myFont, 45);
    fill(#A20522);
     image(myImage, 0, 0, width, height);
    text(e, 45, 45, 500, 400);
    break;
     
  }
}
void mousePressed() {
 myState ++ ;
if (myState > 5) {
 myState = 0 ;
}
}



