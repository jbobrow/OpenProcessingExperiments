
size(640, 480);
background(187,214,26);
smooth();

noStroke();
fill(#BBC810);
rect(20, 20, 600, 440, 7);
fill(#BBa810);
rect(40, 40, 270, 400, 7);
fill(#C6C264);
rect(330, 40, 270, 190, 7);
fill(#C6C264);
rect(330, 250, 270, 190, 7);

noFill();
strokeJoin(ROUND);

// All arcs are organizeds from bottom left clockwise 
// Main white Arcs
stroke(230,237,190);
strokeWeight(10);
arc(129, 364, 188, 188, radians(-29), radians(262));
arc(104, 197, 150, 150, radians(82), radians(314));
arc(192, 107, 102, 102, radians(14), radians(134));
arc(353, 146, 228, 228, radians(-167), radians(1));
arc(495, 148, 56, 56, radians(-179), radians(76));
arc(531, 230, 115, 115, radians(-90), radians(48));
arc(527, 277, 209, 209, radians(-215), radians(-90));
arc(393, 371, 119, 119, radians(-35), radians(221));
arc(284, 279, 165, 165, radians(-209), radians(41));

// Green Arcs, with same centers of the mains arcs
// Diameter difference = 30
strokeWeight(12);
stroke(#89982D);
arc(129, 364, 158, 158, radians(-29), radians(262));
arc(104, 197, 110, 110, radians(82), radians(354));
arc(192, 107, 72, 72, radians(14), radians(234));
arc(353, 146, 259, 259, radians(-167), radians(-20));
// Not with the same center
arc(398, 146, 98, 98, radians(-167), radians(1));
arc(531, 230, 85, 85, radians(-90), radians(78));
arc(527, 277, 179, 179, radians(-215), radians(-90));
arc(393, 371, 148, 148, radians(-35), radians(221));
arc(284, 279, 136, 136, radians(-200), radians(41));

// Dark gray Arcs, with same centers of the mains arcs
// Diameter difference = 20
stroke(#505241);
strokeWeight(3);
arc(129, 364, 208, 208, radians(180), radians(237));
arc(129, 364, 208, 208, radians(-29), radians(90));
arc(104, 197, 130, 130, radians(82), radians(314));
arc(104, 197, 170, 170, radians(112), radians(302));
arc(192, 107, 122, 122, radians(14), radians(134));
arc(192, 107, 92, 92, radians(160), radians(234));
arc(353, 146, 208, 208, radians(-167), radians(1));
// Not with the same center
arc(398, 146, 118, 118, radians(-167), radians(1));
arc(495, 148, 76, 76, radians(-125), radians(22));
arc(495, 148, 46, 46, radians(-245), radians(-200));
arc(531, 230, 135, 135, radians(-90), radians(42));
arc(527, 277, 229, 229, radians(-215), radians(-110));
arc(527, 277, 158, 158, radians(-215), radians(-90));
arc(393, 371, 98, 98, radians(-139), radians(35));
arc(393, 371, 169, 169, radians(-35), radians(221));
arc(284, 279, 186, 186, radians(-203), radians(41));
arc(284, 279, 145, 145, radians(-270), radians(-208));

// Circles, with same centers of the mains arcs
noStroke();
fill(#CB613E);
arc(129, 364, 48, 48, 0, PI+PI);
arc(495, 148, 36, 36, 0, PI+PI);


