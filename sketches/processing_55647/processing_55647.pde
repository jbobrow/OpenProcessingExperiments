
size(400,400);
smooth();
background(230);

// HEAD & NECK

rect(70,100,90,45);   //head

fill(221);
rect(60,110,10,20);   //Left ear
rect(160,110,10,20);  //Right ear
fill(255);

rect(110,95,10,5);    //base antenna
strokeWeight(2);
line(115,80,115,95);  //antenna line
strokeWeight(1);
ellipse(115,80,7,7);  //antenna circle

ellipse(100,130,22,18);  //left eye
ellipse(130,130,22,18);  //right eye

strokeWeight(1.5);
ellipse(101,129,15,15);  //left pupil
ellipse(129,129,15,15);  //right pupil
strokeWeight(1);

triangle(99,109,101,112,91,116);    //left eyebrow
triangle(131,106,139,113,130,111);  //right eyebrow

fill(184);
quad(110,145,119,145,118,165,111,165);  //neck
fill(255);

// BODY: TORSO, ARMS & LEGS

quad(76,163,83,166,70,200,61,198);      //left upper arm
quad(60,200,70,200,70,235,60,235);      //left lower arm
quad(146,165,155,165,170,200,160,200);  //right upper arm
quad(160,200,170,200,170,235,160,235);  //right lower arm


quad(80,165,150,165,135,245,95,245);  //torso
strokeWeight(2);
line(94,240,136,240);                 //torso line
strokeWeight(1);
fill(109);
rect(100,180,30,10);                  //chest
fill(255);

fill(188);
ellipse(80,165,12,12);                //left shoulder
ellipse(65,200,10,10);                //left elbow

fill(94);
rect(57,235,16,5);                    //left wrist
rect(157,235,16,5);                    //right wrist
fill(188);

quad(60,240,70,240,69,248,61,248);    //left hand

ellipse(150,165,12,12);               //right shoulder
ellipse(165,200,10,10);               //right elbow

quad(160,240,170,240,169,248,161,248); //right hand
fill(50);
rect(96,270,15,5);                     //left foot
rect(118,270,15,5);                    //right foot
fill(255);

quad(97,245,111,245,108,270,100,270);  //left leg
quad(118,245,132,245,129,270,121,270); //right leg

