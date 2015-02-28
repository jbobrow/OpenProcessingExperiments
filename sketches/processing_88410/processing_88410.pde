
float spin;
float grow;

void setup(){
   size(154,166);
   grow=0;
   spin=0;
}

void draw(){
  background(245,236,190);
  spin=spin+2;
  grow=grow+.5;
strokeWeight(2);
line(34,130,44,166);
line(0,26,35,0);
line(70,12,90,0);
line(70,12,128,103);
line(132,110,154,146);
line(119,0,154,62);
line(80,28,120,2);
line(145,5,151,0);
stroke(178,203,144);
line(0,13,97,68);
ellipseMode(CENTER);
stroke(188,87,28);
fill(245,239,215);
ellipse(61,101,80,80);
stroke(232,201,75);
fill(222,225,229);
ellipse(61,101,54,54);
stroke(0);
fill(0);
ellipse(61,100,20,20);
noStroke();
fill(206,136,60);
quad(0,62,13,54,42,160,0,160);
fill(98,137,101);
quad(13,54,27,45,100,160,43,160);

pushMatrix();
  translate(61,100);
  rotate(radians(spin));
  translate(-61,-100);
    fill(240);
    stroke(0);
    arc(61,100,20,20,radians(50),radians(240));
popMatrix();

stroke(1);
fill(84,108,155);
ellipse(5,106,72,72);
noStroke();
fill(237,237,237);
ellipse(5,106,60,60);
noStroke();
fill(0,0,0,0+grow*3);
ellipse(10,104,grow,grow/2);
stroke(1);
line(0,8,19,72);
strokeWeight(1);
line(0,11,87,61);
line(86,3,154,112);
line(102,0,154,93);
line(102,0,154,82);
line(142,0,154,20);
line(88,41,128,15);
line(98,56,136,30);
line(108,71,154,39);
stroke(250,222,61);
strokeWeight(3);
line(0,27,43,0);
fill(250,228,116);
quad(64,166,73,166,57,149,53,153);
fill(0);
quad(53,153,57,149,55,148,51,151);
noStroke();
fill(0);
quad(89,42,104,32,112,46,98,56);
fill(80);
quad(112,46,124,40,132,55,122,61);
fill(59,59,59);
quad(133,111,129,103,154,85,154,92);
fill(7,96,142,200);
ellipse(154,72,75+grow/2,75+grow/2);
stroke(1);
strokeWeight(1);
fill(193,54,16);
quad(44,166,59,166,133,110,129,103);
fill(0);
quad(102,113,101,118,154,135,154,130);
quad(70,23,76,29,55,51,50,49);
fill(206,59,10);
quad(47,53,51,56,37,70,34,68);
triangle(28,79,26,77,16,90);
fill(220);
quad(37,70,34,67,26,76,29,78);
noStroke();
fill(85,8,31,0+grow);
ellipse(width/3,height/2,grow,grow);

}


