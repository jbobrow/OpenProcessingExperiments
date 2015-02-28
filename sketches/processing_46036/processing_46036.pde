
/*
Method for masking an image drawn on the screen. An offscreen
image is created blended with the image on the display window.
*/

/******* underlying pattern *******/
// diagonal green pattern drawn in green on dispaly window.
smooth();
background(#A8FF9D);
stroke(#109000);
strokeWeight(2);
for (int i=0;i<20;i++) {
  line(i*5, 0, i*5+10, height);
}

/******* mask *******/
// offscreen PGraphics object created at size of window
PGraphics mask = createGraphics(100, 100, P2D);
// load font for mask
PFont f = loadFont("Serif-150.vlw");
// use dot syntax with PGraphics object: it works just like commands to
// the display window, but they must be surrounded by calls to
// beginDraw and endDraw. After that, you can display the result to 
// the display window using "image" function.
mask.beginDraw(); // begin
mask.background(255); //white background
mask.fill(0); // black fill
mask.textFont(f, 100); //select font
mask.textAlign(CENTER); 
mask.text("Q", 50, 75); //draw letter
mask.endDraw(); // end
// blend the mask with the image on the window
// the white will cover because it's the LIGHTEST
blend(mask,0,0,100,100,0,0,100,100,LIGHTEST);
//image(mask, 0, 0); // uncomment to display mask



