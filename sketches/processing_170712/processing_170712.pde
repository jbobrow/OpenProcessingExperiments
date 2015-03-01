
//sang boca
int value1 = 230;
int value2 = 175;
int value3 = 157;

//llagrimes
int value4 = 157;
int value5 = 219;
int value6 = 229;

//dents
int fons1 = 119;
int fons2 = 79;
int fons3 = 56;

//dents
int dents1 = 246;
int dents2 = 244;
int dents3 = 233;

//ulls
float value = random(15,30);

void setup() {
  
size(300,300);


}

void draw () { 
 
  
background(fons1,fons2,fons3);

//Cap
fill(230,175,157);
strokeWeight(10);
stroke(0);
ellipse(150,150,200,160);


//LLagrima 1

noStroke( );
fill(value4,value5,value6);
ellipse(97,201,20,20);
ellipse(100,200,20,20);
ellipse(105,205,20,20);
ellipse(100,190,20,20);
ellipse(100,195,20,20);
ellipse(95,190,20,20);
ellipse(100,185,20,20);
ellipse(105,200,20,20);
ellipse(105,185,20,20);
ellipse(106,180,20,20);
ellipse(100,180,20,20);
ellipse(95,175,20,20);
ellipse(105,185,20,20);
ellipse(105,175,20,20);
ellipse(105,185,20,20);
ellipse(105,160,20,20);
ellipse(95,160,20,20);
ellipse(95,145,20,20);
ellipse(90,143,20,20);
ellipse(110,145,20,20);

//LLagrima 2

ellipse(196,205,20,20);
ellipse(197,203,20,20);
ellipse(205,200,20,20);
ellipse(200,190,20,20);
ellipse(200,195,20,20);
ellipse(195,190,20,20);
ellipse(200,185,20,20);
ellipse(205,200,20,20);
ellipse(205,185,20,20);
ellipse(206,180,20,20);
ellipse(200,180,20,20);
ellipse(195,175,20,20);
ellipse(205,185,20,20);
ellipse(205,175,20,20);
ellipse(205,185,20,20);
ellipse(205,165,20,20);
ellipse(195,165,20,20);
ellipse(195,150,20,20);
ellipse(190,148,20,20);
ellipse(210,150,20,20);

fill(value1,value2,value3);
ellipse(140,212,20,20);
ellipse(160,203,20,20);
ellipse(155,200,20,20);
ellipse(140,190,20,20);
ellipse(162,214,20,20);
ellipse(150,215,20,20);
ellipse(140,205,20,20);
ellipse(160,200,20,20);
ellipse(150,190,20,20);
ellipse(140,190,20,20);
ellipse(140,181,20,20);
ellipse(160,181,20,20);
ellipse(150,181,20,20);

stroke(0);

//Ulls

strokeWeight(2);
fill(0);
ellipse(100,131,40,mouseX/10);
ellipse(200,135,40,mouseX/10);
fill(233,233,233);
noStroke();
fill(random(204),random(20),random(28));
ellipse(92,126,14,mouseX/20);
ellipse(190,130,12,mouseX/22);

//Boca
strokeWeight(2);
stroke(0);
fill(0);
line(125,170,175,170);
arc(150,170,51,mouseY/6,PI,TWO_PI);

//Dents
noStroke();
fill(dents1,dents2,dents3);
quad(130,160+mouseY/37,170,160+mouseY/37,165,160,135,160);
  
println (mouseX + "," + mouseY);


}
 
//premer i soltar

void mousePressed() {
   if (40 <= mouseX && mouseX <= 260 && 60 <= mouseY && mouseY <= 240) {
   //sang boca
   value1 = 204;
   value2 = 20;
   value3 = 28;
   //llagrimes
   value4 =204;
   value5 =20;
   value6 =28;
   //fons
   fons1 = 67;
   fons2 = 103;
   fons3 = 31;
   //dents
   dents1 = 216;
   dents2 = 192;
   dents3 = 168;
   } 
   

}

void mouseReleased() {
   //sang boca  
   value1 = 230;
   value2 = 175;
   value3 = 157;   
   //llagrimes
   value4 =157;
   value5 =219;
   value6 =229;
   //fons
   fons1 = 119;
   fons2 = 79;
   fons3 = 56;
   //dents
   dents1 = 246;
   dents2 = 244;
   dents3 = 233;
}


