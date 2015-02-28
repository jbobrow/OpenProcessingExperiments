
/* @pjs preload="cat0.jpg, dog0.jpg, animal0.jpg,animal1.jpg animal2.jpg, animal3.jpg, animal4.jpg, animal5.jpg, animal6.jpg, animal7.jpg, animal8.jpg, animal9.jpg, animal10.jpg, animal11.jpg"; */
PImage dog;
PImage cat;
int maxImages = 12; // Total # of images
 // Initial image to be displayed is the first
int timer = 0;
PImage[] images = new PImage[maxImages];
int frame = 0;


void setup() {
  size(600, 450);
    dog = loadImage( "dog0.jpg");
    cat = loadImage( "cat0.jpg");
for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "animal" + i + ".jpg" );
    frameRate(5);

}
}

void draw(){
  
  
    
 background(0);
   timer += 1;
if (timer >= 0 && timer < 25){
 image(dog, 0,0, 300,450);
 image(cat, 300,0, 300,450);
stroke(255,255,255);
fill(255,255,255);
 textAlign(CENTER);
 textSize(30);
 text("DOGS and CATS",296,200);
 text("Home Alone",300,225);
}
  if (timer >= 25 && timer < 70){
    image(images[0],0,0,600,450);
    textAlign(LEFT);
    textSize(15);
    String s = "Hey cat! Lets do something. Wanna play frisbee? How about I chase you?!? Or let's play hide and seek?!? OR LET'S FIND TREASURE!! OOOH CAN WE!?!?"; 
      text(s,10, 10, 130, 300);
    }
    
    if (timer >= 70 && timer <115){
      image(images[1],0,0,600,450);
      textSize(15);
      String s = "I know where treasure is. Check in the compartment where the humans store their waste wiping products. Go now.";
      text(s, 10,10, 100,250);
    }

     if (timer >= 115 && timer <140){
       image(images[2],0,0,600,450);
       textSize(15);
       fill(0);
       text("There's no treasure here.", 140, 100, 100, 200);
     }
     
     if (timer >= 140 && timer <170){
       fill(255,255,255);
       image(images[3],0,0,600,450);
       textSize(15);
       text("hehehehe! Stupid dog!", 70, 270, 100, 200);
     }
    if (timer >= 170 && timer <210){
       image(images[4],0,0,600,450);
       textSize(15);
       String s = "Dogs are supposed to be energetic! Yet you mope around like a lazy bum. I would ask you to chase me if you weren't such a coward!! You disgust me!";
       text(s, 10, 100, 153, 300);
     }
    // increment image index by one each cycle
    // use modulo " % "to return to 0 once the end of the array is reached

  
    if (timer >= 210 && timer <250){
       image(images[5],0,0,600,450);
       textSize(15);
       fill(0);
       String s = "I would be chasing you if you didn't have that spider behind you. You're not afraid of spiders are you?";
       text(s, 480, 30, 120, 200);
     }
 if (timer >= 250 && timer <280){
       image(images[6],0,0,600,500);
       textSize(15);
       fill(255,255,255);
       String s = "N- No. Just tell me when its gone.";
       text(s, 100, 120, 150, 200);
     }
     
      if (timer >= 280 && timer <310){
       image(images[7],0,0,600,500);
       textSize(15);
       fill(0);
       String s = "hahahaha!! And he called ME the scaredy cat!?!";
       text(s, 100, 120, 100, 200);
     }
 if (timer >= 310 && timer <350){
       fill(255,255,255);
       image(images[8],0,0,600,450);
       textSize(15);
       text("MMmmmm!! oh yeah. This is soo good!! mm-mmhm-MMHMM!!!", 250, 400, 400, 200);
     }
     
     if (timer >= 350 && timer <395){
       fill(0);
       image(images[9],0,0,600,450);
       textSize(15);
       text("That DOES look sooooo good!", 20,20,100,100);
       text("TELL me about it!", 190, 50,100,100);
       text("The look of it alone is making me hungry", 300, 50,200,100);
       text("LET'S GO GET SOME!", 460, 120, 100, 100);
     }
     
      if (timer >= 395 && timer <430){
       fill(255,255,255);
       image(images[10],0,0,600,450);
       textSize(15);
       text("One step closer and i'll blast every last one of you all the way to Ms. Cruella D'evil herself!", 200,200,400,200);
     }
     if (timer >= 430 && timer <490){
       fill(255,255,255);
       image(images[11],0,0,600,450);
       textSize(15);
       text(".................Ever wonder what other cats and dogs do in their houses?", 20,20,300,100);
       text(" No. Not Really.", 250,320,100,100);
     }
     if (timer >= 490 && timer<900){
    textAlign(CENTER);
     textSize(50);
     text("THE END",300,200);
     }
  }

   
    // increment image index by one each cycle
    // use modulo " % "to return to 0 once the end of the array is reached





