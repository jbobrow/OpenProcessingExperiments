
size( 640, 480 );
stroke( 0, 0 );

// main body
fill( 64 );
beginShape();
vertex( 236, 35 );
vertex( 234, 78 );
vertex( 264, 116 );
vertex( 234, 220 );
vertex( 184, 248 );
vertex( 196, 386 );
vertex( 279, 462 );
vertex( 405, 370 );
vertex( 428, 122 );
vertex( 388, 24 );
vertex( 350, 16 );
endShape( CLOSE );

// front
fill( 32 );
beginShape();
vertex( 236, 35 );
vertex( 234, 78 );
vertex( 264, 116 );
vertex( 234, 220 );
vertex( 184, 248 );
vertex( 196, 386 );
vertex( 279, 462 );
vertex( 278, 289 );
vertex( 338, 250 );
vertex( 373, 122 );
vertex( 344, 75 );
vertex( 350, 16 );
endShape( CLOSE );

// bottom slant
fill( 16 );
beginShape();
vertex( 234, 78 );
vertex( 264, 116 );
vertex( 373, 122 );
vertex( 344, 75 );
endShape( CLOSE );



// marquee interior side
fill( 102, 52, 29 );
beginShape();
vertex( 251, 42 );
vertex( 252, 76 );
vertex( 290, 74 );
vertex( 274, 47 );
endShape( CLOSE );

// marquee interior top
fill( 102, 52, 29 );
beginShape();
vertex( 251, 42 );
vertex( 344, 25 );
vertex( 342, 36 );
vertex( 274, 47 );
endShape( CLOSE );

// marquee interior back
fill( 143, 78, 48 );
beginShape();
vertex( 274, 47 );
vertex( 290, 74 );
vertex( 340, 72 );
vertex( 342, 36 );
endShape( CLOSE );



// screen
fill( 96 );
beginShape();
vertex( 278, 137 );
vertex( 261, 198 );
vertex( 338, 218 );
vertex( 357, 144 );
endShape( CLOSE );

// screen top bevel
fill( 16 );
beginShape();
vertex( 275, 128 );
vertex( 278, 137 );
vertex( 357, 144 );
vertex( 360, 136 );
endShape( CLOSE );

// screen side bevel
fill( 64 );
beginShape();
vertex( 275, 128 );
vertex( 254, 200 );
vertex( 262, 197 );
vertex( 278, 137 );
endShape( CLOSE );

// screen bottom bevel
fill( 64 );
beginShape();
vertex( 254, 200 );
vertex( 337, 225 );
vertex( 337, 218 );
vertex( 262, 197 );
endShape( CLOSE );



// control panel box front
fill( 32 );
beginShape();
vertex( 182, 248 );
vertex( 184, 256 );
vertex( 252, 290 );
vertex( 322, 303 );
vertex( 320, 288 );
vertex( 246, 275 );
endShape( CLOSE );

// control panel box side
fill( 48 );
beginShape();
vertex( 320, 288 );
vertex( 322, 303 );
vertex( 373, 267 );
vertex( 371, 255 );
endShape( CLOSE );

// control panel front
fill( 32 );
beginShape();
vertex( 170, 241 );
vertex( 171, 244 );
vertex( 235, 276 );
vertex( 326, 289 );
vertex( 325, 285 );
vertex( 241, 275 );
endShape( CLOSE );

// control panel side
fill( 64 );
beginShape();
vertex( 325, 285 );
vertex( 326, 289 );
vertex( 383, 251 );
vertex( 383, 245 );
endShape( CLOSE );

// control panel top
fill( 48 );
beginShape();
vertex( 215, 195 );
vertex( 161, 217 );
vertex( 170, 241 );
vertex( 241, 275 );
vertex( 325, 285 );
vertex( 383, 245 );
endShape( CLOSE );

// control panel top reflection
fill( 135, 128, 79, 50 );
beginShape();
vertex( 215, 195 );
vertex( 161, 217 );
vertex( 170, 241 );
vertex( 241, 275 );
vertex( 275, 279 );
vertex( 285, 244 );
endShape( CLOSE );



// player 3
fill( 32, 50 );
quad( 201, 216, 202, 225, 208, 223, 203, 216 );
ellipse( 205, 224, 6, 6 );

fill( 48 );
ellipse( 202, 215, 10, 6 );
fill( 32 );
quad( 201, 215, 197, 208, 203, 206, 203, 214 );
ellipse( 200, 207, 7, 7 );
fill( 128 );
ellipse( 201, 206, 2, 2 );

fill( 124, 172, 131 ); // green
ellipse( 194, 221, 5, 3 );
fill( 63, 90, 157 ); // blue
ellipse( 202, 219, 5, 3 );
fill( 225, 63, 91 ); // red
ellipse( 194, 224, 5, 3 );
fill( 255, 240, 121 ); // yellow
ellipse( 202, 223, 5, 3 );
fill( 119, 95, 122 ); // purple
ellipse( 189, 227, 5, 3 );
fill( 245, 132, 105 ); // orange
ellipse( 197, 226, 5, 3 );



// player 1
fill( 32, 50 );
quad( 221, 224, 221, 233, 227, 233, 223, 224 );
ellipse( 225, 234, 7, 7 );

fill( 48 );
ellipse( 222, 224, 12, 7 );
fill( 32 );
quad( 221, 224, 217, 215, 223, 213, 223, 223 );
ellipse( 220, 214, 8, 8 );
fill( 128 );
ellipse( 221, 214, 2, 2 );

fill( 124, 172, 131 ); // green
ellipse( 222, 228, 7, 4 );
fill( 63, 90, 157 ); // blue
ellipse( 229, 226, 7, 4 );
fill( 225, 63, 91 ); // red
ellipse( 227, 230, 7, 4 );
fill( 255, 240, 121 ); // yellow
ellipse( 234, 228, 7, 4 );
fill( 119, 95, 122 ); // purple
ellipse( 226, 234, 7, 4 );
fill( 245, 132, 105 ); // orange
ellipse( 234, 232, 7, 4 );



// player 2
fill( 32, 50 );
quad( 247, 240, 247, 251, 254, 250, 250, 239 );
ellipse( 250, 250, 7, 7 );

fill( 48 );
ellipse( 248, 240, 13, 7 );
fill( 32 );
quad( 247, 241, 243, 231, 250, 229, 250, 239 );
ellipse( 246, 230, 8, 8 );
fill( 128 );
ellipse( 247, 229, 2, 2 );

fill( 63, 90, 157 ); // blue
ellipse( 263, 239, 8, 5 );
fill( 255, 240, 121 ); // yellow
ellipse( 272, 238, 8, 5 );
fill( 245, 132, 105 ); // orange
ellipse( 278, 241, 8, 5 );
fill( 124, 172, 131 ); // green
ellipse( 258, 243, 8, 5 );
fill( 225, 63, 91 ); // red
ellipse( 267, 242, 8, 5 );
fill( 119, 95, 122 ); // purple
ellipse( 273, 245, 8, 5 );



// player 4
fill( 32, 50 );
quad( 270, 261, 271, 273, 277, 272, 274, 260 );
ellipse( 274, 272, 9, 9 );

fill( 48 );
ellipse( 272, 260, 15, 8 );
fill( 32 );
quad( 270, 260, 266, 249, 273, 248, 273, 259 );
ellipse( 271, 248, 9, 9 );
fill( 128 );
ellipse( 272, 248, 3, 3 );

fill( 63, 90, 157 ); // blue
ellipse( 288, 254, 9, 5 );
fill( 255, 240, 121 ); // yellow
ellipse( 297, 252, 9, 5 );
fill( 245, 132, 105 ); // orange
ellipse( 307, 252, 9, 5 );
fill( 124, 172, 131 ); // green
ellipse( 289, 260, 9, 5 );
fill( 225, 63, 91 ); // red
ellipse( 298, 257, 9, 5 );
fill( 119, 95, 122 ); // purple
ellipse( 308, 256, 9, 5 );



// start buttons
fill( 128 );
ellipse( 268, 214, 7, 4 );
ellipse( 275, 216, 7, 4 );
ellipse( 281, 218, 7, 4 );
ellipse( 289, 220, 7, 4 );



// coin buttons
fill( 223, 161, 44 );
quad( 199, 304, 200, 309, 203, 311, 203, 306 );
quad( 216, 315, 216, 320, 221, 322, 220, 317 );
quad( 234, 327, 235, 331, 239, 334, 239, 328 );
quad( 255, 339, 255, 344, 260, 347, 260, 341 );



// control panel edge highlight
fill( 0, 0 );
beginShape();
vertex( 170, 241 );
stroke( 128, 25 );
vertex( 241, 275 );
stroke( 128, 50 );
vertex( 325, 285 );
stroke( 128, 100 );
vertex( 383, 245 );
endShape();


