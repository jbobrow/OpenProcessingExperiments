
void setup(){
  size(300,300);
}

void draw(){
background(255);

/* Body */
  fill(0,255,0);
  
/* Armen*/
    /*Rechts*/
rect(mouseX+40,mouseY-35,20,3);
rect(mouseX+40,mouseY-40,20,3);
rect(mouseX+40,mouseY-45,20,3);
rect(mouseX+40,mouseY-50,20,3);
  /*Links*/
rect(mouseX-10,mouseY-35,20,3);
rect(mouseX-10,mouseY-40,20,3);
rect(mouseX-10,mouseY-45,20,3);
rect(mouseX-10,mouseY-50,20,3);

/*Benen*/
rect(mouseX+30,mouseY-25,10,10);
rect(mouseX+10,mouseY-25,10,10);



/*Ext ogen stokken*/
  fill(0,255,0);
rect(mouseX+7,mouseY-130,5,20);
rect(mouseX+38,mouseY-130,5,20);

/*Lichaam*/
rect(mouseX+20,mouseY-60,10,10);

/*Hoofd*/
rect(mouseX,mouseY-110,50,50);
rect(mouseX+10,mouseY-55,30,30);

/*voeten*/
fill(58,72,38);
ellipse(mouseX+35,mouseY-15,10,10);
ellipse(mouseX+15,mouseY-15,10,10);

/* Handen */
  /*Links*/
ellipse(mouseX-10,mouseY-48,10,3);
ellipse(mouseX-10,mouseY-43,10,3);
ellipse(mouseX-10,mouseY-38,10,3);
ellipse(mouseX-10,mouseY-33,10,3);
  /*Rechts*/
ellipse(mouseX+60,mouseY-48,10,3);
ellipse(mouseX+60,mouseY-43,10,3);
ellipse(mouseX+60,mouseY-38,10,3);
ellipse(mouseX+60,mouseY-33,10,3);


/*eyes*/
fill(255);
ellipse(mouseX+9,mouseY-90,15,15);
ellipse(mouseX+42,mouseY-90,15,15);
ellipse(mouseX+26,mouseY-90,15,15);
/* Ext ogen */
ellipse(mouseX+9,mouseY-130,15,15);
ellipse(mouseX+41,mouseY-130,15,15);

fill(0);
ellipse(mouseX+9,mouseY-90,4,4);
ellipse(mouseX+42,mouseY-90,4,4);
ellipse(mouseX+26,mouseY-90,4,4);
/* Ext ogen */
ellipse(mouseX+9,mouseY-130,4,4);
ellipse(mouseX+41,mouseY-130,4,4);

/* Driekhoeken*/
fill(255,0,0);
triangle(mouseX,mouseY-110, mouseX+5,mouseY-120, mouseX+10, mouseY-110);
triangle(mouseX+40,mouseY-110,mouseX+45,mouseY-120,mouseX+50,mouseY-110);
triangle(mouseX+10,mouseY-110, mouseX+15,mouseY-120, mouseX+20, mouseY-110);
triangle(mouseX+20,mouseY-110, mouseX+25,mouseY-120, mouseX+30, mouseY-110);
triangle(mouseX+30,mouseY-110, mouseX+35,mouseY-120, mouseX+40, mouseY-110);


/*mond*/
fill(0);
rect(mouseX+10,mouseY-75,30,10);
fill(255);
rect(mouseX+14,mouseY-75,4,5);
rect(mouseX+20,mouseY-75,4,5);
rect(mouseX+26,mouseY-75,4,5);
rect(mouseX+32,mouseY-75,4,5);
rect(mouseX+11,mouseY-70,4,5);
rect(mouseX+17,mouseY-70,4,5);
rect(mouseX+23,mouseY-70,4,5);
rect(mouseX+29,mouseY-70,4,5);
rect(mouseX+35,mouseY-70,4,5);

/*Lichaam invulling*/
fill(39,139,10);
rect(mouseX+15,mouseY-50,6,3);
rect(mouseX+30,mouseY-45,2,8);
rect(mouseX+17,mouseY-37,5,7);


}

