
size(400,520);
 
PImage hide; //I'm declaring the photo...uh I think
hide= loadImage("hideandseek.jpg");//here is the photo
image(hide,CENTER,CENTER);


 
//PFont font;
//font =loadFont ("Zapfino-48.vlw");
//textFont(font);//i dont know what this step is it looks stupid
 
fill(206,130,234);
 
String s ="Hide and Seek";
text (s, 100,100,700,100);
 
//colorMode(HSB);
//for(int i=0; i<100;i++){
 // stroke(132,108,i*2);
 // point(1,100);
//stroke(5-100);

// Begin Pok-a-Dots
float eSize;

for (int sCount=0; sCount<100; sCount++) {
fill(random(0, 255), random(0, 255), random(0, 255), random(0, 125));
eSize = random(25, 100);
ellipse(random(0, 500), random(0, 700), eSize, eSize);
}
// End Pok-a-Dots
// Begin Text
PFont myTypeFace; // Initiating Typeface Variable
myTypeFace =loadFont ("Zapfino-48.vlw"); // Setting Typeface Variable
textFont(myTypeFace); // Selecting Typeface

fill(206, 130, 234);

String myTextString ="Hide and Seek";
text (myTextString, 100, 100, 700, 100);
smooth();
// End Text

