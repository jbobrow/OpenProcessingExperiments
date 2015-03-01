
/*
float flame1;
float flame2;
float flame3;
float flame4;

float flame1B;

float flame2B;
float flame2BB;

float flame3B;
float flame3BB;

float flame4B;
float flame4BB;
*/

float lights1;
float lights2;
float lights3;
float lights4;
float lights5;
float lights6;
float lights7;
float lights8;
float lights9;
float lights10;
float lights11;
float lights12;
float lights13;
float lights14;
float lights15;
float lights16;
float lights17;
float lights18;


void setup() {
  
size(1000,670);
/*
flame4=142;
flame3=303;
flame2=495;
flame1=739;

flame1B=765;
flame2B=507;
flame3B=304;
flame4B=132;

flame2BB=510;
flame3BB=306;
flame4BB=135;
*/

lights1=976;
lights2=930;
lights3=860;
lights4=820;
lights5=800;
lights6=750;
lights7=705;
lights8=670;
lights9=600;
lights10=560;
lights11=470;
lights12=425;
lights13=300;
lights14=275;
lights15=235;
lights16=190;
lights17=130;
lights18=80;

}

void draw() {
  noStroke();
  background(0);
  
// candle 4
fill(50);           //grey
rect(68,280,147,80);

fill(#081C4F);     //blue
rect(85 + random (-1,1),301,28,58);

fill(#965616);     //beige
rect(121 + random (-1,1),301,29,58);

fill(#EBC45D);    //big flame on table
ellipse(132,468 + random (-1,1),73,151);

fill(#EBFEF9);    //small flame on table
ellipse(135,474 + random (-1,1),32,125);

fill(#FE2D0E);    //red
ellipse(142,284,149,25);

fill(237,184,106,55);    //18
ellipse(140,220 + random (-1,1),150,150);

fill(#FEFEFE);    //flame
ellipse(142,258 + random (-2,2),25,46);



// candle 3
fill(50);           //grey
rect(214,316,181,96);

fill(#081C4F);     //blue
rect(234+ random (-1,1),331,30,79);

fill(#965616);     //beige
rect(275+ random (-1,1),331,30,79);

fill(#EBC45D);    //big flame on table
ellipse(304 + random (-1,1),525,89,185);

fill(#EBFEF9);    //small flame on table
ellipse(306 + random (-1,1),532,39,154);

fill(#FE2D0E);    //red
ellipse(301,313,187,30);

fill(237,184,106,55);    //18
ellipse(301,240 + random (-1,1),200,200);

fill(#FEFEFE);    //flame
ellipse(303,287 + random (-2,2),31,56);




// candle 2
fill(50);           //grey
rect(389,359,210,112);

fill(#081C4F);     //blue
rect(405 + random (-1,1),380,31,89);

fill(#965616);     //beige
rect(442 + random (-1,1),380,31,89);

fill(#EBC45D);    //big flame on table
ellipse(507,594 + random (-1,1),107,216);

fill(#EBFEF9);    //small flame on table
ellipse(510,603 + random (-1,1),46,186);

fill(#FE2D0E);    //red
ellipse(493,361,212,36);

fill(237,184,106,55);    //18
ellipse(493,265 + random (-1,1),250,250);

fill(#FEFEFE);    //flame
ellipse(495,336 + random (-1,1),38,68);




// candle 1
fill(#EBC45D);    //big flame on table
ellipse(765,636 + random (-1,1),118,150);

fill(#EBFEF9);    //small flame on table
ellipse(765,641 + random (-1,1),69,150);

fill(50);         //grey
rect(583,406,323,132);

fill(#DE9D41);    //beige
rect(604 + random (-1,1),409,11,120);

fill(#144E98);    //blue 1
rect(642 + random (-1,1),418,24,116);

fill(#144E98);    //blue 2
rect(670 + random (-1,1),418,28,118);

fill(#FD1A09);    //red
ellipse(739,405,335,33);

fill(237,184,106,55);    //18
ellipse(737,280 + random (-1,1),300,300);

fill(#0281F6);    //flame big
ellipse(739,350+ random (-1,1),46,120);

fill(0);          //stem
ellipse(739,390,11,58);

fill(255);        //flame small
ellipse(739,337+ random (-1,1),43,94);

fill(#DE9D41);    //table light big
rect(600 + random (-1,1),547,9,52);

fill(#144E98);    // flame big
rect(642 + random (-1,1),578,25,82);

fill(#144E98);    // flame big
rect(671 + random (-1,1),578,32,82);



// lights
fill(237,184,106,75);    //1
ellipse(lights1,189,65,65);

fill(237,184,106,75);    //2
ellipse(lights2,189,65,65);

fill(237,184,106,75);    //3
ellipse(lights3,189,65,65);

fill(237,184,106,75);    //4
ellipse(lights4,189,65,65);

fill(237,184,106,75);    //5
ellipse(lights5,189,65,65);

fill(237,184,106,75);    //6
ellipse(lights6,189,65,65);

fill(237,184,106,75);    //7
ellipse(lights7,189,65,65);

fill(237,184,106,75);    //8
ellipse(lights8,189,65,65);

fill(237,184,106,75);    //9
ellipse(lights9,189,65,65);

fill(237,184,106,75);    //10
ellipse(lights10,189,65,65);

fill(237,184,106,75);    //11
ellipse(lights11,189,65,65);

fill(237,184,106,75);    //12
ellipse(lights12,189,65,65);

fill(237,184,106,75);    //13
ellipse(lights13,189,65,65);

fill(237,184,106,75);    //14
ellipse(lights14,189,65,65);

fill(237,184,106,75);    //15
ellipse(lights15,189,65,65);

fill(237,184,106,75);    //16
ellipse(lights16,189,65,65);

fill(237,184,106,75);    //17
ellipse(lights17,189,65,65);

fill(237,184,106,75);    //18
ellipse(lights18,189,65,65);

fill(250,216,169);    //2
ellipse(10,189,65,65);

fill(247,224,192);    //2
ellipse(20,198,65,65);

fill(252,234,209);    //2
ellipse(25,205,65,65);

fill(252,242,227);    //2
ellipse(35,211,65,65);

fill(255,250,242);    //2
ellipse(50,225,65,65);

fill(255,255,255);    //2
ellipse(60,230,65,65);



/*
flame4 = flame4+random(-1,1);
flame3 = flame3+random(-1,1);
flame2 = flame2+random(-1,1);
flame1 = flame1+random(-1,1);

flame4B = flame4B+random(-1,1);
flame3B = flame3B+random(-1,1);
flame2B= flame2B+random(-1,1);
flame1B = flame1B+random(-1,1);

flame4BB = flame4BB+random(-1,1);
flame3BB = flame3BB+random(-1,1);
flame2BB = flame2BB+random(-1,1);
*/

lights1 = lights1+random(-1,1);
lights2 = lights2+random(-1,1);
lights3 = lights3+random(-1,1);
lights4 = lights4+random(-1,1);
lights5 = lights5+random(-1,1);
lights6 = lights6+random(-1,1);
lights7 = lights7+random(-1,1);
lights8 = lights8+random(-1,1);
lights9 = lights9+random(-1,1);
lights10 = lights10+random(-1,1);
lights11 = lights11+random(-1,1);
lights12 = lights12+random(-1,1);
lights13 = lights13+random(-1,1);
lights14 = lights14+random(-1,1);
lights15 = lights15+random(-1,1);
lights16 = lights16+random(-1,1);
lights17 = lights17+random(-1,1);
lights18 = lights18+random(-1,1);

}
