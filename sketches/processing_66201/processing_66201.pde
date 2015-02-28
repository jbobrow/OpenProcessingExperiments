
size (560,520);
background(255,255,255);

fill(0,0,0);
ellipse(148,240,22,22);
ellipse(152,300,22,22);
ellipse(263,322,32,32);
ellipse(255,428,60,60);
ellipse(490,230,20,20);
ellipse(190,367,42,42);
ellipse(183,446,40,38);
beginShape();
vertex(0,170);
vertex(110,220);
vertex(120,280);
vertex(0,240);
endShape(CLOSE);
strokeWeight(2);
//lines off of the parrallelogram attached to circles
line(110,220,148,240);
line(120,280,152,300);
//lines of the smallest asterisk top and left
line(210,0,210,48);
line(182,0,230,40);
line(180,24,237,24);
line(227,8,194,40);
//lines of the top and right asterisk
line(415,1,401,82);
line(388,18,440,90);
line(373,39,458,50);
line(366,78,440,28);
//lines for the largest asterisk
line(200,120,200,220);
line(160,140,260,223);
line(160,172,248,175);
line(155,209,257,120);
//short line
line(190,370,188,440);
//little slice at top
fill(0,0,0);
line(280,0,277,47);
line(287,0,277,47);
//black sliver at top
beginShape();
vertex(280,0);
vertex(277,47);
vertex(286,0);
vertex(280,0);
endShape(CLOSE);
//red sliver at top
fill(204,51,51);
beginShape();
vertex(286,0);
vertex(277,47);
vertex(295,0);
vertex(286,0);
endShape(CLOSE);

noFill();
bezier(51,0,66,3,11,147,0,130);
bezier(100,0,88,135,232,494,0,460);
//dot

fill(0);
bezier(275,150,268,69,390,61,382,149);
bezier(275,150,272,202,382,207,382,149);
noFill();
bezier(333,194,351,289,332,446,321,520);









