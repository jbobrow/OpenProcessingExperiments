
size (600,600); 
background (30); 
smooth ();

//left eye
strokeWeight (10);
stroke (95,242,182);
fill(64,55,180);
ellipse (200,200, 120, 170); //bottom purple with green outline

strokeWeight (3);
stroke (22,14,152);
fill (143,136,250);
ellipse (200,200, 90,150); //intermediate dark blue outline and periwinkle ellipse

strokeWeight (6);
stroke (238,146,245);
fill (5,20,152);
ellipse (200,200, 60,140); //middle dark blue with pink outline

strokeWeight (3);
stroke (255);
fill (245,163,40);
ellipse (200,210, 45,70); //middle orange and white circle

stroke (227,140,9);
fill (175,107,4);
ellipse (200,210, 30,50); //intermediate orange and brown circle

fill (209,2,16);
ellipse (200,210, 20,20); //innermost red and white circle

//right eye
strokeWeight (5);
stroke (255);
fill (0);
ellipse (400,300, 100,100); //underlying black and white circle

noStroke ();
fill (30);
ellipse (400,300, 60,60); //dark end of gradient

fill (60);  
ellipse (400,300,50,50);

fill (90);
ellipse (400,300,40,40);

fill (120);
ellipse (400,300,30,30);

fill (170);
ellipse (400,300,20,20);

fill (200);
ellipse (400,300,10,10); //white end of gradient

//mouth and teeth
strokeWeight (4);
stroke (0,255,0);
fill (100);
triangle (100,400, 500,500, 500,430); //big green outlined triangle

noStroke ();
fill (255);
triangle (496,433, 470,431, 496,490); //upper right tooth

triangle (496,496, 466,433, 450,480); //lower right tooth

triangle (448,480, 463,433, 420,430); 

triangle (416,429, 443,480, 370,460);

triangle (364,460, 409,430, 320,425);

triangle (315,425, 360,460, 280,440);

triangle (274,438, 310,425, 260,419);

triangle (269,438, 257,419, 240,430);

triangle (235,430, 253,419, 210,415);

triangle (207,415, 220,425, 185,418);

triangle (178,416, 203,413, 128,406); //left tooth

//semicircles or hair

strokeWeight (4);
stroke (0,255,0);
fill (0);

//right side
ellipse (600,0, 300,900); //vertical ellipses

ellipse (600,0, 250,800);

ellipse (600,0, 180,650);

ellipse (600,0, 600,300); //begin horizontal ellipses

ellipse (600,0, 550,250);

ellipse (600,0, 470,120);

//left side
ellipse (0,0, 150,1100);

ellipse (0,0, 90,800);
