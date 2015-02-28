
int x=180;
int y=150;
int w=140;
int h=120;
PImage img;




void setup(){
 img=loadImage("space.jpg"); 
size(1000,750);
smooth();
noStroke();

}

void draw(){
image(img,0,0);
  
  

  
noStroke();
 if (keyPressed && (key == CODED)) {  // If it’s a coded key
    if (keyCode == LEFT) {
      x--;
    } else if (keyCode == RIGHT) {
      x++;
    }  else if(keyCode == UP){
      y--;
    } else if(keyCode == DOWN){
      y++;
  } }

//head
fill (255);
rect(x,y,w,h);
fill(232,176,215);
rect(x,y+10,w,15);
rect(x,y+30,w,5);

//eyes
fill(0);
ellipse(x+25,y+80,10,10);
ellipse(x+(w-25),y+80,10,10);

// anntenne
stroke(255);
strokeWeight(4);
line(x+40,y-80,x+(w/2),y);
line(x+30,y-70,x+55,y-75);
line(x+30,y-60,x+55,y-65);
line(x+(w/2),y+h,x+(w/2),y+170);
ellipse(x+w/2,y+120,40,40);

//body
ellipse(x+w/2,y+200,60,60);
noStroke();
fill(mouseX,mouseY,200);
triangle(x+w/2-10,y+190,x+w/2+10,y+190,x+w/2,y+200);

}

