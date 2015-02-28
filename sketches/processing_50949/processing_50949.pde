


void testFace() {
  
   background(80,169,244);
 
  // Face
  //noStroke();
  //fill(0);
 // ellipse(0, 0, 400+v/3, 400+v/3);
 // fill(255);
  
 
 fill(239,231,173);
noStroke();

//head ellipse
float w = map(v,100,width,0,600);
//float cw = constrain(w, 0,700);
ellipse(300,300,530+w, 400+w);

//ellipse(width/2,height/2,390,330);

//let eye socket
fill(255);
ellipse(width/3,height/2-20,80,80);
//right eye socket
ellipse(width/3*2,height/2-20,80,80);
  //left eye ball
  fill(0);
  float c = map(v,280,width,0,100);
  //float cc = constrain(c, 20, 100);
  ellipse(width/3,height/2-20,50+c,50+c);
  
  //right eye ball
  
  float b = map(v,280,width,0,100);
   ellipse(width/3*2,height/2-20,50+b,50+b);
  
  //mouth
  
 float x = map(v, 0, width, 0, 400);

  
  stroke(164,150,107);
  strokeWeight(6);
  fill(0);
  ellipse(300, 380, 50+x, 14+x);
  //ellipse(width/2,height/2 + 100,90,20);
  
//fins
  noFill();
  stroke(191,159,81);
  strokeWeight(2);
  
  //right fin
    strokeWeight(2);
    float l2 = map(v,0,500,500,440);
    line(463,300,l2,260);
    line(l2,260,l2,343);
    line(l2,343,463,320);
    line(473,300,l2,300);
    line(473,310,l2,310);
  
  //left fin
    float l1 = map(v, 0,100, 100, 120);
    line(140,300,l1,260);
    line(l1,260,l1,343);
    line(l1,343,140,320);
    line(l1,300, 127, 300);
    line(l1,310, 127, 310);
    
  //dots on head
  noStroke();
  fill(191,159,81);
  ellipse(320,200,6,6);
  ellipse(270,180,8,8);
  ellipse(280,220,7,7);
  ellipse(300,200,9,9);
  
  //bubbles
  float bubble = random(0, 2);
  strokeWeight(4);
  stroke(63, 119, 232);
  fill(255);
  
  //bubble 1
  float B1 = map(v, 0, 255, 0, 255);
  noStroke();
  fill(255,B1);
  ellipse(82,97, 40 + bubble, 40 + bubble);
  
  // bubble 2 
  noStroke();
  fill(255,B1);
  ellipse(100,204,20 + bubble, 20+bubble);
  
  //bubble 3
  noStroke();
  fill(255,B1);
  ellipse(150,150, 30+bubble, 30+bubble);
  
  //bubble 4
  noStroke();
  fill(255,B1);
  ellipse(130,30, 50 + bubble, 50+bubble);
 


  // Credits
  fill(255);
  String credits = "Kathleen Schenck";
  text(credits, -240, 240);
  fill(255);
  
}

