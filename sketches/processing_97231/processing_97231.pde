
//PFont alien = loadFont("alien.vlw");

color[] change = {#FF0000, #FF0364, #FF03DE, #DD03FF, #7703FF, #3003FF, #038FFF, #03E8FF, #03FFAD, #03FF5D, #A1FF03, #FFF703};
color [] palette = change;


void setup() {
  size(500, 750);
  background(#FFFFFF);}



void draw() {
//textFont(alien, 30);

if(mouseX < 100){
background(#FFFFFF);

  
fill(#000000);
textSize(20);
text("Income of Behavioral Science Careers", width/7+10, 50);

textSize(10);
text("$140,000", 400, 100);

textSize(10);
text("$130,000", 400, 150);

textSize(10);
text("$120,000", 400, 200);

textSize(10);
text("$110,000", 400, 250);

textSize(10);
text("$100,000", 400, 300);

textSize(10);
text("$90,000", 400, 350);

textSize(10);
text("$80,000", 400, 400);

textSize(10);
text("$70,000", 400, 450);

textSize(10);
text("$60,000", 400, 500);

textSize(10);
text("$50,000", 400, 550);

textSize(10);
text("$40,000", 400, 600);

textSize(10);
text("$30,000", 400, 650);

textSize(10);
text("$20,000", 400, 700);


textSize(12);
text("SOCIAL WORKER  marriage&family; therapist  clinical psychologist  i.o.psychologist", 10, 75);

//CONNECTING LINES
pushMatrix();
translate(0, 100);
strokeWeight(3);

stroke(palette[0]);
line(width/5+5, 30, 390, 349);

stroke(palette[1]);
line(width/5+25, 80, 390, 413);

stroke(palette[2]);
line(width/5-20, 130, 390, 443);

stroke(palette[3]);
line(width/5, 180, 390, 448);

stroke(palette[4]);
line(width/5+15, 230, 390, 464);

stroke(palette[5]);
line(width/5+3, 280, 390, 484);

stroke(palette[6]);
line(width/5+45, 330, 390, 486);

stroke(palette[7]);
line(width/5+58, 380, 390, 497);

stroke(palette[8]);
line(width/5-3, 430, 390, 505);

stroke(palette[9]);
line(width/5-10, 480, 390, 520);

stroke(palette[10]);
line(width/5+28, 530, 390, 522);

stroke(palette[11]);
line(width/5+28, 580, 390, 569);
popMatrix();

//CATEGORIES OR STATE LABELS ON LEFT
textSize(13
);
fill(palette[0]);
text("top 10%", width/10, 130);

fill(palette[1]);
text("Minnesosta", width/10, 180);

fill(palette[2]);
text("D.C.", width/10, 230);

fill(palette[3]);
text("Hawaii", width/10, 280);

fill(palette[4]);
text("California", width/10, 330);

fill(palette[5]);
text("Virginia", width/10, 380);

fill(palette[6]);
text("North Carolina", width/10, 430);

fill(palette[7]);
text("National Average", width/10, 480);

fill(palette[8]);
text("Alaska", width/10, 530);

fill(palette[9]);
text("Texas", width/10, 580);

fill(palette[10]);
text("New Mexico", width/10, 630);

fill(palette[11]);
text("bottom 10%", width/10, 680);
    
}     


//MARRIAGE FAMILY THERAPIST

if(mouseX > 175){
background(#FFFFFF);

  
fill(#000000);
textSize(20);
text("Income of Behavioral Science Careers", width/7+10, 50);

textSize(10);
text("$140,000", 400, 100);

textSize(10);
text("$130,000", 400, 150);

textSize(10);
text("$120,000", 400, 200);

textSize(10);
text("$110,000", 400, 250);

textSize(10);
text("$100,000", 400, 300);

textSize(10);
text("$90,000", 400, 350);

textSize(10);
text("$80,000", 400, 400);

textSize(10);
text("$70,000", 400, 450);

textSize(10);
text("$60,000", 400, 500);

textSize(10);
text("$50,000", 400, 550);

textSize(10);
text("$40,000", 400, 600);

textSize(10);
text("$30,000", 400, 650);

textSize(10);
text("$20,000", 400, 700);


textSize(12);
text("social worker            M&F THERAPIST          clinical psychologist    i.o.psychologist", 10, 75);

//CONNECTING LINES
pushMatrix();
translate(0, 100);
strokeWeight(3);

stroke(palette[0]);
line(width/5+5, 30, 390, 327);

stroke(palette[1]);
line(width/5-5, 80, 390, 388);

stroke(palette[2]);
line(width/5-18, 130, 390, 445);

stroke(palette[3]);
line(width/5+24, 180, 390, 454);

stroke(palette[4]);
line(width/5+40, 230, 390, 468);

stroke(palette[5]);
line(width/5+16, 280, 390, 468);

stroke(palette[6]);
line(width/5+53, 330, 390, 468);

stroke(palette[7]);
line(width/5+10, 380, 390, 471);

stroke(palette[8]);
line(width/5-3, 430, 390, 476);

stroke(palette[9]);
line(width/5-5, 480, 390, 481);

stroke(palette[10]);
line(width/5, 530, 390, 497);

stroke(palette[11]);
line(width/5+28, 580, 390, 575);
popMatrix();

//CATEGORIES OR STATE LABELS ON LEFT
textSize(13
);
fill(palette[0]);
text("top 10%", width/10, 130);

fill(palette[1]);
text("Hawaii", width/10, 180);

fill(palette[2]);
text("Utah", width/10, 230);

fill(palette[3]);
text("New Mexico", width/10, 280);

fill(palette[4]);
text("North Carolina", width/10, 330);

fill(palette[5]);
text("Minnesota", width/10, 380);

fill(palette[6]);
text("National Average", width/10, 430);

fill(palette[7]);
text("California", width/10, 480);

fill(palette[8]);
text("Texas", width/10, 530);

fill(palette[9]);
text("Alaska", width/10, 580);

fill(palette[10]);
text("Flordia", width/10, 630);

fill(palette[11]);
text("bottom 10%", width/10, 680);
}




//CLINICAL PSYCHOLOGIST


if(mouseX > 300){
background(#FFFFFF);

  
fill(#000000);
textSize(20);
text("Income of Behavioral Science Careers", width/7+10, 50);

textSize(10);
text("$140,000", 400, 100);

textSize(10);
text("$130,000", 400, 150);

textSize(10);
text("$120,000", 400, 200);

textSize(10);
text("$110,000", 400, 250);

textSize(10);
text("$100,000", 400, 300);

textSize(10);
text("$90,000", 400, 350);

textSize(10);
text("$80,000", 400, 400);

textSize(10);
text("$70,000", 400, 450);

textSize(10);
text("$60,000", 400, 500);

textSize(10);
text("$50,000", 400, 550);

textSize(10);
text("$40,000", 400, 600);

textSize(10);
text("$30,000", 400, 650);

textSize(10);
text("$20,000", 400, 700);


textSize(12);
text("social worker  marriage&family; therapist   CLINICAL PSYCHOLOGIST    i.o.psychologist", 10, 75);

//CONNECTING LINES
pushMatrix();
translate(0, 100);
strokeWeight(3);

stroke(palette[0]);
line(width/5+5, 30, 390, 148);

stroke(palette[1]);
line(width/5+10, 80, 390, 284);

stroke(palette[2]);
line(width/5-7, 130, 390, 303);

stroke(palette[3]);
line(width/5-15, 180, 390, 310);

stroke(palette[4]);
line(width/5+55, 230, 390, 360);

stroke(palette[5]);
line(width/5, 280, 390, 374);

stroke(palette[6]);
line(width/5, 330, 390, 385);

stroke(palette[7]);
line(width/5+30, 380, 390, 390);

stroke(palette[8]);
line(width/5-3, 430, 390, 411);

stroke(palette[9]);
line(width/5+35, 480, 390, 415);

stroke(palette[10]);
line(width/5-10, 530, 390, 432);

stroke(palette[11]);
line(width/5+28, 580, 390, 504);
popMatrix();

//CATEGORIES OR STATE LABELS ON LEFT
textSize(13
);
fill(palette[0]);
text("top 10%", width/10, 130);

fill(palette[1]);
text("California", width/10, 180);

fill(palette[2]);
text("Hawaii", width/10, 230);

fill(palette[3]);
text("D.C.", width/10, 280);

fill(palette[4]);
text("National Average", width/10, 330);

fill(palette[5]);
text("Flordia", width/10, 380);

fill(palette[6]);
text("Alaska", width/10, 430);

fill(palette[7]);
text("New Mexico", width/10, 480);

fill(palette[8]);
text("Texas", width/10, 530);

fill(palette[9]);
text("North Carolnia", width/10, 580);

fill(palette[10]);
text("Utah", width/10, 630);

fill(palette[11]);
text("bottom 10%", width/10, 680);
}
  
  
 
 
 //IO PSYCHOLOGIST 
  
if(mouseX > 400){
background(#FFFFFF);

  
fill(#000000);
textSize(20);
text("Income of Behavioral Science Careers", width/7+10, 50);

textSize(10);
text("$140,000", 400, 100);

textSize(10);
text("$130,000", 400, 150);

textSize(10);
text("$120,000", 400, 200);

textSize(10);
text("$110,000", 400, 250);

textSize(10);
text("$100,000", 400, 300);

textSize(10);
text("$90,000", 400, 350);

textSize(10);
text("$80,000", 400, 400);

textSize(10);
text("$70,000", 400, 450);

textSize(10);
text("$60,000", 400, 500);

textSize(10);
text("$50,000", 400, 550);

textSize(10);
text("$40,000", 400, 600);

textSize(10);
text("$30,000", 400, 650);

textSize(10);
text("$20,000", 400, 700);


textSize(12);
text("social worker  marriage&family; therapist  clinical psychologist  I.O. PSYCHOLOGIST", 10, 75);

//CONNECTING LINES
pushMatrix();
translate(0, 100);
strokeWeight(3);

stroke(palette[0]);
line(width/5+3, 30, 390, -23);

stroke(palette[1]);
line(width/5, 80, 390, 33);

stroke(palette[2]);
line(width/5+8, 130, 390, 48);

stroke(palette[3]);
line(width/5-5, 180, 390, 88);

stroke(palette[4]);
line(width/5+13, 230, 390, 89);

stroke(palette[5]);
line(width/5-5, 280, 390, 119);

stroke(palette[6]);
line(width/5-15, 330, 390, 138);

stroke(palette[7]);
line(width/5-7, 380, 390, 146);

stroke(palette[8]);
line(width/5+25, 430, 390, 155);

stroke(palette[9]);
line(width/5+52, 480, 390, 226);

stroke(palette[10]);
line(width/5-20, 530, 390, 258);

stroke(palette[11]);
line(width/5+23, 580, 390, 423);
popMatrix();

//CATEGORIES OR STATE LABELS ON LEFT
textSize(13
);
fill(palette[0]);
text("top 10%", width/10, 130);

fill(palette[1]);
text("Alaska", width/10, 180);

fill(palette[2]);
text("California", width/10, 230);

fill(palette[3]);
text("Hawaii", width/10, 280);

fill(palette[4]);
text("Minnisota", width/10, 330);

fill(palette[5]);
text("Texas", width/10, 380);

fill(palette[6]);
text("Utah", width/10, 430);

fill(palette[7]);
text("Flordia", width/10, 480);

fill(palette[8]);
text("New Mexico", width/10, 530);

fill(palette[9]);
text("National Average", width/10, 580);

fill(palette[10]);
text("D.C.", width/10, 630);

fill(palette[11]);
text("bottom 10%", width/10, 680);
}
  
    
}
