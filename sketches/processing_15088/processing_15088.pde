
void setup() {
  size(774,861);
PImage b;
b = loadImage("AY.jpg");
image(b, 0, 0);

smooth();
strokeWeight(6);
//BLACK CR
stroke (0);
line (82, 205, 85, 283);
line (39, 230, 133, 228);
//LEFT RED 
stroke (159, 20, 45);
strokeWeight(3); 
line (210, 458, 69, 115);
//BLUE L
stroke (68, 70, 98);
line(306, 764, 618, 250); 
//YELLOW L 
stroke (#f37f0e);
line (419, 483, 621, 354);
//RED SMALL L 
stroke (166, 16, 0);
line (345, 792, 286, 754);
line (479, 423, 425, 420);
line (232, 448, 176, 473);
//BLACK L 
stroke (0);
line (455, 420, 441, 197);
line (333, 360, 582, 425);
//YELOW TRI 
noStroke();
fill (#f37f0e); 
triangle (304, 226, 367, 376, 407, 225);  
//BLACK REC 
fill (0);
quad (434, 294, 361, 330, 372, 357, 465, 322);
quad (504, 84, 212, 117, 223, 190, 512, 153);
quad (396, 14, 304, 22, 312, 111, 405, 101);
//RED REC
fill (166, 16, 0);
quad (648, 179, 87, 389, 95, 404, 655, 195);
quad (416, 164, 164, 198, 167, 237, 417, 232);
quad (580, 270, 540, 160, 568, 148, 607, 257);
quad (535, 49, 401, 65, 405, 96, 538, 79);
//BLUE SQU 
fill(68, 81, 90);
quad (299, 626, 285, 627, 288, 639, 302, 635);
quad (283, 774, 256, 769, 254, 802, 277, 807);
 
 
 save("malevich.tif");
}



