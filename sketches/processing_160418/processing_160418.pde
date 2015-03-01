


//The Standards
int halfFinger;
int finger;
int palm;
int foot;
int cubit;
int mansHeight;
int pace;

//The Excentrics
float shoulderAngle;
float legAngle;
float shoulderRpx;
float shoulder_py;
float shoulderLpx;
float legRpx;
float leg_py;
float legLpx;

//The Variables
float burgers = 0.0;
float eMouseX;
float eMouseY;
float ease = 0.1;

//Setup

void setup() {
//This code is based in pixel units, and so I set up a minimum unit of half a finger
//so that a finger equals 8 pixels.
//It should be ok to change the minimum-value a little, but the loss of precision can fuckup the code.

halfFinger = 4;
finger = halfFinger*2;

//The Proportions
//According to Da Vinci's written text in the drawing known as "The Vitruvian Man":
//"Vitruvius, the architect, says in his work on architecture that the measurements
//of the human body are distributed by Nature as follows"

  palm = finger *4;
  foot = palm *4;
  cubit = palm *6;
  mansHeight = cubit *4;
  pace = mansHeight;

  size((5 * cubit)+(2 * palm), (5 * cubit)+(2 * palm));
  print("window size = " + width + " x " + height + " px");
    
//The Pivots of Da Vinci's System system
  shoulderRpx= (width/2)+(palm*2 + finger);
  shoulder_py= (cubit+foot)+(palm+(finger*2)+halfFinger);
  shoulderLpx= (width/2)-(palm*2 + finger);
  legRpx= ((width/2)+palm-finger); 
  leg_py= (((cubit*3)+palm)+finger);
  legLpx= ((width/2)-palm+finger); 
}
  
  void draw() {
  background(220);

  float targetX = mouseX;
  float dx = targetX - eMouseX;
  if(abs(dx) > 1) {
    eMouseX +=dx * (ease/10);
  }

  float targetY = mouseY;
  float dy = targetY - eMouseY;
  if(abs(dy) > 1){
    eMouseY += dy * ease;
  }

//I need mouseX to be relative and not absolute.
//There might be a simpler way, but I figured out I could fit mouseX/Y into a percentage value.
//it worked for angles, which are constant, but I couldn't figure out how to make it work for the pos values

float eMouseXp = ((eMouseX*100) / (width));
float eMouseYp = ((eMouseY*100) / (height));

//The motion of gettin' full of Burgers
  
  if (eMouseX - (width/4) > 0 && eMouseX < width - (width/4))
  burgers = (eMouseXp * 10.24) - 256;
  
//Shapes
  
  noFill();
  stroke(90);
  strokeWeight(0.5);
  
  rectMode(CENTER);
  rect(width/2, palm + (cubit*3), mansHeight, mansHeight);
  ellipse(width/2, (height/2)+(finger*2), mansHeight+foot+(palm), mansHeight+foot+(palm));


//Head
  ellipse(width/2, cubit+(palm*2)+(finger*3), palm*2 + finger*2, palm*2 + finger*2);
  ellipse(width/2, cubit+(palm*2)+finger, palm*2 + finger*2, palm*2 + finger*2);
  rect(width/2, cubit+(palm*2)+finger*2, palm*2, palm*3);
  rect(width/2, cubit + foot + finger*2, palm*2, palm);

//Shoulders
  ellipse((width/2)-(palm*2 + finger), (cubit+foot)+(palm+(finger*2)+halfFinger), palm+(finger*2), palm+(finger*2));
  ellipse((width/2)+(palm*2 + finger), (cubit+foot)+(palm+(finger*2)+halfFinger), palm+(finger*2), palm+(finger*2));

//UpperChest
//  rect(width/2, (cubit*2), cubit, palm+(finger*3));
  ellipse((width/2)-palm-(finger*2), (cubit*2)+palm, finger*2, finger);
  ellipse((width/2)+palm+(finger*2), (cubit*2)+palm, finger*2, finger);
  quad(
  (width/2) - (palm*3),
    (cubit*2) - palm,
  (width/2) + (palm*3),
    (cubit*2) - palm,
  (width/2) + (palm*2),
    (cubit*2) + palm,
  (width/2) - (palm*2),
    (cubit*2) + palm
  );

//Deltoid
//L
//line((width/2) - (palm*4),
//      (cubit*2) - palm,
//    (width/2)-(palm*2)-(finger*2),
//      (cubit*2)+palm
//    );
////R
//line((width/2) + (palm*4),
//      (cubit*2) - palm,
//    (width/2)+(palm*2)+(finger*2),
//      (cubit*2)+palm
//    );

//ArmsHor_Left
quad(
  (width/2) - (palm*3),
    (cubit*2) - palm,
  (width/2) - cubit,
    (cubit*2) - finger*3,
  (width/2) - cubit,
    (cubit*2) + finger,
  (width/2) - (palm*3),
    (cubit*2) + finger + halfFinger
  );
  
quad(
  (width/2) - (palm*3) - (palm*3),
    (cubit*2) - finger*3,
  (width/2) - palm*3 - palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) - palm*3 - palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) - (palm*3) - (palm*3),
    (cubit*2) + finger
  );
  
quad(
  (width/2) - cubit - palm*3,
    (cubit*2) - finger*3,
  (width/2) - palm*3 - palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) - palm*3 - palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) - cubit - palm*3,
    (cubit*2) + finger - halfFinger
  );
  
quad(
  (width/2) - cubit - palm*3,
    (cubit*2) - finger*3,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2),
  (width/2) - cubit - palm*3,
    (cubit*2) + halfFinger
  );
  
quad(
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2) + finger - halfFinger,
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2)
  );  

//Thumb
  quad(
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) - cubit - palm*5 - finger - halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*5 - finger - halfFinger,
    (cubit*2) - finger*2 - halfFinger,
  (width/2) - cubit - palm*4 - finger*2 - halfFinger,
    (cubit*2) - finger*2 - halfFinger
  );

//Fingers
  quad(
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) - cubit - palm*6,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*5 - finger*2 - halfFinger,
    (cubit*2) - finger,
  (width/2) - cubit - palm*4 - finger*2 - halfFinger,
    (cubit*2)
  );
  
  
//ArmsHor_Right
quad(
  (width/2) + (palm*3),
    (cubit*2) - palm,
  (width/2) + cubit,
    (cubit*2) - finger*3,
  (width/2) + cubit,
    (cubit*2) + finger,
  (width/2) + (palm*3),
    (cubit*2) + finger + halfFinger
  );
  
quad(
  (width/2) + (palm*3) + (palm*3),
    (cubit*2) - finger*3,
  (width/2) + palm*3 + palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) + palm*3 + palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) + (palm*3) + (palm*3),
    (cubit*2) + finger
  );
  
quad(
  (width/2) + cubit + palm*3,
    (cubit*2) - finger*3,
  (width/2) + palm*3 + palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) + palm*3 + palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) + cubit + palm*3,
    (cubit*2) + finger - halfFinger
  );
  
quad(
  (width/2) + cubit + palm*3,
    (cubit*2) - finger*3,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2),
  (width/2) + cubit + palm*3,
    (cubit*2) + halfFinger
  );
  
quad(
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2) + finger - halfFinger,
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2)
  );  

//Thumb
  quad(
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) + cubit + palm*5 + finger + halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*5 + finger + halfFinger,
    (cubit*2) - finger*2 - halfFinger,
  (width/2) + cubit + palm*4 + finger*2 + halfFinger,
    (cubit*2) - finger*2 - halfFinger
  );

//Fingers
  quad(
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) + cubit + palm*6,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*5 + finger*2 + halfFinger,
    (cubit*2) - finger,
  (width/2) + cubit + palm*4 + finger*2 + halfFinger,
    (cubit*2)
  );


//Testing Matrix Push/Pop

//Arm R Movable Test
  
if ( eMouseY/10 - (width/2) <= 70 && eMouseY/10 - (width/2) <= 35){
  shoulderAngle = eMouseYp * 1.95 - 98;
}

pushMatrix();
translate(shoulderRpx, shoulder_py);

pushMatrix();
rotate(radians(shoulderAngle));
//Cheers Anthony and
//http://processing.org/tutorials/transform2d/

pushMatrix();
translate(shoulderRpx*(-1),shoulder_py*(-1));

//ellipse(shoulderRpx, shoulder_py, palm+(finger*2), palm+(finger*2));

  
quad(
  (width/2) + (palm*3),
    (cubit*2) - palm,
  (width/2) + cubit,
    (cubit*2) - finger*3,
  (width/2) + cubit,
    (cubit*2) + finger,
  (width/2) + (palm*3),
    (cubit*2) + finger + halfFinger
  );
  
quad(
  (width/2) + (palm*3) + (palm*3),
    (cubit*2) - finger*3,
  (width/2) + palm*3 + palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) + palm*3 + palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) + (palm*3) + (palm*3),
    (cubit*2) + finger
  );
  
quad(
  (width/2) + cubit + palm*3,
    (cubit*2) - finger*3,
  (width/2) + palm*3 + palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) + palm*3 + palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) + cubit + palm*3,
    (cubit*2) + finger - halfFinger
  );
  
quad(
  (width/2) + cubit + palm*3,
    (cubit*2) - finger*3,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2),
  (width/2) + cubit + palm*3,
    (cubit*2) + halfFinger
  );
  
quad(
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*3 + finger*2 + halfFinger,
    (cubit*2) + finger - halfFinger,
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2)
  );  

//Thumb
  quad(
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) + cubit + palm*5 + finger + halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*5 + finger + halfFinger,
    (cubit*2) - finger*2 - halfFinger,
  (width/2) + cubit + palm*4 + finger*2 + halfFinger,
    (cubit*2) - finger*2 - halfFinger
  );

//Fingers
  quad(
  (width/2) + cubit + (palm*4) + finger*2 + halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) + cubit + palm*6,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) + cubit + palm*5 + finger*2 + halfFinger,
    (cubit*2) - finger,
  (width/2) + cubit + palm*4 + finger*2 + halfFinger,
    (cubit*2)
  );
   
popMatrix();

popMatrix();

popMatrix();


//Arm L Movable Test

pushMatrix();
translate(shoulderLpx, shoulder_py);

pushMatrix();
rotate(radians(shoulderAngle)*(-1));

pushMatrix();
translate(shoulderLpx*(-1),shoulder_py*(-1));

//ellipse(shoulderLpx, shoulder_py, palm+(finger*2), palm+(finger*2));

quad(
  (width/2) - (palm*3),
    (cubit*2) - palm,
  (width/2) - cubit,
    (cubit*2) - finger*3,
  (width/2) - cubit,
    (cubit*2) + finger,
  (width/2) - (palm*3),
    (cubit*2) + finger + halfFinger
  );
  
quad(
  (width/2) - (palm*3) - (palm*3),
    (cubit*2) - finger*3,
  (width/2) - palm*3 - palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) - palm*3 - palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) - (palm*3) - (palm*3),
    (cubit*2) + finger
  );
  
quad(
  (width/2) - cubit - palm*3,
    (cubit*2) - finger*3,
  (width/2) - palm*3 - palm*4,
    (cubit*2) - palm + halfFinger,
  (width/2) - palm*3 - palm*4,
    (cubit*2) + finger*2 - halfFinger,
  (width/2) - cubit - palm*3,
    (cubit*2) + finger - halfFinger
  );
  
quad(
  (width/2) - cubit - palm*3,
    (cubit*2) - finger*3,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2),
  (width/2) - cubit - palm*3,
    (cubit*2) + halfFinger
  );
  
quad(
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*3 - finger*2 - halfFinger,
    (cubit*2) + finger - halfFinger,
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2)
  );  

//Thumb
  quad(
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) - cubit - palm*5 - finger - halfFinger,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*5 - finger - halfFinger,
    (cubit*2) - finger*2 - halfFinger,
  (width/2) - cubit - palm*4 - finger*2 - halfFinger,
    (cubit*2) - finger*2 - halfFinger
  );

//Fingers
  quad(
  (width/2) - cubit - (palm*4) - finger*2 - halfFinger,
    (cubit*2) - finger*3 - halfFinger*2,
  (width/2) - cubit - palm*6,
    (cubit*2) - finger*3 - halfFinger,
  (width/2) - cubit - palm*5 - finger*2 - halfFinger,
    (cubit*2) - finger,
  (width/2) - cubit - palm*4 - finger*2 - halfFinger,
    (cubit*2)
  );

popMatrix();

popMatrix();

popMatrix();


  
//Ribcage
  quad(
  (width/2)-(palm*2)-(finger*2), (((cubit*2)+palm)),
  (width/2)+(palm*2)+(finger*2), (((cubit*2)+palm)),
  (width/2)+palm+(finger*3)+(burgers/12), (cubit*2)+(palm*3)+finger,
  (width/2)-palm-(finger*3)-(burgers/12), (cubit*2)+(palm*3)+finger
  );

//Belly
  ellipse(width/2, height/2+(finger*2), halfFinger+(burgers/32), halfFinger);  
//ellipse(width/2, height/2+(halfFinger*5), (palm*2)+finger+(burgers/halfFinger)+(burgers/halfFinger), (palm*2)+(burgers/halfFinger));
  ellipse(width/2, height/2+(finger*2), (palm*3)-finger+(burgers/4), (palm*2)+(finger*3)+burgers/4);
  ellipse((width/2)-((palm*2)-finger*2)-(burgers/8), ((cubit*2)+foot+finger)-(burgers/(32*4)), palm + halfFinger, palm + halfFinger);
  ellipse((width/2)+((palm*2)-finger*2)+(burgers/8), ((cubit*2)+foot+finger)-(burgers/(32*4)), palm + halfFinger, palm + halfFinger);
  
//Hips
  quad(
  (width/2)-(palm*2) - finger,
    (cubit*3)+palm-halfFinger,
  (width/2)+(palm*2),
    (cubit*3)+palm-halfFinger,
  (width/2)+ palm + finger*2 + halfFinger + (burgers/12),
    (cubit*2)+(palm*3)+finger,
  (width/2)- palm - finger*2 - halfFinger - (burgers/12),
    (cubit*2)+(palm*3)+finger
  );

//Quad Penis
  quad(
  (width/2)-(finger*2), ((cubit*3)+(palm*2)),
  (width/2)+(finger*2), ((cubit*3)+(palm*2)),
  (width/2)+(finger*2), (((cubit*3)+palm)-halfFinger),
  (width/2)-(finger*2), (((cubit*3)+palm)-halfFinger)
  );
  
  quad(
  (width/2)-(finger*2), (((cubit*3)+palm)-halfFinger),
  (width/2)+(finger*2), (((cubit*3)+palm)-halfFinger),
  (width/2)+palm+(finger*3)+(burgers/12), (cubit*2)+(palm*3)+finger,
  (width/2)-palm-(finger*3)-(burgers/12), (cubit*2)+(palm*3)+finger
  );

//Left (Standing) Leg
  
  quad(
  (width/2)-(palm*2)-finger,
    (cubit*3) + palm - halfFinger,
  (width/2),
    (cubit*3) + palm - halfFinger,
  (width/2) - (finger*3),
    (cubit*4) + palm - halfFinger,
  (width/2) - (palm*2) - halfFinger,
    (cubit*4) + palm - halfFinger
  );

  quad(
  (width/2) - palm - (finger*2),
    (cubit*5) - halfFinger,
  (width/2) - (finger*2),
    (cubit*5) - halfFinger,
  (width/2) - (finger*3),
    (cubit*4) + palm - halfFinger,
  (width/2) - (palm*2) - halfFinger,
    (cubit*4) + palm - halfFinger
  );
    
  quad(
  (width/2) - (finger*2),
    (cubit*5) - halfFinger,
  (width/2) - palm - (finger*2),
    (cubit*5) - halfFinger,
  (width/2) - palm - (finger*2),
    (cubit*5)+palm,
  (width/2),
    (cubit*5)+palm
  );
  
  
//Right Standing Leg

  quad(
  (width/2) + (palm*2),
    (cubit*3) + palm - halfFinger,
  (width/2) - finger,
    (cubit*3) + palm - halfFinger,
  (width/2) - halfFinger,
    (cubit*4) + palm - halfFinger,
  (width/2) + palm + finger,
    (cubit*4) + palm - halfFinger
  );
  
  quad(
  (width/2) + finger,
    (cubit*5) - halfFinger,
  (width/2) + palm + finger,
    (cubit*5) - halfFinger,
  (width/2) + palm + finger,
    (cubit*4) + palm - halfFinger,
  (width/2) - halfFinger,
    (cubit*4) + palm - halfFinger
  );
  
  quad(
  (width/2)+finger,
    (cubit*5) - halfFinger,
  (width/2) + palm + finger,
    (cubit*5) - halfFinger,
  (width/2) + palm + (finger*3),
    (cubit*5) + palm,
  (width/2)+finger,
    (cubit*5) + palm
  );
  
ellipse((width/2) - finger, cubit*5 + palm - halfFinger, finger+halfFinger, finger+halfFinger);
ellipse((width/2) - finger*2 - halfFinger/2, cubit*5 + palm - halfFinger, finger, finger);
ellipse((width/2) - finger*3 - halfFinger/2, cubit*5 + palm - halfFinger, finger, finger);
ellipse((width/2) - finger*4 - halfFinger/2, cubit*5 + palm - halfFinger, finger, finger);
ellipse((width/2) - finger*5 - halfFinger/2, cubit*5 + palm - halfFinger, finger, finger);
  
curve((width/2) + palm, (cubit*4) + palm*3,
(width/2) - halfFinger, (cubit*4) + palm - halfFinger,
(width/2) + halfFinger, (cubit*4) + foot,
(width/2) + foot, (cubit*5)
);

//Movable Legs
//"If you open your legs so much as to decrease your height 1/14"

line(0,(((cubit*5)+palm))-((cubit*4)/14), width, (((cubit*5)+palm))-((cubit*4)/14)); 

//Left Leg

pushMatrix();
translate(legLpx, leg_py);

pushMatrix();
rotate(radians(30));

pushMatrix();
translate(legLpx*(-1), leg_py*(-1));

//Ref for Leg's Pivots
//ellipse(legLpx, leg_py, 50, 50);

//Tighs 
  quad(
  (width/2)-(palm*2)-finger, (((cubit*3)+palm)-halfFinger),
  (width/2), (((cubit*3)+palm)-halfFinger),
  (width/2)-finger*2, (((cubit*4)+palm)-halfFinger),
  (width/2)-(palm*2), (((cubit*4)+palm)-halfFinger)
  );

//Fourth of a man

  quad(
  (width/2)-palm-(finger*2),
    (((cubit*5)-finger*2)-halfFinger),
  (width/2)-(finger*2),
    (((cubit*5)-finger*2)-halfFinger),
  (width/2)-finger*2,
    (((cubit*4)+palm)-halfFinger),
  (width/2)-(palm*2),
    (((cubit*4)+palm)-halfFinger)
  );
  
    quad(
  (width/2) - finger*2,
    (((cubit*5)-finger*2)-halfFinger),
  (width/2) - palm - finger*2,
    (((cubit*5)-finger*2)-halfFinger),
  (width/2) - palm - finger*4,
    ((cubit*5)+palm),
  (width/2) - finger*2,
    (((cubit*5)+palm))
  );

popMatrix();

popMatrix();

popMatrix();

//Right Leg

pushMatrix();
translate(legRpx, leg_py);

pushMatrix();
rotate(radians(30)*(-1));

pushMatrix();
translate(legRpx*(-1), leg_py*(-1));
  quad(
  (width/2)+(palm*2), (((cubit*3)+palm)-halfFinger),
  (width/2) - finger, (((cubit*3)+palm)-halfFinger),
  (width/2), (((cubit*4)+palm)-halfFinger),
  (width/2)+ palm + finger*2, (((cubit*4)+palm)-halfFinger)
  );
  
  quad(
  (width/2)+finger,
    (((cubit*5)-finger*2)-halfFinger),
  (width/2) + palm + finger,
    (((cubit*5)-finger*2)-halfFinger),
  (width/2) + palm + finger*2,
    (((cubit*4)+palm)-halfFinger),
  (width/2),
    (((cubit*4)+palm)-halfFinger)
  );
  
  quad(
  (width/2)+finger,
    (((cubit*5)-finger*2)-halfFinger),
  (width/2) + palm + finger,
    (((cubit*5)-finger*2)-halfFinger),
  (width/2) + palm + finger*3,
    ((cubit*5)+palm),
  (width/2)+finger,
    (((cubit*5)+palm))
  );
  
popMatrix();

popMatrix();

popMatrix();

//DaVinci's Ruler

noFill();
ellipse(mouseX, height - palm, halfFinger+1, halfFinger+1);

fill(0);

//Cubits
ellipse(width/2, height - (finger*2), halfFinger+1, halfFinger+1);
ellipse(width/2 + cubit, height - (finger*2), halfFinger+1, halfFinger+1);
ellipse(width/2 - cubit, height - (finger*2), halfFinger+1, halfFinger+1);
ellipse(width/2 + (cubit*2), height - (finger*2), halfFinger+1, halfFinger+1);
ellipse(width/2 - (cubit*2), height - (finger*2), halfFinger+1, halfFinger+1);

//Palms
ellipse(width/2 - cubit - palm, height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 - cubit - (palm*2), height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 - cubit - (palm*3), height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 - cubit - (palm*4), height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 - cubit - (palm*5), height - (finger*2), halfFinger, halfFinger);

ellipse(width/2 + cubit + palm, height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 + cubit + (palm*2), height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 + cubit + (palm*3), height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 + cubit + (palm*4), height - (finger*2), halfFinger, halfFinger);
ellipse(width/2 + cubit + (palm*5), height - (finger*2), halfFinger, halfFinger);

//Fingers
ellipse(width/2 - cubit - (palm*5) - finger, height - (finger*2), halfFinger-1, halfFinger-1);
ellipse(width/2 - cubit - (palm*5) - (finger*2), height - (finger*2), halfFinger-1, halfFinger-1);
ellipse(width/2 - cubit - (palm*5) - (finger*3), height - (finger*2), halfFinger-1, halfFinger-1);

ellipse(width/2 + cubit + (palm*5) + finger, height - (finger*2), halfFinger-1, halfFinger-1);
ellipse(width/2 + cubit + (palm*5) + (finger*2), height - (finger*2), halfFinger-1, halfFinger-1);
ellipse(width/2 + cubit + (palm*5) + (finger*3), height - (finger*2), halfFinger-1, halfFinger-1);

}


