
float spin=0.0;
 
 void setup(){
 size(400,400);
 smooth();
 }
 void draw(){
 noFill();
rotate(spin);
 stroke(random(45),random(449),random(425));
curve(0,0,10,10,30,20,20,10);
 stroke(random(95),random(209),random(445));
curve(0,20,20,20,50,40,40,10); 
 stroke(random(195),random(109),random(445));
curve(0,20,40,40,70,60,40,10);
 stroke(random(295),random(49),random(445));
curve(0,20,60,60,90,80,60,10);
 stroke(random(395),random(29),random(405));
curve(0,20,80,80,110,100,80,10);
 stroke(random(495),random(59),random(205));
curve(0,20,100,100,130,120,100,10);
 stroke(random(495),random(89),random(105));
curve(0,20,120,120,150,140,120,10);
 stroke(random(495),random(159),random(65));
curve(0,20,140,140,170,160,140,10);
curve(0,20,120,120,150,140,120,10);
 stroke(random(495),random(209),random(45));
curve(0,20,160,160,190,180,160,10);
 stroke(random(495),random(269),random(25));
curve(0,20,180,180,210,200,180,10);
 stroke(random(445),random(329),random(25));
curve(0,20,200,200,230,220,200,10);
 stroke(random(405),random(379),random(25));
curve(0,20,220,220,250,240,220,10);
 stroke(random(355),random(429),random(85));
curve(0,20,240,240,270,260,240,10);
 stroke(random(255),random(449),random(105));
curve(0,20,260,260,290,280,260,10);
 stroke(random(155),random(409),random(155));
curve(0,20,280,280,310,300,280,10);
 stroke(random(55),random(309),random(205));
curve(0,20,300,300,330,320,300,10);
 stroke(random(45),random(209),random(305));
curve(0,20,320,320,350,340,320,10);
 stroke(random(45),random(449),random(425));
 curve(0,20,340,340,370,360,340,10);
  curve(0,20,350,350,380,370,350,10);
spin=spin+0.5;
 }
