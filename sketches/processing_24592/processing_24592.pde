
float x = 50; 
float y = 50;
float easing = 0.03;


void setup() {
  
  
size(500,300);
smooth();

}


void draw () {
//println(mousePressed);
  //println("Draw is running");
  //println(frameCount);
 
background(60,70,100);

float targetX = mouseX;
x += (targetX - x) * easing;

float targetY = mouseY;
y += (targetY - y) * easing;

//begin robot

//body
fill(160,170,200);
quad(x+10,y+33,x+40,y+37,x+40,y+102,x+10,y+90);
fill(200,210,240);
quad(x+40,y+37,x+87,y+22,x+87,y+80,x+40,y+102);

//rightarm
fill(160,170,200);
quad(x+5,y+32,x+25,y+38,x+25,y+80,x+5,y+70);
fill(200,210,240);
quad(x+25,y+38,x+36,y+38,x+36,y+75,x+25,y+80);

//leftarm
fill(160,170,200);
quad(x+87,y+22,x+110,y+45,x+98,y+59,x+87,y+49);
fill(200,210,240);
quad(x+110,y+45,x+114,y+50,x+104,y+61,x+98,y+59);

//head
fill(160,170,200);
quad(x,y-20,x+30,y-30,x+30,y+40,x,y+30);//leftbitofhead
fill(200,210,240);
quad(x+30,y-30,x+95,y-20,x+95,y+20,x+30,y+40);//rightbitofhead



//eyes
fill(255,255,180);
//if mouse pressed robot shuts eyes
if (mousePressed) {
 ellipse(x+53,y+2,25,1);
  ellipse(x+80,y+1,15,1);
}
else {
ellipse(x+53,y+5,25,40);
ellipse(x+80,y+1,15,23);
 
}


//rivets
ellipse(x+5,y-16,2,2);
ellipse(x+24,y-22,2,2);
ellipse(x+5,y+25,2,2);
ellipse(x+25,y+32,2,2);
ellipse(x+35,y-23,2,2);
ellipse(x+91,y-16,2,2);
ellipse(x+92,y+17,2,2);
ellipse(x+35,y+33,2,2);  



}


