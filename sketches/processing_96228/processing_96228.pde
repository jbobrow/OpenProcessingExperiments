
// David Haro Torne
 //  2n GEDI - 3r trimestre
   //Informàtica 2013 - G03
  // Elisava 


//definim tipus de variable
int x;
int y;
int ulls;
//es defineix la grandaria de la finestra així com el color del fons (negre)
void setup()
{
size(600,600);
background(0);
stroke(0);
strokeWeight(0);

}

void draw()
{
  background(0);// es posa un bakcground al inici de tot del típus (0), perque no quedi el recorregut de l' "espasa gedi" i el fons és negre.
  //ara es fabrica la espasa l'àser, on és un conjunt de formes que es mouen a la vegada seguint el cursor.
  fill(220,255,28);
stroke(220,255,28);
rect(mouseX,mouseY,8,140);// aquesta espasa s' anira movent per tota la finestra, i sera l' encarregada de tallar el cap del Kenny.
ellipse(mouseX+4,mouseY,8,8);

fill(188,188,188);
stroke(188,188,188);
rect(mouseX-6,mouseY+140,20,5);

fill(188,188,188);
stroke(188,188,188);
rect(mouseX,mouseY+140,8,50);

fill(188,188,188);
stroke(188,188,188);
rect(mouseX-6,mouseY+190,20,5);

fill(188,188,188);
stroke(188,188,188);
ellipse(mouseX+4,mouseY+193,11,11);

fill(255,9,0);
stroke(255,9,0);
ellipse(mouseX+4,mouseY+175,4,4);


// hem agafat el Kenny del seminari 1 i qüan l' epasa passa per sobre seu canvia de color, però ho fa de diferents maneres en diferents llocs del cos, depen de si s' ha imposat que ho fassi respecte les x o les y
fill(-mouseX/4+255,-mouseX/4+100,-mouseX/4+3);
arc(300,400+mouseX/2,300,300,-PI,0); // s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.
 
//volem que el cap se l' hi fassi petit petit quan l' eespaza GEDI l' hi passa per el coll, simulan que l' hi talla. 
stroke(-mouseY/4+255,-mouseY/4+100,-mouseY/4+3);
fill(mouseY/4+255,mouseY/4+100,mouseY/4+3);
ellipse(300,170,300-mouseX/4,300-mouseX/4);
 
stroke(255,100,3);
fill(255,100,3);
rect(205,400+mouseX/2,200,45);// s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.
 

stroke(126,49,1);
fill(126,49,1);
rect(170,445+mouseX/2,265,10);// s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.
 
stroke(0);
strokeWeight(2);
fill(255,100,3);
ellipse(300,175,190-mouseX/6,165-mouseX/6);//aquesta part dle cap tmabè s' ah de fer petita d' acord amb tota la resta
 
stroke(0);
line(300,400+mouseX/2,300,325);// s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.
 
stroke(126,49,1);
strokeWeight(2);
fill(126,49,1);
ellipse(300,162,160-mouseX/6,135-mouseX/6);//aquesta part dle cap tmabè s' ah de fer petita d' acord amb tota la resta
 
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse(300,162,105-mouseX/6,135-mouseX/6);//aquesta part dle cap tmabè s' ah de fer petita d' acord amb tota la resta
 
stroke(255);
strokeWeight(2);
fill(255);
ellipse(274,162,51-mouseX/6,65-mouseX/8);//aquesta part dle cap tmabè s' ah de fer petita d' acord amb tota la resta
 
stroke(255);
strokeWeight(2);
fill(255);
ellipse(325,162,51-mouseX/6,65-mouseX/8);//aquesta part dle cap tmabè s' ah de fer petita d' acord amb tota la resta
 
stroke(0);
strokeWeight(1);
fill(0);
ellipse(279,160,10-mouseX/60,10-mouseX/60);
 
stroke(0);
strokeWeight(1);
fill(0);
ellipse(320,160,10-mouseX/60,10-mouseX/60);
 
stroke(126,49,1);
strokeWeight(1);
fill(126,49,1);
ellipse(170,400+mouseX/2,50,50);// s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.
 
stroke(126,49,1);
strokeWeight(1);
fill(126,49,1);
ellipse(435,400+mouseX/2,50,50);// s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.
 
stroke(126,49,1);
strokeWeight(1);
fill(126,49,1);
ellipse(190,395+mouseX/2,30,30);// s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.
 
stroke(126,49,1);
strokeWeight(1);
fill(126,49,1);
ellipse(410,395+mouseX/2,30,30);// s' ha volgut traslladar tot el cos cap a baix per fer més real que el cos i el cap estan separats.


}


