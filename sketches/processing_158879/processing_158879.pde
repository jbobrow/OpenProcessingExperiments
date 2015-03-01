
size (400,400);
background (255, 255, 255);
fill (0,0,0);
ellipse (200, 200, 200,200);//head
ellipse (100, 100, 110,120);//left ear
ellipse (300, 100, 120,120);//right ear
fill (255,255,255);
strokeWeight(3);
ellipse (200,230,190,130);//mouth area
noStroke();
ellipse (170,180, 90,120);//left eye surrounding area
ellipse (230,180, 90,120);//right eye surrounding area
stroke(9);
strokeWeight(3);
ellipse (183,200, 25,70);//left eye
ellipse (217,200, 25,70);//right eye
fill (0,0,0);
ellipse (183, 220, 12,25);//left pupil
ellipse (217, 220, 12,25);//right pupil
noFill();
curve (100, 280, 170, 238, 230, 238, 350, 300);//bridge
fill(0,0,0);
ellipse (200, 254, 60,30);//nose
noFill();
stroke(0);
arc(200, 237, 150, 90, 0.2, PI - 0.2);//smile

