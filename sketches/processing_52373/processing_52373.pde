
Route[] routes = new Route[23];

PImage img;
PImage header;
PImage mapViewOn;
PImage lineViewOn;
PImage circle;

float damping = 0.09;
boolean isViewToggle = false;
float topMargin = 200;
float leftMargin = 22;
float ellipSize = 5;


PFont flag;
PFont routeNames;
float fontX = 16.79;
float fontY = 67.0;
float fontZ = 9999;
float titleW;

boolean hit = false;

void setup() {
  size(1024, 768);
  frameRate(30);
  smooth();

  flag = loadFont("MercuryTextG1-Roman-12.vlw");
  routeNames = loadFont("mercurytextg1-roman-10.vlw");

  // load images
  img = loadImage("mapbackground.png");
  header = loadImage("header.png");
  mapViewOn = loadImage("mapViewOn.png");
  lineViewOn = loadImage("lineViewOn.png");
  circle = loadImage("circle.png");

  // initialize routes
  routes[0] = new Route(new Point2D[] {
    new Point2D(369.2, 327.6, "start", "Magnuson Park"), 
    new Point2D(425.7, 170.1, "problem", "broken spoke"), 
    new Point2D(528.0, 330.9, "problem", "attempted to fix wheel"), 
    new Point2D(636.6, 307.1, "interest", "lunch stop"), 
    new Point2D(734.0, 205.5, "interest", "flat tire"), 
    new Point2D(830.3, 413.6, "problem", "Remlinger Farms"), 
    new Point2D(951.1, 598.6, "interest", "Snoqualmie Falls"), 
    new Point2D(731.2, 551.2, "interest", "flat tire"), 
    new Point2D(578.4, 569.2, "problem", "snack break"), 
    new Point2D(375.7, 510.9, "interest", "Mercer Island"), 
    new Point2D(369.2, 327.6, "end", "Magnuson Park")
  }, 101.0, "Seattle Century Ride"
  );
  routes[1] = new Route(new Point2D[] {
    new Point2D(286.0, 375.1, "start", "UW"), 
    new Point2D(313.2, 210.6, "interest", "Burke Gilman closures"), 
    new Point2D(507.7, 212.4, "end", "Red Hook Brewery")
  }, 18.5, "UW to Red Hook"
  );
  routes[2] = new Route(new Point2D[] {
    new Point2D(286.0, 368.5, "start", "45th and 21st"), 
    new Point2D(343.3, 606.1, "end", "Seward Park"),
  },9.5, "45th Apartment to Seward Park"
  ); 
  routes[3] = new Route(new Point2D[] {
    new Point2D(286.0, 368.5, "start", "45th and 21st"), 
    new Point2D(256.0, 593.4, "end", "Georgetown Brewery"),
  },8.9, "45th Apartment to Georgetown Brewery"
  ); 
  routes[4] = new Route(new Point2D[] {
    new Point2D(286.0, 368.5, "start", "45th and 21st"), 
    new Point2D(146.6, 303.7, "end", "Golden Gardens"),
  }, 8.0, "45th Apartment to Golden Gardens"
  );
  routes[5] = new Route(new Point2D[] {
    new Point2D(264.8, 356.8, "start", "53rd and 7th"), 
    new Point2D(168.1, 376.2, "interest", "blueberry picking"), 
    new Point2D(103.9, 368.5, "end", "Discovery Park")
  }, 8.0, "53rd House to Discovery Park"
  );
  routes[6] = new Route(new Point2D[] {
    new Point2D(264.8, 356.8, "start", "53rd and 7th"), 
    new Point2D(146.6, 303.7, "end", "Golden Gardens"),
  },7.9, "53rd House to Golden Gardens"
  ); 
  routes[7] = new Route(new Point2D[] {
    new Point2D(281.7, 315.4, "start", "Maple Leaf"), 
    new Point2D(243.5, 453.4, "end", "Amazon"),
  },5.6, "80th House to Amazon Internship"
  ); 
  routes[8] = new Route(new Point2D[] {
    new Point2D(286.0, 368.5, "start", "45th and 21st"), 
    new Point2D(327.9, 295.9, "end", "Matthews Beach"),
  },5.4, "45th Apartment to Matthews Beach"
  ); 
  routes[9] = new Route(new Point2D[] {
    new Point2D(281.7, 315.4, "start", "Maple Leaf"), 
    new Point2D(222.9, 382.9, "end", "Fremont"),
  },5.1, "Maple Leaf House to Fremont"
  ); 
  routes[10] = new Route(new Point2D[] {
    new Point2D(286.0, 368.5, "start", "45th and 21st"), 
    new Point2D(369.3, 327.6, "end", "Magnuson Park"),
  }, 4.1, "45th Apartment to Magnuson Park"
  );   
  routes[11] = new Route(new Point2D[] {
    new Point2D(286.0, 368.5, "start", "45th and 21st"), 
    new Point2D(243.5, 453.4, "end", "Amazon"),
  },3.8, "45th Apartment to Amazon Internship"
  ); 
  routes[12] = new Route(new Point2D[] {
    new Point2D(291.0, 375.1, "start", "McMahon Hall"), 
    new Point2D(244.5, 402.4, "end", "Gasworks Park"),
  },2.5, "McMahon to Gasworks"
  );
  routes[13] = new Route(new Point2D[] {
    new Point2D(286.0, 368.5, "start", "45th and 21st"), 
    new Point2D(244.5, 402.4, "end", "Gasworks Park"),
  },2.5, "45th Apartment to Gasworks"
  ); 
  routes[14] = new Route(new Point2D[] {
    new Point2D(272.6, 380.1, "start", "Lander Hall"), 
    new Point2D(244.5, 402.4, "interest", "Gasworks Park"), 
    new Point2D(240.7, 396.7, "interest", "dumpster diving"), 
    new Point2D(227.5, 392.6, "problem", "fremont troll"), 
    new Point2D(222.9, 382.9, "end", "Fremont")
  }, 2.5, "Lander to Fremont"
  );
  routes[15] = new Route(new Point2D[] {
    new Point2D(281.7, 315.4, "start", "Maple Leaf"), 
    new Point2D(285.5, 348.9, "problem", "flat tire"), 
    new Point2D(286.0, 375.1, "end", "UW"),
  },2.4, "Maple Leaf House to UW"
  ); 
  routes[16] = new Route(new Point2D[] {
    new Point2D(264.8, 356.8, "start", "53rd and 7th"), 
    new Point2D(290.0, 387.0, "problem", "flipped bike"), 
    new Point2D(294.6, 383.4, "end", "UW IMA"),
  },2.2, "53rd House to UW IMA"
  ); 
  routes[17] = new Route(new Point2D[] {
    new Point2D(281.7, 315.4, "start", "Maple Leaf"), 
    new Point2D(275.8, 364.8, "end", "University Way"),
  },2.1, "Maple Leaf House to the Ave"
  ); 
  routes[18] = new Route(new Point2D[] {
    new Point2D(281.7, 315.4, "start", "Maple Leaf"), 
    new Point2D(252.8, 327.6, "end", "Greenlake"),
  }, 1.6, "Maple Leaf House to Greenlake"
  ); 
  routes[19] = new Route(new Point2D[] {
    new Point2D(264.8, 356.8, "start", "53rd and 7th"), 
    new Point2D(286.0, 375.1, "end", "UW"),
  },1.5, "53rd House to UW"
  ); 
  routes[20] = new Route(new Point2D[] {
    new Point2D(272.6, 380.1, "start", "Lander Hall"), 
    new Point2D(244.5, 402.4, "end", "Gasworks Park"),
  },1.5, "Lander to Gasworks"
  ); 
  routes[21] = new Route(new Point2D[] {
    new Point2D(264.8, 356.8, "start", "53rd and 7th"), 
    new Point2D(252.8, 327.6, "end", "Greenlake"),
  } , 1.3, "53rd House to Greenlake"
  );   
  routes[22] = new Route(new Point2D[] {
    new Point2D(272.6, 380.1, "start", "Lander Hall"), 
    new Point2D(294.6, 383.4, "end", "UW IMA"),
  },1.1, "Lander to UW IMA"
  ); 
}
void draw() {
  if (!isViewToggle) {
    background(img);
  } 
  else {
    background(70);
  }
  // display routes
  for (int i = 0; i < routes.length; i++) {
    routes[i].display();
  }
  image(header,0,8);
  image(circle,-10,8);
  strokeWeight(.25);
  stroke(255,100);
  line(fontX, fontY+40,fontX+(width-leftMargin*2),fontY+40);
}

void keyPressed() {

  // position routes
  if (!isViewToggle) {
    isViewToggle = true;

    for (int i = 0; i < routes.length; i++) {
      float offsetY = i * 75; //75 = rowHeight
      routes[i].onKeyPressed(isViewToggle, offsetY, 0.5);
    }
  } 
  else {
    isViewToggle = false;

    for (int i = 0; i < routes.length; i++) {
      routes[i].onKeyPressed(isViewToggle, 0, 0);
    }
  }
}  

void mouseDragged() {
  // isDragged = true;
  if (isViewToggle) {
    for (int i = 0; i < routes.length; i++) {
      routes[i].onMouseDragged();
    }
  }
}
void mousePressed() {
 if (isViewToggle) {
  for (int i = 0; i < routes.length; i++) {
   routes[i].onMousePressed(mouseX,mouseY); 
  }
 } 
 
}


