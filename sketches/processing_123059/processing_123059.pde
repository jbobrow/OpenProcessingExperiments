
int monsterX;
int monsterY;


void setup(){
size(500,500);

}

void draw(){
strokeWeight(2);
background(255,255,255);
stroke(0);
ellipseMode(CENTER);

//hoofd
fill(28,24,255);
ellipse (monsterX+105, monsterY+20, 80, 80);

//buik
fill (67,192,247);
rect(monsterX+40,monsterY+60,130,130);

//voeten
fill (0,145,252);
rect(monsterX+40,monsterY+190,30,30);
rect(monsterX+140,monsterY+190,30,30);

//armen, mond en navel
line (monsterX-50,monsterY+60,monsterX+280,monsterY+60);
line (monsterX-50,monsterY+60,monsterX-50,monsterY+10);
line (monsterX+280,monsterY+60,monsterX+280,monsterY+100);
fill(22,0,175);
ellipse (monsterX+105,monsterY+145,10,10);
strokeWeight(3);
line(monsterX+71, monsterY+40, monsterX+139, monsterY+40);

// ogen
fill (3,255,21);
strokeWeight(2);
ellipse (monsterX+123,monsterY+10,16,32);
ellipse (monsterX+88,monsterY+10,16,32);

monsterX= monsterX+1;
monsterY = monsterY+1;




}
