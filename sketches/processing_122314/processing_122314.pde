
//////////////////////////////////////////////////////////
//Code By cgiles
//Description : how to add mouse wheel interactivy
//////////////////////////////////////////////////////////
// default size of my ellipse
int display1=1219;
int display2=891;
float px;
float py;
float initialx;
float initialy;
boolean overpicture = false;
boolean locked = false;
float xOffset = 0.0;
float yOffset = 0.0;
PImage photo,building1,building1intro,building2,building2intro,building3,building3intro,building5,building5intro,
building6,building6intro,building7,building7intro,gym,gymintro,fitnessCenter,fitnessCenterintro,stone,road,roadintro,turtle,park,parkintro;
boolean open = false;
boolean show = false;


void setup(){
  size(1219,891);
  px = width/2.0;
  py = height/2.0;
  initialx = width/2.0;
  initialy = height/2.0;
  frameRate(30);
  // this will add a new event listener to your sketch
  // for listen how the mouse scroll is used
   addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
  }}); 
  photo = loadImage("school.png");
  building1 = loadImage("building1.JPG");
  building1intro = loadImage("building1intro.JPG");
  building6 = loadImage("building6.JPG");
  building6intro = loadImage("building6intro.JPG");
  building5 = loadImage("building5.JPG");
  building5intro = loadImage("building5intro.JPG");
  building2 = loadImage("building2.JPG");
  building2intro = loadImage("building2intro.JPG");
  building3 = loadImage("building3.JPG");
  building3intro = loadImage("building3intro.JPG");
  building7 = loadImage("building7.JPG");
  building7intro = loadImage("building7intro.JPG");
  gym = loadImage("gym.JPG");
  gymintro = loadImage("gymintro.JPG");
  fitnessCenter = loadImage("fitnessCenter.JPG");
  fitnessCenterintro = loadImage("fitnessCenterintro.JPG");
  stone = loadImage("stone.JPG");
  road = loadImage("road.JPG");
  roadintro = loadImage("roadintro.JPG");
  turtle = loadImage("turtle.JPG");
  park = loadImage("park.JPG");
  parkintro = loadImage("parkintro.JPG");
}

void draw(){
  cursor(HAND);
  background(255);
  imageMode(CENTER);
  //Test if the cursor is over the box
  if(mouseX > px-1219 && mouseX < px+1219 && 
     mouseY > py-891 && mouseY < py+891){
     overpicture = true;
  }else {
     overpicture = false;
   }  
  image(photo,px,py,display1,display2);
     if(open==true){
       if(mouseX >= 240+px-initialx && mouseX <= 400+px-initialx &&
          mouseY >= 325+py-initialy && mouseY <= 485+py-initialy)
          {if(show==false) image(building1,1005+px-initialx,680+py-initialy,430,430);
           else image(building1intro,1005+px-initialx,680+py-initialy,430,430);
          } 
       if(mouseX >= 176+px-initialx && mouseX <= 336+px-initialx &&
          mouseY >= 193+py-initialy && mouseY <= 333+py-initialy)
          {if(show==false) image(building6,1005+px-initialx,680+py-initialy,430,430);
           else image(building6intro,1005+px-initialx,680+py-initialy,430,430);
          } 
       if(mouseX >= 311+px-initialx && mouseX <= 471+px-initialx &&
          mouseY >= 145+py-initialy && mouseY <= 305+py-initialy)
          {if(show==false) image(building5,1005+px-initialx,680+py-initialy,430,430);
           else image(building5intro,1005+px-initialx,680+py-initialy,430,430);
          }
       if(mouseX >= 483+px-initialx && mouseX <= 643+px-initialx &&
          mouseY >= 103+py-initialy && mouseY <= 263+py-initialy)
          {if(show==false) image(building2,1005+px-initialx,680+py-initialy,430,430);
           else image(building2intro,1005+px-initialx,680+py-initialy,430,430);
          }
       if(mouseX >= 520+px-initialx && mouseX <= 660+px-initialx &&
          mouseY >= 322+py-initialy && mouseY <= 482+py-initialy)
          {if(show==false) image(building3,1005+px-initialx,680+py-initialy,430,430);
           else image(building3intro,1005+px-initialx,680+py-initialy,430,430);
          }
       if(mouseX >= 614+px-initialx && mouseX <= 774+px-initialx &&
          mouseY >= 325+py-initialy && mouseY <= 485+py-initialy)
          {if(show==false) image(building7,1005+px-initialx,680+py-initialy,430,430);
           else image(building7intro,1005+px-initialx,680+py-initialy,430,430);
          }
       if(mouseX >= 898+px-initialx && mouseX <= 1058+px-initialx &&
          mouseY >= 283+py-initialy && mouseY <= 443+py-initialy)
          {if(show==false) image(gym,213+px-initialx,197+py-initialy,430,430);
           else image(gymintro,213+px-initialx,197+py-initialy,430,430);
          }
       if(mouseX >= 961+px-initialx && mouseX <= 1121+px-initialx &&
          mouseY >= 36+py-initialy && mouseY <= 196+py-initialy)
          {if(show==false) image(fitnessCenter,213+px-initialx,678+py-initialy,430,430);
           else image(fitnessCenterintro,213+px-initialx,678+py-initialy,430,430);
          }
       if(mouseX >= 525+px-initialx && mouseX <= 605+px-initialx &&
          mouseY >= 276+py-initialy && mouseY <= 356+py-initialy) 
          { image(stone,1005+px-initialx,680+py-initialy,430,430);}
       if(mouseX >= 632+px-initialx && mouseX <= 792+px-initialx &&
          mouseY >= 531+py-initialy && mouseY <= 611+py-initialy)   
          {image(turtle,213+px-initialx,197+py-initialy,430,430); }
       if(mouseX >= 723+px-initialx && mouseX <= 803+px-initialx &&
          mouseY >= 247+py-initialy && mouseY <= 327+py-initialy)   
          {if(show==false) image(road,1005+px-initialx,680+py-initialy,430,430);
           else image(roadintro,1005+px-initialx,680+py-initialy,430,430);
          }
       if(mouseX >= 464+px-initialx && mouseX <= 544+px-initialx &&
          mouseY >= 264+py-initialy && mouseY <= 344+py-initialy)   
          {if(show==false) image(park,1005+px-initialx,680+py-initialy,430,430);
           else image(parkintro,1005+px-initialx,680+py-initialy,430,430);
          }
     } 
}

// this is the event listener of mouse wheel
void mouseWheel(int delta) {
  // add the value of wheel's scolling to my ellipse's size
  // for a better effiency i multiply the scrolling value by 5
  display1+=delta*200;
  display2+=delta*200;
}

void mousePressed() {
  println(mouseX);
  println(mouseY);
  if(mouseButton == LEFT){
  if(overpicture){
    locked = true;
  } else{
    locked = false;
  }
  xOffset = mouseX-px;
  yOffset = mouseY-py;
  }
  if(mouseButton == RIGHT){
    if(show==false)show=true;
    else show=false;
  }
}

void mouseDragged() {
  if(locked) {
    px = mouseX-xOffset;
    py = mouseY-yOffset;
  }
}

void mouseReleased() {
  locked = false;
}

void keyPressed(){
  switch(key){
   case TAB: 
      display1=1219;
      display2=891;
      px=width/2.0;
      py=height/2.0;
      break;
   case ENTER:
   if(open==false)
   {   open = true;
      println(open);}
   else
      open = false;
   break;   
   default:
  }   
}





