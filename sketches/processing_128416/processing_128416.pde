
import gifAnimation.*;

import ddf.minim.*;
Minim minim;
AudioSample sndButton;

int mouseTimer = 200;

boolean isOverImage = false;
boolean isOverFoyer = false;
boolean isOverComp = false;
boolean isOverDining = false;
boolean isOverPantry = false;
boolean isOverKitchen = false;
boolean isOverCon1 = false;
boolean isOverCon2 = false;
boolean isOverHygiene = false;

PImage room;

Gif loopingGif;

HScrollbar hs1;  

//These images below consist of our panoramas, header, footer, buttons, etc.

//Panorama Images have a p at the end

PImage foyerp, computerp, hygienep, pantryp, kitchenp, diningp, con1p, con2p, 
footer;

//Navigation buttons have a b at the end

PImage foyeroff, foyeron, diningoff, diningon, hygieneoff, hygieneon, 
kitchenoff, kitchenon, conrm1off, conrm1on, conrm2off, conrm2on, computeroff,
computeron, pantryoff, pantryon, curHeader, scrollIcon, scrollClickedIcon;

PImage foyerh, computerh, hygieneh, pantryh, kitchenh, diningh, con1h, con2h;

//Slider Image
PImage slider_image,slider_image_exp;



//This area simply sets up the dimensions of our sketch and the scroll-bar.
//Also where Processing will attempt to load our images we listed above.
void setup() {
  size(1024, 680);
  noStroke();
  frameRate(120);
  
  loopingGif = new Gif(this, "mouse_click_animation.gif");
  loopingGif.loop();
  
  hs1 = new HScrollbar(0, height-8, width, 16, 16);
  
// Load images
  pantryp = loadImage ("pantry.jpg");
  footer = loadImage ("footer.png");
  foyerp = loadImage ("foyer.jpg");
  foyeroff = loadImage("navbuttons/foyeroff.png");
  foyeron = loadImage ("navbuttons/foyeron.png");
  hygienep = loadImage ("hygiene.jpg");
  kitchenp = loadImage("kitchen.jpg");
  hygieneoff = loadImage ("navbuttons/hygieneoff.png");
  hygieneon = loadImage ("navbuttons/hygieneon.png");
  diningp = loadImage ("dining.jpg");
  diningoff = loadImage ("navbuttons/diningoff.png");
  diningon = loadImage ("navbuttons/diningon.png");
  kitchenoff = loadImage ("navbuttons/kitchenoff.png");
  kitchenon = loadImage ("navbuttons/kitchenon.png");
  kitchenp = loadImage ("kitchen.jpg");
  con1p = loadImage ("conference1.jpg");
  conrm1off = loadImage ("navbuttons/conrm1off.png");
  conrm1on = loadImage ("navbuttons/conrm1on.png");
  con2p = loadImage("conference2.jpg");
  conrm2off = loadImage ("navbuttons/conrm2off.png");
  conrm2on = loadImage ("navbuttons/conrm2on.png");
  computerp = loadImage ("computerlab.jpg");
  computeroff = loadImage ("navbuttons/computeroff.png");
  computeron = loadImage ("navbuttons/computeron.png");
  pantryoff = loadImage ("navbuttons/pantryoff.png");
  pantryon = loadImage ("navbuttons/pantryon.png");
  foyerh = loadImage ("header_foyer.png");
  computerh = loadImage ("header_computer_lab.png");
  hygieneh = loadImage ("header_hygiene_room.png");
  pantryh = loadImage ("header_pantry.png");
  diningh = loadImage ("header_dining_hall.png");
  kitchenh = loadImage ("header_kitchen.png");
  con1h = loadImage ("header_cr1.png");
  con2h = loadImage ("header_cr2.png");
  scrollIcon = loadImage("scrollBarIcon.png");
  scrollClickedIcon = loadImage("scrollBarClickedIcon.png"); 
  slider_image = loadImage("slider_image.png");
  slider_image = loadImage("slider_image_exp.png");

  curHeader = foyerh;
  room = foyerp;
  
  minim = new Minim(this);
  int buffersize = 256;
  sndButton = minim.loadSample("button_click_sound_2.wav");
   
}

void draw() {
  background(255);
  
  mouseTimer --;
   
  // Get the position of the img1 scrollbar
  // and convert to a value to display the img1 image 
  float roomPos = hs1.getPos()-width/2.1;
  fill(255);
  //image(room, width/2-room.width/2 + roomPos*1.5, 0);
  
  stroke(0);
  
  if(room == foyerp) 
  {   
    image(room, width/2-room.width/2 + roomPos*1.345, 0);
    curHeader=foyerh;
  }
  if(room == diningp) 
  {   
    image(room, width/2-room.width/2 + roomPos*6.665, 0);
    curHeader=diningh;
  }
  if(room == computerp) 
  { 
    image(room, width/2-room.width/2 + roomPos*1.16, 0);
    curHeader=computerh;
  }
  if(room == pantryp)
  {
    image(room, width/2-room.width/2 + roomPos*1.53, 0);    
    curHeader=pantryh;
  }
  if(room == kitchenp)
  {
    image(room, width/2-room.width/2 + roomPos*5.11, 0);
    curHeader=kitchenh;
  }
  if(room == con1p)
  {
    image(room, width/2-room.width/2 + roomPos*1.9, 0);   
    curHeader=con1h;
  }
  if(room == con2p)
  {
    image(room, width/2-room.width/2 + roomPos*1.4, 0);   
    curHeader=con2h;
  }
  if(room == hygienep)
  {
    image(room, width/2-room.width/2 + roomPos*.85, 0);    
    curHeader=hygieneh;
  }
  
  image(curHeader, 0, -10);
  image(footer, 0, 560);
 
  hs1.update(); 
  hs1.display();
 
 
 
 //Foyer Rollover Effect
 // Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverFoyer = checkImage(1, 570, 120, 95);
  
  
  // Create a rollover effect for the button
  if(isOverFoyer == true)
  {
    // the other image
   image(foyeron, 0, 560); 
  } else {
    // button image
   image(foyeroff, 0, 560);
  }
  
  if(room == foyerp)
  {image(foyeron, 0, 560);
  }

//Dining Hall Rollover Effect
 // Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverDining = checkImage(126, 570, 120, 95);
  
  
  // Create a rollover effect for the button
  if(isOverDining == true)
  {
    // the other image
   image(diningon, 126, 560); 
  } else {
    // button image
   image(diningoff, 126, 560);
  }
 
 if(room == diningp)
  {image(diningon, 126, 560);
  }
  
 //Computer Room Rollover Effect
 // Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverComp = checkImage(251, 570, 120, 95);
  
  
  // Create a rollover effect for the button
  if(isOverComp == true)
  {
    // the other image
   image(computeron, 251, 560); 
  } else {
    // button image
   image(computeroff, 251, 560);
  }
  
 if(room == computerp)
  {image(computeron, 251, 560);
  }
  
//Conference Room I Rollover Effect
// Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverCon1 = checkImage(389, 570, 120, 95);
  
  // Create a rollover effect for the button
  if(isOverCon1 == true)
  {
    // the other image
   image(conrm1on, 389, 560); 
  } else {
    // button image
   image(conrm1off, 389, 560);
  }
   
 if(room == con1p)
  {image(conrm1on, 389, 560);
  }
    
//Conference Room II Rollover Effect
// Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverCon2 = checkImage(510, 570, 120, 95);
  
  // Create a rollover effect for the button
  if(isOverCon2 == true)
  {
    // the other image
   image(conrm2on, 510, 560); 
  } else {
    // button image
   image(conrm2off, 510, 560);
  }
   
 if(room == con2p)
  {image(conrm2on, 510, 560);
  }
    
  //Kitchen Rollover Effect
  // Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverKitchen = checkImage(645, 570, 120, 95);
  
  // Create a rollover effect for the button
  if(isOverKitchen == true)
  {
    // the other image
   image(kitchenon, 645, 560); 
  } else {
    // button image
   image(kitchenoff, 645, 560);
  }
   
 if(room == kitchenp)
  {image(kitchenon, 645, 560);
  }
    
    //Pantry Rollover Effect
    // Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverPantry = checkImage(772, 570, 120, 95);
  
  // Create a rollover effect for the button
  if(isOverPantry == true)
  {
    // the other image
   image(pantryon, 772, 560); 
  } else {
    // button image
   image(pantryoff, 772, 560);
  }
   
 if(room == pantryp)
  {image(pantryon, 772, 560);
  }
  
  
  //Hygiene Room Rollover Effect
   // Check to see if the mouse is hovering over the button (x, y, width, height)
  isOverHygiene = checkImage(898, 570, 120, 95);
  
  // Create a rollover effect for the button
  if(isOverHygiene == true)
  {
    // the other image
   image(hygieneon, 898, 560); 
  } else {
    // button image
   image(hygieneoff, 898, 560);
  }
 
 if(room == hygienep)
  {image(hygieneon, 898, 560);
  
  }
  
  if (mouseTimer > 0) {
    image(loopingGif, 500, 430, width/5, height/3);
  }
  
}


  void mouseClicked()
{
 
  if(isOverFoyer == true) 
  {
    room = foyerp;
    sndButton.trigger();
  }
  if(isOverComp == true) 
  {
  room = computerp;
  sndButton.trigger();
  }
  if(isOverDining == true) 
  {
  room = diningp;
  sndButton.trigger();
  }
  if(isOverPantry == true)
  {
  room = pantryp;
  sndButton.trigger();
  }
  if(isOverKitchen == true)
  {
  room = kitchenp;
  sndButton.trigger();
  }
  if(isOverCon1 == true)
  {
  room = con1p;
  sndButton.trigger();
  }
  if(isOverCon2 == true)
  {
  room = con2p;
  sndButton.trigger();
  }
  if(isOverHygiene == true)
  {
  room = hygienep;
  sndButton.trigger();
  }
}

// Checks to see if the mouse is hovering over the button
boolean checkImage(int x, int y, int width, int height) 
{
  // A conditional that checks if the mouse is positioned within the confines of the button
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) 
  {
    return true;
  } else {
    return false;
  }

  
}



class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin+1, sposMax-47);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
   noStroke();
    fill(217, 132, 65);
    
    rect(xpos, ypos, swidth*4, sheight);
    //image(scrollIcon, swidth*2, sheight);
  

    image(slider_image, spos, ypos, sheight*4, sheight);
   // image(scrollIcon, swidth*2, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}




