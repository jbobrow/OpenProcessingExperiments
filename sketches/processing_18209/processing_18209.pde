
 size(320, 240);
 background(150);
 smooth();
 
 /*
 line(30, 20, 85, 20);   // no previous sroke set, so this is black
 stroke(126);            // set stroke to grey
 line(85, 20, 85, 75);   // line drawn as grey
 stroke(255);            // stroke set to white
 line(85, 75, 30, 75);   // line drawn in white
 line(30, 75, 180, 180); // line also drawn in white

point(100,100);
*/
 
 /* the processing enviornment is considered a "state machine", 
 meaning that properties do not change unless you explicitly change 
 them and those properties will stay what you set them until you change 
 them again. */
 
 
 strokeWeight(1);
 line(30, 20, 85, 20);   // stroke weight set to 1, no color set
 stroke(126);            // set stroke to grey
 strokeWeight(4);        // strokeWeight set to 4
 line(85, 20, 85, 75);   // 4 pixel wide line drawn as grey
 stroke(100, 10,10);            // stroke set to white
 strokeWeight(8);        // strokeWeight set to 8
 line(85, 75, 30, 75);   // 8 pixel wide line drawn in white
 strokeWeight(10);        // strokeWeight set to 8
 line(30, 75, 180, 180); // 10 pixel wide line also drawn in white
 
 
 // try setting the stoke command with RGB colors

