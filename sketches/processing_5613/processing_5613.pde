
int page = 1;
 
PFont Chalkboard;

 
 float j, k;
 float r, s;
 float a, b;
 float targetX, targetY;
float size = 10.0;
float easing = 0.1;

float x = 100;
float y = 100;
float x2 = 100;
float y2 = 100;
float angle;
float cosine;
float jitter;
float speed = 0.0;

float xpos, ypos;
float xspeed = 1;
float yspeed = 1;
float xdirection = -1;
float ydirection = -5;


PImage travelagent;
PImage mteverest;
PImage beach;
PImage falling;
PImage lobby;
PImage snorkel;
PImage martini;
PImage armbig;
PImage bahamassign;
PImage fish1;
PImage fish2;
PImage fish3;
PImage hammocklittle;
PImage hammockbig;
PImage shark;
PImage hotchocolate;
PImage littlearm;
PImage rope;
PImage snorkelmask;
PImage waves;
PImage fakemochi1;
PImage mounteverestsign;
PImage fakemochi2;
PImage fakemochi3;
PImage drink;



void setup() {
  size(640, 480);
  Chalkboard = loadFont("Chalkboard-20.vlw");
  textFont(Chalkboard);
  textAlign(CENTER);
  
  
  travelagent = loadImage("travelagency.png");
  mteverest = loadImage("mteverestscene.png");
  beach = loadImage("beachscene.png");
  falling = loadImage("climbmountain.png");
  lobby = loadImage("lobby.png");
  snorkel = loadImage("underwater.png");
  martini = loadImage("beachscene2.png"); 
  bahamassign = loadImage("bahamassign.png");
  fish1 = loadImage("fish1.png");
  fish2 = loadImage("fish2.png");
  fish3 = loadImage("fish3.png");
  hammocklittle = loadImage("hammcok.png");
  hammockbig = loadImage("hammock2.png");
  armbig = loadImage("armbig.png"); 
  shark = loadImage("shark.png");
  hotchocolate = loadImage("hotchocolate.png"); 
  littlearm = loadImage("littlearm.png"); 
  rope = loadImage("rope.png"); 
  snorkelmask = loadImage("snorkel.png"); 
  waves = loadImage("wabes.png"); 
  fakemochi1 = loadImage("fakemochi-1.png");
  mounteverestsign = loadImage("mounteverestsign.png"); 
  fakemochi2 = loadImage("mochinoarmflip.png");
  fakemochi3 = loadImage("mochinoarm.png");
  drink = loadImage("martini.png");
  
  
  
 
}

void draw() {
    background(255);
    smooth();
    

  // Page 1: Travel Agent
  if (page == 1) {
     image(travelagent, 0, 0);
    image(mounteverestsign, 420, 255, 170, 185);
     image(bahamassign, 56, 325, 110, 115);
     targetX = mouseX; 
  j = j + ((targetX - j) * easing); 
  targetY = mouseY; 
  k = k + ((targetY - k) * easing);  
    image(armbig, j, k, 100, 160);
    
    text("Use Mochi's arm to choose your Vacation. Bahamas or Mt. Everest", width/2, height/1.05); 
  }
  // Page 2: Arrive Mt. Everest
  else if (page == 2) {
   image(mteverest, 0, 0);
   fill(0);
    text("Welcome to Mt. Everest!", width/2, height/1.2);
    text("Click the mountain to climb it, click the lodge to go inside.", width/2, height/1.05);
  }
  // Page 3: Arrive Bahamas
  else if (page == 3) {
    image(beach, -25, 0);
    image(hammocklittle, 145, 190);
     text("Welcome to the Bahamas!", width/2, height/1.2);
    text("Click the hammock to hang on the beach, click the water to go in.", width/2, height/1.05);
    }
  // Page 4: Climb Mountain
    else if (page == 4) {
      image(falling, 0, 0);
      float currentTime = millis()/1000.0;
        if (currentTime < 10.0){
    jitter = (random(-0.1, 0.1));
  angle = angle + jitter;
  cosine = cos(angle);
    
  translate(-25, -35);
  rotate(cosine);
   image(rope, 50, -10);
      image(fakemochi3, 99, 90);
      
    } else if (currentTime > 10.0) {
   xpos = xpos + ( xspeed * xdirection );
ypos = ypos + ( yspeed * ydirection );

  
  if (xpos > width-size || xpos < 10) {
  xdirection *= -1;
}
if (ypos > height-size || ypos < -50) {
  ydirection *= -1;
}

xpos = xpos + speed;


{
    image(rope, xpos, ypos);
      image(fakemochi3, xpos+50, ypos+90);
} 
  
    } else if (currentTime > 13.0) {
           xspeed = 0.0;  
           yspeed = 0.0;
    }
    
     
  println(currentTime);

      
      
      
  }
  // Page 5: Sit in Lobby
  else if (page == 5 ){
    image(lobby, 0, 0);
    image(fakemochi2, 234, 200);
    
      targetX = mouseX; 
  a = a + ((targetX - a) * easing); 
  targetY = mouseY; 
  b = b + ((targetY - b) * easing); 
  image(hotchocolate, a, b, 30, 30);
 
  }



  



  // Page 6: Go Snorkeling
  else if (page == 6) {
   image(snorkel, 0, 0);
   image(fakemochi1, 54, 342);
   image(snorkelmask, 48, 332);
  
   ellipse(44, 342, 4, 4);
   ellipse(59, 351, 5, 5);
   ellipse(68, 369, 6, 6);
   ellipse(53, 353, 4, 4);
   ellipse(41, 346, 4, 4);
   
  if (x > width - size) {
    x = size;
  } 
    
   x = x - 0.8;
  translate(x, -height/2+size/2);
   image(shark, 690, 500);
   
      x = x + 0.2;
    
    translate(x, height/2+7-size/2);
   image(fish2, 7, -70);
   
    translate(x, height/2+5-size/2+3);
   image(fish1, 34, 0);
       translate(x, (height/2-94)-size/2+17);
   image(fish3, -34, -65);
   
   
  }
  // Page 7: Sit on Beach
  else if (page == 7) {
  image(martini, -83, 0);  
  image(hammockbig, 93, 320);
  rotate(-PI/8);
  image(fakemochi2, 83, 400);
  
 
   targetX = mouseX; 
  r = r + ((targetX - r) * easing); 
  targetY = mouseY; 
  s = s + ((targetY - s) * easing);  
  image(drink, r, s, 30, 30);
  }
  
}

void mousePressed() {
  if (page == 1) {
    if (mouseX < width/2) {
      page = 3;
    }
    else {
      page = 2;
  }
  }
  else if (page == 2) {
    if (mouseY > 300) {
      page = 5;
    }
    else {
      page = 4;
    }
  }
     
  else if (page == 3) {
    if (mouseX < height/2) {
      page = 6;
    }
    else {
      page = 7;
    }
  } else if (page == 6) {
    if (mouseX < height/2) {
      page = 1;
    }
    
    } else if (page == 7) {
    if (mouseX < height/2) {
      page = 1;
    }
    
    } else if (page == 4) {
    if (mouseX < height/2) {
      page = 1;
    }
    
    } else if (page == 5) {
    if (mouseX < height/2) {
      page = 1;
    }
    
  }
}



