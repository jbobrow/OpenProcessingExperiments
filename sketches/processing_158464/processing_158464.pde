

void setup() {

size(777,888); 
background(0); 
stroke(255,100);
fill(214,0,68,100); 
}

void draw() {

stroke(255,0,0,100);
line(0,0,width/2,height/2);

stroke(255,0,0,100);
line(width,0,width/2,height/2);

stroke(155,255,99,100);
line(width/2,height/2,width/2,height);

stroke(237,3,255,100);
line(width/3,0,width/2,height/2);

stroke(255,3,142,50);
line(width*2/3,0,width/2,height/2);

stroke(149,3,255,50);
line(0,height/3,width/2,height/2);

stroke(255,255,0,50);
line(width,height/3,width/2,height/2);

stroke(random(255),random(255),random(255));
line(width/3,0,width/3,height);

stroke(random(255),random(255),random(255));
line(width*2/3,0,width*2/3,height);

stroke(random(255),random(255),random(255));
line(0,height/3,width,height/3);

stroke(random(255),random(255),random(255));
line(0,height*2/3,width,height*2/3);

}
