
/* @pjs preload="controls.png, watermark.png"; */
// I wanted to make something I found interesting that uses simple tools
// So a user can create ellipses and lines

// images for display controls, watermark, screen capture
PImage menu;
boolean menu_test;
PImage lastState;
boolean go;//disables controls while menu is loaded

PImage record;
PImage save;
PImage watermark;
boolean wm_test;
PImage wm_replace;

// dx, dy are used to change origin of shapes, default is center
int dx;
int dy;

//color controls for themes, c1 is ellispe, c2 is line, cs is background
int c1;
int c2;
int c3;

//controls for mode and color changes
boolean mode;
boolean eColor;
boolean lColor;

void setup(){
  size(800,600);
  c1 = 0;
  c2 = 255;
  c3 = c2;
  colorMode(RGB,255,255,255);
  background(c3);
  dx = width/2;
  dy = height/2;
  menu_test = false;
  mode = false;
  eColor = false;
  lColor = false;
  go = false;
  watermark = loadImage("watermark.png");
  wm_test = false;
  menu = loadImage("controls.png");
  image(menu, 0, 0);
  smooth(4);
}

void draw() {
}

// draw ellipse and line, wait for trigger
// ellipse and line drawn from default origin, change with O key
void mouseDragged(){ 
  if (mousePressed == true) {
  if (go==true) {
  if (mouseButton == LEFT) {
    strokeWeight(1);
    int x = mouseX;
    int y = mouseY;
    noFill();
    stroke(c1);
    ellipse(dx, dy, x, y);
  }
  if (mouseButton == RIGHT) {
    strokeWeight(1);
    int x = mouseX;
    int y = mouseY;
    noFill();
    stroke(c2);
    line(dx, dy, x, y);
  }
  }
}
}

// controls and event handlers
void keyPressed() {
  switch(key) {
    
    //Menu controls
    case 'd': case 'D':
      if (menu_test == true){
        lastState = get();
        image(menu, 0,0);
        go = false;
        menu_test = false;
        break;
    }
      if(menu_test == false){
        if (lastState == null){
            background(c3);
            menu_test = true;
            go = true;
            break;
        }
        else{
          image(lastState, 0, 0);
          menu_test = true;
          go = true;
          break;
      }
    }
    
    //Screen capture and reload
    case 'r': case 'R':
    if (go == true){
      record = get();
      break;
    }
    case '4':
    if (go == true) {
      if (record == null){
        break;
      }
      image(record, 0, 0);
      break;
    }
    
    //watermark display
    case 'w': case 'W':
      if (go == true){
        if (wm_test == true){
          image(wm_replace, 5, height-55);
          wm_test = false;
          break;
      }
        if (wm_test == false){
          wm_replace = get(5, height-55, 50, 50);
          image(watermark, 5, height-55);
          wm_test = true;
          break;
        }
    }
    
    //clear canvas to current them background;
    case 'c': case 'C':
      if (go == true) {
        background(c3);
        break;
      }
      
    //change draw origin
    case 'o': case 'O':
      if (go == true){
      dx = mouseX;
      dy = mouseY;
      break;
      }
      
    //save frame
    case 's': case 'S':
      if (go == true){
      saveFrame("frame-####.png");
      break;
      }
   //change color mode
   case 'm': case 'M':
   if (go == true){
     if (mode == false){
        c1 = 255;
        c2 = 0;
        c3 = c2;
        mode = true;
        background(c3);
        break;
      }
     if (mode == true){
        c1 = 0;
        c2 = 255;
        c3 = c2;
        mode = false;
        background(c3);
        break;
      }
    }
      
  //change ellipse color
  case '1':
    if(go == true){ 
     if (eColor == false){
        c1 = 255;
        eColor = true;
        break;
      } 
     if (eColor == true){
        c1 = 0;
        eColor = false;
        break;
      }
    }
  //change line color
  case '2':
  if (go == true) {
     if (lColor == false){
        c2 = 0;
        lColor = true;
        break;
      } 
     if (lColor == true){
        c2 = 255;
        lColor = false;
        break;
      }
  }
  //restore default colors
  case '3':
    if (go == true) {
       c1 = 0; 
       c2 = 255;
       dx = width/2;
       dy = height/2;
       break;
  }
  }
}


