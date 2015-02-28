
//foot

int footstartx = 279;//constants
int footstarty = 300;

int footx = 279;//this one changes
int footy = 300;

int footendx = 268;//constants
int footendy = 278;

//images

float inc = 0.0; //mustache

boolean vector = false;//spacebar head


PImage img, i, i2, man, b, m, sans, stache, a, ah, c, f, hearts, ac,h, sexy, NO, NOsmall, eyes, mouth, head; //background, head, man, boots, mad face, sans mustache, mans stache, accusations
 
//PShape s; //head


// Rt. man moving off screen

float xman = 300;
float yman = 170;
int center = 150;
float speed = 1.0;
int directionX = 1;
int directionY = 0;

float speedX = 1.2; //man
float speedY = 0.4; //man

float x; 

  //PAGES
  int page = 1; //stores current page
  int start_time = 0;
  int time_to_approach = 6000;
  int time_to_tease_release = 2500;
  int time_to_tease_release_2 = 2000;
  int time_to_tease_release_3 = 2500;
  int alarm_time = 0;
  PFont carlson;




void setup ( )   {

  //frameRate(30); //millis 
  smooth();
  size (640,480); 
  carlson = loadFont("ACaslonPro-Bold-20.vlw");
  textFont(carlson);
  textAlign(RIGHT);
  fill(255,241,194);
  start_time = millis();
  
  
  
//IMAGES (head and man)
 // sunrise = loadImage ("alley_sunrise.png"); //sunrise background
  img = loadImage ("alley_final_buttons.png");//background
  
  //i = loadImage ("head_eyes.png"); // camo head
  //i2 = loadImage ("head_sexy_eyes copy.png");// sexy face
  man = loadImage ("mustache1edit.png");//moving man
  b = loadImage ("Red-boots.png");//boots
  m = loadImage ("not_appreciate.png");//not appreciate face
  sans = loadImage ("man_sans-stache.png"); //sans mustache
  stache = loadImage("real_stache.png"); //mans mustache
  a = loadImage("accusations_final.png");//accusation face
  ah = loadImage("accusation_heads.png"); //accusation heads
  c = loadImage("cat.png"); //cat gift
  f = loadImage("flirtation.png");//flirtation face
  hearts = loadImage("hearts.png"); //hearts flirtation
  ac = loadImage("alley_cropped.png"); //cropped alley to cover up man
  h = loadImage("happy_face.png"); //happy face
  //sexy = loadImage("head_sexy_eyes.png"); // sexy eyes
  NO = loadImage("NO_STACHE.png");//NO MUSTACHE
  NOsmall = loadImage("NO_STACHE_small.png"); //small mustache allergic
  eyes = loadImage("eyes_layer_final.png");// original eyes
  mouth = loadImage("lips_layer_final.png"); //original mouth
  head = loadImage("head_layer_final_2.png"); //original head
  
  
  float angle = 0.0; 
  
  stroke(0);//mustache
  
  


}


void draw ( )   {
  background (img);
  
  
  //moving man
  image(man, xman, yman); //far right
  
  //speedX = random(0.0, 5.0); //man speed
  
  //xman = xman + speed * directionX;
  //if ((xman > width-center) || (xman < center)) {
    //directionX = directionX * -1;
    //println(directionX);
    
  //}
   //yman = yman + speed * directionY;
  //if ((yman > height-center) || (yman < center)) {
    //directionY = directionY * -1;
    
  //}
  
  //page 1 - intro.
  if (page == 1) {
   textAlign(CENTER);
   image(ac, 500, 176);
    text("It's 2:36am and the city is quiet, except for you.", width/2, 40);
   text("You don't sleep...you wait.", width/2, 80);
   if (millis() > start_time + time_to_approach) {
     page = 2;
   }
  } else if(page==2) { // man approaches
   text("A gentleman is approaching!!!", width/2, 40);
   text("Would you like to snatch his mustache?", width/2, 80);
   text("Yes",60, 460);
   text("No", 460, 315);
   
  
 } else if (page==3) {
   text("Uh oh. He does not appreciate that.",width/2, 40); 
   text("Maybe you should try something different.", width/2, 80);
   image(m, 562, 204); //mad face
   image(stache, 300,370);
   if (millis() > start_time + time_to_tease_release) {
     page = 5;
     start_time = millis();
   }
  } else if(page==4) {
     text("This is too much. You just can't resist...",width/2, 40);
     text("Make another attempt",120, 460);
     text("Taunt him", 460, 315);
     //image(sexy,165, 155);
    
 
  
  } else if (page==5) {
     text("You revise your method.", width/2, 80);
     image(m, 562, 204); //mad face
     image(stache, 300,370);
     if (millis() > start_time + time_to_tease_release) {
       page = 6;
       start_time = millis();
     }
  } else if(page == 6) {
     text("What would you like to do?", width/2, 40);
     text("Intimidate him", 90,460); 
     text("Return his mustache", 460, 315);
     image(m, 562, 204); //mad face
     image(stache, 300,370);
      
  
  } else if (page==7) {
     image(hearts, 500, 20);
     text("He mistakes your taunts for fliration.",width/2, 40); 
     text("To avoid an unpleasant situation, cease your snatching efforts.", width/2, 80);
     image(f, 558, 197);
     image(NO, 320, 220);
     
  
   
    } else if (page == 8) { // left click on 6
      text("What valor! He is not easily intimidated.", width/2, 40);
      text("Abort mustache snatching efforts", 160, 460);
      text("Trade him something for it", 470, 315);
      image(m, 562, 204); //mad face
      image(stache, 300,370);
    

     } else if (page == 9) { //right click on 6
    text("Questioning your kindness, he throws accusations at you.", width/2, 40);
    text("Explain yourself", 160, 460);
    text("Let him go,", 515, 290);
    text("it's not worth it.", 535,315);
    image(a, 570, 204);
    image(ah, 320, 80);
  
  
     } else if (page == 10) { //left click on 8
      text("That was a wise decision.",width/2,40);
      text("Maybe next time.", width/2, 80);
     // image(m, 562, 204); //mad face
      image(h, 560, 200); //happy face
      image(NO, 320, 220);
      //image(stache, 300,390);
     
     } else if (page == 11) { // right click on 8
       text("Oh no! He's extremely allergic to that!", width/2, 40);
       text("Give up while you still have some dignity.", width/2, 80);
       image(m, 562, 204); //mad face
       //image(stache, 300,390);//mustache
       image(c, 340, 320);//cat
       image(NOsmall, 360, 140);//NO stache
      
       
     }else if (page == 12) { //left click on 9
      image(ac, 500, 176);
       text("Unfortunately, he still refuses to hand over his mustache.", width/2, 40);
       text("Better luck next time.", width/2, 80);
      image(NO, 320, 220);
       //image(a, 570, 204);
    
     
   } else if (page ==13) { //right click on 9
     image(ac, 500, 176);
     text("At least you tried.", width/2, 40);
     text("It's just not your night.", width/2, 80);
     image(NO, 320, 220);
     
     
      } else if (page ==14) { //right click on 6
     image(ac, 500, 176);
     text("At least you tried.", width/2, 40);
     text("It's just not your night.", width/2, 80);
     image(NO, 320, 220);
      }
   
   
     
   //orignal head

    
    image(head, 125,115);  //head
    image(eyes, 160, 170); //eyes
    image(mouth, 210, 260); //mouth 
     
   
   
   
   
   
   
   
   
  
//spacebar change

  //if (vector == true) {

    //image(i2, 165, 157);//sexy face

  //} 
  //else {
    //image(i,165,155); //camo head
  //} 
  
 //legs
  strokeWeight(5);
  //stroke(0,175,255);
  line(210,299,210,380);//lft leg
  line(256,297,258,380);//rt leg

  //hands
  line(197,320,210,300);//lft foot
  line(258,295,footx,footy);//rt foot
  
  //boots
  image(b,193,320);
   
 

//mustache
  
  float speed = mouseX/2000.0;
  int units = (int) mouseY/10;
 


  
  mustache(speed, units);
  //mustache(speed);
  
}

void mustache (float speed, int units) {
 
  inc += speed;
   float angle = sin(inc) / mouseY*10 + sin(inc*1.2) / mouseY*20;
  //float angle = sin(inc) / 10.0 + sin(inc*1.2) / 20.0;
   tail(225, 240, mouseX/20, angle, 1);
   tail(225, 240, mouseX/20, angle, -1);
    
   tail(225, 240, mouseY/20, angle, 1);
   tail(225, 240, mouseY/20, angle, -1);
}
  
 void tail(int x, int y, int units, float angle, int d) {
  pushMatrix();
  translate(x,y);
  for (int i = units; i > 0; i--) {
  strokeWeight(i);
  line(5,3,0,-8);
  translate(-8*d,0);
  rotate(angle*d);  
    
  }  
  
  popMatrix();
  }
  
  
//story  
void mousePressed() {
 // Page 2
 if (page == 2) {
   if (mouseX < width/2) {
     page = 3;
     start_time = millis();
   }
   else {
     page = 4;
     alarm_time = alarm_time + 1;
   }
 }
 // Page 4
 else if (page == 4) {
   if (mouseX < width/2) {
     page = 3;
   }
   else {
     page = 7;
     alarm_time = alarm_time + 1;
     if (alarm_time == 2) {
       page = 7;
     }
     start_time = millis();
   }
 }
 
//page 6 
else if (page == 6) {
  if (mouseX < width/2) {
    page = 8; //click left
  }
  else {
    page = 14; // click right
    alarm_time = alarm_time + 1;
    if (alarm_time == 2) {
       page = 14;
     }
     start_time = millis();
  }
}

//page 8
else if (page == 8) {
  if (mouseX < width/2) {
    page = 10; //click left
  }
  else {
    page = 11; //right click
    alarm_time = alarm_time + 1;
    if(alarm_time == 2) {
       page = 11;
     }
     start_time = millis();
  }
}

//page 9
else if (page == 9) {
  if (mouseX < width/2) {
    page = 12; //left click
  }
  else {
    page = 13; //right click 
  
  }
}
}









void mouseMoved( )  {


  // foot raising
  if (mouseY < pmouseY) {
    footx = footstartx;
    footy = footstarty;
  }
  if (mouseY > pmouseY) {
    footx = footendx;
    footy = footendy;
  }
}


void keyPressed() {
  if (key == ' ') {
    if (vector == true) {
      vector = false;
    } 
    else {
      vector = true;
    }
  
  }
  
}










