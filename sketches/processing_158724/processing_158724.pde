
/* @pjs font="sister.ttf, Highway.ttf"; preload="note.jpg" ; */

PImage note ;
PFont sister ;
PFont highway ;

size(405, 345) ;
note = loadImage("note.jpg") ;
image(note, 0, 0, 405, 345) ;
sister = createFont("sister.ttf", 30) ;
highway = createFont("Highway.ttf", 30) ;

textFont(sister, 30) ;

fill(#000000) ;
text("Come to", 27, 72) ;

fill(#000000) ;
text("Come to", 23, 68) ;

fill(#000000) ;
text("Come to", 27, 68) ;

fill(#000000) ;
text("Come to", 23, 72) ;

fill(#dddd00) ;
text("Come to", 25, 70) ;

fill(#000000) ;
text("the", 73, 112) ;

fill(#000000) ;
text("the", 69, 108) ;

fill(#000000) ;
text("the", 73, 108) ;

fill(#000000) ;
text("the", 69, 112) ;

fill(#dddd00) ;
text("the", 71, 110) ;

textFont(sister, 40) ;

fill(#000000) ;
text("circus!", 10, 153) ;

fill(#000000) ;
text("circus!", 14, 153) ;

fill(#000000) ;
text("circus!", 10, 157) ;

fill(#000000) ;
text("circus!", 14, 157) ;

fill(#dddd00) ;
text("circus!", 12, 155) ;

textFont(highway, 20) ;

fill(#000000) ;

text("featuring", 19, 296) ;

text("featuring", 21, 296) ;

text("featuring", 19, 298) ;

text("featuring", 21, 298) ;

fill(#ffffff) ;

text("featuring", 20, 297) ;

textFont(highway, 23) ;

fill(#000000) ;

text("One-Armed Dave", 19, 324) ;

text("One-Armed Dave", 21, 324) ;

text("One-Armed Dave", 19, 326) ;

text("One-Armed Dave", 21, 326) ;

fill(#ffffff) ;

text("One-Armed Dave", 20, 325) ;

noStroke() ;
fill(#dd0000) ;
ellipse(223, 115, 20, 20) ;

noStroke() ;
fill(#ff5555) ;
ellipse(225, 112, 7, 7) ;




