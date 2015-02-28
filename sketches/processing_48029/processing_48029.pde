

color dusk = color(9,20,70);//the sky color
color morning = color(66,200,220);// an optianal sky color

int Stars =40;// the number of stars

float windowsPerBuilding = 12;//the number of windows per building


float[] rand = new float[int(windowsPerBuilding)];//don't change this stuff < V
int timer =0;
float parralax =mouseX -width/2;

float[] pox = new float[Stars];
float[] poy = new float[Stars];
float[] rov = new float[Stars];


void setup() {
  size(800,500);

  for(int i=0; i<Stars; i ++) {
    pox[i] = random((width/Stars)*(i-1),(width/Stars)*i);
    poy[i] = random(height);
    rov[i] = random(360);
  }
  for(int i=0; i<windowsPerBuilding; i++) {
    rand[i] =int(random(0,195));
  }
  //the optianl smooth function
 // smooth();
}


//
// DRAW FUNCTION

void draw() {
  parralax =mouseX -width/2;
  windowsPerBuilding =constrain(windowsPerBuilding,0,13);
  background(0);
  sky(dusk);// just add the sky color( dusk or morning )
  stars(Stars);// just add the number stars
  noCursor();
  moon(100+parralax/25,50);// the two values are an x and y position
  
  translate(0,100);
  // the first value is the x position, 2nd is y, 3rd is the type of building it is (0 through 4)
  building(300+parralax/7,340,2);
  building(500 +parralax/7,350,2);
  building(-100 +parralax/7,400,1);
  building(200+parralax/7, 350,3);
  building(800+parralax/7, 400,4);
  building(parralax/7+100, 350, 1);
  building(420+parralax/7, 400,3);
  
  building(-50+parralax/6,370,4);
  building(100+parralax/6,380,3);
  building(700+parralax/6,400,2);
  building(600 +parralax/6,380,1);
  building(200 +parralax/6,410,1);
  
  building(400 +parralax/5,400,4);
  building(600 +parralax/5,400,0);
  
  building(0+parralax/4,400,0);
  building(800+parralax/4, 450,0);
  building(600+parralax/4, 460,3);
  building(680+parralax/4, 470,0);
  building(500+parralax/4, 460,0);
  building(340+parralax/4, 450,0);
  building(200+parralax/4, 460,2);
  
  
  grass(200+parralax/2,450,400,200);
  grass(500+parralax/2,450,400,150);
  grass(360+parralax/2,400,300,150);
  grass(-100+parralax/2, 550, 400,500);
  grass(700 +parralax/2, 440, 200,100);
  grass(900 +parralax/2, 460, 300,250);
  for(int hi=0; hi<10; hi++){
  //  grass(100*hi-100, hi%2-1, 400,100*(hi%2)-1+400);
  }
}

void minutes(int amount) {// unimportant as of now
  if(timer <= frameRate*amount) timer++;
  else timer =0;
}
//  XXXX  X       X  XxxX  XXXX  XXXXX XXXX
//  X  X  XXX     X  XXXX  X       X   X
//  X  X  X X  X  X  X  _  X       X   XXXX
//  XXXX  XXX  XXXX  XXXX  XXXX    X   ___X

// the sky
void sky(color Sky) {

  color setSky = color(Sky);

  for(int i=0; i<height; i+=1) {
    float R = red(Sky) + i*0.2/2;
    float G = green(Sky) +i*0.1/2;
    float B = blue(Sky) - i*0.1/2;

    stroke(R, G, B);
    line(0,i,width,i);
  }
}

//the stars
void stars(int numStar) {

  pushMatrix();
  noStroke();
  for(int i =0; i <numStar; i++) {
    pushMatrix();
    fill(255);
    translate(pox[i] +(width/numStar) +parralax/40,poy[i] +(height/numStar));
    rotate(radians(rov[i]));
    rect(-2.5, -2.5, 5, 5);
    popMatrix();
  }
  popMatrix();
}

void grass(float x, float y, float xwidth, float ywidth){// the grassy hills
  pushMatrix();
  fill(40,80,0);
  ellipse(x,y,xwidth,ywidth);
  strokeWeight(3);
  translate(x-xwidth,0);
  stroke(40,80,0);
  for(int l=0; l<xwidth; l+=2){
    line(l+xwidth/2, (sq(l- (xwidth/2)))/(xwidth*1.5) +y-ywidth/2 +(ywidth +xwidth)/10,
    l+xwidth/2 +random(-1,1), (sq(l- (xwidth/2)))/(xwidth*1.5) +y-ywidth/2 - 20);
    
  }
  strokeWeight(1);
  popMatrix();
}
//the moon
void moon(float x, float y){
  pushMatrix();
  
 // M00N!!
  fill(200);
  arc(x,y,60,60, radians(45-90),radians(225-90));
  translate(x,y);
  rotate(radians(-45));
  ellipse(0,0,60,30);
  fill(180);
  rotate(radians(45));
  ellipse(19,0,20,20);
  ellipse(10,23,10,10);
  ellipse(-17,17,12,12);
  ellipse(-5,-5,15,15);
  popMatrix();
}



void building(float posx, float posy, int type) {//////BUILDINGS!!!
  pushMatrix();
  switch(type) {
    case(0)://building 1
    default:
    
    fill(0);
    if(posx+10 < width/2) {
      rect(posx+20, posy-180, 100-(posx)/20,180);
      quad(posx+20,posy-200, posx+100,posy-200, posx+120-(posx)/20,posy-180, posx+20,posy-180);
    } 
    else {
      rect(posx-(posx-width)/20, posy-180, 100+(posx-width)/20,180);
      quad(posx-(posx-width)/20, posy-180, posx+20,posy-200, posx+100,posy-200, posx+100,posy-180);
      stroke(250);
      line(posx-(posx-width)/20, posy-180, posx+20,posy-200);
      noStroke();
      for(int r =0; r < 180; r++) {
        fill(155-r/1.5);
        rect(posx-(posx-width)/20, posy -180 +r,1,1);
      }
    }
    noStroke();
    fill(255,251,150);//window color
    for(int w =0; w<windowsPerBuilding; w++) {

      rect(posx+23 +w*6,posy-197 +rand[w], 5,3);
    }
    for(int r =0; r < 200; r++) {
      fill(155-r/1.5);
      rect(posx+20,posy -200 +r,1,1);
    }
    for(int r =0; r < 80; r++) {
      fill(155-r*1.5);
      rect(posx+20+r, posy-200,1,1);
    }
    break;//the break fuction
    
    case(1)://building 2
    fill(0);
    rect(posx,posy-230, 60,230);
    rect(posx+10,posy-250,40,40);
    rect(posx+15,posy-280,30,30);
    ellipse(posx+30+20-posx/20,posy -280, 90,30);
    triangle(posx+15+20-posx/20,posy -280, posx+30+20-posx/20, posy-340, posx+45+20-posx/20,posy-280);
    
    if(posx+30 < width/2) {//left side effect
      quad(posx+45,posy-250, posx+65-(posx)/20,posy-230, posx+65-(posx)/20,posy-285, posx+45,posy-280);
      quad(posx+50,posy-230, posx+70-(posx)/20,posy-220, posx+70-(posx)/20,posy-230, posx+50,posy-250);
      quad(posx+60,posy, posx+80-(posx)/20,posy, posx+80-(posx)/20,posy-210, posx+60,posy-230);
    } else{//right side effect
      quad(posx+15,posy-250, posx+35-(posx)/20,posy-230, posx+35-(posx)/20,posy-285, posx+15,posy-280);
      
      quad(posx+30-(posx)/20,posy-210, posx+30-(posx)/20,posy-230, posx+10,posy-250, posx+10,posy-230);
      stroke(250);
      line(posx+30-(posx)/20,posy-230, posx+10,posy-250);
      noStroke();
      fill(0);
      quad(posx+20-(posx)/20,posy, posx+20-(posx)/20,posy-210, posx,posy-230, posx,posy);
      stroke(250);
      line(posx+20-(posx)/20,posy-210, posx,posy-230);
      noStroke();
      for(int r =0; r < 210; r++) {
        fill(155-r/1.5);
        rect(posx+20 -(posx)/20, posy -210 +r,1,1);
      }
    }
    for(int r =0; r < 20; r++) {//top block lighting
      fill(155-r*5);
      rect(posx+15,posy -270 +r,1,1);
    }
    
    fill(0);
    stroke(250);
    line(posx+15+20-posx/20,posy -280, posx+30+20-posx/20, posy-340);
    arc(posx+30+20-posx/20,posy-280, 90-(posx)/20,30, radians(180),radians(260));
    
    noStroke();
    for(int r =0; r < 230; r++) {//main building lighting
      fill(155-r/1.5);
      rect(posx,posy -230 +r,1,1);
    }
    for(int r =0; r < 60; r++) {
      fill(155-r*1.5);
      rect(posx+r, posy-230,1,1);
    }
    for(int r =0; r < 20; r++) {//middle lighting
      fill(155-r/1);
      rect(posx+10,posy -250 +r,1,1);
    }
    for(int r =0; r < 40; r++) {
      fill(155-r*1.5);
      rect(posx+10+r, posy-250,1,1);
    }
    
    noStroke();
    fill(255,251,150);//window color
    for(int w =0; w<windowsPerBuilding; w++) {

      rect(posx+10 +w*3,posy-225 +rand[w], 5,3);
    }
    
    break;
    
    
    
    case(2)://building 3
    
    fill(0);
    if(posx+10 < width/2) {
      rect(posx+20, posy-280, 100-(posx)/20,280);
      quad(posx+20,posy-300, posx+100,posy-300, posx+120-(posx)/20,posy-280, posx+20,posy-280);
    } 
    else {
      rect(posx-(posx-width)/20, posy-280, 100+(posx-width)/20,280);
      quad(posx-(posx-width)/20, posy-280, posx+20,posy-300, posx+100,posy-300, posx+100,posy-280);
      stroke(250);
      line(posx-(posx-width)/20, posy-280, posx+20,posy-300);
      noStroke();
      for(int r =0; r < 280; r++) {
        fill(155-r/1.5);
        rect(posx-(posx-width)/20, posy -280 +r,1,1);
      }
    }
    noStroke();
    fill(255,251,150);//window color
    for(int w =0; w<windowsPerBuilding; w++) {

      rect(posx+23 +w*6,posy-297 +rand[w], 5,3);
    }
    for(int r =0; r < 300; r++) {
      fill(155-r/1.5);
      rect(posx+20,posy -300 +r,1,1);
    }
    for(int r =0; r < 80; r++) {
      fill(155-r*1.5);
      rect(posx+20+r, posy-300,1,1);
    }
    break;//the break fuction
    
    
    
    
    case(3)://building 4
      
      fill(0);
      pushMatrix();
      translate(10-(posx)/40,10);
      ellipse(posx+40,posy-230,80,80);
      triangle(posx+35,posy-265, posx+40,posy-320, posx+45,posy-265);
      stroke(250);
      line(posx+35,posy-265, posx+40,posy-320);
      arc(posx+40,posy-230,80,80, radians(180), radians(265));
      fill(255,251,150);
      triangle(posx+38,posy-319, posx+42,posy-321, posx+41,posy-318);
      popMatrix();
    
      noStroke();
      fill(0);
      rect(posx,posy-230, 80,230);//main body
      
      
      fill(0);
      if(posx+30 < width/2) {//left side effect
      
      quad(posx+80,posy, posx+100-(posx)/20,posy, posx+100-(posx)/20,posy-210, posx+80,posy-230);
      
    } else{//right side effect
      
      fill(0);
      quad(posx+20-(posx)/20,posy, posx+20-(posx)/20,posy-210, posx,posy-230, posx,posy);
      stroke(250);
      line(posx+20-(posx)/20,posy-210, posx,posy-230);
      noStroke();
      for(int r =0; r < 210; r++) {
        fill(155-r/1.5);
        rect(posx+20 -(posx)/20, posy -210 +r,1,1);
      }
    }
      
      
    for(int r =0; r < 230; r++) {//main building lighting
      fill(155-r/1.5);
      rect(posx,posy -230 +r,1,1);
    }
    for(int r =0; r < 20; r++) {
      fill(155-r*6);
      rect(posx+r, posy-230,1,1);
    }
    
    noStroke();
    fill(255,251,150);//window color
    for(int w =0; w<windowsPerBuilding; w++) {

      rect(posx+10+w*5,posy-220 +rand[w], 5,3);
    }
    
    break;// another break function
    
    case(4)://building 5
      float ED = width/40;
      noStroke();
      fill(0);
      
      if(posx+30 < width/2) {//left side effect
      
      quad(posx+70,posy+20, posx+90-(posx)/20,posy+20, posx+90-(posx)/20,posy-160, posx+70,posy-180);
      quad(posx+80,posy-140, posx+100-(posx)/20,posy-140, posx+100-(posx)/20,posy-170, posx+80,posy-180);
      triangle(posx+80-(posx)/20+ED,posy-140, posx+70-(posx)/20+ED,posy-140, posx+70-(posx)/20+ED,posy-120);//left slant
      triangle(posx+70-(posx)/20+ED,posy+20, posx+80-(posx)/20+ED,posy+20, posx+70-(posx)/20+ED,posy+10);
    } else{//right side effect
      
      triangle(posx-(posx)/20+ED,posy-140, posx+10-(posx)/20+ED,posy-140, posx+10-(posx)/20+ED,posy-120);//right slant
      triangle(posx-(posx)/20+ED,posy+20, posx+10-(posx)/20+ED,posy+20, posx+10-(posx)/20+ED,posy+10);
      
      fill(0);
      quad(posx+20,posy+20, posx+10-(posx)/20+ED,posy+20, posx+10-(posx)/20+ED,posy-160, posx+20,posy-180);
      quad(posx,posy-140, posx+20-(posx)/20,posy-140, posx+20-(posx)/20,posy-170, posx,posy-180);
      stroke(250);
      line(posx+20-(posx)/20,posy-170, posx,posy-180);
      stroke(155-80);
      line(posx-(posx)/20+ED,posy-140, posx+10-(posx)/20+ED,posy-120);
      line(posx-(posx)/20+ED,posy+20, posx+9-(posx)/20+ED,posy+11);
      
      noStroke();
      for(int r =0; r < 30; r++) {
        fill(155-r*2);
        rect(posx+20 -(posx)/20, posy -170 +r,1,1);
      }
      for(int r =0; r < 120; r++) {
        fill(155-60-r/2);
        rect(posx+30 -(posx)/20, posy -120 +r,1,1);
      }
    }//blah!
      fill(0);
      quad(posx+48,posy-205, posx+43,posy-209, posx+30,posy-180, posx+40,posy-180);//stalite stuff
      arc(posx+10,posy-200,20,20, radians(-45), radians(135));
      triangle(posx+9,posy-199, posx+11,posy-201, posx+5,posy-205);
      ellipse(posx+20,posy-190, 20,20);
      arc(posx+50,posy-210,40,40, radians(45),radians(225));
      triangle(posx+48,posy-212, posx+52,posy-208, posx+58,posy-218);
      arc(posx+56,posy-217, 5,5, radians(-135), radians(45));
      
      rect(posx,posy-180, 80,40);//main body
      rect(posx+10, posy-160,60,180);
      triangle(posx,posy-140, posx+10,posy-140, posx+10,posy-120);
      triangle(posx+80,posy-140, posx+70,posy-140, posx+70,posy-120);
      triangle(posx,posy+20, posx+10,posy+20, posx+10,posy+10);
      triangle(posx+70,posy+20, posx+80,posy+20, posx+70,posy+10);
      
      stroke(200);
      arc(posx+50,posy-210,40,40, radians(135),radians(225));//lighting effects
      line(posx+3,posy-193, posx+9,posy-199);
      arc(posx+20,posy-190, 16,16, radians(45+90),radians(225+90));
      ellipse(posx+15,posy-195, 5,5);
      
      stroke(155-80);
      line(posx,posy-140, posx+10,posy-120);//more lighting effects
      line(posx,posy+20, posx+9,posy+11);
      
      noStroke();
      for(int r =0; r < 40; r++) {//main building lighting
      fill(155-r*2);
      rect(posx,posy -180 +r,1,1);
    }
    for(int r =0; r < 120; r++) {//middle building lighting
      fill(155-80-r/2);
      rect(posx+10,posy -120 +r,1,1);
    }
    for(int r =0; r < 20; r++) {
      fill(155-r*6);
      rect(posx+r, posy-180,1,1);
    }
    
    
    
    fill(255,251,150);//window color
    for(int w =0; w<windowsPerBuilding; w++) {

      rect(posx+15+w*4,posy-180 +rand[w], 5,3);
    }
      
    break;
  }
  popMatrix();
}

// if you seriously read through all that you probably have headace now and should take a break
// but congrates on wading through all that code and I hope you appreicate all the work
// I went through. Unless you don't get it.


