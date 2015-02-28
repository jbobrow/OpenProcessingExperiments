
                          //WINDOW                          
                         
background (0 , 230 , 0);  //Green backdrop
size (500 , 500);

smooth( );  //Softens edges
stroke (1);  //Borders effective

                            //TORSO

//TAIL

fill (206 , 146 , 33);  //Darker brown colouring
ellipse (140 , 330 , 10 , 10);  //Tail tip
noStroke ( );

fill (240 , 186 , 87);  //Lighter brown colouring
quad (142 , 325 , 139 , 335 , 250 , 440 , 250 , 420);  //Tail
stroke (1);
line (142 , 325 , 250 , 420);  //Top border tail
line (139 , 335 , 250 , 440);  //Bottom border tail
                            
//BODY

stroke (0);
fill (240 , 186 , 87);  //Lighter brown colouring
ellipse (250 , 350 , 150 , 200);  //Outer part of body

fill (206 , 146 , 33);  //Darker brown colouring
ellipse (250 , 350 , 100 , 150);  //Inner part of body

fill (147 , 115 , 56);  //Even darker brown colouring
ellipse ( 250 , 377 , 5 , 6);  //Bellybutton

//ARMS

fill (240 , 186 , 87);  //Lighter brown colouring
ellipse (123 , 185 , 13 , 13);  //Left elbow
ellipse (435, 242 , 13 , 13);  //Right elbow

noStroke ( );
quad (127 , 180 , 120 , 190 , 180 , 330 , 190 , 310);  //Left arm (bicep)
stroke (1);
line (127 , 180 , 190 , 310);  //Upper border of left arm (bicep)
line (120 , 190 , 180 , 330);  //Lower border of left arm (bicep)

noStroke ( );
quad (126 , 190 , 122 , 179 , 205 , 80 , 220 , 80);  //Left arm (forearm)
stroke (1);
line (129 , 185 , 219 , 80);  //Lower border of left arm (forearm)
line (122 , 179 , 205 , 80);  //Upper border of left arm (forearm)

noStroke ( );
fill (240 , 186 , 87);  //Lighter brown colouring
quad (310 , 310 , 318 , 330 , 435 , 250 , 430 , 240);  //Right arm (bicep)
stroke (1);
line (310 , 310 , 430 , 239);  //Right arm upper border (bicep)
line (424 , 257 , 318 , 330);  //Right arm lower border (bicep)

noStroke ( );
quad (439 , 245 , 428 , 247 , 380 , 380 , 386 , 390);  //Right arm (forearm)
stroke (1);
line (426 , 253 , 380 , 380);  //Right arm upper border (forearm)
line (437 , 249 , 386 , 390);  //Right arm lower border (forearm)

//LEFT HAND

strokeWeight (1);
ellipse (202 , 78 , 33 , 36);  //Left outer palm
fill (206 , 146 , 33);  //Darker brown colouring
ellipse (202 , 78 , 29 , 29);  //Left inner palm

                                //TREE
                                
//WOOD                                

stroke (1);
fill (13 , 165 , 14);  //Dark green colour
ellipse (365 , 80 , 60 , 60);  //First patch of leaves
ellipse (365 , 60 , 50 , 50);  //Second patch of leaves

noStroke ( );
fill (147 , 115 , 56);  //Even darker brown colouring
rect (0 , 60 , 400 , 30);  //Branch

rect (0 , 0 , 50 , 500);  //Trunk

stroke (1);
line (50 , 60 , 400 , 60);  //Top border (branch)
line (50 , 90 , 400 , 90);  //Bottom border (branch)

line (50 , 0 , 50 , 60);  //Top border (trunk)
line (50 , 90 , 50 , 500);  //Bottom border (trunk)

//LEAVES

fill (13 , 165 , 14);  //Dark green colour
ellipse (380 , 55 , 60 , 60);  //Third patch of leaves
ellipse (368 , 78 , 40 , 40);  //Fourth patch of leaves
ellipse (377 , 70 , 45 , 45);  //Fifth patch of leaves
ellipse (400 , 75 , 60 , 60);  //Sixth patch of leaves
ellipse (390 , 85 , 50 , 50);  //Seventh patch of leaves

                            //HEAD
                            
//EARS

stroke (1);
fill (240 , 186 , 87);  //Lighter brown colouring
ellipse (180 , 220 , 30 , 30);  //Outer part of LEFT ear

ellipse (320 , 220 , 30 , 30);  //Outer part of RIGHT ear

fill (206 , 146 , 33);  //Darker brown colouring
ellipse (180 , 221 , 20 , 20);  //Inner part of LEFT ear

ellipse (320 , 221 , 20 , 20);  //Inner part of RIGHT ear

//HEAD

fill (240 , 186 , 87);
ellipse (230 , 210 , 100 , 150);  //Left section of head

ellipse (270 , 210 , 100 , 150);  //Right section of head

//HAIR

stroke (240 , 186 , 87);
bezier (230 , 140 , 320 , 320 , 330 , 330 , 250 , 120);  //First lock of hair

bezier (240 , 140 , 320 , 320 , 330 , 330 , 260 , 120);  //Second lock of hair

stroke (0);
line (233 , 136 , 250 , 120);  //Hairline border no. 1
line (250 , 120 , 253 , 127);  //Hairline border no. 2
line (253 , 127 , 260 , 120);  //Hairline border no. 3
line (260 , 120 , 265 , 136);  //Hairline border no. 4

//EYES

ellipse (230 , 200 , 60 , 90);  //Eye border (left)

ellipse (270 , 200 , 60 , 90);  //Eye border (right)

noStroke ( );
fill (255);
ellipse (230 , 200 , 60 , 90);  //First white of eye (left)

ellipse (270 , 200 , 60 , 90);  //Second white of eye (right)

fill (0);
ellipse (235 , 200 , 20 , 30);  //First pupil (left)

ellipse (265 , 200 , 20 , 30);  //Second pupil (right)

//EYEBROWS

stroke (0);
strokeWeight (2);
line (195 , 165 , 245 , 151);  //Left eyebrow
line (255 , 137 , 305 , 152);  //Right eyebrow

//MOUTH AREA

stroke (0);
strokeWeight (1);
strokeWeight (0);
fill (206 , 146 , 33);  //Darker brown colour
ellipse (250 , 250 , 150 , 90);  //Dark brown circle around mouth

fill (0);
ellipse (245 , 217 , 5 , 10);  //First nostril (left)

ellipse (255 , 217 , 5 , 10);  //Second nostril (right)

strokeWeight (2);
fill (255);
ellipse (220 , 270 , 20 , 20);  //Open mouth

//LEGS

strokeWeight (1);
fill (240 , 186 , 87);  //Lighter brown colouring
ellipse (112 , 402 , 15 , 15);  //Knobly left knee
ellipse (410 , 424 , 15 , 15);  //Knobly right knee

noStroke ( );
quad (110 , 410 , 120 , 400 , 222 , 420 , 213 , 430);  //Left thigh
stroke (1);
line (110 , 410 , 213 , 430);  //Top border left thigh
line (119 , 400 , 213 , 418);  //Bottom border left thigh

noStroke ( );
quad (110 , 411 , 107 , 400 , 40 , 420 , 40 , 430);  //Left calf
stroke (1);
line (105 , 399 , 40 , 420);  //Top border left calf
line (110 , 411 , 40 , 430);  //Bottom border left calf

noStroke ( );
quad (290 , 420 , 295 , 430 , 410 , 430 , 410 , 420);  //Right thigh
stroke (1);
line (290 , 420 , 404 , 420);  //Upper border right thigh
line (284 , 430 , 405 , 430);  //Lower border right thigh

noStroke ( );
quad (400 , 427 , 411 , 432 , 320 , 460 , 320 , 450);  //Right calf
stroke (1);
line (400 , 427 , 320 , 450);  //Upper border right calf
line (411 , 432 , 320 , 460);  //Lower border right calf

//Feet

stroke (1);
fill (206 , 146 , 33);  //Darker brown colouring
ellipse (37 , 417 , 20 , 35);  //Left foot
ellipse (320 , 462 , 20 , 35);  //Right foot

//BANANA

fill (234 , 227 , 5);  //Juicy banana colour
curve (600 , 300 , 370 , 430 , 370 , 320 , 410 , 400);  //Banana part i
curve (500 , 300 , 373 , 427 , 373 , 320 , 410 , 400);  //Banana part ii

fill (0);
ellipse (372 , 429 , 4 , 3);  //Bottom tip of banana
rect (370 , 317 , 3 , 6);  //Top tip of banana
line (372 , 320 , 373, 427);  //Banana border


//RIGHT HAND

fill (240 , 186 , 87);  //Lighter brown colouring
ellipse (371 , 385 , 33 , 30);  //Right palm

//FINGERS

fill (206 , 146 , 33);  //Darker brown colouring
ellipse (195 , 60 , 8 , 10);  //First finger, left arm
ellipse (204 , 62 , 10 , 15);  //Second finger, left arm
ellipse (213 , 61 , 9 , 13);  //Second finger, left arm

ellipse (360 , 370 , 8 , 9);  //Thumb, right arm
ellipse (355 , 378 , 12 , 8);  //First finger, right arm
ellipse (354 , 386 , 15 , 9);  //Second finger, right arm
ellipse (355 , 393 , 11 , 6);  //Third finger, right arm

