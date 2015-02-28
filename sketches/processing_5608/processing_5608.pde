
int page = 0;
PFont markerF;

Boolean shovel_f = false;
Boolean seeds_f = false;
Boolean hay_f = false;
Boolean bananas_f = false;
Boolean coat_f = false;
Boolean spoon_f = false;
int count_item = 0;
int input = 0;
double time = 0;

PImage hay;
PImage bananas;
PImage spoon;
PImage seeds;
PImage coat;
PImage shovel;
PImage bag;

PImage frog_hand;

PShape leaf;

float x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5;                    //easing for the black ball
float targetX, targetY;
float easing = 0.1;

PShape left_hand;
PShape right_hand;
PShape left_leg;
PShape right_leg;
PShape head;
PShape left_hand_click;
PShape left_leg_jump;
PShape right_leg_jump;
PShape rightjump_long;
PShape leftjump_long;

PShape farmhouse;
PShape house;
PShape jungle1;
PShape jungle2;
PShape door_closed;
PShape door_open;
PShape tree_leaves;
PShape farmBG;
PShape magic1;
PShape magic2;
PShape magic3;
PShape magic4;
PShape magic5;

PShape snake;
PShape worm;
PShape monkey_front;
PShape monkey_back;
PShape snail;
PShape bunny;
PShape spider;
PShape dead_froggy;

int x_shift = -236;
int y_shift = -214;

float jump_y_pressed = 1;              // jump
float jump_easing_pressed = 0.1;
float targetY_jump_pressed = 100;
boolean key_pressed = false;
boolean jump_off_pg = false;

int jump_key = 0;
int door_key = 0;
int right_edge = 250;
int jump_inc = 0;
int home_f = 0;
int tree_rate = 0;

void setup() {
  size(640, 480);
   markerF = loadFont("MarkerFelt-Thin-48.vlw");
   textFont(markerF);
   textSize(20);
   textAlign(CENTER);
   fill(255);
   
   hay = loadImage("hay.png");
   seeds = loadImage("seeds.png");
   shovel = loadImage("shovel.png");
   bananas = loadImage("bananas.png");
   coat = loadImage("coat.png");
   spoon = loadImage("spoon.png");
   bag = loadImage("bag.png");
   
   left_hand = loadShape("left_hand.svg");
   right_hand = loadShape("right_hand.svg");
   left_leg = loadShape("left_leg.svg");
   right_leg = loadShape("right_leg.svg");
   head = loadShape("head.svg");
   rightjump_long = loadShape("rightjump_long.svg");
   leftjump_long = loadShape("leftjump_long.svg");
   
   frog_hand = loadImage("cursor.png");
   
   leaf = loadShape("leave.svg");
   farmhouse = loadShape("farmhouse.svg");
   house = loadShape("house.svg");
   jungle1 = loadShape("jungle1.svg");
   jungle2 = loadShape("jungle2.svg");
   door_open = loadShape("door_open.svg");
   door_closed = loadShape("door_closed.svg");
   tree_leaves = loadShape("tree_leaves.svg"); 
   farmBG = loadShape("farmBG.svg"); 
   magic1 = loadShape("magic1.svg"); 
   magic2 = loadShape("magic2.svg"); 
   magic3 = loadShape("magic3.svg"); 
   magic4 = loadShape("magic4.svg"); 
   magic5 = loadShape("magic5.svg"); 

   snail = loadShape("snail.svg");
   spider = loadShape("spider.svg");
   worm = loadShape("worm.svg");
   monkey_front = loadShape("monkey_front.svg");
   monkey_back = loadShape("monkey_back.svg");
   snake = loadShape("snake.svg");
   dead_froggy = loadShape("dead_froggy.svg");

   time = millis();

}

void draw() {
   background(0);
   smooth();
   // Page 0: Title Page
   if(page == 0) { 
     cursor(frog_hand, 1, 1);
     pushMatrix();
     scale(0.4, 0.4);
     shape(leaf, width/2+360, height/2+750);
     popMatrix();
     
     textSize(22);
     fill(0);
     text("START", width/2, height/2+200);
     textSize(26);
     fill(255);
     text("Froggy's Adventure to the Farm", width/2, height/2+130);
          
     pushMatrix();
     scale(0.8, 0.8);
     translate(150, 100);
     jump();     
     popMatrix();
     
   // Page 1: Froggy picks four items
   }else if(page == 1) {
     fill(225);
     textSize(20);
     text("After days of work, Froggy wants to go on a vacation at the farm.", width/2, height/2-50);
     text("What should he take with him?", width/2, height/2-20);
     text("All items are very heavy to Froggy, so he can only take four with him (pick four).", width/2, height/2+30);
     
     pushMatrix();
     scale(0.5, 0.5);
     translate(width-220, 10);
     jump();     
     popMatrix();

     
     tint(150);
     image(shovel, 50, height/2+80);
     image(seeds, 150, height/2+80);
     image(hay, 200, height/2+80);
     image(bananas, 320, height/2+80);
     image(coat, 430, height/2+60);
     image(spoon, 520, height/2+80);
     
     if(mouseX > 50 && mouseX < 140 && mouseY > height/2+80 && mouseY < 470 && !shovel_f) {
       noTint();
       image(shovel, 50, height/2+80);
     } else if(shovel_f) {
       noTint();
       image(shovel, 50, height/2+80);
     }
       
     if(mouseX > 150 && mouseX < 190 && mouseY > height/2+80 && mouseY < 470 && !seeds_f) {
       noTint();
       image(seeds, 150, height/2+80);
      } else if(seeds_f) {
       noTint();
       image(seeds, 150, height/2+80);
     }
     
     if(mouseX > 200 && mouseX < 310 && mouseY > height/2+80 && mouseY < 470 && !hay_f) {
       noTint();
       image(hay, 200, height/2+80);
      } else if(hay_f) {
       noTint();
       image(hay, 200, height/2+80);
     }
     
     if(mouseX > 320 && mouseX < 420 && mouseY > height/2+80 && mouseY < 470 && !bananas_f) {
       noTint();
       image(bananas, 320, height/2+80);
      } else if(bananas_f) {
       noTint();
       image(bananas, 320, height/2+80);
     }
     
     if(mouseX > 430 && mouseX < 510 && mouseY > height/2+80 && mouseY < 470 && !coat_f) {
       noTint();
       image(coat, 430, height/2+60);
      } else if(coat_f) {
       noTint();
       image(coat, 430, height/2+60);
     }
     
     if(mouseX > 520 && mouseX < 600 && mouseY > height/2+80 && mouseY < 470 && !spoon_f) {
       noTint();
       image(spoon, 520, height/2+80);
      } else if(spoon_f) {
       noTint();
       image(spoon, 520, height/2+80);
     }

     if(count_item == 4) {
       time = millis();
       page = 2;
     }

     // Page 2: Froggy leaving house
   } else if(page == 2) {     
     fill(255);
     shape(jungle1, -80, -245); 
     shape(house, 0, 0);
     if(door_key == 0) {
       shape(door_closed, width/2-30, height/2+50);
       text("Open the door for Froggy to leave", width/2, height-70);
     } else if(door_key == 1) {
       shape(door_open, width/2-70, height/2+40);
       pushMatrix();
       scale(0.4, 0.4);
       translate(400, 700);
       jump();     
       popMatrix();
       
       if(millis() > time + 3000) {
         if(right_edge < width) {
           jump_off_pg = true;
           jump_key = 2;
           pushMatrix();
           scale(0.4, 0.4);
           translate(400, 700);
           jump();     
           popMatrix();
         }      
       }
 
       if(millis() > time + 10000) {
         time = millis();
         page = 3;
       }
 
    }
     
     
     
     // Page 3: after 10 sec, Froggy is tired. Ask for a ride from monkey?
   } else if(page == 3) {
     fill(255);
     shape(jungle2, -300, -243); 
     shape(monkey_front, 50, -45);
     shape(tree_leaves, -160, -245);
     
     pushMatrix();
     scale(0.4, 0.4);
     translate(400, 700);
     jump();     
     popMatrix();
       
     fill(255);
     text("After hours of hopping, Froggy is tired.", width/2, height-90);    
     text("Should he go up the tree to ask monkey for a ride?", width/2, height-60);
     text("Key in Y for yes, N for no", width/2, height-30);
     if(input == 1) {
       image(bananas, width/2-40, height/2+10);
       textSize(48);
       text("?", width/2+50, height/2+60);
       textSize(20);
       if( millis() > time + 2000) {
         time = millis();
         page = 4;
       }
     } else if(input == 2) {
       page = 6;
     } else {     
       time = millis();
     }
     
     // Page 4: yes ride
   } else if(page == 4) {
     shape(jungle1, -80, -243); 
     if(bananas_f) {
       noFill();
       stroke(255);
       strokeWeight(8);
       ellipse(width/2-10, height/2-20, 100, 100);
       noStroke();
       fill(255);
       ellipse(width/2-80, height/2+80, 100, 100);
       ellipse(width/2+60, height/2+80, 100, 100);
       image(bananas, width/2-40, height/2-50);
       image(seeds, width/2-100, height/2+60);
       image(shovel, width/2+35, height/2+35);
       fill(0);
       text("?", width/2-50, height/2+80);
       text("?", width/2+80, height/2+80);
       if(millis() > time + 2000) {
         time = millis();
         page = 51;
       }
     } else {
       noFill();
       stroke(255);
       strokeWeight(8);
       ellipse(width/2-10, height/2-20, 100, 100);
       fill(255);
       image(bananas, width/2-40, height/2-50);
       line(275, 185, 345, 255);
       text("sorry no bananas, have to keep hopping", width/2, height/2+70);
       if(millis() > time + 5000) {
         time = millis(); 
         page = 6;
       }
     }  
   } else if(page == 51) {
     shape(jungle1, -80, -243); 
       noFill();
       stroke(255);
       strokeWeight(8);
       ellipse(width/2-10, height/2-20, 100, 100);
       noStroke();
       fill(255);
       ellipse(width/2-80, height/2+80, 100, 100);
       ellipse(width/2+60, height/2+80, 100, 100);
       image(bananas, width/2-40, height/2-50);
       image(seeds, width/2-100, height/2+60);
       image(shovel, width/2+35, height/2+35);
       fill(0);
       if(millis() > time + 5000) {
         time = millis();
         page = 5;
       }
     if(seeds_f && shovel_f) {
       text("O", width/2-50, height/2+80);
       text("O", width/2+80, height/2+80);
       
     } else if(seeds_f && !shovel_f) {
       text("O", width/2-50, height/2+80);
       text("X", width/2+80, height/2+80);
     } else if(!seeds_f && shovel_f) {
       text("X", width/2-50, height/2+80);
       text("O", width/2+80, height/2+80);
     }
     
       
       
     
     // Page 5: check for seeds and shovel     
   } else if(page == 5) {
     shape(jungle2, -80, -243); 
     shape(monkey_front, width/2-100, -45);
     shape(tree_leaves, -160, -245);
     
       
     if(seeds_f && shovel_f) {
           pushMatrix();
           scale(0.4, 0.4);
           translate(50, 700);
           jump();     
           popMatrix();

       if(tree_rate == 0){
         shape(magic1, width/2, height-100);
         tree_rate++;
       } else if(tree_rate == 1){
         shape(magic2, width/2, height-200);
         tree_rate++;
       } else if(tree_rate == 2){
         shape(magic3, width/2, height-300);
         tree_rate++;
       } else if(tree_rate == 3){
         shape(magic4, width/2, height-350);
         tree_rate++;
       } else if(tree_rate == 4){
         shape(magic5, width/2, height-400);
         tree_rate++;
       } else {
         shape(magic5, width/2, height-400);
         fill(255);
         text("Froggy just plants a tree to climb!", width/2, height/2+200);  
          if(millis() > time + 5000) {
           time = millis();
           page = 7;
         }
       }
       
    

     } else if(seeds_f && !shovel_f) {
       
 
       fill(255);
       text("Froggy has no shovel!", width/2, height/2+130);
       text("Have to keep hopping!", width/2, height/2+160);
        jump_y_pressed = 1;              
        jump_easing_pressed = 0.1;
        targetY_jump_pressed = 100;
         
       if(millis() > time + 3000) {
         if(right_edge < width) {
           jump_off_pg = true;
           jump_key = 2;
           pushMatrix();
           scale(0.4, 0.4);
           translate(400, 700);
           jump();     
           popMatrix();
         }      
       }
 
       if(millis() > time + 5000) {
         time = millis();
         page = 6;
       }
     } else if(!seeds_f && shovel_f) {
       fill(255);
       text("Froggy has no seeds!", width/2, height/2+70);
       text("Have to keep hopping!", width/2, height/2+100);
       pushMatrix();
       scale(0.4, 0.4);
       translate(400, 700);
       jump();     
       popMatrix();
       
       if(millis() > time + 3000) {
         if(right_edge < width) {
           jump_off_pg = true;
           jump_key = 2;
           pushMatrix();
           scale(0.4, 0.4);
           translate(400, 700);
           jump();     
           popMatrix();
         }      
       }

       if(millis() > time + 5000) {
         time = millis();
         page = 6;
       }
     } else {
       time = millis();
     }     
              
      // Page 6: no ride 
   } else if(page == 6) {
     shape(jungle1, -80, -243); 
     
     right_edge = 250;
     jump_inc = 0;
     jump_key = 2;
            
         if(right_edge < width) {
           jump_off_pg = true;
           jump_key = 2;
           pushMatrix();
           scale(0.4, 0.4);
           translate(400, 700);
           jump();     
           popMatrix();
           fill(255);
         }      

      
     //text("Froggy keeps hopping", width/2, height/2);
     if(millis() > time + 8000) {
       time = millis();
       page = 8;
     }
     
    // Page 7: froggy hopping onto the tree briding monkey froggy rides on monkey     
   } else if(page == 7) {
     shape(jungle2, -80, -243); 
     shape(monkey_front, width/2, -45);
     shape(tree_leaves, -160, -245);
     shape(magic5, width/2, height-400);
     fill(255);
     text("Froggy bride the monkey, ride with monkey to the farm!", width/2, height/2+200);  

      if(millis() > time + 1000) {
       pushMatrix();
       scale(0.4, 0.4);
       translate(600, 200);
       jump();     
       popMatrix();
      }

     if(millis() > time + 5000) {
       time = millis();
       page = 18;
     }
     
     // Page 8: tired and hungry     
   } else if(page == 8) {
     shape(jungle1, -80, -243); 
     text("froggy is tired and hungry, worm, spider, snails?", width/2, height/2);  
     
     pushMatrix();
     scale(0.8, 0.8);
     tint(150);
     shape(worm, 100, height-100);
     stroke(0);
     strokeWeight(2);
     line(200, 0, 200, 200);
     shape(spider, 130, 150);
     shape(snail, width/2+200, height/2+100);
     popMatrix();

     if(input == 3) {
       //text("worm", width/2, height/2+70);
       if( millis() > time + 2000) {
         time = millis();
         page = 9;
       } 
     } else if(input == 4) {
       //text("spider", width/2, height/2+70);
       if( millis() > time + 2000) {
         time = millis();
         page = 10;
       }
     } else if(input == 5) {     
       //text("snails", width/2, height/2+70);
       if( millis() > time + 2000) {
         time = millis();
         page = 11;
       }
     } else {
       time = millis();
     }
         
     // Page 9: worm     
   } else if(page == 9) {
     
     shape(jungle1, -80, -243); 
     shape(worm, width/2, height/2+70);
       pushMatrix();
       scale(0.4, 0.4);
       translate(200, 700);
       jump();     
       popMatrix();
     //text("eating worm", width/2, height/2);  
     if(millis() > time + 5000) {
       time = millis();
       page = 12;
     }  
     // Page 10: spider     
   } else if(page == 10) {
     shape(jungle1, -80, -243); 
     shape(spider, width/2, height/2+70);

    //text("eating spider", width/2, height/2);   
     if(millis() > time + 2000) {
       shape(dead_froggy, width/2-200, height/2);
       fill(255);
       text("Ah! Poisonous! Froggy died!", width/2+120, height-50);   
     }       
     // Page 11: snails     
   } else if(page == 11) {
     shape(jungle1, -80, -243); 
     shape(snail, width/2, height/2+70);
       pushMatrix();
       scale(0.4, 0.4);
       translate(200, 700);
       jump();     
       popMatrix();
     //text("eating snails, yum!!", width/2, height/2); 
     if(millis() > time + 5000) {
       time = millis();
       page = 17;  

     }       
     
     // Page 12: snake appear, run or hide?
   } else if(page == 12) {
     shape(jungle1, -80, -243); 
     pushMatrix();
     scale(1.5, 1.5);
     shape(snake, width/2, height/2-50);
     popMatrix();
       pushMatrix();
       scale(0.4, 0.4);
       translate(200, 700);
       jump();     
       popMatrix();
     fill(255);
     text("Froggy finished the worm. But... ", width/2, height/2-30); 
     text("A snake appears! Run(R) or Hide(H)? ", width/2, height/2); 
     if(input == 6) {
       if( millis() > time + 2000) {
         time = millis();
         page = 13;
       }
     } else if(input == 7) {
       if( millis() > time + 2000) {
         time = millis();
         page = 14;
       }
     }
     
     // Page 13: run
   } else if(page == 13) {
     shape(jungle1, -80, -243); 
     pushMatrix();
     scale(1.5, 1.5);
     shape(snake, width/2-50, height/2-50);
     popMatrix();
    
     //text("froggy running", width/2, height/2); 
     fill(255);
     if(millis() > time + 2000) {
       text("Snake caught Froggy, he's dead", width/2+200, height-200); 
       shape(dead_froggy, width/2-200, height/2);
     }
     
     // Page 14: hide, check if have coat
   } else if(page == 14) {
     shape(jungle1, -80, -245); 
     text("Froggy is trying to hide", width/2, height/2); 
     if(millis() > time + 2000) {
       if(coat_f) {
         time = millis();
         page = 15;
       } else {
         time = millis();
         page = 16;
       }
     }
     
     // Page 15: yes coat
   } else if(page == 15) {
     shape(jungle1, -80, -243); 
     text("Hiding inside the coat, safe!", width/2, height/2);
     if(millis() > time + 2000) {
       time = millis();
       page = 17;
     } 
     // Page 16: no coat
   } else if(page == 16) {
     shape(jungle1, -80, -243); 
     if(millis() > time + 2000) {
       text("Froggy forgot to bring his coat to protect himself.", width/2+100, height/2+200); 
       text("Snake found Froggy, he's dead.", width/2+100, height/2+170); 
       shape(dead_froggy, width/2-200, height/2);
     }
 
      // Page 17: keep hopping
   } else if(page == 17) {
     shape(jungle1, -80, -243); 
       pushMatrix();
       scale(0.4, 0.4);
       translate(200, 700);
       jump();     
       popMatrix();
     fill(255);

       text("Now Froggy Have energy to keep going!", width/2, height-200); 
  
     if( millis() > time + 3000) {
       time = millis();
       page = 18;
     }
     // Page 18: arrives at farm
   } else if(page == 18) {
     shape(farmBG, -100, 0);
     pushMatrix();
     scale(0.7, 0.7);
     shape(farmhouse, 0, 180);
     popMatrix();
     pushMatrix();
       scale(0.4, 0.4);
       translate(400, 700);
       jump();     
       popMatrix();

     fill(255);
     text("arrives at farm!", width/2, height/2+200); 
     if(millis() > time + 5000) {
       time = millis();
       page = 19;
     }

     // Page 19: ready to go home?
   } else if(page == 19) {
     shape(farmBG, -100, 0);
     pushMatrix();
     scale(0.7, 0.7);
     shape(farmhouse, 0, 180);
     popMatrix();
     pushMatrix();
       scale(0.4, 0.4);
       translate(400, 700);
       jump();     
       popMatrix();
     fill(255);
     text("After visiting friends in the farm, Froggy is ready to go home?(Y/N)", width/2, height/2+200); 
     if(input == 8) {
       if( millis() > time + 2000) {
         time = millis();
         page = 20;
       }
     } else if(input == 9) {
       if( millis() > time + 2000) {
         time = millis();
         page = 21;
       }
     }
       
     
     // Page 20: yes home
   } else if(page == 20) {
     shape(farmBG, -100, 0);
     pushMatrix();
     scale(0.7, 0.7);
     shape(farmhouse, 0, 180);
     popMatrix();
     pushMatrix();
       scale(0.4, 0.4);
       translate(400, 700);
       jump();     
       popMatrix();
    fill(255);
     text("Froggy wants to go home!", width/2, height/2+200); 
     if(millis() > time + 2000) {
       time = millis();
       page = 22;
     }
     
     // Page 21: no home
   } else if(page == 21) {
     shape(farmBG, -100, 0);
     pushMatrix();
     scale(0.7, 0.7);
     shape(farmhouse, 0, 180);
     popMatrix();
     pushMatrix();
       scale(0.4, 0.4);
       translate(400, 700);
       jump();     
       popMatrix();
    fill(255);
     text("Froggy wants to stay at the farm!", width/2, height/2+200); 

     // Page 22: home
   } else if(page == 22) {
       shape(jungle1, -80, -245); 
       shape(house, 0, 0);
       shape(door_closed, width/2-30, height/2+50);
       pushMatrix();
       scale(0.4, 0.4);
       translate(400, 700);
       jump();     
       popMatrix();
       fill(255);
       text("Froggy is home! Nice trip! Ready for work tomorrow!", width/2, height/2+200);        
   }
   
}


void jump() {
     noStroke();
     if(!jump_off_pg && jump_key == 0) {             
        pushMatrix();             // if no jump, show body 
        translate(236, 214);
        initial_show_body();
        popMatrix();   
        
     } else if(jump_off_pg && jump_key == 0) {
        pushMatrix();             // if show body while jumping off pg
        translate(236 + jump_inc, 214);
        initial_show_body();
        popMatrix();    
        
     } else if(jump_key == 1) {
       pushMatrix();
       translate(236, 214);
       rotate(-PI/16);
       run_right_jump();
       popMatrix();
       
       //time = millis();
       
     } else if(jump_key == 2){
       if(right_edge < width + 200) {
        pushMatrix();
        translate(236 + jump_inc, 214);
        rotate(PI/16);
        run_left_jump();
        popMatrix();
        jump_inc += 2;
        right_edge = 236 + jump_inc;
       } 
    }
    
}

void initial_show_body() {
  //legs
  noFill();
  initial_show_legs_right();
  initial_show_legs_left();
  
  // hands 
  initial_show_hand_left();
  initial_show_hand_right();

  fill(114, 191, 68);
  noStroke(); 
    
    //belly
    beginShape();
    vertex(199.5 + x_shift, 150 + y_shift);
    bezierVertex(199.5 + x_shift, 150 + y_shift, 145 + x_shift, 214 + y_shift, 171 + x_shift, 248 + y_shift);
    bezierVertex(198 + x_shift, 282.5 + y_shift, 286.5 + x_shift, 277 + y_shift, 302.5 + x_shift, 248 + y_shift);
    bezierVertex(324 + x_shift, 208 + y_shift, 269 + x_shift, 149.5 + y_shift, 269 + x_shift, 149.5 + y_shift);
    endShape(CLOSE);
    
    //head
    shape(head, 146 + x_shift, 30 + y_shift);
    ellipse(236 + x_shift, 116 + y_shift, 180, 114);
  
    fill(255);
    //eyes
    ellipse(199 + x_shift, 53 + y_shift, 32, 32);
    ellipse(271 + x_shift, 53 + y_shift, 32, 32);
     
    //eye balls
    fill(0);
    float mx = constrain(mouseX, 195, 202);
    float my = constrain(mouseY, 50, 55);
    float mx2 = constrain(mouseX, 267, 274);
    float my2 = constrain(mouseY, 50, 55);
    ellipse(mx2 + x_shift, my2 + y_shift, 23, 23);
    ellipse(mx + x_shift, my + y_shift, 23, 23);
    
    //eye shines
    fill(255);
    float mx3 = constrain(mouseX, mx-6, mx+6);
    float my3 = constrain(mouseY, my-6, my+6);
    float mx4 = constrain(mouseX, mx2-6, mx2+6);
    float my4 = constrain(mouseY, my2-6, my2+6);
    ellipse(mx3 + x_shift, my3 + y_shift, 5, 5);
    ellipse(mx4 + x_shift, my4 + y_shift, 5, 5);
        
    //cheeks
    fill(204, 124, 69);
    ellipse(297.5 + x_shift, 93.5 + y_shift, 26, 23);
    ellipse(177 + x_shift, 93.5 + y_shift, 26, 23);
    fill(198, 95, 52 );
    ellipse(297.5 + x_shift, 96 + y_shift, 19.5, 17 );
    ellipse(177 + x_shift, 96.5 + y_shift, 19.5, 17);
    
    //nose
    stroke(0);
    strokeWeight(3);
    strokeCap(ROUND);
    line(232.5 + x_shift, 88 + y_shift, 232.5 + x_shift, 93 + y_shift);
    line(237.5 + x_shift, 88 + y_shift, 237.5 + x_shift, 93 + y_shift);
    
    show_mouth(); 
}


void initial_show_hand_right() {
    shape(right_hand, 280 + x_shift, 128 + y_shift);
}

void initial_show_hand_left() {
    shape(left_hand, 80 + x_shift, 127 + y_shift);
}

void initial_show_legs_right() {
  if(jump_key == 0){ 
      shape(right_leg, 285 + x_shift, 200 + y_shift);
  } else if(jump_key == 1) {
      shape(right_leg, 285 + x_shift, 200 + y_shift);
  } else if(jump_key == 2) {
      shape(leftjump_long, 285 + x_shift, 200 + y_shift);   
  }
}
void initial_show_legs_left() {
  if(jump_key == 0){
      shape(left_leg, 100 + x_shift, 200 + y_shift);
  } else if(jump_key == 1) {
      shape(rightjump_long, 130 + x_shift, 220 + y_shift);
  } else if(jump_key == 2) {
      shape(left_leg, 100 + x_shift, 200 + y_shift);
  }    
}


void show_mouth(){
  if(jump_key == 0){
    draw_tongue();  
      //mouth with tongue
      fill(114, 191, 68);
      stroke(0);
      strokeWeight(1);
      strokeCap(ROUND);
      line(162 + x_shift, 115 + y_shift, 175 + x_shift, 111 + y_shift);
      line(300 + x_shift, 109 + y_shift, 311 + x_shift, 112 + y_shift);
      beginShape();
      vertex(169 + x_shift, 113 + y_shift);
      bezierVertex(169 + x_shift, 113 + y_shift, 165 + x_shift, 137.5 + y_shift, 194 + x_shift, 154 + y_shift);
      bezierVertex(223 + x_shift, 170.5 + y_shift, 270 + x_shift, 161.5 + y_shift, 282.5 + x_shift, 154 + y_shift);
      bezierVertex(302 + x_shift, 142.5 + y_shift, 308 + x_shift, 120.5 + y_shift, 305 + x_shift, 110.5 + y_shift);
      endShape();
  } else {
    //mouth wide open  
    noStroke();
    beginShape();
    vertex(169 + x_shift, 113 + y_shift);
    bezierVertex(169 + x_shift, 113 + y_shift, 165 + x_shift, 137.5 + y_shift, 194 + x_shift, 154 + y_shift);
    bezierVertex(223 + x_shift, 170.5 + y_shift, 270 + x_shift, 161.5 + y_shift, 282.5 + x_shift, 154 + y_shift);
    bezierVertex(302 + x_shift, 142.5 + y_shift, 308 + x_shift, 120.5 + y_shift, 305 + x_shift, 110.5 + y_shift);
    endShape(CLOSE);
  }
}

void draw_tongue() {
  
  int rotate_y = mouseY-96;
  int rotate_x = mouseX-150;          //balance the tongue's moving range
  
  if(rotate_y < 110) {                //restrict the tongue's position
    rotate_y = 110;
  }
  
  fill(198, 95, 52);
  noStroke();
    
  float angle2 = atan2(rotate_y, rotate_x);
  pushMatrix();
  translate(236 + x_shift, 96 + y_shift);
  rotate(angle2);
  beginShape();
  vertex(83, 4 );
  bezierVertex(113, 12, 111, 33, 98, 35);
  bezierVertex(84, 37, 56, 13, 56, 13);
  bezierVertex(36, 6, 50, 4 , 50, 4);
  endShape(); 
      
  stroke(135, 26, 32);
  strokeCap(ROUND);
  line(40, 4, 100, 25);        
  popMatrix();
}
void run_left_jump() {
    jump_y_pressed = jump_y_pressed + ((targetY_jump_pressed - jump_y_pressed) * jump_easing_pressed);
    if(jump_y_pressed >= (targetY_jump_pressed - 1)) {
      jump_easing_pressed = -jump_easing_pressed;          // falling
    } 
    if(jump_y_pressed <= 0){                       // return to before jump status  
      jump_key = 0;      
      jump_easing_pressed = -jump_easing_pressed;
      jump_y_pressed = 1;
    }
    if(!jump_off_pg){
      pushMatrix();
      translate(0, -jump_y_pressed);
      noStroke();
      initial_show_body();                   // show body
      popMatrix();
    } else {
      pushMatrix();
      translate(0, -jump_y_pressed);
      noStroke();
      initial_show_body();                   // show body
      popMatrix();
    }
      
}

void run_right_jump() {
    jump_y_pressed = jump_y_pressed + ((targetY_jump_pressed - jump_y_pressed) * jump_easing_pressed);
    if(jump_y_pressed >= (targetY_jump_pressed - 1)) {
      jump_easing_pressed = -jump_easing_pressed;          // falling
    } 
    if(jump_y_pressed <= 0){                       // return to before jump status
      jump_key = 0;      
      jump_easing_pressed = -jump_easing_pressed;
      jump_y_pressed = 1;
    }
    pushMatrix();
    translate(0, -jump_y_pressed);
    noStroke();
    initial_show_body();                   // show body
    popMatrix();
    if(page == 0){
      if(millis() > time + 1000) {
        page = 1;
      }
    }
}

void keyPressed() {
  if(page == 3) {
    //89
    if(keyCode == 'Y') {
      input = 1;
      //78
    } else if(keyCode == 'N') {
      input = 2;
    }
  }  else if(page == 12) {
    if(keyCode == 'R') {
      input = 6;
    } else if(keyCode == 'H') {
      input = 7;
    }
  } else if(page == 19) {
    if(keyCode == 'Y') {
      input = 8;
    } else if(keyCode == 'N') {
      input = 9;
    }
  }
}





void mousePressed() {
  if(page == 1) {
    if(count_item <= 3) {
       if(mouseX > 50 && mouseX < 140 && mouseY > height/2+80 && mouseY < 470 && !shovel_f) {     
         shovel_f = true;
         count_item ++;
       }
       if(mouseX > 150 && mouseX < 190 && mouseY > height/2+80 && mouseY < 470 && !seeds_f) {
         seeds_f = true;
         count_item ++;
        }
       if(mouseX > 200 && mouseX < 310 && mouseY > height/2+80 && mouseY < 470 && !hay_f) {
         hay_f = true;
         count_item ++;
       }
       if(mouseX > 320 && mouseX < 420 && mouseY > height/2+80 && mouseY < 470 && !bananas_f) {
         bananas_f = true;
         count_item ++;
        }
       if(mouseX > 430 && mouseX < 510 && mouseY > height/2+80 && mouseY < 470 && !coat_f) {
         coat_f = true;
         count_item ++;
        }
       if(mouseX > 520 && mouseX < 600 && mouseY > height/2+80 && mouseY < 470 && !spoon_f) {
         spoon_f = true;
          count_item ++;
       }
       
    }
  }
  if(mouseX > 620 && mouseX < 640 && mouseY > 460 && mouseY < 480) {
    page = 0;
    count_item = 0;
    time = 0;
    shovel_f = false;
    seeds_f = false;    
    hay_f = false;
    bananas_f = false;
    coat_f = false; 
    spoon_f = false;  
    jump_key = 0;
    time = 0;
    door_key = 0;
    jump_y_pressed = 1;              // jump
    jump_easing_pressed = 0.1;
    targetY_jump_pressed = 100;
    key_pressed = false;
    jump_off_pg = false;
  }
  if(page == 0) {
    if(mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height/2+150 && mouseY < height/2+250) {
      jump_key = 1;
      time = millis();
    }
  } 
  if(page == 2) {
    if(mouseX > width/2-30 && mouseX < width/2+30 && mouseY > height/2+40 && mouseY < height/2+150) {
      door_key = 1;
      jump_key = 1;
    }
  }
  if(page == 8) {
    if(mouseX > 60 && mouseX < 150 && mouseY > height/2 && mouseY < height-50) {
      input = 3;
    } else if(mouseX > 100 && mouseX < 250 && mouseY > 100 && mouseY < 200) {
      input =4;
    } else if(mouseX > width/2+100 && mouseX < width/2+300 && mouseY > height/2+50 && mouseY < height/2+180) {
      input =5;
    }
  }
}



