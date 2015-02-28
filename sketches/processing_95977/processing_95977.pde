
 /*
 I thought if this program right before I went to sleep.  I decided it would be pretty
 if i could make fireworks.  Also, due to the relative shape simplicity, I wouldn't have any
 issues with art.  It only took around two and a half hours to code as well, so it was a 
 very reaasonable project. Getting the color of the ground took a bit more time.
 */
//set variables for height and width of the screen
  int w, h;
  
  //set the mouse point variables
  float mx, my;
  
  //set the firing variable
  boolean fire = true;
  
  //this variable controls the firework display
  boolean exp = false;
  
  //this variable controls the explosion
  boolean boom = false;
  
  //declare the firework color variables
  float R, G, B;
  
  //create a chance variable for extra fun
  float chance;
  
  
//create the firework cannon object
Cannon cannon = new Cannon();

//create fireworks
Firework firework = new Firework();

//create the firey bits
Firebits[] firebits = new Firebits[120];

void setup() {
  smooth();
  //set height and width to 800 by 600
  w = 800;
  h = 600;  
  size(w,h);
  //this makes the screen resizeable!
//  if ( frame != null) {
//    frame.setResizable(true);
//  }
  
  //initialize the fire
  for(int i = 0; i < 119; i++) {
    firebits[i] = new Firebits();
  }
      //initialize the firework's color
      R = random(80,250);
      G = random(80,250);
      B = random(80,250);
      //initialize the chance
      chance = random(0,100);
}

//this section triggers the firing event
void mousePressed() {
  if(fire == true) {
     exp = true;
     //sets the target
     mx = mouseX;
     my = mouseY;
     
    //set the position to the designated explosion point and trajectory away from the point
    for(int i = 0; i < 119; i ++) {
    firebits[i].posx = mx;
    firebits[i].posy = my;
    firebits[i].traj = random(0,360);
    
    }
     
     //must click twice to fire again (reload time, also makes things run smoother)
     fire = false;
    }else if(fire == false) {
      fire = true;
      boom = false;
      //changes the color for each firework
      R = random(80,250);
      G = random(80,250);
      B = random(80,250);
      chance = random(0,100);
    }  
    
}






void draw() {
  //draw the sky
  fill(0,20);
  rectMode(CORNER);
  rect(0,0, width, height - height/8);
  
  
  //this tells the firework it's ready to explode
  if(firework.posY <= my && exp == true) {
      boom = true;
    }
  
  //sets the speed of one so i can keep track of the explosion's radius
  firebits[100].speed = 4;
  
  //stop the explosion
  if(dist(firebits[100].posx,firebits[100].posy,mx,my) >= 200) {
    boom = false;
  }
  
  //display the fire!
  if(boom == true) {
  for(int i = 0; i < 119; i++) {
  firebits[i].display();
   }
  }
  
  //draw the ground
  fill(11,40,14);
  rect(0,height - height/8,width,height/8);
  
  //display the firework
  firework.display();
  

  
  //display the firework cannon
  cannon.display();
  
}



class Cannon {
  
  //set the variables
  int posx, posy, he, wi;
  
  //finds the angle to the mouse
 float mouseAngle;
 
  //constructor (must be empty due to the variability in size and position)
  Cannon() {
  }
  
  
  void display() {
    
    //set the variable variables
   posx = width/2;
   posy = height - height/10;
   he = height/25;
   wi = width/20;
   mouseAngle = atan2(posy - mouseY, posx - mouseX) + (.5 * PI);
   
   //the translate and rotate allow the cannon to follow the mouse
   translate(posx,posy + 7);
   rotate(mouseAngle);
   
   //draw the cannon
   rectMode(CENTER);
   stroke(0);
   fill(117,117,117);
   rect(0,0,he,wi);
   
  }
  
 
 
 
 
  
  
  
  
  
  
  
}
class Firebits {
  
  //initialize the size, color, speed, and position variables
  float posx, posy, r, speed; 
  
  //angle of trajectory!
  float traj;
  
  Firebits() {
    speed = random(2,6);
    r = width/50;
  }
  
  
  void display() {
      if(boom == true) {
        if(chance <=10) {
      posx -= cos(traj + random(1,3)) * speed;
      posy -= sin(traj + random(1,3)) * speed;
        }
      posx -= cos(traj) * speed;
      posy -= sin(traj) * speed;
      
      ellipseMode(CENTER);
      noStroke();
      fill(R,G,B);
      ellipse(posx,posy,r,r);
      }
    
  }
  
  
  
  
}
class Firework {
  //declare the shape and position variables
  float posX, posY, r;
  //variables for motion
  float fangle;
  int speed;
  
  //constructor 
  Firework() {
    speed = 8;
    posX = width/2;
    posY = height - height/10;
  }
  
  void display() {
    //set the radius or the firework
    r = width/30;
    
    
    //this stops the ball when it gets to the explosion point
    if(posY < my) {
      exp = false;
    }
    //this resets the ball
    if(exp == false) {
      posX = width/2;
      posY = height - height/10;
    }
    
    //this moves the ball to the explosion point
    if(exp == true) {
     fangle = atan2(cannon.posy - my, cannon.posx - mx);
     posX -= cos(fangle) * (speed + (width/100 - 8));
     posY -= sin(fangle) * (speed + (width/100 - 8));
     fire = false;
     
     //draw the firework (only displays if exp is true)
    ellipseMode(CENTER);
    noStroke();
    fill(255,120,0);
    ellipse(posX,posY,r,r);
    }
    
    
  }
  
  
  
  
  
  
}


