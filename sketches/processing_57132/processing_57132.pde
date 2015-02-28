
//declaring all variables here first
int cx = 160; //center
int cy = 140; 
int bh = 100;//body height
int bx = cx;
int by = cy+bh;



void setup() {
  size(1000, 600);
  background(243, 243, 243);
  smooth();
}


void draw () {
 background(243, 243, 243);//clear background

  //mouse press
  if(mousePressed){
    bh = 200;
  }else{
    bh = 100;
  }

  //body follows the mouse
  bx = mouseX;
  by = mouseY;
  
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
  line(bx-20,by, bx-80, by+60);// bx=160, by=360
  line(bx-10, by,bx-40, by+100);
  line(bx+10, by,bx+40, by+100);
  line(bx+20, by,bx+60, by+60); 
  //leg circles
  ellipse(bx-80, by+60, 20, 20);
  ellipse(bx-40, by+100, 20, 20);
  ellipse(bx+40, by+100, 20, 20);
  ellipse(bx+60, by+60, 20, 20);
  
  //antenane 
  { stroke(0);
  strokeWeight(3); 
  line(cx, cy-120, cx, cy-80);
  noStroke();
  fill(222, 222, 121);
  triangle(cx-20,cy-120,cx,cy-130,cx+20,cy-120);
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
  fill(121, 222, 208);
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
  rect(bx-20, by-80, 25, 2);
  rect(bx-20, by-60, 25, 2);
  rect(bx-20, by-40, 25, 3);
  rect(bx-20, by-20, 25, 3);

  fill(86, 99, 240, 100); //rightlines bx=160, by=360
  rect(bx-10, by-90, 25, 1);
  rect(bx-10, by-70, 25, 2);
  rect(bx-10, by-50, 25, 3);
  rect(bx-10, by-30, 25, 4);
  rect(bx-10, by-10, 25, 5);
  
}







