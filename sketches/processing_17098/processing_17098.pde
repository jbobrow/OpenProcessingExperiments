
import processing.opengl.*;



int plat = 8;
float rot = 0;
float rotX = 0;
float pX = 0;
float pY = -15 ;
float pZ = -10;
float pRot = 0;
float pRotX = 0;
float grav;
boolean pressed = false;
//distance
float d;
PFont font;
//variables for where the hole is
int hx;
int hz;
//variable for switch
int n = 0;
//for the patch the case 0/case 1 glitch
int m = 0;
//for falling
boolean fall = false;


//array's for the demensions of the platforms
int[] x = new int[plat];
int[] x1 = new int[plat];
int[] w = new int[plat];
int[] w1 = new int[plat];

void setup() {
  size(850,500,OPENGL);
font = loadFont("KinoMT.vlw");
  

    
}

void draw(){
    background(107,173,255);
  fill(0);
  textFont(font, 30); 
text("MARBLE WORLD", 10, 30);

switch(n) {
  //menu
  case 0:
  fill(107,173,255);
  rect(0,0,500,50);
  fill(0);
    textFont(font, 50); 
text("MARBLE WORLD", 300, 50);
  textFont(font, 27); 
text("Instructions", 10, 60);
  textFont(font, 20); 
text("Up arrow to roll ball toward you", 10, 80);
text("Down arrow to roll ball away from you", 10, 100);
text("Right arrow to roll ball left" , 10, 120);
text("Left arrow to roll ball right" , 10, 140);
text("Roll to the hole to begin" , 10, 160);
text("Don't fall off" , 10, 180);
      break;

  //level 1
  case 1:
text("LEVEL 1: The Basics", 600, 30);
    break;

//level 2
case 2:
text("LEVEL 2: Off Center", 600, 30);
    break;

//level 3
case 3:
text("LEVEL 3: To The Side", 600, 30);
    break;
    
    //level 4
    case 4:
    text("LEVEL 4: A Turn", 600, 30);
    break;
    
       //level 5
    case 5:
    text("LEVEL 5: A Turn and A Push", 540, 30);
    break;
    
       //level 6
    case 6:
    text("LEVEL 6: A Turn Back", 600, 30);
    break;
    
    //level 7
    case 7:
    text("LEVEL 7: The Loop", 600, 30);
    break;

}

  //setting up the values for the four arrays and using a switch to move between different sets
  
  switch(n) {
    case 0:
     //x
  x[0] = -1500;

  
  //x1
  x1[0] = -2 * x[0];

   
  //w
  w[0] = -500;

   
  //w1
  w1[0] = -w[0] + 400;
        break;

//level 1
    case 1:
    //will this fix the pY problem?
    switch(m){
    case 0:
    pY = -15;
    m = 1;
    break;
    case 1:
    pY = pY;
    break;
    }
    
  //x
  x[0] = -75;
  x[1] = -200;
  x[2] = -75;
  
  //x1
  x1[0] = -2 * x[0];
 x1[1] = -2 * x[1];
   x1[2] = -2 * x[2];
   
  //w
  w[0] = -100;
    w[1] = -300;
   w[2] = -400;
   
  //w1
  w1[0] = -w[0];
    w1[1] = 200;
    w1[2] = 100;
        break;

    //level 2
    case 2:
    //x
  x[0] = -75;
  x[1] = -200;
  x[2] = -75;
  
  //x1
  x1[0] = -2 * x[0];
 x1[1] = -2 * x[1];
   x1[2] = -2 * x[2];
   
  //w
  w[0] = -100;
    w[1] = -300;
   w[2] = -400;
   
  //w1
  w1[0] = -w[0];
    w1[1] = 200;
    w1[2] = 100;
        break;

    //level 3
    case 3:
        //x
  x[0] = -75;
  x[1] = -200;
  x[2] = -75;
  
  //x1
  x1[0] = -2 * x[0];
 x1[1] = -2 * x[1];
   x1[2] = -2 * x[2];
   
  //w
  w[0] = -100;
    w[1] = -300;
   w[2] = -400;
   
  //w1
  w1[0] = -w[0];
    w1[1] = 200;
    w1[2] = 100;
        break;

 //level 4
    case 4:
        //x
  x[0] = -75;
  x[1] = -200;

  
  //x1
  x1[0] = -2 * x[0];
 x1[1] = -x[1] + -x[0];

   
  //w
  w[0] = -600;
    w[1] = -800;

   
  //w1
  w1[0] = -w[0];
    w1[1] = 200;
        break;
        
         //level 5
    case 5:
        //x
  x[0] = -75;
  x[1] = -200;
  x[2] = -200;

  
  //x1
  x1[0] = -2 * x[0];
 x1[1] = -x[1] + -x[0];
  x1[2] = 100;

   
  //w
  w[0] = -600;
    w[1] = -800;
 w[2] = -1000;
   
  //w1
  w1[0] = -w[0];
    w1[1] = 200;
     w1[2] = 200;
        break;
        
            //level 6
    case 6:
        //x
  x[0] = -75;
  x[1] = -400;
  x[2] = -400;

  
  //x1
  x1[0] = -2 * x[0];
 x1[1] = -x[1] + -x[0];
  x1[2] = 150;

   
  //w
  w[0] = -600;
    w[1] = -800;
 w[2] = -600;
   
  //w1
  w1[0] = -w[0];
    w1[1] = 200;
     w1[2] = 200;
        break;
        
        //level 7
            case 7:
        //x
  x[0] = -75;
  x[1] = -500;
  x[2] = -500;
  x[3] = -500;
x[4] = 500;
x[5] = -200;
x[6] = -200;
  
  //x1
  x1[0] = -2 * x[0];
 x1[1] = -x[1] + -x[0];
  x1[2] = 150;
  x1[3] = (-2 * x[3]) + 150;
     x1[4] = 150;
      x1[5] = 700;
      x1[6] = 150;
     
  //w
  w[0] = -100;
    w[1] = -250;
 w[2] = -800;
  w[3] = -950;
  w[4] = -800;
  w[5] = -500;
  w[6] = -650;
   
  //w1
  w1[0] = -w[0];
    w1[1] = 150;
     w1[2] = 550;
     w1[3] = 150;
     w1[4] = 450;
       w1[5] = 150;
       w1[6] = 150;
        break;
  }
    
    
pushMatrix();
    translate(width/2,height/2+height/4,0);
  rotateX(49.9);
   rotateX(rotX);
   rotateZ(rot);
   ball(pX,pY,pZ);
   pX = pX + grav * (rot +  pRot);
   pZ = pZ - grav * (rotX + pRotX);
   
   //the platforms and using a switch to move between diferent sets
     switch(n) {
       //menu
    case 0:
      plane(x[0],0,w[0],x1[0],w1[0]);
        break;

    //level 1
    case 1:
  plane(x[0],0,w[0],x1[0],w1[0]);
   plane(x[1],0,w[1],x1[1],w1[1]);
   plane(x[2],0,w[2],x1[2],w1[2]);
       break;

   //level 2
   case 2:
    plane(x[0],0,w[0],x1[0],w1[0]);
   plane(x[1],0,w[1],x1[1],w1[1]);
   plane(x[2],0,w[2],x1[2],w1[2]);
       break;

   //level 3
   case 3:
   plane(x[0],0,w[0],x1[0],w1[0]);
   plane(x[1],0,w[1],x1[1],w1[1]);
   plane(x[2],0,w[2],x1[2],w1[2]);
       break;

 //level 4
   case 4:
   plane(x[0],0,w[0],x1[0],w1[0]);
   plane(x[1],0,w[1],x1[1],w1[1]);
       break;
       
          //level 5
   case 5:
   plane(x[0],0,w[0],x1[0],w1[0]);
   plane(x[1],0,w[1],x1[1],w1[1]);
   plane(x[2],0,w[2],x1[2],w1[2]);
       break;
       
              //level 6
   case 6:
   plane(x[0],0,w[0],x1[0],w1[0]);
   plane(x[1],0,w[1],x1[1],w1[1]);
   plane(x[2],0,w[2],x1[2],w1[2]);
       break;
       
                    //level 7
   case 7:
   plane(x[0],0,w[0],x1[0],w1[0]);
   plane(x[1],0,w[1],x1[1],w1[1]);
   plane(x[2],0,w[2],x1[2],w1[2]);
     plane(x[3],0,w[3],x1[3],w1[3]);
       plane(x[4],0,w[4],x1[4],w1[4]);
        plane(x[5],0,w[5],x1[5],w1[5]);
        plane(x[6],0,w[6],x1[6],w1[6]);
       break;
     }
     
     
   
     //switches to change the values of where the hole is 
     switch(n) {
       //menu
    case 0:
    hx = 0;
hz = -350;
        break;

    //level 1
    case 1:
hx = 0;
hz = -300;
    break;

//level 2
case 2:
hx = 30;
hz = -250;
    break;

//level 3
case 3:
hx = -150;
hz = -150;
    break;
    
    //level 4
case 4:
hx = -150;
hz = -700;
    break;
    
        //level 5
case 5:
hx = -150;
hz = -900;
    break;
    
            //level 6
case 6:
hx = -350;
hz = -500;
    break;

      //level 7
case 7:
hx = -130;
hz = -530;
    break;

       }
       
       //the goal hole
       hole(hx,-21,hz); 
//if pX and pZ get close enough to it the level switches     

 d = dist(pX, pY, pZ, hx,-21,hz);
 if(d<20){
    
    pX = 0;
pZ = -10;
println(pY);


rot = 0;
rotX =0;

    n+=1;
 }
 
 popMatrix();
  
  //to set the pRot's back to 0 (friction)
  if(pRot > 0 && rot == 0){
    pRot-=.0005;
}

  else if(pRot < 0 && rot == 0){
    pRot+=.0005;
} 

  if(pRotX > 0 && rotX == 0){
    pRotX-=.0005;
}

  else if(pRotX < 0 && rotX == 0){
    pRotX+=.0005;
  } 
  
  //gravity
  if(pressed==true){
    grav = 3;
    if(grav < 3.3 && rot != 0){
      grav+=.005;
    }  
    pressed = false;
  }
  
    //to make the ball fall
    //a switch is used to move between diferent sets
    
    switch(n) {
      //menu
      case 0:
          break;

      //level 1
      case 1:
    //plane0
  if(pZ >= w[0] && pX < x[0] || pZ >= w[0] && pX > x[0] + x1[0] || pZ > w[0] + w1[0]){
    pY = pY+30;
  }
  
   //plane1
  else if(pZ >= w[1]  && pX < x[1] || pZ >= w[1] && pX > x[1] + x1[1]){
    pY = pY+30;
  }
  
  //plane2
  else if(pZ > w[2] && pZ <= w[1] &&  pX < x[2] || pZ > w[2] && pZ <= w[1] && pX > x[2] + x1[2] || pZ <= w[2]+40){
    pY = pY+30;
  }
      break;

  //level 2
  case 2:
     //plane0
  if(pZ >= w[0] && pX < x[0] || pZ >= w[0] && pX > x[0] + x1[0] || pZ > w[0] + w1[0]){
    pY = pY+30;
  }
  
   //plane1
  else if(pZ >= w[1]  && pX < x[1] || pZ >= w[1] && pX > x[1] + x1[1]){
    pY = pY+30;
  }
  
  //plane2
  else if(pZ > w[2] && pZ <= w[1] &&  pX < x[2] || pZ > w[2] && pZ <= w[1] && pX > x[2] + x1[2] || pZ <= w[2]+40){
    pY = pY+30;
  }
      break;

    //level 3
    case 3:
         //plane0
  if(pZ >= w[0] && pX < x[0] || pZ >= w[0] && pX > x[0] + x1[0] || pZ > w[0] + w1[0]){
    pY = pY+30;
  }
  
   //plane1
  else if(pZ >= w[1]  && pX < x[1] || pZ >= w[1] && pX > x[1] + x1[1]){
    pY = pY+30;
  }
  
  //plane2
  else if(pZ > w[2] && pZ <= w[1] &&  pX < x[2] || pZ > w[2] && pZ <= w[1] && pX > x[2] + x1[2] || pZ <= w[2] + 40){
    pY = pY+30;
    }
    break;
    
        //level 4
    case 4:
         //plane0
  if(pZ >= w[0] && pX < x[0] || pZ >= w[0] && pX > x[0] + x1[0] || pZ > w[0] + w1[0]){
    pY = pY+30;
  }
  
   //plane1
  else if(pZ >= w[1]  && pX < x[1] || pZ >= w[1] && pX > x[1] + x1[1] || pZ <= w[1]){
    pY = pY+30;
  }

    break;
    
     //level 5
    case 5:
         //plane0
  if(pZ >= w[0] && pX < x[0] || pZ >= w[0] && pX > x[0] + x1[0] || pZ > w[0] + w1[0]){
    pY = pY+30;
  }
  
   //plane1
  else if(pZ >= w[1]  && pX < x[1] || pZ >= w[1] && pX > x[1] + x1[1]){
    pY = pY+30;
  }
  
  //plane2
  else if(pZ > w[2] && pZ <= w[1] &&  pX < x[2]  || pZ > w[2] && pZ <= w[1] && pX > x[2] + x1[2] || pZ <= w[2] + 40){
    pY = pY+30;
    }
    break;
    
     //level 6
    case 6:
         //plane0
  if(pZ >= w[0] && pX < x[0] && pX > x[0] - 20|| pZ >= w[0] && pX > x[0] + x1[0] && pX < x[0] + x1[0] +20 || pZ > w[0] + w1[0]){
    pY = pY+30;
  }
  
   //plane1
  else if(pZ >= w[1]  && pX < x[1] || pZ >= w[1] && pX > x[1] + x1[1] || pZ <= w[1] + 40){
    pY = pY+30;
  }
  
  //plane2
  else if(pZ > w[2] && pZ <= w[1] &&  pX < x[2] || pZ > w[2] && pX <= x[0] && pX > x[2] + x1[2] || pZ > w[2] + w1[2] && pX > x[2] - 20 && pX < x[2] + x1[2] + 20){
    pY = pY+30;
    }
    break;
    
      //level 7
    case 7:
         //plane0
  if(pZ >= w[0] && pX < x[0]|| pZ >= w[0] && pX > x[0] + x1[0]|| pZ > w[0] + w1[0]){
    pY = pY+30;
  }
  
   //plane1
  else if(pZ >= w[1]  && pX < x[1] || pZ >= w[1] && pX > x[1] + x1[1]){
    pY = pY+30;
  }
  
  //plane2
  else if(pZ <= w[2] +w1[2]  && pX < x[2] || pZ <= w[2] +w1[2] && pX > x[2] + x1[2] && pX < x[6] && pZ>= w[3] +w1[3]){
    pY = pY+30;
    }

    
    //plane3
  else if( pZ <= w[3] + 40){
    pY = pY+30;
    }
    
       //plane4
  else if(pX <= x[4] && pX>=x[6] +x1[6] && pZ>= w[3] + w1[3] && pZ<=w[5]  || pX >= x[4] + x1[4] || pZ >= w[4] + w1[4] && pX > x[2] + x1[2] && pZ < w[1]){
    pY = pY+30;
    }
    
    //plane5

//plane6
else if(pZ<=w[6] && pZ>=w[3] + w1[3] && pX>= x[2] + x1[2] && pX <= x[4]){
      pY = pY+30;
}
    
    
    break;
  }
  
  //to restart level
  if(pY>=0){
    fall = true;
      textFont(font, 30); 
text("Try Again?", 365, 200);
text("Press Y or N", 355, 230);

  }
}

void plane(int l, int h, int w, int l1, int w1){
 noStroke();
    fill(100,240,120);
  //front
  pushMatrix();
  beginShape();
  vertex(l,h,w+w1);
  vertex(l+l1,h,w+w1);
  vertex(l+l1,h+20,w+w1);
  vertex(l,h+20,w+w1);
  endShape();
  popMatrix();
  
  //left
     pushMatrix();
  beginShape();
  vertex(l,h,w+w1);
  vertex(l,h,w);
  vertex(l,h+20,w);
  vertex(l,h+20,w+w1);
  endShape();
  popMatrix();
  
  //right
   pushMatrix();
  beginShape();
  vertex(l+l1,h,w+w1);
  vertex(l+l1,h,w);
  vertex(l+l1,h+20,w);
  vertex(l+l1,h+20,w+w1);
  endShape();
  popMatrix();
  
  fill(145,240,133);
  //top
   pushMatrix();
  beginShape();
  vertex(l,h,w+w1);
  vertex(l+l1,h,w+w1);
  vertex(l+l1,h,w);
  vertex(l,h,w);
  endShape();
  popMatrix();
  
}

void keyPressed(){

  if (keyCode == LEFT && rot != -.2){
    pRot = rot;
    rot-=.1;

  }
  
   if (keyCode == RIGHT && rot != .2){
       pRot = rot;
    rot+=.1;
  
  }
    if (keyCode == UP && rotX != -.2){
        pRotX = rotX;
    rotX-=.1;
  
  }
  
   if (keyCode == DOWN && rotX != .2){
       pRotX = rotX;
    rotX+=.1;
  }
  
  //to restart level or go to menu
  if(fall==true){
    
  if(key == 'y'){
        pX = 0;
pZ = -10;
pY = -15;

rot = 0;
rotX =0;
fall = false;
  }
  
  else if(key == 'n'){
          pX = 0;
pZ = -10;
pY = -15;

rot = 0;
rotX =0;

//send back to menu
n = 0;

fall = false;
  }
  }
    
    
    pressed = true;
}

void ball(float x, float y, float z){
    pushMatrix();
    stroke(0);
    fill(255);
  translate(x,y,z);
  sphere(8);
  popMatrix();
}

void hole(int x1, int y1, int z1){
  pushMatrix();
  fill(0);
  translate(x1, 0, z1);
  rotateX(1.5);
  ellipse(0, y1, 25, 25);
  popMatrix();
  }


