
// TJ Bel

// A sunny day at the beach.

//setup
size (600, 400);
background (#C6E1F0);
//sun
smooth ();
stroke (#F0E911);
strokeWeight (5);
fill (#F0E911);
ellipse (510, 50, 80, 80);
//sand
stroke (#EDE6D7);
strokeWeight (5);
fill (#EDE6D7);
rect (1, 280, 600, 120);
//water
stroke (#4BA9C4);
strokeWeight (5);
fill (#4BA9C4);
rect (1, 180, 600, 100);
//palm base
stroke (#C3CEAD);
strokeWeight (5);
fill (#C3CEAD);
rect (100, 300, 10, 70);
//palm fronds
smooth ();
noFill ();
stroke (#4C983C);
strokeWeight (9);
arc (84, 315, 50, 50, 2.8, 5.50);
arc (86, 330, 50, 50, 2.8, 5.50);
arc (134, 308, 50, 40, 3.40, 6.58);
arc (132, 325, 50, 50, 3.40, 6.58);
arc (86, 320, 50, 40, 2.8, 5.50);
arc (132, 317, 50, 40, 3.40, 6.58);
arc (136, 304, 50, 50, 3.40, 5.20);
arc (83, 300, 50, 50, 2.8, 6.20);
strokeWeight (7);
line (108, 290, 108, 275);
//boat
stroke (#5A431F);
strokeWeight (5);
fill (#5A431F);
arc (200, 200, 45, 12, .50, 2.80);
strokeWeight (3);
line (200, 187, 200, 198);
//sail
stroke (#FFFFFF);
fill (#FFFFFF);
triangle(202, 170, 200, 191, 180, 191);
//umbrellas
smooth ();
stroke (#37DFED);
strokeWeight (1);
fill (#37DFED);
arc (400, 300, 50, 50, 3.14, 6.28);
stroke (#64F046);
fill (#64F046);
arc (300, 325, 40, 40, 3.14, 6.28);
stroke (#F04682);
fill (#F04682);
arc (350, 370, 45, 45, 3.14, 6.28);
stroke (#F0B73C);
fill (#F0B73C);
arc (210, 310, 33, 33, 3.14, 6.28);
stroke (#464AF0);
fill (#464AF0);
arc (500, 340, 51, 51, 3.14, 6.28);
stroke (#F5240C);
fill (#F5240C);
arc (40, 375, 58, 58, 3.14, 6.28);
stroke (#8B8B8A);
strokeWeight (2);
line (400, 300, 400, 318);
line (300, 325, 300, 343);
line (350, 370, 350, 388);
line (210, 310, 210, 318);
line (500, 340, 500, 358);
line (40, 375, 40, 392);
//birds
noFill ();
arc (78, 130, 8, 8, 3.2, 6.10);
arc (86.5, 129, 8, 8, 2.8, 6.18);
arc (90, 122, 8, 8, 3.2, 6.20);
arc (98.5, 122, 8, 8, 3.40, 6.22);
arc (86, 111, 7, 7, 3.2, 6.20);
arc (94, 111, 7, 7, 3.40, 6.22);
//sand edge
stroke (#EDE6D7);
strokeWeight (5);
fill (#EDE6D7);
arc (312, 298, 120, 40, 3.90, 7.58);
quad (581, 271, 596, 280, 569, 284, 520, 281);

