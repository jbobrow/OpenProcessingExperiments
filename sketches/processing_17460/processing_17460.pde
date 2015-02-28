
// carolyn schuetz
// art 497 algorithmic vcd
// lesson one project step 2
// due: 1/11/11


// Program draws an interactive Giraffe. Move the mouse around to change 
// the color of her spots. Click mouse to get her to stick her tongue out
// and release to get her to put her tongue back in her mouth.


// sets up the Avatar's window
void setup() { 
  size(200,200);              // set window size
  smooth();                   // set as smooth
  rectMode(CENTER);           // make the rectangle mode CENTER
  background(175,218,245);    // set background to light blue
  frameRate(60);              // sets frameRate to 60 frames per second
  
  // set scenery
  noStroke();
  fill(12,167,31);
  rect(width/2,height-35,width,70);
}

void draw() {
  
  // draw Giraffe's body + neck
  noStroke();
  fill(234,159,38);
  rect(width/2,height/2,30,100);
  rect((width/2)-30,(height/2)+35,80,30);
  
  // draw one ear to be behind head
  fill(152,114,8);
  triangle((width/2)+20,(height/2)-70,(width/2)+40,(height/2)-70,(width/2)+30,(height/2)-85);
  
  // draw Giraffe's head
  fill(234,159,38);
  ellipse((width/2)+20,(height/2)-50,80,50);
  ellipse((width/2)+50,(height/2)-35,35,25);
  // draw one ear to be in front of head
  fill(152,114,8);
  triangle((width/2)-5,(height/2)-65,(width/2)+15,(height/2)-65,(width/2)+5,(height/2)-80);
  
  // draw Giraffe's eyes
  fill(255,255,255);
  ellipse((width/2)+18,(height/2)-55,20,20);
  ellipse((width/2)+33,(height/2)-60,20,20);
  fill(0,0,0);
  ellipse((width/2)+18,(height/2)-50,10,10);
  ellipse((width/2)+33,(height/2)-55,10,10);
  
  // draw Giraffe's nostrils
  fill(152,114,8);
  ellipse((width/2)+50,(height/2)-27,10,5);
  ellipse((width/2)+60,(height/2)-35,5,10);
  
  // draw Giraffe's spots
  fill(200,mouseX,mouseY);
  ellipse((width/2)-60,(height/2)+30,16,16);
  ellipse((width/2)-20,(height/2)+30,16,16);  
  ellipse((width/2)-40,(height/2)+40,16,16);  
  ellipse((width/2),(height/2)+40,16,16); 
  ellipse((width/2)-7,(height/2),16,16); 
  ellipse((width/2)+6,(height/2)+20,16,16); 
  ellipse((width/2)+6,(height/2)-20,16,16); 

  //draw Giraffe's legs
  strokeWeight(5);
  stroke(131,87,15);
  line((width/2)-65,(height/2)+50,(width/2)-65,(height/2)+80);
  line((width/2)-55,(height/2)+50,(width/2)-55,(height/2)+70);
  line((width/2),(height/2)+50,(width/2),(height/2)+80);
  line((width/2)+10,(height/2)+50,(width/2)+10,(height/2)+70);

  // draw Giraffe's tail
  line((width/2)-70,(height/2)+20,(width/2)-80,(height/2)+40);
}

// when mouse is pressed, Giraffe sticks her tongue out
void mousePressed() {
  noStroke();
  fill(245,101,185);
  ellipse((width/2)+55,(height/2)-20,18,35);
}

// when mouse is released, Giraffe brings her tongue back in
void mouseReleased() {
  background(175,218,245);
  noStroke();
  fill(12,167,31);
  rect(width/2,height-35,width,70);
}

                
