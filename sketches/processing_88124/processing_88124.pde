
// Archer the Seal
// ITGM 315 Fundamentals of Programming for Artists
// Tian Chen
// Assignement 2 Part 3
// Part 2:  The creature is redrawn in 4 quadrants of the canvas.  Once the left mouse is pressed within the restricted quadrants,
// then the creature will follow the cursor around, but once the mouse is released, the creature
// will go back to the localx and localy of the quadrant.  Archer's horn will also change colors by left mouse press
// and the background will change colors according to the location of mouseX and mouseY.
// When the right mouse is clicked, Archer's spots will change to different colors.  When shift is pressed,
// Archer will blink. and when another key other than shift is pressed, Archer will open his eyes.

int localx = 400;
int localy = 435;

int jumpHeight=0;
int cageX;
int cageY;
Boolean jumpUp=true;


// New variables for colors on his body
color black = 0;
color white = 255;
color g1=80; color g2=100; color g3=120; color g4=160; 
color g5=185; color g6=120; color g7=140; color g8=150;
color g9=170; color g10=220; color g11=240;

// Variables for Archer's Spot colors
color s1=g1; color s2=g2;

// Variable for Archer's eyes that change color when shift is pressed
color eye1=black; color eye2=white;

// Variables for the Archer's Horn when mouse is not pressed
color h1=g6; color h2=g7; color h3=g8;
color h4=g9; color h5=g10; color h6=g11;

// Variables for Archer's Horn fill color when mouse is pressed
color r=color(255, 10, 0); color o=color(255, 140, 0); color y=color(255, 220, 0);
color g=color(100, 190, 0); color b=color(0, 0, 170); color p=color(150, 0, 255);


void setup() {
  size(800,800);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

// Archer is being called upon
void draw() {
  background(mouseX/2, 0, mouseY/2);
    for(cageX=0; cageX<width; cageX+=400){ 
      for(cageY=0; cageY<height; cageY+=400){
        noFill();
        noStroke();    
// Everytime the left mouse is pressed, the position of the creature will
// reposition itself onto the mouse cursor if it is in the range of the cage size per 4 boxes.
  if (mousePressed==true && mouseButton==LEFT && mouseX>=cageX && mouseX<=(cageX+400) && mouseY>=cageY && mouseY<=(cageY+400)){
//Rainbow colors
      h1 = r;
      h2 = o;
      h3 = y;
      h4 = g;
      h5 = b;
      h6 = p;
      noFill();
      rect(cageX, cageY, cageX+400, cageY+400);
      draw_creature(mouseX, mouseY+jumpHeight);
      if (cageX==0 && cageY==0){
        draw_creature(mouseX, mouseY+jumpHeight);
      }
      if (cageX==400 && cageY==400){
        draw_creature(mouseX, mouseY+jumpHeight);
      }
      if (cageX==400 && cageY==0){
        draw_creature(mouseX, mouseY+jumpHeight);
      }
      if (cageX==0 && cageY==400){
        draw_creature(mouseX, mouseY+jumpHeight);
      }
      // Jumping Boolean which states if the jump height is less than or equal to -50,
      // then Archer will move up 7 units.  If his jump height is greater than or equal to 50,
      // then he will move down 7 units.
      if (jumpHeight<=-50) { jumpUp=true; }
      if (jumpHeight>=50) { jumpUp=false; }
      if (jumpUp) {
        jumpHeight+=7;
      } else {
        jumpHeight-=7;
        h1=g6;
        h2=g7;
        h3=g8;
        h4=g9;
        h5=g10;
        h6=g11;
      }
    }
// there are 4 Archers being drawn.  Each archer is drawn according to their location from cageX and cageY.
// When Right mouse button is pressed, the spots on his body will change colors randomly.
else if (mousePressed==true && mouseButton==RIGHT && mouseX>=cageX && mouseX<=(cageX+400) && mouseY>=cageY && mouseY<=(cageY+400)){
    noFill();
    noStroke();
    rect(cageX, cageY, cageX+400, cageY+400);
    if (cageX==0 && cageY==0){
      s1=color (random(190), 0, random(190));
      s2=color (random(255), 0, random(255));
      draw_creature (cageX+180, cageY+290);
    }
    if (cageX==400 && cageY==400){
      s1=color (random(255), random(255), random(255));
      s2=color (random(255), random(255), random(255));
      draw_creature (cageX+180, cageY+290);
    }    
    if (cageX==400 && cageY==0){
      s1=color (random(255), 0, random(255));
      s2=color (random(255), 0, random(255));
      draw_creature (cageX+180, cageY+290);
    }    
     if (cageX==0 && cageY==400){
      s1=color (0, random(255), random(255));
      s2=color (0, random(255), random(255));
      draw_creature (cageX+180, cageY+290);
    } 
  } else {
    rect(cageX, cageY, cageX+400, cageY+400);
    if (cageX==0 && cageY==0){
      s1=g1;
      s2=g2;
      draw_creature (cageX+180, cageY+290);
    }
    if (cageX==400 && cageY==400){
      s1=g1;
      s2=g2;
      draw_creature (cageX+180, cageY+290);
    }    
    if (cageX==400 && cageY==0){
      s1=g1;
      s2=g2;
      draw_creature (cageX+180, cageY+290);
    }    
    if (cageX==0 && cageY==400){
      s1=g1;
      s2=g2;
      draw_creature (cageX+180, cageY+290);
   }
 }


// When shift is pressed, Archer will blink and if shift is held down, then a copy of one of one
// of the Archers will follow the mouse.  Archer will also shut his eyes, and then when any other
// key is pressed, Archer will open his eyes.
   if (keyPressed){
     if(keyCode==SHIFT){
       if(cageX==0 && cageY==0){
         eye1=(180);
         eye2=(180);
         draw_creature(cageX+180, cageY+290);
       }
       if(cageX==400 && cageY==400){
         eye1=(180);
         eye2=(180);
         draw_creature(cageX+180, cageY+290);
       }
       if(cageX==400 && cageY==0){
         eye1=(180);
         eye2=(180);
         draw_creature(cageX+180, cageY+290);
       }
       if(cageX==0 && cageY==400){
         eye1=(180);
         eye2=(180);
         draw_creature(cageX+180, cageY+290);
       }
     } else {
         eye2=white;
         eye1=black;
     }
   }
  }
 }
}


void draw_creature (int localx, int localy){
  
  ellipseMode(CENTER);
  rectMode(CENTER);
   
// Main Body Components  
// Right Arm
  noStroke();
  fill(g5);
  quad(localx+10 ,localy-100, localx+20, localy-35, localx+60, localy-105, localx+50, localy-125);
  triangle(localx+50, localy-125, localx+60, localy-105, localx+95, localy-135);

// Left Arm
  noStroke();
  fill(g5);
  quad(localx-95, localy+25, localx-80, localy+45, localx-20, localy-5, localx-50, localy-95);
  triangle(localx-95, localy+25, localx-80, localy+45, localx-127, localy+45);

// Legs
  noStroke();
  fill(g5);
  quad(localx+90, localy-25, localx+110, localy+10, localx+145, localy-10, localx+160, localy-55); // Right Legs
  fill(g2);
  quad(localx+120, localy-5, localx+80, localy+25, localx+160, localy+55, localx+145, localy+10); // Leg Legs

// Body
  noStroke();
  fill(g3);
  ellipse(localx+35, localy, 190, 100); // Lower Body
  ellipse(localx-20, localy-55, 110, 180); // Upper Body

//Body Spots
  noStroke();
  fill(s2);
  ellipse(localx-50, localy-55, 50, 50);
  fill(s2);
  ellipse(localx+10, localy-75, 20, 20);
  fill(s1);
  ellipse(localx-30, localy+15, 40, 40);
  fill(s1);
  ellipse(localx-15, localy-5, 20, 20);
  fill(s1);
  ellipse(localx+50, localy-30, 35, 35);
  ellipse(localx+80, localy-10, 15, 15);
  fill(s2);
  ellipse(localx+40, localy+25, 25, 25);

// Head
  noStroke();
  fill(g4);
  ellipse(localx-40, localy-155, 105, 105);

// Eyes
  stroke(eye1); 
  fill(eye1);
  ellipse(localx-60, localy-145, 25, 25); //Left Eye
  ellipse(localx-20, localy-152, 25, 25); //Right Eye

// Eye highlights
  stroke(eye2);
  fill(eye2);
  ellipse(localx-66, localy-152, 10, 10); //Left Large Reflection
  ellipse(localx-60, localy-145, 6, 6); //Left small Reflection
  ellipse(localx-26, localy-159, 10, 10); //Right Large Reflection
  ellipse(localx-20, localy-152, 6, 6); //Right small Reflection

// Cheeks
  stroke(g4);
  strokeWeight(2);
  fill(g10);
  ellipse(localx-60, localy-110, 55, 55);
  ellipse(localx-6, localy-120, 55, 55);

// Nose
  stroke(g1);
  strokeWeight(2);
  fill(g4);
  ellipse(localx-36, localy-125, 35, 35);

// Horn
  noStroke();
  fill(h1);
  ellipse(localx-50, localy-195, 25, 25); // Bottom part of horn
  fill(h2);
  ellipse(localx-53, localy-205, 20, 20);
  fill(h3);
  ellipse(localx-55, localy-215, 17, 17);
  fill(h4);
  ellipse(localx-57, localy-223, 15, 15);
  fill(h5);
  ellipse(localx-59, localy-230, 12, 12);
  fill(h6);
  ellipse(localx-61, localy-237, 10, 10); // Tip of horn

// Whiskers
  stroke(black);
  fill(black);
  line(localx-65, localy-120, localx-100, localy-115);
  line(localx-65, localy-110, localx-90, localy-100);
  line(localx-3, localy-130, localx+30, localy-138);
  line(localx, localy-120, localx+25, localy-120);

}


