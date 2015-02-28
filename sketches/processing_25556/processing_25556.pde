
size (500,500);
smooth();

ellipse (445,445,60,100);
translate (-100,0);
ellipse (445,445,60,100);

fill (0);
PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("ACaslonPro-Regular-48.vlw"); 
textFont(font, 32); 
text("Pick me!", 400, 50);


// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("ACaslonPro-Regular-48.vlw"); 
textFont(font, 60); 
text("No, me!", 300, 200);

                
                
