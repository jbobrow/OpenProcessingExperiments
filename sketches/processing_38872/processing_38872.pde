

void setup() {
 size(500,500);
 background(220);
}

void draw() {
  

stroke(0);  
line(250,0,mouseX,500);

stroke(0);  
line(0,250,500,mouseY);

stroke(0);  
line(0,0,500,mouseY);

stroke(30);  
line(0,0,500,mouseY);

stroke(255);
fill(random(240));
ellipse(250,250, random(360), 320);
  
stroke(255);
fill(mouseX,mouseY, 200,180);
ellipse(250, 250, 200, random(180));

stroke(255);
fill(mouseX,mouseY, 255,130);
ellipse(250, 250, random(150), 140);


stroke(255);
fill(3,255,173,70);  
ellipse( 250,250,100,100);

stroke(255);
fill(255,3,100);
triangle(250,200,220,210,250,250);

stroke(255);
fill(random(255));
triangle(250,200,280,210,250,250);


stroke(255);
fill(255,3,100);
triangle(280,210,300,235,250,250);

stroke(255);
fill(255,3,random(255));
triangle(300,235,297,270,250,250);

stroke(255);
fill(255,3,random(255));
triangle(200,240,220,210,250,250);

stroke(255);
fill(255,3,random(255));
triangle(200,240,220,210,250,250);

//if the mouseX is greater tham 250, then the background random.
if(mouseX>250){
  background(random(255));
}

//if the mouseY is less than 250, curve start to draw 
if(mouseX<250){
noFill();
curve(mouseX, mouseY, random(500), random(500), random(500), random(500), random(500), random(500));
}

}








