
void setup(){
size(1000,1000);
}

void draw(){
background(255);
smooth();
delay(100);
translate(mouseX-600,mouseY-400);
stroke(220,100,80);
fill(200,100,80);
beginShape();
vertex(80,160);vertex(120,140);vertex(340,140);
vertex(400,80);vertex(680,80);vertex(760,160);
vertex(800,240);vertex(800,720);vertex(780,760);
vertex(740,760);vertex(720,720);vertex(720,520);
vertex(700,480);vertex(680,520);vertex(680,880);
vertex(660,920);vertex(620,920);vertex(600,880);
vertex(600,560);vertex(580,520);vertex(560,560);
vertex(560,880);vertex(540,920);vertex(500,920);
vertex(480,880);vertex(480,520);vertex(460,480);
vertex(440,520);vertex(440,800);vertex(420,840);
vertex(380,840);vertex(360,800);vertex(360,320);
vertex(320,240);vertex(120,240);vertex(80,220);
endShape(CLOSE);
stroke(0);
fill(255);
triangle(440,280,440,200,520,280);
triangle(720,200,640,280,720,280);
fill(0);
rect(440,240,40,40);
rect(680,240,40,40);
line(480,160,560,240);
line(680,160,600,240);
line(560,320,600,320);
beginShape();
vertex(500,360);
vertex(660,360);
vertex(700,440);
vertex(640,400);
vertex(480,400);
vertex(520,400);
vertex(460,440);
endShape(CLOSE);
//i intend to find some condition where 
//the mouth only opens when the cursor 
//is hovering over. May need to edit 
//strobe and delay funtions.
int strobeSpeed = 4;
if(frameCount%strobeSpeed==0)
beginShape();
vertex(500,360);
vertex(660,360);
vertex(700,440);
vertex(460,440);
endShape(CLOSE);
}

