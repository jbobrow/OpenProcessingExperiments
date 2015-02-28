
boolean vector = false;
float speed = 0.0;
float easing = 0.5;
float angle;
boolean color_switch = false;
boolean shake_hand = false;

PImage Ih;
PImage Ib;
PImage Ilf;
PImage Irf;
PImage Ile;
PImage Ire;
PImage ILl;
PImage IRl;
PImage Ibl;
PImage Iback;

PShape b;
PShape h;
PShape lf;
PShape rf;
PShape m;
PShape Le;
PShape Re;
PShape Lp;
PShape Rp;
PShape Ll;
PShape Rl;
PShape s;
PShape Is;
PShape bl;
PShape back;

 




void setup(){
  size(480, 320); 
  smooth(); 


  b=loadShape("body.svg");
  h=loadShape("hair.svg");
  lf=loadShape("Lfoot.svg");
  rf=loadShape("Rfoot.svg");
  m=loadShape("mouth.svg");
  Le=loadShape("Leye.svg");
  Re=loadShape("Reye.svg");
  Lp=loadShape("Lpupil.svg");
  Rp=loadShape("Rpupil.svg");
  Ll=loadShape("Llid.svg");
  Rl=loadShape("Rlid.svg");
  s=loadShape("smile.svg");
  Is=loadShape("Ismile.svg");
  bl=loadShape("blink.svg");
  back=loadShape("back.svg"); 

  Ib=loadImage("egg.png");
  Ih=loadImage("hair.png");
  Ilf=loadImage("Lfoot.png");
  Irf=loadImage("Rfoot.png");
  Ile=loadImage("Leye.png");
  Ire=loadImage("Reye.png");
  ILl=loadImage("ILlid.png");
  IRl=loadImage("Rlid.png");
  Ibl=loadImage("blink.png");
  Iback=loadImage("back.png");

}

void draw(){
  background(200);

             //////////////shape sequence////////////

  if (vector == true) {

    shape(back,-75,-10);
    
      //explosion
  if (mousePressed==true)
  {
    if ((mouseX >258) && (mouseX < 285) && (mouseY>186) && (mouseY<200))
    {
      shake_hand = true;
    }
    if(!shake_hand)
    {
      noStroke(); 
      for(int d = 24; d>0; d-=1)
      {
        if(color_switch){
          color_switch = false;
          fill(249,8,31);
        }
        else{
          color_switch = true;
          fill(243,249,6);
        }
        //Michael Stratford helped create the repeating star 

        smooth();

        beginShape();
        vertex(mouseX+cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        vertex(mouseX+cos(.25)*d*100,mouseY-sin(.25)*d*100);
        vertex(mouseX+cos(.31)*d*30.7,mouseY+sin(.31)*d*30.7);
        vertex(mouseX+cos(.96)*d*100,mouseY+sin(.96)*d*100);
        vertex(mouseX,mouseY+d*30.7);
        vertex(mouseX-cos(.96)*d*100,mouseY+sin(.96)*d*100);
        vertex(mouseX-cos(.31)*d*30.7,mouseY+sin(.31)*d*30.7);
        vertex(mouseX-cos(.25)*d*100,mouseY-sin(.25)*d*100);
        vertex(mouseX-cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        vertex(mouseX,mouseY-d*100);
        vertex(mouseX+cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        //xcenter = 40
        //ycenter = 42
        endShape();
      }
    }
  }
  else{
    shake_hand = false;
  } 

    //Left Arm

    strokeWeight(10);

    //Left Arm 
    fill(145,53,148); 
    stroke(145,53,148);
    strokeWeight(10);
    line(110,178,76,200);
    line(76,200,55,174); 


    strokeWeight(10);
    line(220,178,260,198);
    if(shake_hand)
    {
      angle = atan2(mouseY-198,mouseX-258);
      line(258,198,258+cos(angle)*24,198+sin(angle)*24);
    }
    else{
      line(258,198,282,200);
    }



    shape(b,90,100);
    shape(h,105,53);
    shape(lf,93,290);
    shape(rf,159,290);




    if ((mouseX > 115) && (mouseX < 175) && (mouseY>83) && (mouseY<120)) {
      shape(s,100,148);

    } 
    else {
      //smile
      shape(m,125,232);
      shape(Le,113,150);
      shape(Re,141,148); 
      shape(Lp,124,172);
      shape(Rp,147,170); 
      shape(Ll,110,148);
      shape(Rl,144,145); 
    }
    
    //BLINK

  if(mousePressed == true && !(shake_hand) && !((mouseX >258) && (mouseX < 285) && (mouseY>186) && (mouseY<200)))  
  { shape(bl,110,144);
  }
   // BLUSHING
   noStroke();
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target - speed) * easing;
  fill(237,119,173,speed);
  ellipse(113,213,20,30);
  ellipse(180,213,20,30);


  }
  else{                /////////// Image sequence//////////////
    image(Iback,0,0); 

  //explosion
  if (mousePressed==true)
  {
    if ((mouseX >258) && (mouseX < 285) && (mouseY>186) && (mouseY<200))
    {
      shake_hand = true;
    }
    if(!shake_hand)
    {
      noStroke(); 
      for(int d = 24; d>0; d-=1)
      {
        if(color_switch){
          color_switch = false;
          fill(249,8,31);
        }
        else{
          color_switch = true;
          fill(243,249,6);
        }
        //Michael Stratford helped create the repeating star 

        smooth();

        beginShape();
        vertex(mouseX+cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        vertex(mouseX+cos(.25)*d*100,mouseY-sin(.25)*d*100);
        vertex(mouseX+cos(.31)*d*30.7,mouseY+sin(.31)*d*30.7);
        vertex(mouseX+cos(.96)*d*100,mouseY+sin(.96)*d*100);
        vertex(mouseX,mouseY+d*30.7);
        vertex(mouseX-cos(.96)*d*100,mouseY+sin(.96)*d*100);
        vertex(mouseX-cos(.31)*d*30.7,mouseY+sin(.31)*d*30.7);
        vertex(mouseX-cos(.25)*d*100,mouseY-sin(.25)*d*100);
        vertex(mouseX-cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        vertex(mouseX,mouseY-d*100);
        vertex(mouseX+cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        //xcenter = 40
        //ycenter = 42
        endShape();
      }
    }
  }
  else{
    shake_hand = false;
  }     
                                                    //Left Arm 
    fill(145,53,148); 
    stroke(202,136,58);
    strokeWeight(10);
    line(110,178,76,200);
    line(76,200,55,174); 


    strokeWeight(10);
    line(220,178,260,198);
    if(shake_hand)
    {
      angle = atan2(mouseY-198,mouseX-258);
      line(258,198,258+cos(angle)*24,198+sin(angle)*24);
    }
    else{
      line(258,198,282,200);
    }

    image(Ib,73,90);
    image(Ih,105,30);
    image(Ilf,92,280);
    image(Irf,160,280);





    if ((mouseX > 115) && (mouseX < 195) && (mouseY>65) && (mouseY<120)) {
      shape(Is,100,148);

    } 
    else {
      //smile
      shape(m,125,232);
      shape(Le,113,150);
      shape(Re,141,148); 
      shape(Lp,124,172);
      shape(Rp,147,170); 
      image(ILl,105,148);
      image(IRl,140,138);
    }
    if(mousePressed == true && !(shake_hand) && !((mouseX >258) && (mouseX < 285) && (mouseY>186) && (mouseY<200)))  
  { 
    image(Ibl,109,140);
   }
     // BLUSHING
   noStroke();
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target - speed) * easing;
  fill(237,119,173,speed);
  ellipse(113,213,20,30);
  ellipse(180,213,20,30);
  }
}




void keyPressed() {
  if(key==' '){
    if(vector==true){
      vector=false;
    }
    else{
      vector=true;
    }
  }
}









