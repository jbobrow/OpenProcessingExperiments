
void setup () {
size(200,200);        //grootte van het document//
}

void draw() {
background(255);      //kleur van het document//
/*lichaampje*/
fill(186,182,182);    //kleur van het lichaampje//
rectMode(CENTER);     //positionering van het vormpje van het lichaampje//
rect(mouseX,mouseY,20,100); //vorm van het lichaampje//

fill(0);              //zwarte sjlieps//
rect(mouseX,mouseY,5,40);

fill(186,0,10);        //rode sjlieps//
rect(mouseX,mouseY,3,35);

/*broekje*/
fill(186,0,10);
rectMode(CENTER);
rect(mouseX,mouseY+45,20,10);

/*hoofd*/
fill(186,182,182);
rect(mouseX,mouseY-30,60,60);


/*linker oog*/
fill(255);
ellipse(mouseX-19,mouseY-30,16,31);

/*linker iris*/
fill(186,0,10);
ellipse(mouseX-19,mouseY-30,8,15);


/*rechter oog*/
fill(255);
ellipse(mouseX+19,mouseY-30,16,32);

/*rechter iris*/
fill(186,0,10);
ellipse(mouseX+19,mouseY-30,8,14);

/*beentjes*/
line(mouseX-10,mouseY+50,mouseX-20,mouseY+60);
line(mouseX+10,mouseY+50,mouseX+20,mouseY+60);

ellipse(mouseX-21,mouseY+55,8,14);
ellipse(mouseX+19,mouseY+55,8,14);

/*armpjes*/
line(mouseX-10,mouseY+5,mouseX-20,mouseY+30);
line(mouseX+10,mouseY+5,mouseX+20,mouseY+30);

rect(mouseX,mouseY-63,40,7);
fill(0);
rect(mouseX,mouseY-70,30,14);

}

