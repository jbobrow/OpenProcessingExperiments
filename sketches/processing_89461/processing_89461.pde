
//Homework 5
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)

float x, y, wd, ht;

void setup ( ) 
{
    size (400, 400);
    background (220);
    smooth ( );
    x= 200;
    y= 200;
    wd= 200;
    ht= 200;
    
    frameRate (20);
}

void draw ( ) 
{
//hands
fill (190, 165, 105);
noStroke ( );
ellipse (mouseX - (.23 * wd), mouseY + (.8 * ht), (.1 * wd), (.1 * ht));
ellipse (mouseX + (.23 * wd), mouseY + (.8 * ht), (.1 * wd), (.1 * ht));

//body shirt
fill (15, 110, 180);
noStroke ( );
ellipse (mouseX, mouseY + (.5 * ht), (.8 * wd), (.35 * ht));
quad (mouseX - (.4 * wd), mouseY + (.53 * ht), mouseX - (.27 * wd), mouseY + (.8 * ht), mouseX + (.27 * wd), mouseY + (.8 * ht), mouseX + (.4 * wd), mouseY + (.53 * ht));
strokeWeight (1);
stroke (220);
line (mouseX + (.24 * wd), mouseY + (.75 * ht), mouseX + (.27 * wd), mouseY + (.6 * ht));
line (mouseX - (.24 * wd), mouseY + (.75 * ht), mouseX - (.27 * wd), mouseY + (.6 * ht));


//face shape
fill (190, 165, 105);
noStroke ( );
ellipse (mouseX, mouseY, wd, ht);
ellipse (mouseX, mouseY - (.5 * ht), (1.1 * wd), (.5 * ht));
quad (mouseX - (.55 * wd), mouseY - (.5 * ht), mouseX + (.55 * wd), mouseY - (.5 * ht), mouseX + (.5 * wd), mouseY, mouseX - (.5 * wd), mouseY);


//shoes
fill (60, 20, 60);
ellipse (mouseX + (.1 * wd), mouseY + (.9 * ht), (.1 * wd), (.15 * ht));
ellipse (mouseX - (.1 * wd), mouseY + (.9 * ht), (.1 * wd), (.15 * ht));


//body pants
strokeWeight (0);
noStroke ( );
fill (30, 105, 80);
point (mouseX + (.25 * wd), mouseY + (.75 * ht));
point (mouseX + (.15 * wd), mouseY + (.9 * ht));
point (mouseX + (.05 * wd), mouseY + (.9 * ht));
point (mouseX, mouseY + (.85 * ht));
point (mouseX - (.05 * wd), mouseY + (.9 * ht));
point (mouseX - (.15 * wd), mouseY + (.9 * ht));
point (mouseX - (.25 * wd), mouseY + (.75 * ht));
beginShape ( );
vertex (mouseX + (.25 * wd), mouseY + (.75 * ht));
vertex (mouseX + (.15 * wd), mouseY + (.9 * ht));
vertex (mouseX + (.05 * wd), mouseY + (.9 * ht));
vertex (mouseX, mouseY + (.85 * ht));
vertex (mouseX - (.05 * wd), mouseY + (.9 * ht));
vertex (mouseX - (.15 * wd), mouseY + (.9 * ht));
vertex (mouseX - (.25 * wd), mouseY + (.75 * ht));
endShape ( );
strokeWeight (3);
stroke (60, 50, 15);
line (mouseX - (.24 * wd), mouseY + (.75 * ht), mouseX + (.24 * wd), mouseY + (.75 * ht));


/* "L" */
strokeWeight (4);
noFill ( );
stroke (250, 215, 235);
point (mouseX - (.1 * wd), mouseY - (.25 * ht));
point (mouseX - (.1 * wd), mouseY + (.25 * ht));
point (mouseX + (.2 * wd), mouseY + (.25 * ht));
beginShape ( );
vertex (mouseX - (.1 * wd), mouseY - (.25 * ht));
vertex (mouseX - (.1 * wd), mouseY + (.25 * ht));
vertex (mouseX + (.2 * wd), mouseY + (.25 * ht));
endShape ( );



//eyebrows
strokeWeight (3);
noStroke ( );
noFill ( );
//left
point (mouseX - (.7 * wd), mouseY - (.1 * ht));//reference
point (mouseX - (.6 * wd), mouseY - (.4 * ht));
point (mouseX - (.4 * wd), mouseY - (.55 * ht));
point (mouseX - (.2 * wd), mouseY - (.55 * ht));
point (mouseX - (.1 * wd), mouseY - (.53 * ht)); //reference
beginShape ( );
stroke (255);
curveVertex (mouseX - (.7 * wd), mouseY - (.1 * ht));//reference
curveVertex (mouseX - (.6 * wd), mouseY - (.4 * ht));
curveVertex (mouseX - (.4 * wd), mouseY - (.55 * ht));
curveVertex (mouseX - (.2 * wd), mouseY - (.55 * ht));
curveVertex (mouseX - (.1 * wd), mouseY - (.53 * ht)); //reference
endShape ( );
//right
noStroke ( );
point (mouseX + (.7 * wd), mouseY - (.1 * ht));//reference
point (mouseX + (.6 * wd), mouseY - (.4 * ht));
point (mouseX + (.4 * wd), mouseY - (.55 * ht));
point (mouseX + (.2 * wd), mouseY - (.55 * ht));
point (mouseX + (.1 * wd), mouseY - (.53 * ht)); //reference
beginShape ( );
stroke (255);
curveVertex (mouseX + (.7 * wd), mouseY - (.1 * ht));//reference
curveVertex (mouseX + (.6 * wd), mouseY - (.4 * ht));
curveVertex (mouseX + (.4 * wd), mouseY - (.55 * ht));
curveVertex (mouseX + (.2 * wd), mouseY - (.55 * ht));
curveVertex (mouseX + (.1 * wd), mouseY - (.53 * ht)); //reference
endShape ( );

//eyeballs
strokeWeight (10);
stroke (30);
point (mouseX - (.3 * wd), mouseY - (.2 * ht));
point (mouseX + (.3 * wd), mouseY - (.2 * ht));

//*Glasses*//
strokeWeight (5);
stroke (240, 200, 60);
fill (240, 200, 60, 70);
//left lense//
point (mouseX - (.1 * wd), mouseY - (.25 * ht));//reference
point (mouseX - (.1 * wd), mouseY - (.25 * ht));
point (mouseX - (.125 * wd), mouseY - (.4 * ht));
point (mouseX - (.5 * wd), mouseY - (.4 * ht));
point (mouseX - (.58 * wd), mouseY - (.2 * ht));
point (mouseX - (.55 * wd), mouseY);
point (mouseX - (.25 * wd), mouseY - (.05 * ht));
point (mouseX - (.25 * wd), mouseY - (.05 * ht));//reference
beginShape ( );
curveVertex (mouseX - (.1 * wd), mouseY - (.25 * ht));//reference
curveVertex (mouseX - (.1 * wd), mouseY - (.25 * ht));
curveVertex (mouseX - (.125 * wd), mouseY - (.4 * ht));
curveVertex (mouseX - (.5 * wd), mouseY - (.4 * ht));
curveVertex (mouseX - (.58 * wd), mouseY - (.2 * ht));
curveVertex (mouseX - (.55 * wd), mouseY);
curveVertex (mouseX - (.25 * wd), mouseY - (.05 * ht));
curveVertex (mouseX - (.25 * wd), mouseY - (.05 * ht));//reference
endShape ( );
beginShape ( );
vertex (mouseX - (.25 * wd), mouseY - (.05 * ht));
vertex (mouseX - (.1 * wd), mouseY - (.25 * ht));
endShape ( );
//right lense//
point (mouseX + (.1 * wd), mouseY - (.25 * ht));//reference
point (mouseX + (.1 * wd), mouseY - (.25 * ht));
point (mouseX + (.125 * wd), mouseY - (.4 * ht));
point (mouseX + (.5 * wd), mouseY - (.4 * ht));
point (mouseX + (.58 * wd), mouseY - (.2 * ht));
point (mouseX + (.55 * wd), mouseY);
point (mouseX + (.25 * wd), mouseY - (.05 * ht));
point (mouseX + (.25 * wd), mouseY - (.05 * ht));//reference
beginShape ( );
curveVertex (mouseX + (.1 * wd), mouseY - (.25 * ht));//reference
curveVertex (mouseX + (.1 * wd), mouseY - (.25 * ht));
curveVertex (mouseX + (.125 * wd), mouseY - (.4 * ht));
curveVertex (mouseX + (.5 * wd), mouseY - (.4 * ht));
curveVertex (mouseX + (.58 * wd), mouseY - (.2 * ht));
curveVertex (mouseX + (.55 * wd), mouseY);
curveVertex (mouseX + (.25 * wd), mouseY - (.05 * ht));
curveVertex (mouseX + (.25 * wd), mouseY - (.05 * ht));//reference
endShape ( );
beginShape ( );
vertex (mouseX + (.1 * wd), mouseY - (.25 * ht));
vertex (mouseX + (.25 * wd), mouseY - (.05 * ht));
endShape ( );



//moustache
strokeWeight (1);
fill (255, 50);
//fill (30, 165, 165);
//noFill ( );
stroke (255);
point (mouseX - (.3 * wd), mouseY + (.3 * ht));
point (mouseX - (.4 * wd), mouseY + (.4 * ht));
point (mouseX + (.3 * wd), mouseY + (.3 * ht));
point (mouseX + (.4 * wd), mouseY + (.4 * ht));

beginShape ( );
vertex (mouseX - (.3 * wd), mouseY + (.3 * ht));
vertex (mouseX - (.4 * wd), mouseY + (.4 * ht));
vertex (mouseX + (.4 * wd), mouseY + (.4 * ht));
vertex (mouseX + (.3 * wd), mouseY + (.3 * ht));
vertex (mouseX - (.3 * wd), mouseY + (.3 * ht));
endShape ( );

stroke (255, 255, 255, 100);
strokeWeight (1);
line (mouseX + (.3 * wd), mouseY + (.3 * ht), mouseX - (.3 * wd), mouseY + (.3 * ht));
line (mouseX + (.31 * wd), mouseY + (.31 * ht), mouseX - (.31 * wd), mouseY + (.31 * ht));
line (mouseX + (.32 * wd), mouseY + (.32 * ht), mouseX - (.32 * wd), mouseY + (.32 * ht));
line (mouseX + (.33 * wd), mouseY + (.33 * ht), mouseX - (.33 * wd), mouseY + (.33 * ht));
line (mouseX + (.35 * wd), mouseY + (.35 * ht), mouseX - (.35 * wd), mouseY + (.35 * ht));
line (mouseX + (.37 * wd), mouseY + (.37 * ht), mouseX - (.37 * wd), mouseY + (.37 * ht));
line (mouseX + (.4 * wd), mouseY + (.4 * ht), mouseX - (.4 * wd), mouseY + (.4 * ht));
}

void keyPressed ( ) 
{
  wd= wd/2;
  ht= ht/2;
}

void mousePressed( )
{
     background (220); 
}

