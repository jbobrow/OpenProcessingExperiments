
/* Final Project- Introduction to Computational Arts: Processing.
By: Yoshuam Bajos

-Stamping over Landscapes-
This sketch takes two beautiful landscapes and lets you stamp
clouds, trees, flowers, etc, on the canvas.

I feel the playfulness of placing an animated object into the 
photograph of a vast space lets you explore every nook and cranny 
you can find in the image, thus deepening your connection to it.

The "stickers" you can use are exclusive to each landscape.
If you choose to work with the snowy landscape, you will be able 
to paste snowmen, icy flowers, falling snow and snow mounds.
If you choose to use the sunny countryside, you will be able to 
paste clouds, trees and flowers.

*Controls:
*First choose a landscape:
  *Press"1" for sunny countryside
  *Press"2" for snowy field
  
  *For Sunny Countryside
    *Click the mouse on the sky for clouds and on the land for trees
    *Press "f" or "F" for flowers to be placed on mouse position
    
  *For Snowy Field
    *Click the mouse on the sky for falling snow
    *Click mouse on land for snow mounds
    *Press "f" or "F" for icy flowers to be placed on mouse position
    *Press "m" or "M" for a snowman
   
*To save a screenshot of your work press "s" or "S"
*To clear the screen press the "DELETE" or "BACKSPACE" key
  or press "1" or "2" to choose a landscape again. 
  
*/

//Global Variables
//Background Images
PImage scene1;
PImage scene2;

//Variable to determine which scene is displayed
int currentscene;

//Colors to be used in scene 1
color[] trees = {#0F8B2D, #043610, #00FF32, #27FF00, #BBC61E};
color[] trunk = {#E88E1A, #FFA510, #99630A};
color[] cloud = {#FFFFFF, #FFFCE5, #F5F1DB};
color[] flower = {#F5DD0B, #E81910, #B005FF, #134AF5};

//Colors to be used in scene 2
color[]ice = {#58AAF5, #59C0E8, #55E0FF, #60E8F5};
color snow = #FFFFFF;
color[]snowman = {#FA5D03, #000000};

//Setup 
void setup(){
size(1000,800);
scene1 = loadImage("scene1.jpg");
scene2 = loadImage("scene2.jpg");
background(#000000);
textAlign(CENTER);
textSize(20);
text("STAMPING OVER LANDSCAPES", 500,25);
text("By: Yoshuam", 500,75);
text("INSTRUCTIONS", 500, 150);
text("Choose landscape:", 500, 200);
text("Press '1' for Sunny Countryside", 500, 225);
text("Press '2' for Snowy Field", 500, 250);
text("On Sunny Countryside, click on the sky to add clouds",500, 350);
text("and on the ground to add Pine trees.", 500, 375);
text("Press 'f' to add a flower in the current position of the mouse.", 500, 400);
text("On Snowy Field, click on the sky to add falling snow,", 500, 450);
text("and on the ground to place snow mounds.",500, 475);
text("Press 'f' to add Icy flowers and 'm' to add Snowmen", 500, 500);
text("in the current position of the mouse.", 500, 525);
text("Press the DELETE or BACKSPACE key to erase canvas.",500,575);
text("You can also just reselect a landscape with '1' or '2' to clear canvas.", 500,600);
text("To save your image, press 's' or 'S'.",500,650);
text("Hope you enjoy it!", 500, 700);
}

void draw(){
  
}




void mouseClicked(){
  
//Assigning items to draw by clicking when in scene 1
  
  if(currentscene == 1){
    
  //Clouds when mouse clicked on sky
  
    if(mouseY<350){
      float d = random(20,60);
      noStroke();
      float r = random(3);
      fill(cloud[int(r)]);
      ellipse(mouseX, mouseY, d+d/4, d);
      ellipse(mouseX - d/2, mouseY, d -d/4, d -d/3);
      ellipse(mouseX + d/2, mouseY, d -d/4, d -d/3);
    }

  //Trees when mouse clicked on ground    
    
    if(mouseY>400){
      float th = random(mouseY/10, mouseY/8);
      float tw = random(mouseY/20, mouseY/15);
      float lc = random(5);
      noStroke();
      fill(trees[int(lc)]);
      triangle(mouseX, mouseY-th, mouseX+tw, mouseY, mouseX-tw, mouseY);
      float tc = random(3);     
      strokeWeight(mouseY/60);
      stroke (trunk[int(tc)]);
      line(mouseX,mouseY,mouseX, mouseY+mouseY/40);
    }
  }
  
//Assigning items to be drawn when on scene 2  
  if(currentscene == 2){
    
    //Snow if above ground
    if(mouseY<600){
      stroke(snow);
      strokeWeight(random(3,9));
      point(mouseX,mouseY);
    }
    if(mouseY>600){
      strokeWeight(0.5);
      stroke(snowman[1]);
      fill(snow);
      float sw = random(mouseY/30,mouseY/20);
      float sh = sw/2;
      arc(mouseX,mouseY,sw,sh,PI, TWO_PI);
    } 
      
}
}


//Choose Scene with '1' or '2'
void keyPressed(){
  
  if(key == '1') {
    image(scene1, 0, 0, 1000, 800);
    currentscene = 1;
  }
  if(key == '2') {
    image(scene2, 0, 0, 1000,800);
    currentscene = 2;
  }
 
//Keyboard items for Scene 1: Flowers 
 if(currentscene == 1){
   if(key == 'f' || key =='F'){
     float fc = random(4);
     strokeWeight(random(5,10));
     stroke(flower[int(fc)]);
     point(mouseX,mouseY);
   }
 }
 
//Keyboard items for scene 2: Flowers and Snowman 
 if(currentscene == 2){
   if(key == 'f' || key =='F'){
     float ic = random(4);
     strokeWeight(random(5,10));
     stroke(ice[int(ic)]);
     point(mouseX,mouseY);
   }
   
   //Drawing the snowman
   if(key == 'm' || key == 'M'){
     float sd = random(40,50);
     strokeWeight(1);
     stroke(snowman[1]);
     fill(snow);
     ellipse(mouseX,mouseY,sd,sd);
     ellipse(mouseX,mouseY-sd/2,(sd*2)/3,(sd*2)/3);
     ellipse(mouseX,mouseY-sd,sd/2, sd/2);
     strokeWeight(5);
     point(mouseX,mouseY);
     point(mouseX,mouseY-sd/2);
     point(mouseX+sd/7,mouseY-sd);
     point(mouseX-sd/7,mouseY-sd);
     fill(snowman[0]);
     stroke(snowman[0]);
     strokeWeight(1);
     triangle(mouseX+sd/15,mouseY-sd,mouseX-sd/15,mouseY-sd,mouseX,mouseY-sd/2);
   }
     
}
}


//Clear Canvas & Save
void keyReleased(){
  
  if(key == DELETE || key == BACKSPACE) {
    background(#000000);
    textAlign(CENTER);
    textSize(20);
    text("STAMPING OVER LANDSCAPES", 500,25);
    text("By: Yoshuam", 500,75);
    text("INSTRUCTIONS", 500, 150);
    text("Choose landscape:", 500, 200);
    text("Press '1' for Sunny Countryside", 500, 225);
    text("Press '2' for Snowy Field", 500, 250);
    text("On Sunny Countryside, click on the sky to add clouds",500, 350);
    text("and on the ground to add Pine trees.", 500, 375);
    text("Press 'f' to add a flower in the current position of the mouse.", 500, 400);
    text("On Snowy Field, click on the sky to add falling snow,", 500, 450);
    text("and on the ground to place snow mounds.",500, 475);
    text("Press 'f' to add Icy flowers and 'm' to add Snowmen", 500, 500);
    text("in the current position of the mouse.", 500, 525);
    text("Press the DELETE or BACKSPACE key to erase canvas.",500,575);
    text("You can also just reselect a landscape with '1' or '2' to clear canvas.", 500,600);
    text("To save your image, press 's' or 'S'.",500,650);
    text("Hope you enjoy it!", 500, 700);
  }

    
  if(currentscene == 1){
    if(key == 's' || key =='S') saveFrame("country.png");
  }
  if(currentscene == 2){
    if(key == 's' || key =='S') saveFrame("snowy.png");
  }
  
}

