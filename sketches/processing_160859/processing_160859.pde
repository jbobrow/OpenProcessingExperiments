
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}



size(640, 640);
background(230);
noStroke();




fill(20);
ellipse(320, 320, 500, 500);
fill(222);
ellipse(320, 320, 450, 450);



fill(10);
ellipse(197, 260, 100, 100);

fill(230,10,10);
ellipse(197, 260, 92, 92);

fill(1);
ellipse(197, 260, 28, 28);



fill(240,244,95,80);
noStroke();
quad(600, 0, 550, 0, 90, 640, 300, 640);

fill(30, 90, 140, 100);
quad(150, 0, 70, 0, 640, 600, 640, 400);

fill(0,0,0,200);
ellipse(411, 322, 200, 200);

fill(5,10,250,255);
ellipse(411, 322, 195, 195);

 
fill(196, 00, 12);
strokeWeight(5);    
ellipse(222, 275, 33, 33);
strokeWeight(3);
ellipse(276,140, 13, 13);

fill(127, 23, 58, 200);
strokeWeight(0);
ellipse(422, 143, 79, 79);

fill(90, 158, 190, 170);
strokeWeight(5);
ellipse(153, 353, 47, 47);

fill(5);
ellipse(256, 411, 95, 95);
fill(10,200,100,250);
ellipse(256, 411, 90, 90);

stroke(3);
line(500, 440, 300, 100);
stroke(5,20,20);
line(120, 390, 200, 150);
stroke(5,20,20);
line(300, 520, 160, 390);


fill(1);
ellipse(420, 360, 40, 40);

fill(1);
ellipse(440, 460, 70, 70);

fill(1);
ellipse(180,190, 15,15);

fill(100, 00, 00, 59);
strokeWeight(2);
ellipse(320, 492, 33, 33);

fill(196, 00, 12, 190); 
strokeWeight(2);
ellipse(217, 400, 65, 65);
ellipse(276, 419, 13, 13);
ellipse(483, 433, 27, 27);

strokeWeight(0.8);
ellipse(305, 358, 17, 17);




strokeWeight(2);
line(303+4, 119-8, 303+30+4, 119+30-8);
line(451, 205, 474, 203);
line(452, 214, 486, 211);
 
strokeWeight(1);
line(336, 470, 404, 440);
line(336+7, 470+10, 404+7, 440+10);
line(336+14, 470+10+10, 404+14, 440+10+10);
line(371, 258, 433, 188);
line(385, 318, 407, 344);
line(73, 273, 94, 231);
line(79, 270, 113, 219);
line(131, 281, 139, 246);

