
void setup (){
size (400,400);
background(200);
smooth();
}

void draw(){

noStroke();
fill(200,2);
rect(0,0,width,height);

stroke(255);
ellipse(width*3/12,height*2/12,30,30);
ellipse(width*8/12,height*1/12,30,30);
ellipse(width*9/12,height*4/12,30,30);
ellipse(width*6/12,height*6/12,30,30);
ellipse(width*1/12,height*8/12,30,30);
ellipse(width*4/12,height*9/12,30,30);
ellipse(width*10/12,height*10/12,30,30);


if(mousePressed){
noStroke();
fill(20,70);
ellipse(mouseX,mouseY,30,30);
fill(100,70);
ellipse(mouseX+70,mouseY+10,30,30);
ellipse(mouseX+10,mouseY+50,30,30);
ellipse(mouseX+35,mouseY+25,10,10);
ellipse(mouseX-40,mouseY+60,10,10);
ellipse(mouseX-30,mouseY+20,30,30);
ellipse(mouseX-60,mouseY,50,50);
ellipse(mouseX-35,mouseY-15,10,10);
ellipse(mouseX-70,mouseY-40,10,10);
ellipse(mouseX-15,mouseY-25,10,10);
ellipse(mouseX-30,mouseY-70,50,50);
ellipse(mouseX+35,mouseY-90,50,50);
ellipse(mouseX+45,mouseY-30,30,30);
ellipse(mouseX+60,mouseY-50,10,10);
ellipse(mouseX+20,mouseY-20,10,10);
ellipse(mouseX+10,mouseY-60,30,30);
ellipse(mouseX+25,mouseY+20,10,10);
ellipse(mouseX+40,mouseY+60,50,50);
ellipse(mouseX+80,mouseY+60,10,10);
ellipse(mouseX+70,mouseY+40,10,10);
ellipse(mouseX+90,mouseY+20,10,10);
ellipse(mouseX+110,mouseY-20,10,10);
ellipse(mouseX-110,mouseY+30,10,10);
ellipse(mouseX-90,mouseY+50,30,30);
ellipse(mouseX-50,mouseY+90,50,50);

}
}								
