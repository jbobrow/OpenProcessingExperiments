
//UCLA SUMMER 2012
//by Elaine Zhao

//--------------------------variable------------------------------
PImage squirrel1;//the squirrel sitting on the tree
PImage squirrel2;//the squirrel normal
PImage squirrel3;//the squirrel falling
PImage squirrel4;//the squirrel shocked
PImage tree;
PImage arm;
PImage branch;
PImage cone;
PImage leaves;
PImage grass;
PImage cactus;
PFont font;
int time;
//---------------------variable for motion-------------------------
float squirrelY1 = 100;
float squirrelY2 = 165;
float angle = 0;
float angleCone1 = 0;
float scalarCone1 = 0.3;
float angleArm;
float scalarArm = 0.3;
float angleCone2 = 0;
float scalarCone2 = 0.5;
float angleSqui1 = -PI * 3 / 4;
float angleSqui2 = 0;
float angleSqui3 = 0;
float scalarSqui1 = 1.0;
float scalarSqui2 = 0.2;

float coneY = 0;
float grassY = 145;
Boolean grassFall = false;

void setup() {
  size(600, 300);
  smooth();
  imageMode(CORNER);

  //load all images
  squirrel1 = loadImage("squirrel-1.png");
  squirrel2 = loadImage("squirrel-2.png");
  squirrel3 = loadImage("squirrel-3.png");
  squirrel4 = loadImage("squirrel-4.png");
  tree = loadImage("tree.png");
  arm = loadImage("squirrel-arm.png");
  branch = loadImage("branch.png");
  cone = loadImage("cone.png");
  leaves = loadImage("leaves.png");
  grass = loadImage("grass.png");
  cactus = loadImage("cactus.png");
  //load font
  font = loadFont("MVBoli-36.vlw");
  //set font
  textFont(font);
}

void draw() {
  time++;
  background(0);
  //----------------------Scene1: see the cone-------------------------
  if (time <=120) {
    image(tree,0,0);
    
    angle += 0.25;
    float scalarY = 5;
    squirrelY1 = 105 + sin(angle) * scalarY;
    image(squirrel1,143,squirrelY1);
    
    angleCone1 += 0.1; 
    pushMatrix();
    translate(490,90);
    rotate(sin(angleCone1)*scalarCone1);
    image(cone, -30, -5, 60, 70);
    popMatrix();
    image(branch, 370, 20, 370, 70);
    text("Wow!",400,230);
    
  }else if(time > 120 && time <= 260){
    
    //----------------------Scene2: get the cone-------------------------
    angleArm = map(mouseX,0,600,-2,0);
    image(branch, 195, 30);
    pushMatrix();
    translate(-50,210);
    rotate(angleArm);
    image(arm,-30,0);
    popMatrix();
    
    pushMatrix();
    translate(340,130);
    angleCone2 += 0.13;
    rotate(sin(angleCone2) * scalarCone2);
    image(cone,-55,-10);
    popMatrix();
    
    textSize(24);
    text("Move your mouse to get it!",20,40);
    textSize(32);
    
  }else if(time > 260 && time <= 315){
    
    //----------------------Scene3: start to fall-------------------------
    image(branch, 195, 30);
    pushMatrix();
    translate(340,130);
    angleCone2 += 0.15;
    rotate(sin(angleCone2) * scalarCone2);
    image(cone,-55,-10);
    popMatrix();
    
    pushMatrix();
    translate(0,300);
    angleSqui1 += 0.1;
    rotate(angleSqui1);
    image(squirrel2,-300,-150);
    popMatrix();
    
    text("Oh!!!",450,230);
    
  }else if(time > 315 && time <= 350){
    //----------------------Scene4: falling-------------------------
    image(leaves,0,0);
        
    pushMatrix();
    translate(300,150);
    rotate(angleSqui2);
    scale(scalarSqui1);
    image(squirrel3,-124,-143);
    angleSqui2 += 0.05;
    scalarSqui1 -=0.01;
    popMatrix();
    
    pushMatrix();
    translate(420,10);
    rotate(-PI / 6);
    image(branch,0,0,370,87);
    popMatrix();
    
    pushMatrix();
    translate(340,170);
    rotate(PI / 5);
    image(branch,0,0,370,87);
    popMatrix();
    
    pushMatrix();
    translate(220,130);
    rotate(PI);
    image(branch,0,0);
    popMatrix();
    
    text("Ah----",430,170);
  
  }else if(time > 250 && time <= 380){
    
    //----------------------Scene5: landing-------------------------
    image(grass,90,145);
    
    image(squirrel2,-20,squirrelY2,300,123);
    if(squirrelY2 <= 185){
      squirrelY2 += 2;
    }
    
    pushMatrix();
    translate(200,150);
    rotate(PI * 6 / 7);
    image(branch,0,0,240,56);
    popMatrix();
    
    text("Well...",430,60);
    
  }else if(time > 380 && time <= 430){
    
    //----------------------Scene5: cone falling-------------------------
    image(grass,90,grassY);
    image(cone,410,coneY,50,60);
    pushMatrix();
    translate(200,150);
    rotate(PI * 6 / 7);
    image(branch,0,0,240,56);
    popMatrix();
    
    if(coneY <= 220){
      coneY += 5;
    }
    if(coneY == 220){
      grassFall = true;
    }
    if(grassFall == true && grassY <= 165){
      grassY += 3;
      image(grass,90,grassY);
    }
    if(grassY >= 165){
      image(cactus,181,229);
    }
    image(squirrel2,-20,186,300,123);
    
    text("Hm...wait!",30,60);
    
  }else if(time > 430 && time < 490){
    
    //----------------------Scene6: shocked-------------------------
    image(grass,90,grassY);
    image(cone,410,220,50,60);
    image(cactus,181,229);
    pushMatrix();
    translate(100,150);
    rotate(PI * 9 / 7);
    image(branch,0,0,240,56);
    popMatrix();
    
    pushMatrix();
    translate(150,135);
    scalarSqui2 = sin(angleSqui2) * 0.1;
    scale(1 + scalarSqui2);
    angleSqui2 += 1.4;
    image(squirrel4,-110,-130);
    popMatrix();
    
    text("Oh!!!!!",400,70);
    
  }else if(time == 490){
    time = 0;
    
     squirrelY1 = 100;
     squirrelY2 = 165;
     angle = 0;
     angleCone1 = 0;
     scalarCone1 = 0.3;
     scalarArm = 0.3;
     angleCone2 = 0;
     scalarCone2 = 0.5;
     angleSqui1 = -PI * 3 / 4;
     angleSqui2 = 0;
     angleSqui3 = 0;
     scalarSqui1 = 1.0;
     scalarSqui2 = 0.2;

  }
  
}

