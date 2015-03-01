

// Introducing Processing at ProcessingCairo
// June 2014
// http://processingcairo.tumblr.com/

  


// 0. introduce run and stop

// 1. run with setup and draw empty 

//This is a comment

/* 
this
is
a block of
comments
*/

void setup(){  
  
// 2. let's make it bigger
size(700,500);

// 3. print something once 
// print("ay kalam");

// 9. what happens when you color the background here?
background(0);
  
}


void draw(){

 
// 7. give your background a color
//background(0);
  
// 4. print here and see it print forever
// print("ay kalam");

// 6. give your text a color
//fill(0,255,0);

// 12. let's play with the colors
fill(mouseX,0, mouseY);

// noFill();
// stroke(mouseX,0, mouseY);

// 5. write in window, we need a position here 
//text("ay 7aga", 400,300);
// you can also introduce int x = 400; int y = 300; text("Adef camp 2013", x,y);

// 8. make the text follow the mouse
//text("Follow me", mouseX, mouseY);
//text(tex[int(random(0,4))], mouseX, mouseY);
//text(tex[int(random(0,4))], mouseX+50, mouseY);

// 10. now we want to clear the drawing, so
 if (mousePressed){
  background(0);
 }


// 13. No outline
//noStroke();

// 11. now let's draw a rectangle
// we need x, y, width and height
// rect(mouseX, mouseY, 50, 50);


// 14. we can also try speed of mouse as input
//ellipse( mouseX, mouseY, 100, 100);
ellipse( mouseX, mouseY, pmouseX/5, pmouseY/5);
 
  
}

