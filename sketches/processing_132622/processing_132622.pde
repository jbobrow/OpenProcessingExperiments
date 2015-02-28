
void setup() {

  size(400,600);
     
}

void draw () {

//flowervariables
float flowerpetal1x;
flowerpetal1x = random(0, 400);
float flowerpetal1y;
flowerpetal1y = random(0, 100);

//eyevariables
float eyeax;
eyeax = random(0, 400);
float eyeay;
eyeay = random(0, 400);

//headvariables
float headax;
headax = random(0, 400);
float headay;
headay = random(0, 400);
float headbx;
headbx = random(0, 400);
float headby;
headby = random(0, 400);
float headcx;
headcx = random(0, 400);
float headcy;
headcy = random(0, 400);
float headdx;
headdx = random(0, 400);
float headdy;
headdy = random(0, 400);

//bodyvariables 
//ellipse(160, 240, 30, 30);
float bodyx;
bodyx = random(0, 400);
float bodyy;
bodyy = random(0, 400);

//variables for innerbody 
//ellipse(185, 360, 40, 50);
float innerbodyx;
innerbodyx = random(0, 400);
float innerbodyy;
innerbodyy = random(0, 400);

//tail
beginShape();
fill(99, 116, 139, 10);
vertex(innerbodyx-5, innerbodyy);
vertex(innerbodyx+55, innerbodyy-100);
vertex(innerbodyx+75, innerbodyy-140);
vertex(innerbodyx+95, innerbodyy-100);
vertex(innerbodyx+155, innerbodyy-140);
vertex(innerbodyx+135, innerbodyy-80);
vertex(innerbodyx+155, innerbodyy-40);
vertex(innerbodyx+95, innerbodyy-60);
vertex(innerbodyx+95, innerbodyy-20);
vertex(innerbodyx+55, innerbodyy-60);
endShape(CLOSE);

//attempt one at tail movement 
/*
//tail
beginShape();
fill(99, 116, 139);
//1
vertex(bodyx+30, bodyy+120);
//2
vertex(bodyx+80, bodyy+20);
//3
vertex(bodyx+100, bodyy-20);
//4
vertex(bodyx+120,bodyy+20);
//5
vertex(bodyx+180, bodyy-20);
//6
vertex(bodyx+160, bodyy+40);
//7
vertex(bodyx+180, bodyy+80);
//8
vertex(bodyx+120, bodyy+60);
//9
vertex(bodyx+120, bodyy+100);
//10
vertex(bodyx+80, bodyy+60);
endShape(CLOSE);
*/

//foot1
strokeWeight(1);
fill(99, 116, 139, 10);
//ellipse(180, 390, 100, 30);
ellipse(bodyx-25, bodyy+30, 100, 30);

//foot2
strokeWeight(1);
fill(99, 116, 139, 10);
//ellipse(160, 420, 100, 30);
ellipse(bodyx-15, bodyy+50, 100, 30);

//neck
strokeWeight(1);
fill(99, 116, 139, 10);
//quad(200, 260, 220, 220, 200, 320, 180, 320);
quad(headax+40, headay-20, headbx+80, headby-20, headcx, headcy+140, headdx-60, headdy+80);

//head
strokeWeight(1);
fill(#BAC9DE, 10);
//quad(160, 280, 140, 240, 200, 180, 240, 240);
quad(eyeax, eyeay+40, eyeax-20, eyeay, eyeax+40, eyeay-40, eyeax+80, eyeay);

//body
fill(#BAC9DE);
//ellipse(160, 240, 30, 10);
ellipse(eyeax+40, eyeay+120, 100, 100);

//bodyinner
strokeWeight(0);
fill(99, 116, 139, 10);
//ellipse(185, 360, 40, 50);
ellipse(bodyx-15, bodyy, 40, 50);

//antenna1
strokeWeight(2);
//line (160, 220, 115, 200);
line (eyeax, eyeay-20, eyeax-45, eyeay-40);

//antenna2
strokeWeight(2);
//line (160, 220, 150, 200);
line (eyeax, eyeay-20, eyeax+10, eyeay-40);

//eyeA
strokeWeight(1);
fill(255, 10);
//ellipse(160, 240, 30, 30);
ellipse(eyeax, eyeay, 30, 30);

//eyeB
strokeWeight(1);
fill(255, 10);
//ellipse(180, 220, 30, 30);
ellipse(eyeax+20, eyeay-20, 30, 30);

//eyefillA
strokeWeight(1);
fill(99, 116, 139, 10);
ellipse(eyeax, eyeay, 10, 10);

//eyefillB
strokeWeight(1);
fill(99, 116, 139, 10);
ellipse(eyeax+20, eyeay-20, 10, 10);

//mouth
strokeWeight(1);
//line(180, 260, 200, 240);
line(eyeax+20, eyeay+20, eyeax+40, eyeay);

//pushMatrix();
//mouth2
//strokeWeight(0);
//translate(eyeax, eyeay);
//rotate(radians(45))
//fill (99, 116, 139);
//ellipse(eyeax+20, eyeay+20, 30, 15);
//popMatrix(); 

//ellipse(185, 360, 40, 50);
//ellipse(bodyx-15, bodyy, 40, 50);

//arm
strokeWeight(1);
fill(99, 116, 139, 10);
//ellipse(170, 340, 50, 25);
ellipse(innerbodyx-15, innerbodyy-20, 50, 25);

//flowerstem
noStroke();
fill(100, 250, 150, 25);
//curve(100, 100, 150, 350, 100, 250, 15, 30);
//curve(flowerpetal1x, flowerpetal1y+173, 150, 350, 100, 250, flowerpetal1x-85, flowerpetal1y-243);
curve(100, 100, flowerpetal1x+50, flowerpetal1y+73, flowerpetal1x, flowerpetal1y, 15, 30);

//flowerpetal1
noStroke();
fill(250, 0, 100, 25);
//ellipse(100, 273, 15, 30);
ellipse(flowerpetal1x, flowerpetal1y, 15, 30);

//flowerpetal2
noStroke();
fill(150, 0, 100, 25);
ellipse(flowerpetal1x+5, flowerpetal1y, 15, 30);

//flowerpetal3
noStroke();
fill(150, 0, 100, 25);
ellipse(flowerpetal1x-5, flowerpetal1y, 15, 30);

//cloudone
noStroke();
// blendMode(BLEND);
fill(0, 140, 200, 50);
ellipse(300, 50, 120, 80);

//cloudtwo
noStroke();
//blendMode(BLEND);
fill(0, 100, 200, 50);
ellipse(300, 89, 60, 60);

//cloudthree
noStroke();
//blendMode(BLEND);
fill(0, 75, 200, 50);
ellipse(350, 80, 60, 60);

//cloudfour
noStroke();
//blendMode(BLEND);
fill(0, 150, 200, 50);
ellipse(350, 50, 60, 60);

//cloudfive
noStroke();
//blendMode(BLEND);
fill(0, 200, 200, 50);
ellipse(300, 50, 60, 60);

//cloudsix
noStroke();
fill(50, 200, 250, 50);
ellipse(315, 25, 60, 60);

//cloudseven
noStroke();
//blendMode(BLEND);
fill(0, 140, 200, 50);
ellipse(290, 25, 60, 60);

//cloudeight
noStroke();
//blendMode(BLEND);
fill(0, 75, 200, 50);
ellipse(250, 25, 60, 60);

//cloudnine
noStroke();
//blendMode(BLEND);
fill(0, 75, 200, 50);
ellipse(335, 25, 60, 60);

//cloudten
noStroke();
//blendMode(BLEND);
fill(0, 100, 255, 50);
ellipse(250, 55, 60, 60);

//cloudeleven
noStroke();
//blendMode(BLEND);
fill(0, 100, 255, 50);
ellipse(300, 55, 60, 60);

//cloudtwelve
noStroke();
//blendMode(BLEND);
fill(0, 100, 150, 50);
ellipse(275, 75, 60, 60);

//circle
noStroke();
//blendMode(BLEND);
fill(0, 100, 150, 50);
ellipse(50, 600, 200, 200);

//circle2
noStroke();
//blendMode(BLEND);
fill(0, 100, 200, 50);
ellipse(75, 500, 100, 100);

//PFont font;
//font = loadFont("Amatic-Bold-48.vlw");
fill(255);
text("Sad Robot Tries to Catch a Flower", 100, 570);

}



