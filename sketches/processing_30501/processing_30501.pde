
//canvas parameters
size(800, 800);
background(random (28), random (27), random (32));
smooth();
//style parameters
noStroke();

//set ellipses, with random colours
fill(random (223), random (205),random(33));
ellipse( 100, 100, 30, 30);
 
fill(random (195), random (62),random (132));
ellipse( 120, 180, 65, 65);
 
fill(random (40), random (38), random (88));
ellipse( 370, 350, 350, 350);
 
fill(random (126), random (135), random (204), random (200));
ellipse( 415, 400, 30, 30);
 
fill( 6, 6, 6);
ellipse( 330, 320, 250, 250);
 
fill(random (105), random (60), random (118), random (120));
ellipse( 450, 210, 100, 100);
 
fill(random (223), random (205), random (33));
ellipse( 600, 180, 60, 60);
 
fill(random (134), random (69), random (51));
ellipse( 730, 150, 25, 25);
 
fill(random (243), random (155), random (16));
ellipse( 680, 230, 35, 35);
 
fill(random (70), random (86), random (105), random (160));
ellipse( 600, 310, 140, 140);
 
fill( 6, 6, 6);
ellipse( 600, 310, 30, 30);
 
fill(random (40), random (38), random (88), random (190));
ellipse( 415, 400, 30, 30);
 
fill(random (115), random (223), random (113), random (80));
ellipse( 465, 380, 65, 65);
 
fill(random (91), random (101), random (162));
ellipse( 490, 550, 100, 100);
 
fill(random (237), random (193), random (14), random (100));
ellipse( 500, 450, 120, 120);
 
fill(random (237), random (193), random (14), random (100));
ellipse( 440, 455, 70, 70);
 
fill(random (195), random (62), random (132), random (120));
ellipse( 540, 480, 50, 50);
 
fill( 6, 6, 6);
ellipse( 520, 490, 15, 15);
 
fill(random (105), random (60), random (118), random (120));
ellipse( 360, 530, 90, 90);
 
fill( 6, 6, 6);
ellipse( 340, 570, 10, 10);
 
fill(random (149), random (93), random (51));
ellipse( 250, 550, 60, 60);
 
fill(random (153), random (133), random (64), random (150));
ellipse( 220, 520, 60, 60);
 
fill(random (79), random (60), random (43), random (150));
ellipse( 240, 590, 60, 60);
 
fill(random (114), random (55), random (39), random (150));
ellipse( 210, 585, 60, 60);
 
fill(random (240), random (228), random (76), random (150));
ellipse( 175, 580, 60, 60);
 
fill( 6, 6, 6);
ellipse( 120, 490, 100, 100);
 
fill(random (105), random (60), random (118));
ellipse( 120, 490, 90, 90);
 
fill( 6, 6, 6);
ellipse( 140, 470, 25, 25);
 
fill(random (105), random (60), random (118));
ellipse( 140, 650, 20, 20);
 
fill(random (81), random (91), random (152));
ellipse( 190, 680, 50, 50);
 
fill( 6, 6, 6);
ellipse( 130, 720, 20, 20);
 
fill(random (170), random (137), random (56));
ellipse( 400, 650, 30, 30);
 
fill(random (170), random (137), random (56));
ellipse( 216, 430, 15, 15);
 
fill( 6, 6, 6);
ellipse( 216, 430, 10, 10);
 
fill(random (131), random (108), random (90));
ellipse( 600, 600, 40, 40);
 
fill(random (152), random (139), random (185), random (150));
ellipse( 680, 640, 160, 160);
 
fill(random (211), random (207), random (146));
ellipse( 645, 610, 45, 45);
 
fill(random (116), random (126), random (188));
ellipse( 645, 610, 40, 40);
 
fill(random (114), random (55), random (37));
ellipse( 670, 570, 10, 10);
 
fill( 6, 6, 6 );
ellipse( 685, 570, 7, 7);
 
fill(random (125), random (113), random (53));
ellipse( 760, 640, 14, 14);
 
fill(random (174), random (169), random (65));
ellipse( 650, 740, 15, 15);
 
fill(random (108), random (55), random (41));
ellipse( 640, 770, 20, 20);
 
fill(random (55), random (62), random (108));
ellipse( 700, 780, 17, 17);

for ( int i = 0; i < 10; i = i +1)
{
   
   fill(random (255),random (255),random (255));
    noStroke ();
    float altura = random (100,200); 
   
    rectMode(CENTER); 
    rect(random(width),random(height/2-altura/2,height/2+altura/2 ), random(5) , altura);
            
}


//triangles
for ( int i = 0; i < 5; i = i +1)
{
   fill (255, random (255), random (255), 63);  
   triangle(random (width), random (height), random (width), random (height), random (width), random (height));
            
}
                                
