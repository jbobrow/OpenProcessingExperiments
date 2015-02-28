
//declare all variables here 
float cx = 160; //center
float cy = 140; 
float bh = 100;//body height
float bx = cx;
float by = cy+bh;
float angle = 0.0; //for bouncy head
float speed = 0.05;
PImage img; //ocean background
PFont font;

void setup() {
  size(544, 700);
  background(243, 243, 243);
  smooth();
  img= loadImage("ocean.jpeg"); // background image
  font= loadFont("AppleCasual-20.vlw"); //font
  textFont (font);
}


void draw () {
  background(243, 243, 243);//clear background
  image(img,0,0);
  textSize(30);
  text("bopping in the ocean...",180,100);
  //mouse press
  if (mousePressed) {
    if((cy-140) > 0) {
    bh = bh*1.05;
    }
  }
  else {
    if (bh>80) { //shrink if too tall
      bh = bh*0.99;
    }
    //bouncy sine head
    bh = bh - sin(angle)*0.5;
  }
  //body follows the mouse
  bx = mouseX-40+sin(angle)*8;
  by = mouseY +sin(angle*0.5)*5;

  //head follows body
  cx = bx;
  cy = by-bh-120;


  //head hexagon 
  fill(0);  
  beginShape();
  vertex(cx-80, cy);
  vertex(cx-80, cy+60);
  vertex(cx-40, cy+120);
  vertex(cx+40, cy+120);
  vertex(cx+80, cy+60);
  vertex(cx+80, cy);
  endShape();
  fill(0);  //circle head bit
  ellipse(cx, cy, 160, 160);

  //legs
  fill(86, 99, 240);  
  stroke(0); //makes stroke appear
  strokeWeight(8); 
  line(bx-15, by, bx-80+sin(angle)*5, by+60+sin(angle)*6); 
  line(bx-10, by, bx-40+sin(angle)*-5, by+100+sin(angle)*-8);
  line(bx+10, by, bx+40+sin(angle)*4, by+100+sin(angle)*2);
  line(bx+15, by, bx+60+sin(angle)*-6, by+60+sin(angle)*-5); 
  //leg circles
  ellipse(bx-80+sin(angle)*5, by+60+sin(angle)*3, 20, 20);
  ellipse(bx-40+sin(angle)*-8, by+100+sin(angle)*-8, 20, 20);
  ellipse(bx+40+sin(angle)*2, by+100+sin(angle)*6, 20, 20);
  ellipse(bx+60+sin(angle)*-5, by+60+sin(angle)*-5, 20, 20);

  //antenane 
  { 
    stroke(0);
    strokeWeight(3); 
    line(cx, cy-120, cx, cy-80);
    noStroke();
    if(mousePressed){
      fill(255, 10, 10);
      triangle(cx-20, cy-120, cx, cy-130, cx+20, cy-120);
    }else{
      fill(222, 222, 121);
      triangle(cx-20, cy-120, cx, cy-130, cx+20, cy-120);
    }
    
  
}

  //mouth cx=160, cy=140
  quad(cx-40, cy+80, cx-20, cy+100, cx+20, cy+100, cx+40, cy+80);

  //eye  cx=160, cy=140
  fill(222, 121, 121);//red outer
  ellipse( cx-60, cy+40, 100, 100);
  ellipse( cx+60, cy+40, 100, 100);

  fill(222, 185, 121, 100); //orange middle
  ellipse( cx-60, cy+40, 80, 80);
  ellipse( cx+60, cy+40, 80, 80);

  fill(128, 121, 222, 50); // pink centre
  ellipse(cx-60, cy+40, 30, 30);
  ellipse(cx+60, cy+40, 30, 30);



  //body triangles
  //fill(121, 222, 208);
  fill(62,255,215);
  beginShape();//left spikes
  vertex(bx-20, by);
  vertex(bx-40, by-(bh/10));
  vertex(bx-20, by-(bh/5));
  vertex(bx-40, by-(bh/3.333));
  vertex(bx-20, by-(bh/2.5));
  vertex(bx-40, by-(bh/2));
  vertex(bx-20, by-(bh/1.666));
  vertex(bx-40, by-(bh/1.428));
  vertex(bx-20, by-(bh/1.25));
  vertex(bx-40, by-(bh/1.111));
  vertex(bx-20, by-(bh/1));
  endShape();
  beginShape();//right spikes
  vertex(bx+20, by);
  vertex(bx+40, by-(bh/10));
  vertex(bx+20, by-(bh/5));
  vertex(bx+40, by-(bh/3.333));
  vertex(bx+20, by-(bh/2.5));
  vertex(bx+40, by-(bh/2));
  vertex(bx+20, by-(bh/1.666));
  vertex(bx+40, by-(bh/1.428));
  vertex(bx+20, by-(bh/1.25));
  vertex(bx+40, by-(bh/1.111));
  vertex(bx+20, by-(bh/1));
  endShape();

  fill(121, 180, 22); //rectangle // bx=160, by=360
  rect(bx-20, by, 40, -bh);

  fill(222, 121, 215); //lines
  rect(bx-20, by-(bh/1.25), 25, 2);
  rect(bx-20, by-(bh/1.66), 25, 2);
  rect(bx-20, by-(bh/2.5), 25, 3);
  rect(bx-20, by-(bh/5), 25, 3);

  fill(160,38,237, 100); //rightlines bx=160, by=360
  rect(bx-10, by-(bh/1.111), 25, 1);
  rect(bx-10, by-(bh/1.428), 25, 2);
  rect(bx-10, by-(bh/2), 25, 3);
  rect(bx-10, by-(bh/3.333), 25, 4);
  rect(bx-10, by-(bh/10), 25, 5);
  
  //incrementing angle value
  angle +=speed;
}





