
void setup() {
  size(800, 600);
  background(255);
  fill(0);
  smooth();
  strokeWeight(3);
  frameRate(10);

  
  line(190, 30, 210, 30);
  line(225, 40, 233, 53);
  line(235, 70, 236, 85);
  line(237, 103, 240, 120); //right hair
  
  line(175, 40, 167, 53);
  line(165, 70, 164, 85);
  line(163, 103, 160, 120); //left hair
  
  line(175, 85, 185, 95);
  line(195, 103, 205, 103);
  line(225, 85, 215, 95); //bottom of face
  
  line(192, 115, 188, 127);
  line(207, 115, 211, 127); //neck
  
  line(177, 135, 163, 137);
  line(150, 140, 140, 145);//left shoulder
  
  line(223, 135, 237, 137);
  line(250, 140, 260, 145); //right shoulder
  
  line(133, 157, 127, 173); 
  line(123, 185, 118, 200);
  line(114, 212, 110, 227);
  line(108, 237, 109, 250);
  line(110, 262, 112, 276);
  line(117, 285, 125, 285); //left side of left arm
  
  line(267, 157, 273, 173);
  line(277, 185, 282, 200);
  line(286, 212, 290, 227);
  line(292, 237, 291, 250);
  line(290, 262, 288, 276);
  line(283, 285, 275, 285); //right side of right arm
  
  line(126, 250, 125, 237);
  line(130, 212, 126, 227);
  line(139, 185, 134, 200);
  line(145, 170, 143, 173);
  line(145, 170, 147, 173); 
  line(126, 262, 128, 276); //right side of left arm
  
  line(274, 250, 275, 237);
  line(270, 212, 274, 227);
  line(261, 185, 266, 200);
  line(255, 170, 257, 173);
  line(255, 170, 253, 173);
  line(274, 262, 272, 276); //left side of right arm
  
  line(155, 185, 158, 200);
  line(160, 213, 163, 230);
  line(160, 245, 157, 260);
  line(156, 275, 156, 290); // left side of torso
  
  line(245, 185, 242, 200);
  line(240, 213, 237, 230);
  line(240, 245, 243, 260);
  line(244, 275, 244, 290); //right side of torso
  
  line(155, 305, 155, 320);
  line(155, 335, 155, 350);
  line(155, 365, 155, 380);
  line(155, 395, 155, 410);
  line(153, 425, 151, 440); //left side of left leg
  
  line(245, 305, 245, 320);
  line(245, 335, 245, 350);
  line(245, 365, 245, 380);
  line(245, 395, 245, 410);
  line(247, 425, 249, 440); //right side of right leg
  
  line(147, 455, 134, 457);
  line(121, 459, 112, 461);
  line(110, 467, 110, 472);
  line(120, 475, 130, 475);
  line(145, 475, 160, 475);
  line(170, 470, 172, 455); //left foot
  
  line(253, 455, 266, 457);
  line(279, 459, 288, 461);
  line(290, 467, 290, 472);
  line(280, 475, 270, 475);
  line(255, 475, 240, 475);
  line(230, 470, 228, 455); //right foot
  
  line(175, 437, 177, 420);
  line(178, 403, 179, 386);
  line(181, 369, 183, 350);
  line(185, 335, 189, 315);
  line(193, 305, 200, 295); //right side of left leg
 
  
  line(225, 437, 223, 420);
  line(222, 403, 221, 386);
  line(219, 369, 217, 350);
  line(215, 335, 211, 315);
  line(200, 295, 207, 305); //left side of right leg
  
fill(0);
PFont font;
font = loadFont("AmericanTypewriter-Condensed-24.vlw");
textFont(font);
String s = "Connect the lines.";
text(s, 100, 520, 500, 100);

fill(224, 88, 87);
translate(117, 283);
rotate(-1.7);
font = loadFont("AppleBraille-10.vlw");
textFont(font);
String t = "Start -->";
text(t, 0, 0, 500, 100);
   
}


void draw(){

PFont font;
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String s = "I dressed up as Gandalf for a school project last year.";
text(s, 400, 0, 500, 100);

if (frameCount > 30) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String t = "I own a Master Sword.";
text(t, 400, 20, 500, 100);
}

if (frameCount > 60) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String u = "I have synesthesia.";
text(u, 400, 40, 500, 100);
}

if (frameCount > 90) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String v = "I freaking love Keanu Reeves.";
text(v, 400, 60, 500, 100);
}

if (frameCount > 120) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String w = "Billy Corgan is my idol.";
text(w, 400, 80, 500, 100);
}

if (frameCount > 150) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String x = "I know almost ever word to Mulan.";
text(x, 400, 100, 500, 100);
}

if (frameCount > 180) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String y = "I own about 100 grunge CDs.";
text(y, 400, 120, 500, 100);
}

if (frameCount > 210) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String z = "The Chronicles of Narnia are my favorite books. ";
text(z, 400, 140, 500, 100);
}

if (frameCount > 240) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String a = "I wave at every dog I see.";
text(a, 400, 160, 500, 100);
}

if (frameCount > 270) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String b = "I would wear the same outfit everyday if I could.";
text(b, 400, 180, 500, 100);
}

if (frameCount > 300) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String c = "Milkshakes are my favorite food.";
text(c, 400, 200, 500, 100);
}

if (frameCount > 330) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String d = "I could watch The Crow over and over and over again.";
text(d, 400, 220, 500, 100);
}

if (frameCount > 360) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String e = "Wolves are my favorite animal.";
text(e, 400, 240, 500, 100);
}

if (frameCount > 390) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String f = "I sleep with a Snoopy stuffed animal.";
text(f, 400, 260, 500, 100);
}

if (frameCount > 420) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String g = "When I was young I named my bouncing horse Paper.";
text(g, 400, 280, 500, 100);
}

if (frameCount > 450) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String h = "If I could be anything, I'd be a rockstar.";
text(h, 400, 300, 500, 100);
}

if (frameCount > 480) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String i = "I have an awful singing voice, but I love to sing.";
text(i, 400, 320, 500, 100);
}

if (frameCount > 510) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String j = "Beverly Hills Chihuahua made me cry.";
text(j, 400, 340, 500, 100);
}

if (frameCount > 540) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String k = "I don't really like to read.";
text(k, 400, 360, 500, 100);
}

if (frameCount > 570) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String l = "I have signatures from every member of Linkin Park.";
text(l, 400, 380, 500, 100);
}

if (frameCount > 600) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String m = "I work at GameStop and I hate it there.";
text(m, 400, 400, 500, 100);
}

if (frameCount > 630) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String n = "I think Chis Cornell has the coolest voice ever.";
text(n, 400, 420, 500, 100);
}

if (frameCount > 660) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String o = "...";
text(o, 400, 440, 500, 100);
}

if (frameCount > 690) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String p = "...";
text(p, 400, 460, 500, 100);
}

if (frameCount > 720) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String q = "...";
text(q, 400, 480, 500, 100);
}

if (frameCount > 750) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String r = "...";
text(r, 400, 500, 500, 100);
}

if (frameCount > 780) {
font = loadFont("AmericanTypewriter-Condensed-15.vlw");
textFont(font);
String s1 = "And I don't really care what you think about me.";
text(s1, 400, 530, 500, 100);
}

}

void mouseDragged() {
  strokeWeight(3);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

  

