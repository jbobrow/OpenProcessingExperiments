
//Author - Lostrit form Cummunicatoin University of China
//UCLA Summer12 - Interactivity - Workshop 2

size(640,360);  //window size required

smooth();  //just smooth

background(#E4DFCC);  //background color

strokeWeight(0);  //I found it funny to set the value to 0
stroke(#A4A19C);  //just a stroke color

//====================red_1=======================
//red_1
fill(#D4413A);
quad( 0,0 , 134,0 , 96,36 , 0,61 );

//====================dark brown================
//dark brown
fill(#453B32);
triangle( 546,57 , 559,127 , 493,77 );

//right the dark brown
fill(#E0D9BF);
quad( 546,57 , 559,127 , 567,125 , 553,55 );

//====================brown====================
//main brown
fill(#B69F97);
quad( 303,0 , 565,0 , 603,26 , 427,86 );

//below the brown
fill(#E4D5B4);
quad( 427,86 , 603,26 , 603,38 , 428,101 );

//left the brown
fill(#2F2A27);
quad( 427,86 , 428,101 , 281,0 , 303,0 );

//==================red_4=====================
//red_4
fill(#D3281E);
quad( 543,9 , 544,13 , 594,0 , 581,0 );

//above the red_4
fill(#E3DECB);
quad( 543,9 , 581,0 , 560,0 , 537,6);

//left the red_4
fill(#E4DECE);
quad(543,9 , 537,6 , 537,11 , 544,13);

//==================red_5=====================
fill(#DC3932);
triangle(606,94 , 640,89 , 640,154);

//==================blue======================
fill(#739DC3);
quad(249,0 , 513,0 , 520,26 , 309,75);

//==================circle===================
noStroke();
//circle
fill(#252122);
ellipse(193,92,236,236);

//==================red_3=====================
stroke(#A4A19C);
//red_3
fill(#A12519);
quad(197,21 , 290,0 , 309,0 , 200,26);
//above the red_3
fill(#CCC8C5);
quad(197,21 , 290,0 , 239,0 , 194,10);

//==================red_2=====================
//red_2
fill(#D33029);
quad( 16,323 , 31,330 , 148,43 , 132,35);
//above the red_2
fill(#D6CFBD);
quad( 148,43 , 132,35 , 166,21 , 183,30);
//right the red_2
fill(#E4DDCB);
quad(148,43 , 183,30 , 72,310 , 31,330);

//=================gray=====================
//gray
fill(#A09F9A);
quad( 31,152 , 37,176 , 256,126 , 250,102);

//==================yellow====================
//yellow
fill(#DABD31);
beginShape();
vertex(60,116);
vertex(196,83);
vertex(211,145);
vertex(179,152);
vertex(172,120);
vertex(66,144);
endShape();

