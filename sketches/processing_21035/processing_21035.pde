
Pika pikaOne;

void setup() {
  size (500,500);
  smooth();

  pikaOne = new Pika(250,250,1,0,0,0);
}
void draw() {

  pikaOne.centerY = 250-pikaOne.jump; //when a key is pressed, pikachu switches from resting to going up
  pikaOne.keyHop();
  if(pmouseX>pikaOne.centerX-50 && pmouseX<pikaOne.centerX+50 && pmouseY>pikaOne.centerY-50 && pmouseY<pikaOne.centerY+50){
  pikaOne.halo();
  }
  else{
    background(0);
  }
  pikaOne.body();
  if(pikaOne.boo == 0){
  pikaOne.sleep();}
  else{
    pikaOne.body();
  }
  if(pmouseX>pikaOne.centerX-50 && pmouseX<pikaOne.centerX+50 && pmouseY>pikaOne.centerY-50 && pmouseY<pikaOne.centerY+50){
  pikaOne.squint();
  }
  pikaOne.wink();
  pikaOne.walk();
  
  /////////////////////////////////// 'awake/sleep button'
  noStroke();
  fill(20,20,250);
  ellipse(477,477,40,40);//button
}
void mouseReleased(){
  if(mouseX > 437 && mouseY >437 && pikaOne.boo==0){//pressing the button
   pikaOne.boo=1;
    }
  else if(mouseX>437 && mouseY>437 && pikaOne.boo !=0){
  pikaOne.boo=0;
    }
  }


///////////////////////////////////////////classy
class Pika {
  float centerX;
  float centerY;
  float speed; //speed is the increment for jumping action
  float jump; //jump is the total added, when jump=0, no jump is happening
  //state defines where pika is in the jumping process
  int state;// 0=resting, 1=going up, 2=going down
  int boo;

  Pika(float _centerX, float _centerY, float _speed, float _jump, int _state, int _boo) {
    centerX = _centerX;
    centerY = _centerY;
    speed = _speed;
    jump = _jump;
    state = _state;
    boo = _boo;
  }

  ///////////////////////////////////////////////
  void wink() {
    if(mousePressed && mouseX<437 && mouseY<437) {
      noStroke();
      fill(0);
      ellipse(centerX-15,centerY-55,12,12);
      fill(255,255,0);
      ellipse(centerX+15,centerY-55,13,13);
      stroke(0);
      strokeWeight(3);
      arc(centerX+15,centerY-55, 9, 3, 0, PI); //making him wink
      strokeWeight(4);
      arc(centerX,centerY-35, 10, 5, 0, PI);
      stroke(0);
      strokeWeight(2);
      arc(centerX,centerY-37, 13, 8, 0, PI); //making him smile
    }
  }
  /////////////////////////////////////////
  void body() {
    //background(0);
    noStroke();
    fill(250,250,0);
    float value = brightness(255);
    ellipse(centerX,centerY,110,90);
    ellipse(centerX,centerY-40,80,80);
    triangle(centerX-15,centerY-55,centerX-35,centerY-55,centerX-30,centerY-110);
    triangle(centerX+15,centerY-55,centerX+15,centerY-75,centerX+70,centerY-75);//ears
    ellipse(centerX-25,centerY+35,30,30);
    ellipse(centerX+25,centerY+35,30,30); //body
    noStroke();
    fill(0);
    ellipse(centerX-15,centerY-55,12,12);
    ellipse(centerX+15,centerY-55,12,12); //eyes
    noFill();
    stroke(250,250,0);
    strokeWeight(11);
    line(centerX+38,centerY+25,centerX+80,centerY-15);
    strokeWeight(14);
    line(centerX+78,centerY-15,centerX+60,centerY-30);
    quad(centerX+67,centerY-35,centerX+80,centerY-45,centerX+100,centerY-45,centerX+74,centerY-33); //tail
    noStroke();
    fill(255,0,0);
    ellipse(centerX-20,centerY-40,15,15);
    ellipse(centerX+20,centerY-40,15,15); //cheeks
    stroke(0);
    strokeWeight(3);
    noFill();
    arc(centerX,centerY-47, 5, 2, 0, PI); //nose
    noFill();
    arc(centerX,centerY-35, 10, 5, 0, PI); //mouth
  }
  /////////////////////////////////////////////////////////
  void keyHop() {
    if(key ==CODED) {
      if (keyCode == UP) {
        state = 1;
        boo=1;
      }
    } //***need to figure out how to make him just do one jump and come back down, but for now he hops :)
    //here's the conditional using states
    if(state==1 && jump<20) { //<---so here: "when pikachu is on the way up AND has not yet reached 20...
      jump=jump+speed;
    }
    if(jump >=20) {
      jump = 0;
      state = 0; //making him hop....??
    }      
    //}else if(jump>0){//<---or else, if the above it not true, do this, and make the state "2", so we don't invoke the first conditional again
    //state=2;
    //jump=jump-speed;
    //}else{//<---if neither of the above are true, put pikachu back where he belongs.  Return to a resting state
    //jump = 0;
    //state = 0;
  }
  ////////////////////////////////////////////////////////////
  void sleep() {
    noStroke();
    fill(255,255,0);
    ellipse(centerX+15,centerY-55,13,13);
    ellipse(centerX-15,centerY-55,13,13);
    stroke(0);
    strokeWeight(3);
    arc(centerX+15,centerY-55, 9, 3, 0, PI);
    arc(centerX-15,centerY-55,9,3,0,PI); //making him close both eyes; 'sleeping' when mouse is not over him
    stroke(0);
    ///////quivering stuff...
    noStroke();
    fill(250,250,0);
    float value = brightness(255);
    float s = random (110,112);
    ellipse(centerX,centerY,s,90); //body 'quivering'

    noFill();
    stroke(250,250,0);
    float t1 = random (10,12);
    strokeWeight(t1);
    line(centerX+38,centerY+25,centerX+80,centerY-15);
    float t2 = random (13,15);
    strokeWeight(t2);
    line(centerX+78,centerY-15,centerX+60,centerY-30);
    float t3 = random (44.5,45.5);
    quad(centerX+67,centerY-35,centerX+80,centerY-t3,centerX+100,centerY-45,centerX+74,centerY-33); //tail
    ///redrawing mouth and cheeks to show over rest of 'body'
    stroke(0);
    strokeWeight(3);
    noFill();
    arc(centerX,centerY-35, 10, 5, 0, PI); //mouth

    noStroke();
    fill(255,0,0);
    ellipse(centerX-20,centerY-40,15,15);
    ellipse(centerX+20,centerY-40,15,15); //cheeks

    ////////////////////////////////////////////////////////////////////// dreams
    float r = random(100,250);
    float b = random (100,250);
    float g = random(100,250);
    noStroke();
    fill(r,g,b);
    ellipse(centerX+120,centerY-110,80,60);
    ellipse(centerX+67,centerY-98,20,20);
    ellipse(centerX+45,centerY-90,13,13);//random colored dream bubbles
    stroke(0);
    line(centerX+95,centerY-120,centerX+105,centerY-120);
    line(centerX+105,centerY-120,centerX+95,centerY-100);
    line(centerX+95,centerY-100,centerX+105,centerY-100);// 1st 'z'

    line(centerX+113,centerY-110,centerX+120,centerY-110);
    line(centerX+120,centerY-110,centerX+113,centerY-100);
    line(centerX+113,centerY-100,centerX+120,centerY-100);// 2nd 'z'

    line(centerX+126,centerY-110,centerX+134,centerY-110);
    line(centerX+134,centerY-110,centerX+126,centerY-100);
    line(centerX+126,centerY-100,centerX+134,centerY-100); // 3rd 'z'
  }
  ////////////////////////////////////////
  void halo(){
    background(0);
    noStroke();
      fill(250,250,250,1);
    ellipse (centerX, centerY-25, 225,240);
      fill(250,250,250,3);
    ellipse (centerX, centerY-25, 225,240);
    fill(250,250,250,5);
    ellipse (centerX, centerY-25, 225,240);
    ellipse (centerX, centerY-25, 220,235);
    ellipse (centerX, centerY-25, 215,230);
     fill(250,250,250,7);
    ellipse (centerX, centerY-25, 210,225);
    ellipse (centerX, centerY-25, 205,220);
    ellipse (centerX, centerY-25, 200,215);
     fill(250,250,250,10);
    ellipse (centerX, centerY-25, 195,210);
    ellipse (centerX, centerY-25, 190,205);
    ellipse (centerX, centerY-25, 185,200);
     fill(250,250,250,12);
    ellipse (centerX, centerY-25, 180,195);
    ellipse(centerX,centerY-25,175,190);
    ellipse(centerX,centerY-25,170,185);
    fill(250,250,250,16);
   ellipse(centerX,centerY-25,165,175);    
   ellipse(centerX,centerY-25,160,170);
   ellipse(centerX,centerY-25,155,165);
   fill(250,250,250,20);
   ellipse(centerX,centerY-25,150,160);    
   ellipse(centerX,centerY-25,145,155);
   ellipse(centerX,centerY-25,140,150);
   fill(250,250,250,25);
   ellipse(centerX,centerY-25,135,145);    
   ellipse(centerX,centerY-25,130,140);
   ellipse(centerX,centerY-25,125,135);
   fill(250,250,250,30);
   ellipse(centerX,centerY-25,120,130);    
   ellipse(centerX,centerY-25,115,125);
   ellipse(centerX,centerY-25,110,120);
   fill(250,250,250,37);
   ellipse(centerX,centerY-25,105,115);    
   ellipse(centerX,centerY-25,100,110);
   ellipse(centerX,centerY-25,95,105);
   fill(250,250,250,55);
   ellipse(centerX,centerY-25,90,100);    
   ellipse(centerX,centerY-25,85,95);
   ellipse(centerX,centerY-25,80,90);
  }
   
  void squint(){
   
   noStroke();       //////////////////////////making him squint
   fill(250,250,0);
   ellipse(centerX-15,centerY-55,12,12);
   ellipse(centerX+15,centerY-55,12,12);
   
   stroke(0);
   strokeWeight(3);
   line(centerX-19,centerY-57,centerX-11,centerY-55);
   line(centerX+11,centerY-55,centerX+19,centerY-57);
  
  }  
  
  void walk() {
    if(keyCode == LEFT) {
      centerX = centerX -1;
      if(centerX<55) {
        centerX=centerX+1;
        boo=1;
      }
    }

    if(keyCode == RIGHT) {
      centerX = centerX+1;
      if(centerX>371) {
        centerX=centerX-1;
        boo=1;
      }
    }
  }
}


