
// Processing Haiku
// 3 lines: 5/7/5 syllables
// But I'm going to cheat a little
// by creating variables to use in
// the commands.

// Create the variables

// The first three are RGB colors
int r = 100;
int g = 0;
int b = 60;

// The next four set lines coordinates
int start = 10;
int rightHere = 10;
int end = 90;
int rightThere = 90;

int _this = 50;
int _is = 20;
int _the = 50;
int _end = 80;

// Some attributes
strokeWeight(20);

// The actual haiku
background(r, g, b);
line(start, rightHere, end, rightThere);
line(_this, _is, _the, _end);
