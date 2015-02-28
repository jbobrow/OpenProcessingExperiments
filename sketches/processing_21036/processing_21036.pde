
Pika[] crazypikas = new Pika [4];

void setup() {
  size (500,500);
  smooth();

 for(int i=0; i<crazypikas.length; i++){
   crazypikas[i] = new Pika(100+80*i,80+100*i,random(150,250),random(150,250),1,0,0,0);
 }
  
}
void draw() {
  background(0);

  //functions for crazypikas[i]
   //when a key is pressed, pikachu switches from resting to going up
  for(int i=0; i< crazypikas.length; i++){
    //crazypikas[i].centerY = 250-crazypikas[i].jump;
    crazypikas[i].centerY = (80+100*i)-crazypikas[i].jump;
    crazypikas[i].keyHop();
    crazypikas[i].body();
  if(crazypikas[i].boo == 0){
  crazypikas[i].sleep();}
  else{
    crazypikas[i].body();
  }
  crazypikas[i].wink();
  crazypikas[i].walk();
  }
  
  /////////////////////////////////// 'awake/sleep button'
  noStroke();
  fill(20,20,250);
  ellipse(477,477,40,40);//button
}
void mouseReleased(){
  for(int i=0; i< crazypikas.length; i++){
  if(mouseX > 437 && mouseY >437 && crazypikas[i].boo==0){//pressing the button
   crazypikas[i].boo=1;
    }
  else if(mouseX>437 && mouseY>437 && crazypikas[i].boo !=0){
  crazypikas[i].boo=0;
    }
}}
 
///////////////////////////////////////////classy
class Pika {
  float centerX;
  float centerY;
  float c1;
  float c2;
  float speed; //speed is the increment for jumping action
  float jump; //jump is the total added, when jump=0, no jump is happening
  //state defines where pika is in the jumping process
  int state;// 0=resting, 1=going up, 2=going down
  int boo;

  Pika(float _centerX, float _centerY, float _c1, float _c2, float _speed, float _jump, int _state, int _boo) {
    centerX = _centerX;
    centerY = _centerY;
    c1 = _c1;
    c2 = _c2;
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
      fill(c1,c2,0);
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
    
    noStroke();
    fill(c1,c2,0);
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
    stroke(c1,c2,0);
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
    fill(c1,c2,0);
    ellipse(centerX+15,centerY-55,13,13);
    ellipse(centerX-15,centerY-55,13,13);
    stroke(0);
    strokeWeight(3);
    arc(centerX+15,centerY-55, 9, 3, 0, PI);
    arc(centerX-15,centerY-55,9,3,0,PI); //making him close both eyes; 'sleeping' when mouse is not over him
    stroke(0);
    ///////quivering stuff...
    noStroke();
    fill(c1,c2,0);
    float value = brightness(255);
    float s = random (110,112);
    ellipse(centerX,centerY,s,90); //body 'quivering'

    noFill();
    stroke(c1,c2,0);
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
  }}

