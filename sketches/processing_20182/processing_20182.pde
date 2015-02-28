
float centerX = 250;
float centerY = 250;
float speed = 1;
int state = 0;//<---I changed the boolean to state. 0=resting, 1=going up, 2=going down
float jump =0;
float r = random(0,250);
float b = random (0,250);
float g = random(0,250);
float a = random(0,100);
float cx = random (330,410);
float cy = random(110,170);
float w = random(0,30);
float h = random(0,30);

void setup() {
 size (500,500);
 smooth();
}
void draw() {
 //centerX = mouseX;
 //centerY = mouseY-jump;
 centerX = 250;
 centerY = 250-jump;

//when a key is pressed, pikachu switches from resting to going up
if (keyPressed){
   state = 1;

 }

//here's the conditional using states
if(state==1 && jump<20){ //<---so here: "when pikachu is on the way up AND has not yet reached 20...
 jump=jump+speed;
}else if(jump>0){//<---or else, if the above it not true, do this, and make the state "2", so we don't invoke the first conditional again
 state=2;
 jump=jump-speed;
}else{//<---if neither of the above are true, put pikachu back where he belongs.  Return to a resting state
 jump = 0;
 state = 0;
}



 background(0);
 noStroke();
 fill(250,250,0);
 float value = brightness(255);
 ellipse(centerX,centerY,110,90);
 ellipse(centerX,centerY-40,80,80);
 triangle(centerX-15,centerY-55,centerX-35,centerY-55,centerX-30,centerY-110);
 triangle(centerX+15,centerY-55,centerX+15,centerY-75,centerX+70,centerY-75);
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
 quad(centerX+67,centerY-35,centerX+80,centerY-45,centerX+100,centerY-45,centerX+74,centerY-33);
 //tail

 if(mousePressed) {
   fill(255,255,0);
   ellipse(centerX+15,centerY-55,13,13);
   stroke(0);
   strokeWeight(3);
   arc(centerX+15,centerY-55, 9, 3, 0, PI); //making him wink
 }
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

 if(mousePressed) {
   stroke(255,255,0);
   strokeWeight(4);
   arc(centerX,centerY-35, 10, 5, 0, PI);
   stroke(0);
   strokeWeight(3);
   arc(centerX,centerY-37, 13, 8, 0, PI); //making him smile
 }

if(mouseX < 190 || mouseX>310 || mouseY<120 || mouseY>300){
   noStroke();
  fill(255,255,0);
   ellipse(centerX+15,centerY-55,13,13);
   ellipse(centerX-15,centerY-55,13,13);
   stroke(0);
   strokeWeight(3);
   arc(centerX+15,centerY-55, 9, 3, 0, PI);
   arc(centerX-15,centerY-55,9,3,0,PI); //making him close both eyes; 'sleeping' when mouse is not over him
fill(250,250,250);
ellipse(centerX+120,centerY-110,80,60);
stroke(0);
//line(345,130,355,130);
line(centerX+95,centerY-120,centerX+105,centerY-120);
line(centerX+105,centerY-120,centerX+95,centerY-100);
line(centerX+95,centerY-100,centerX+105,centerY-100);// 1st 'z'


line(centerX+113,centerY-110,centerX+120,centerY-110);
line(centerX+120,centerY-110,centerX+113,centerY-100);
line(centerX+113,centerY-100,centerX+120,centerY-100);// 2nd 'z'

line(centerX+126,centerY-110,centerX+134,centerY-110);
line(centerX+134,centerY-110,centerX+126,centerY-100);
line(centerX+126,centerY-100,centerX+134,centerY-100); // 3rd 'z'

//noStroke();
//fill(r,b,g);
//ellipse(cx,cy,w,h); // colorful 'dreams'

noStroke();
fill(250,250,250);
ellipse(315,152,20,20);
ellipse(295,160,13,13);
}

}



