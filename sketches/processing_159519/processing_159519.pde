


//The Standards

int halfFinger;
int finger;
int palm;
int foot;
int cubit;
int mansHeight;
int pace;


//Variables

float burgers = 0.0;
 
  
//Setup

void setup() {

  
//The Proportions

/*
Vitruvius, the architect, says in his work on architecture that the measurements of the human body are distributed by Nature as follows that is that
4 fingers make 1 palm, and 4 palms make 1 foot, 6 palms make 1 cubit; 4 cubits make a man's height. And 4 cubits make one pace and 24 palms make a man;
and these measures he used in his buildings. If you open your legs so much as to decrease your height 1/14 and spread and raise your arms till your
middle fingers touch the level of the top of your head you must know that the centre of the outspread limbs will be in the navel and the space between
the legs will be an equilateral triangle. The length of a man's outspread arms is equal to his height. From the roots of the hair to the bottom of the
chin is the tenth of a man's height; from the bottom of the chin to the top of his head is one eighth of his height; from the top of the breast to the
top of his head will be one sixth of a man. From the top of the breast to the roots of the hair will be the seventh part of the whole man. From the nipples
to the top of the head will be the fourth part of a man. The greatest width of the shoulders contains in itself the fourth part of the man. From the elbow
to the tip of the hand will be the fifth part of a man; and from the elbow to the angle of the armpit will be the eighth part of the man. The whole hand
will be the tenth part of the man; the beginning of the genitals marks the middle of the man. The foot is the seventh part of the man. From the sole of
the foot to below the knee will be the fourth part of the man. From below the knee to the beginning of the genitals will be the fourth part of the man.
The distance from the bottom of the chin to the nose and from the roots of the hair to the eyebrows is, in each case the same, and like the ear, a third
of the face.

The preceding is the complete translation of the text accompanying Leonardo DaVinci's Vitruvian Man. It is actually a translation of Vitruvius,
as Leonardo's drawing was originally an illustration for a book on the works of Vitruvius.
The Notebooks of Leonardo DaVinci Vol. 1 (of a 2 vol. set in paperback) pp. 182-3 Dover, ISBN 0-486-22572-0
*/  
  
  halfFinger = 4;
  finger = halfFinger*2;
  palm = finger *4;
  foot = palm *4;
  cubit = palm *6;
  mansHeight = cubit *4;
  pace = mansHeight;

  size((5 * cubit)+(2 * palm), (5 * cubit)+(2 * palm));

}
  
  
//still confused about how to use void and why...
  //trial and error brought me here though, with the help of processing.org
  
  void draw() {

  background(220);
  
  
//Trying to understand how to use Mouse Function
  //[http://processing.org/examples/mousefunctions.html]
  
  if (mouseX - (width/4) > 0 && mouseX < width - (palm*10))
  burgers = (mouseX-(width/4));
  
  
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

  
//Ribcage
  quad(
  (width/2)-(palm*2)-(finger*2), (((cubit*2)+palm)),
  (width/2)+(palm*2)+(finger*2), (((cubit*2)+palm)),
  (width/2)+palm+(finger*3)+(burgers/(finger+halfFinger)), (cubit*2)+(palm*3)+finger,
  (width/2)-palm-(finger*3)-(burgers/(finger+halfFinger)), (cubit*2)+(palm*3)+finger
  );

//Belly
  ellipse(width/2, height/2+(finger*2), halfFinger+(burgers/palm), halfFinger);  
//ellipse(width/2, height/2+(halfFinger*5), (palm*2)+finger+(burgers/halfFinger)+(burgers/halfFinger), (palm*2)+(burgers/halfFinger));
  ellipse(width/2, height/2+(finger*2), (palm*3)-finger+(burgers/halfFinger), (palm*2)+(finger*3)+burgers/halfFinger);
  ellipse((width/2)-((palm*2)-finger*2)-(burgers/finger), ((cubit*2)+foot+finger)-(burgers/foot), halfFinger*9, halfFinger*9);
  ellipse((width/2)+((palm*2)-finger*2)+(burgers/finger), ((cubit*2)+foot+finger)-(burgers/foot), halfFinger*9, halfFinger*9);
  
//Hips
  quad(
  (width/2)-(palm*2) - finger, (((cubit*3)+palm)-halfFinger),
  (width/2)+(palm*2), (((cubit*3)+palm)-halfFinger),
  (width/2)+ palm + finger*2 + halfFinger + (burgers/(finger+halfFinger)), (cubit*2)+(palm*3)+finger,
  (width/2)- palm - finger*2 - halfFinger - (burgers/(finger+halfFinger)), (cubit*2)+(palm*3)+finger
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
  (width/2)+palm+(finger*3)+(burgers/(finger+halfFinger)), (cubit*2)+(palm*3)+finger,
  (width/2)-palm-(finger*3)-(burgers/(finger+halfFinger)), (cubit*2)+(palm*3)+finger
  );

//Legs

  //Tighs
  
  pushMatrix();
    //I dont know how to use pushpopmatrix yet, but   realized it has something to do
  //with what I want to do with the limbs (rotate them after built)
  
  quad(
  (width/2)-(palm*2)-finger, (((cubit*3)+palm)-halfFinger),
  (width/2), (((cubit*3)+palm)-halfFinger),
  (width/2)-finger*2, (((cubit*4)+palm)-halfFinger),
  (width/2)-(palm*2), (((cubit*4)+palm)-halfFinger)
  );

  quad(
  (width/2)+(palm*2), (((cubit*3)+palm)-halfFinger),
  (width/2) - finger, (((cubit*3)+palm)-halfFinger),
  (width/2), (((cubit*4)+palm)-halfFinger),
  (width/2)+ palm + finger*2, (((cubit*4)+palm)-halfFinger)
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
}


