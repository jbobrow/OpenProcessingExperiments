
int x = 140;
int y = 50;
PImage img1;
float angle = 0.0;

void setup(){
  size(400,500);
  smooth();
  img1 = loadImage("triangles.jpg");
}

void draw(){
  image(img1,0,0);
  
   if (keyPressed && (key == CODED)) { // If it’s a coded key
    if (keyCode == LEFT) { // If it’s the left arrow
      x--;
} else if (keyCode == RIGHT) { // If it’s the right arrow
      x++;
} else if (keyCode == UP) {
  x++;
  }
  
   fill(89,162,217);
  rect(x,y,120,80); //head
  ellipse(x+40,y+350,25,25);//foot1
  ellipse(x+80,y+350,25,25);//foot2
  rect(x+55,y+80,10,20);//neck
  fill(126,203,176);
  rect(x-5,y-5,130,5);//forehead
  rect(x+10,y+100,100,100);//body
  line(x+10,y+125,x-15,300);//arm1
  line(x+110,y+125,x+135,300);//arm2
  line(x+40,y+200,x+40,390);//leg1
  line(x+80,y+200,x+80,390);//leg2

  //for (int i = 160; i<=240; i+=10){
   // line(i,y+55,i,y+65);

}
  
  fill(255,231,194);
  ellipse(x+30,y+20,25,25);//eye
  ellipse(x+30,y+25,15,15);//inner eye
  ellipse(x+90,y+20,25,25);//eye 2
  ellipse(x+90,y+25,15,15);//inner eye
  rect(x+10,y+65,100,10);//mouth
  ellipse(x+60,y+180,15,15);//middle button
  ellipse(x+30,y+180,15,15);//button
  ellipse(x+90,y+180,15,15);//button
  fill(mouseX,mouseY,0);
  triangle(x+60,y+105,x+30,y+160,x+90,y+160); //belly
}


