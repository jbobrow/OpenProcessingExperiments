
PImage cursor_hand, cursor_handgrab, cursor_redjump, cursor_bluejump, cursor_yellowjump, cursor_greenjump, cursor_blackball;
PImage item_redsticker, item_back;
PImage[] images = new PImage[7]; //Image array from animation section in Processing handbook
int frame = 0;
boolean handcursorvisible = false;

void setup() {
  size  (1287, 933);
  frameRate(60);
  noFill();
  noStroke();
  noCursor();
  cursor_hand = loadImage("cursor_hand.png");
  cursor_handgrab = loadImage("cursor_handgrab.png");
  cursor_redjump = loadImage("cursor_redjump.png");
  cursor_yellowjump = loadImage("cursor_yellowjump.png");
  cursor_bluejump = loadImage("cursor_bluejump.png");
  cursor_greenjump = loadImage("cursor_greenjump.png");
  cursor_blackball = loadImage("cursor_blackball.gif");
  cursor_bluejump = loadImage("cursor_bluejump.png");
  item_redsticker = loadImage("item_redsticker.png");
  item_back = loadImage("item_back.png");
  images[0] = loadImage("handson26.jpg");
  images[1] = loadImage("handson31.jpg");
  images[2] = loadImage("handson27.jpg");
  images[3] = loadImage("handson8.jpg");
  images[4] = loadImage("handson11.jpg");
  images[5] = loadImage("handson25.jpg");
  images[6] = loadImage("handson0.jpg");
}

void draw() {
  //loads variable image, starts at 0. From Animation section in Processing handbook
  image(images[frame], 0, 0); 

  //FRAME 1--red "if"
  if (frame == 0) {
    if (dist(mouseX, mouseY, 840, 157)<41) {
      image(cursor_bluejump, mouseX-8, mouseY-8);
      if (mousePressed ==true) {
        frame++;
      }
    }
    else {
      if (mousePressed ==false) {
        image (cursor_hand, mouseX-8, mouseY-8);
      }
      if (mousePressed ==true) {
        image(cursor_handgrab, mouseX-8, mouseY-8);
      }
    }
  }

  //FRAME 2--
  if (frame == 1) {
    if (dist(mouseX, mouseY, 704, 485)<41) {
      image (cursor_redjump, mouseX-8, mouseY-8);
      if (mousePressed==true) {
        frame++;
      }
    }
    else {
      if (mousePressed ==false) {
        image (cursor_hand, mouseX-8, mouseY-8);
      }
      if (mousePressed ==true) {
        image(cursor_handgrab, mouseX-8, mouseY-8);
      }
    }
  }
  //FRAME 3--yellow "if"
  if (frame == 2) {
    if (dist(mouseX, mouseY, 708, 168)<41) {
      image(cursor_yellowjump, mouseX-8, mouseY-8);
      if (mousePressed ==true) {
        frame++;
      }
    }
    else {
      if (mousePressed ==false) {
        image (cursor_hand, mouseX-8, mouseY-8);
      }
      if (mousePressed ==true) {
        image(cursor_handgrab, mouseX-8, mouseY-8);
      }
    }
  }


  //FRAME 4--sideviewglove
  if (frame == 3) {
    if (mousePressed ==true) {
      frame++;
    }
    if (mousePressed ==false) {
      image (cursor_hand, mouseX-8, mouseY-8);
    }
    if (mousePressed ==true) {
      image(cursor_handgrab, mouseX-8, mouseY-8);
    }
  }
  //FRAME 5--red,green,blue,yellow buttons
  if (frame == 4) {
    //boolean handcursorvisible =true;
    //having trouble getting the hand to leave when there is a button mouseover...

    //if (handcursorvisible) {
    if (mousePressed ==false) {
      image (cursor_hand, mouseX-8, mouseY-8);
    }
    if (mousePressed ==true) {
      image(cursor_handgrab, mouseX-8, mouseY-8);
    }
    //}
    if (dist(mouseX, mouseY, 467, 308)<41) {
      handcursorvisible=false;
      image(cursor_redjump, mouseX-8, mouseY-8);
      if (mousePressed ==true) {
        frame++;
      }
    }

    if (dist(mouseX, mouseY, 424, 444)<41) {
      handcursorvisible=false;
      image(cursor_yellowjump, mouseX-8, mouseY-8);
      if (mousePressed ==true) {
        frame-=2;
      }
    }

    if (dist(mouseX, mouseY, 474, 565)<41) {
      handcursorvisible=false;
      image(cursor_greenjump, mouseX-8, mouseY-8);
      if (mousePressed ==true) {
        frame+=2;
      }
    }

    if (dist(mouseX, mouseY, 588, 700)<41) {
      handcursorvisible=false;
      image(cursor_bluejump, mouseX-8, mouseY-8);
      if (mousePressed ==true) {
        frame++;
      }
    }
    //handcursorvisible=true;
  }

  //FRAME 6--blue "if" 2
  if (frame == 5) {
    if (dist(mouseX, mouseY, 805, 324)<41) {
      image(cursor_bluejump, mouseX-8, mouseY-8);
      if (mousePressed ==true) {
        frame-=5;
      }
    }
    else {
      if (mousePressed ==false) {
        image (cursor_hand, mouseX-8, mouseY-8);
      }
      if (mousePressed ==true) {
        image(cursor_handgrab, mouseX-8, mouseY-8);
      }
    }
  }
  //FRAME 7--pointer finger with back
  if (frame == 6) {
    cursor(HAND);
    image(item_back, 100, 100);
    if (mouseX > 100 && mouseX < 170 && mouseY > 100 && mouseY <143 && mousePressed == true) {
      frame--;
    }
    noCursor();
  }
}

//void gloveoutline() {
//  beginShape();
//  vertex(373, 207);
//  vertex(367, 229);
//  vertex(370, 254);
//  vertex(385, 312);
//  vertex(405, 365);
//  vertex(419, 411);
//  vertex(436, 458);
//  vertex(494, 596);
//  vertex(503, 608);
//  vertex(589, 705);
//  vertex(598, 722);
//  vertex(619, 770);
//  vertex(637, 829);
//  vertex(687, 890);
//  vertex(770, 896);
//  vertex(861, 910);
//  vertex(870, 892);
//  vertex(869, 873);
//  vertex(885, 846);
//  vertex(1005, 755);
//  vertex(1011, 745);
//  vertex(996, 737);
//  vertex(982, 711);
//  vertex(973, 707);
//  vertex(958, 670);
//  vertex(953, 662);
//  vertex(967, 638);
//  vertex(973, 598);
//  vertex(984, 443);
//  vertex(946, 229);
//  vertex(934, 194);
//  vertex(916, 172);
//  vertex(901, 171);
//  vertex(877, 184);
//  vertex(866, 208);
//  vertex(857, 247);
//  vertex(844, 385);
//  vertex(812, 318);
//  vertex(792, 264);
//  vertex(671, 60);
//  vertex(621, 0);
//  vertex(580, 0);
//  vertex(573, 11);
//  vertex(570, 34);
//  vertex(685, 262);
//  vertex(673, 272);
//  vertex(631, 169);
//  vertex(549, 0);
//  vertex(483, 0);
//  vertex(480, 18);
//  vertex(484, 39);
//  vertex(579, 299);
//  vertex(558, 258);
//  vertex(528, 216);
//  vertex(461, 108);
//  vertex(432, 68);
//  vertex(412, 56);
//  vertex(395, 56);
//  vertex(379, 77);
//  vertex(378, 99);
//  vertex(386, 124);
//  vertex(434, 219);
//  vertex(446, 250);
//  vertex(502, 374);
//  vertex(493, 376);
//  vertex(476, 331);
//  vertex(451, 281);
//  vertex(424, 227);
//  vertex(405, 204);
//  vertex(392, 200);
//  vertex(380, 203);
//  endShape(CLOSE);
//}


