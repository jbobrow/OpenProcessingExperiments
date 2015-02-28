
size(2560, 1440);
background(240, 186, 99);
strokeWeight(0);
fill(80, 132, 203);
ellipse(1920, 432, 960, 960);//head
bezier(1440, 432, 1280, 528, 1400, 600, 1440, 576);//nose
fill(103, 167, 255);
triangle(1480, 360, 1480, 432, 1600, 432);//triangle under eye
fill(31, 56, 90);
bezier(1480, 432, 1465, 440, 1465, 460, 1480, 480);//pupil of eye
fill(103, 167, 255);
triangle(1480, 480, 1480, 435, 1560, 435);//eye
triangle(1480, 504, 1600, 495, 1480, 528);//eye bags EDIT!!!!
fill(31, 56, 90);
triangle(1480, 432, 1430, 442, 1600, 432);//eyelashes
quad(1480, 330, 1480, 355, 1550, 365, 1550, 360); // top eyebrow
quad(1550, 365, 1550, 360, 1600, 427, 1600, 432);//lower eyebrow
fill(103, 167, 255);
triangle(1440, 536, 1440, 624, 1400, 624);//small triangle lip
quad(1520, 682, 1480, 566, 1440, 566, 1440, 624);//quad lip
fill(104, 161, 240);
triangle(1440, 432, 1440, 529, 1480, 529);//next to nose
ellipse(1460, 546, 60, 48);//nostril
fill(31, 56, 90);
ellipse(1460, 556, 40, 30);//inner nostril
quad(1400, 624, 1420, 672, 1520, 682, 1440, 624);//upper lip
quad(1420, 672, 1400, 696, 1440, 720, 1520, 682);//lower lip
fill(103, 167, 255);
triangle(1520, 682, 1440, 720, 1600, 720); //triangle under lip
triangle(1440, 720, 1600, 720, 1600, 864);//triangle next to chin
bezier(1440, 720, 1420, 782, 1440, 864, 1600, 864);//chin
triangle(1600, 720, 1600, 864, 1820, 864); //triangle to the left of neck
quad(1600, 720, 1920, 720, 1920, 1152, 1700, 864); //neck
fill(80, 132, 203);
rect(1920, 720, 80, 432); //rect next to neck
fill(80, 132, 203);
quad(1760, 864, 1760, 854, 1920, 710, 1920, 720);//cheek bone
rect(1920, 576, 10, 120);// 2nd cheek bone
fill(103, 167, 255);
bezier(1900, 508, 1900, 558, 1920, 576, 1935, 535);//ear
ellipse(1920, 576, 60, 60);//earring
ellipseMode(CENTER);
fill(31, 56, 90);
ellipse(1920, 576, 30, 30);
fill(104, 161, 240);
ellipse(1720, 576, 340, 160);//cheek
ellipseMode(CENTER);
fill(118, 176, 255);
ellipse(1720, 576, 180, 124);//inner cheek
//HAIR
fill(31, 56, 90);
quad(1800, 0, 1920, 528, 2480, 528, 2320, 0);//top right hair
quad(1800, 0, 1650, 0, 1500, 65, 1920, 528);//top left hair
quad(1920, 528, 2000, 720, 2000, 1152, 2480, 528);//bottom center hair
triangle(2000, 1152, 2480, 528, 2480, 1152); //bottom right
//FLYAWAY BRAIDS
triangle(1550, 130, 1550, 160, 1580, 160);
triangle(1580, 160, 1550, 160, 1550, 190);
triangle(1550, 190, 1520, 210, 1550, 240);
triangle(1550, 240, 1550, 270, 1580, 270);
triangle(1580, 270, 1580, 310, 1610, 310);//working on
triangle(1610, 310, 1610, 340, 1640, 340);
triangle(1640, 340, 1670, 340, 1670, 370);
triangle(1670, 370, 1670, 400, 1700, 400);
triangle(1700, 400, 1730, 400, 1730, 430);
triangle(1730, 430, 1730, 460, 1760, 460);
triangle(1760, 460, 1790, 460, 1790, 490);
triangle(1790, 460, 1790, 490, 1820, 490);
triangle(1820, 490, 1850, 490, 1835, 520);
triangle(1850, 490, 1890, 490, 1890, 520);
//SHOULDER
fill(103, 167, 255);
bezier(1920, 1152, 2000, 960, 2400, 1008, 2560, 1152);
quad(1920, 1152, 1820, 1440, 2560, 1440, 2560, 1152);
fill(80, 132, 203);
triangle(1920, 1152, 1820, 1440, 1650, 1440);
