
//Erica Lazrus - staticFace

int offset = 20;

void setup() {
  size(600, 600);
}

void draw() {

  smooth();
  
  //draw background
  background(19,160,152);
  
  //middle line
  
  //yellow stripe
  strokeWeight(60);
  stroke(246,190,31);
  line(width/2,0,width/2,height);
  
  //green stripe
  strokeWeight(40);
  stroke(54,159,119);
  line(width/2,0,width/2,height);
  
  //white triangles
  noStroke();
  fill(255,255,255);
  for(int i=0; i <= height-20; i += 20){
    triangle(width/2,i,width/2-20,i+20,width/2+20,i+20);
  }
  
  //black stripe  
  strokeWeight(10);
  stroke(0,0,0);
  line(width/2,0,width/2,height);
  
  //pink squares
  noStroke();
  fill(226,93,52);
  for(int i=5; i < height; i += 20){
    rect(width/2-5,i,10,10);
  }
  
  //side lines
  
  //white stripes
  strokeWeight(40);
  stroke(227,246,250);
  line(width/4-15,0,width/4-15,height);
  line(3*width/4+15,0,3*width/4+15,height);
  
  //background yellow stripes
  strokeWeight(10);
  stroke(238,170,37);
  line(width/4-15,0,width/4-15,height);
  line(3*width/4+15,0,3*width/4+15,height);
  
  //black triangles
  noStroke();
  fill(0,0,0);
  for(int i=height; i > 0; i -= 20){
    triangle(width/4-15,i,width/4-35,i-20,width/4+5,i-20);
    triangle(3*width/4+15,i,3*width/4-5,i-20,3*width/4+35,i-20);
  }
  
  //overlay yellow stripe
  strokeWeight(10);
  stroke(238,170,37,50);
  line(width/4-15,0,width/4-15,height);
  line(3*width/4+15,0,3*width/4+15,height);
  
  
  //side triangles
  noStroke();
  for (int i = -10; i <= height+10; i+=20){
    //maroon triangles
    fill(68,21,41);
    triangle(0,i,width/8-20,i+10,0,i+20);
    triangle(width,i,width-width/8+20,i+10,width,i+20);
    triangle(width/2+30,i,5*width/8+10,i+10,width/2+30,i+20);
    triangle(width/2-30,i,3*width/8-10,i+10,width/2-30,i+20);
    //red triangles
    fill(154,37,27);
    triangle(width/4+5,i,3*width/8-15,i+10,width/4+5,i+20);
    triangle(width/4-35,i,width/8-15,i+10,width/4-35,i+20);
    triangle(3*width/4+35,i,7*width/8+15,i+10,3*width/4+35,i+20);
    triangle(3*width/4-5,i,5*width/8+15,i+10,3*width/4-5,i+20);
  }
  
  //dull background
  fill(255,255,255,50);
  rect(0,0,width,height);
  
  noStroke();

  //draw hair
  fill(0, 0, 0);
  ellipse(width/2, (height/3)+(2*offset), 2*(width/3), 3*(height/4));

  //draw lower face
  fill(102, 101, 193);
  quad(width/2, height/2, width/4, 3*(height/4), width/2, 
  height-(2*offset), 3*(width/4), 3*(height/4));

  //draw cheeks
  fill(229, 188, 72);
  quad(width/2, height/2, width/4, 3*(height/4), 2*offset, height/2, 
  width/4, height/3);
  quad(width/2, height/2, 3*(width/4), 3*(height/4), width-(2*offset), 
  height/2, 3*(width/4), height/3);

  //draw upper face
  fill(155, 36, 46);
  beginShape();
  vertex(width/2, height/2);
  vertex(width/4, height/3);
  vertex((width/3)+20, height/5);
  vertex(width/2, (height/4)+40);
  vertex((2*(width/3))-20, height/5);
  vertex(3*(width/4), height/3);
  endShape(CLOSE);

  //draw nose
  fill(124, 209, 150);
  triangle(width/2, height/3, width/3, 2*(height/3), 2*(width/3), 
  2*(height/3));

  //draw forehead
  fill(102, 59, 111);
  quad(width/2, height/3, (width/3)+20, height/5, width/2, height/8, 
  (2*(width/3))-20, height/5);

  //draw mouth

  //open mouth
  fill(242, 90, 73);
  arc(width/2, (3*(height/4))-20, 150, 100, radians(30), radians(150));

  //closed mouth
  //  noFill();
  //  stroke(0, 0, 0);
  //  strokeWeight(5);
  //  beginShape();
  //  vertex((width/2)-65, (3*(height/4))+5);
  //  vertex(width/2, (3*(height/4))-20);
  //  vertex((width/2)+65, (3*(height/4))+5);
  //  endShape();

  //draw blush
  fill(250, 141, 248);
  noStroke();
  ellipse(width/4, (height/2)+20, 100, 100);
  ellipse(3*(width/4), (height/2)+20, 100, 100);

  //draw eyes

  //open eye
  fill(255, 255, 255);
  arc((2*(width/3))-25, (height/3)+10, 80, 60, PI, TWO_PI);
  fill(39, 100, 183);
  noStroke();
  ellipse((2*(width/3))-25, (height/3)-5, 30, 30);
  fill(0, 0, 0);
  ellipse((2*(width/3))-25, (height/3), 10, 10);

  //closed eye
  noFill();
  strokeWeight(5);
  stroke(0, 0, 0);
  arc((width/3)+25, (height/3)-5, 70, 50, 0, PI);

  //draw nostrils
  noStroke();
  fill(0, 0, 0);
  arc((width/2)-35, 2*(height/3), 40, 40, PI, TWO_PI);
  arc((width/2)+35, 2*(height/3), 40, 40, PI, TWO_PI);
}

