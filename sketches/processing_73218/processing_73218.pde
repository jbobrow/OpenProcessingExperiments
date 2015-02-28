

/*Family Tree sketch by Summer Johnston about the Bush Family
I will show the lineage from my grandparents through my nieces. I might go above my grandparents as well?
*/

//Here, load images of each member of my family
//also a blue sky background
//or, baroque frames would be cooler than tree imagery

int whichScreen;
//whichScreen will make me able to go from the home screen with title to the actual family tree

PFont font;

PImage pat;
PImage spud;
PImage patti;
PImage mike;
PImage taylor;
PImage jean;
PImage lane;
PImage lee;
PImage aj;
PImage allie;
PImage callie;
PImage james;
PImage josh;
PImage summer;
PImage brentice;
PImage mattie;
PImage sm;
PImage kay;
PImage taytay;
PImage addison;
PImage eisley;
PImage willow;

//boolean isShowing will be to do true/false for each image. On a click, the next one shows. I think this will work(?)
boolean isShowing;

int generation;

void setup(){
  size(1400, 900);
  
  whichScreen = 0;
 hint(ENABLE_NATIVE_FONTS);
 
 generation = 0;
    
}
//can change the frame rate so people pop up slowly
//also can make eyes move around in the frame which would be cute/funny like a haunted house
//can make a patterned background for effect?
void draw(){ 
 //striped background, I can easily change how many stripes, how thick, etc 
  
  //title screen
  if (whichScreen == 0){
     font = loadFont("LucidaCalligraphy-Italic-48.vlw");
     fill(0);
   
   for(int i=0; i<80; i++) {
    rect(i*20, 0, 10, 900);
  }
  
    fill(#F9FAE1);
    stroke(0);
    rect(500, 200, 600, 300);
    rect(510, 210, 580, 280);
    stroke(0);
    fill(0);
    textFont(font, 16);
    smooth();
    text("The", 625, 270);
    textFont(font, 114);
    text("Bush", 625, 370);
    textFont(font, 42);
    text("Family Tree", 760, 440);
  }
  
//from here on in the draw loop will be the actual family tree stuff  
 if (whichScreen == 1){
   background(255);
   fill(#BFB88E);
   for(int i=0; i<80; i++) {
    rect(i*20, 0, 10, 900);
  }
  
  smooth();
  if (generation == 1){
  pat = loadImage("patframed.png");
  image(pat, 490, 0);
  spud = loadImage("papaframed.png");
  image(spud, 690, 0);
 }
  if (generation == 2) {
    pat = loadImage("patframed.png");
  image(pat, 490, 0);
  spud = loadImage("papaframed.png");
  image(spud, 690, 0);
    patti = loadImage("pattiframed.png");
    image(patti, 245, 295);
    taylor = loadImage("taylorframed.png");
    image(taylor, 1030, 295);
    lane = loadImage("laneframed.png");
    image(lane, 690, 225);
  }
  
    if (generation ==3) {
       pat = loadImage("patframed.png");
  image(pat, 490, 0);
  spud = loadImage("papaframed.png");
  image(spud, 690, 0);
    patti = loadImage("pattiframed.png");
    image(patti, 245, 295);
    taylor = loadImage("taylorframed.png");
    image(taylor, 1030, 295);
    lane = loadImage("laneframed.png");
    image(lane, 690, 225);
    mike = loadImage("mjframed.png");
    image(mike, 90, 295);
    jean = loadImage("jeanframed.png");
    image(jean, 1175, 295);
    lee = loadImage("leeframed.png");
    image(lee, 560, 225);
    }
    
  if (generation ==4) {
  pat = loadImage("patframed.png");
  image(pat, 490, 0);
  spud = loadImage("papaframed.png");
  image(spud, 690, 0);
    patti = loadImage("pattiframed.png");
    image(patti, 245, 295);
    taylor = loadImage("taylorframed.png");
    image(taylor, 1030, 295);
    lane = loadImage("laneframed.png");
    image(lane, 690, 225);
    mike = loadImage("mjframed.png");
    image(mike, 90, 295);
    jean = loadImage("jeanframed.png");
    image(jean, 1175, 295);
    lee = loadImage("leeframed.png");
    image(lee, 560, 225);  
    josh = loadImage("joshframed.png");
    image(josh, 0, 510);
    summer = loadImage("summerframed.png");
    image(summer, 150, 510);
    aj = loadImage("ajframed.png");
    image(aj, 290, 510);
    sm = loadImage("sarahframed.png");
    image(sm, 490, 375);
    kay = loadImage("kayframed.png");
    image(kay, 620, 375);
    taytay = loadImage("taytayframed.png");
    image(taytay, 750, 375);
    callie = loadImage("callieframed.png");
    image(callie, 960, 510);
    brentice = loadImage("brenticeframed.png");
    image(brentice, 1110, 510);
    mattie = loadImage("mattieframed.png");
    image(mattie, 1255, 510);
  }
  
  if (generation ==5) {  
    pat = loadImage("patframed.png");
  image(pat, 490, 0);
  spud = loadImage("papaframed.png");
  image(spud, 690, 0);
    patti = loadImage("pattiframed.png");
    image(patti, 245, 295);
    taylor = loadImage("taylorframed.png");
    image(taylor, 1030, 295);
    lane = loadImage("laneframed.png");
    image(lane, 690, 225);
    mike = loadImage("mjframed.png");
    image(mike, 90, 295);
    jean = loadImage("jeanframed.png");
    image(jean, 1175, 295);
    lee = loadImage("leeframed.png");
    image(lee, 560, 225);  
    josh = loadImage("joshframed.png");
    image(josh, 0, 510);
    summer = loadImage("summerframed.png");
    image(summer, 150, 510);
    aj = loadImage("ajframed.png");
    image(aj, 290, 510);
    sm = loadImage("sarahframed.png");
    image(sm, 490, 375);
    kay = loadImage("kayframed.png");
    image(kay, 620, 375);
    taytay = loadImage("taytayframed.png");
    image(taytay, 750, 375);
    callie = loadImage("callieframed.png");
    image(callie, 960, 510);
    brentice = loadImage("brenticeframed.png");
    image(brentice, 1110, 510);
    mattie = loadImage("mattieframed.png");
    image(mattie, 1255, 510);
    allie = loadImage("allieframed.png");
    image(allie, 430, 510);
    james = loadImage("jamesframed.png");
    image(james, 820, 510);
  }
  
  if (generation ==6) {
    pat = loadImage("patframed.png");
  image(pat, 490, 0);
  spud = loadImage("papaframed.png");
  image(spud, 690, 0);
    patti = loadImage("pattiframed.png");
    image(patti, 245, 295);
    taylor = loadImage("taylorframed.png");
    image(taylor, 1030, 295);
    lane = loadImage("laneframed.png");
    image(lane, 690, 225);
    mike = loadImage("mjframed.png");
    image(mike, 90, 295);
    jean = loadImage("jeanframed.png");
    image(jean, 1175, 295);
    lee = loadImage("leeframed.png");
    image(lee, 560, 225);  
    josh = loadImage("joshframed.png");
    image(josh, 0, 510);
    summer = loadImage("summerframed.png");
    image(summer, 150, 510);
    aj = loadImage("ajframed.png");
    image(aj, 290, 510);
    sm = loadImage("sarahframed.png");
    image(sm, 490, 375);
    kay = loadImage("kayframed.png");
    image(kay, 620, 375);
    taytay = loadImage("taytayframed.png");
    image(taytay, 750, 375);
    callie = loadImage("callieframed.png");
    image(callie, 960, 510);
    brentice = loadImage("brenticeframed.png");
    image(brentice, 1110, 510);
    mattie = loadImage("mattieframed.png");
    image(mattie, 1255, 510);
    allie = loadImage("allieframed.png");
    image(allie, 430, 510);
    james = loadImage("jamesframed.png");
    image(james, 820, 510);
    willow = loadImage("willowframed.png");
    image(willow, 360, 660);
    addison = loadImage("addisonframed.png");
    image(addison, 745, 660);
    eisley = loadImage("eisleyframed.png");
    image(eisley, 885, 660);
  }
    
  }
 }
  
  
   
    
//}

void keyPressed() {
  
 if (key==RETURN) {
   whichScreen++;
   if (whichScreen > 1) {
     whichScreen = 0;
   }
 }
   
    if (key==ENTER) {
   whichScreen++;
   if (whichScreen > 1) {
     whichScreen = 0;
   }
    }
    
 if (keyCode == DOWN) {
  generation += 1;
 }

 if (keyCode == UP) {
  generation -= 1;
 } 
    
}


