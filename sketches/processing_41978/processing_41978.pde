
float bg = 255;

void setup () {
size (650, 650);
}  

void draw() { 

//changing background based on mouse position

background (bg);
  if (mouseY > 325) {//speed
    bg = bg + .5;
  } else {
    bg = bg - .5;
  }
  
  if (bg > 255) {
    bg = 255;
  } else if (bg < 0) {
    bg = 0;
  }

smooth();

//face
translate (-250,-200);
fill (255);
noStroke();
beginShape();
vertex(mouseX+113,mouseY+185);
vertex(mouseX+83, mouseY+230);
vertex(mouseX+81, mouseY+240);
vertex(mouseX+100, mouseY+255);
vertex(mouseX+100, mouseY+265);
vertex(mouseX+90, mouseY+275);
vertex(mouseX+92, mouseY+290);
vertex(mouseX+95, mouseY+295);
vertex(mouseX+98, mouseY+300);
vertex(mouseX+92, mouseY+305);
vertex(mouseX+96, mouseY+315);
vertex(mouseX+108, mouseY+320);
vertex(mouseX+108, mouseY+330);
vertex(mouseX+113, mouseY+340);
vertex(mouseX+118, mouseY+350);
vertex(mouseX+160, mouseY+360);
vertex(mouseX+170, mouseY+360);
vertex(mouseX+180, mouseY+357);
vertex(mouseX+200, mouseY+355);
vertex(mouseX+220, mouseY+350);
vertex(mouseX+230, mouseY+340);
vertex(mouseX+240, mouseY+325);
vertex(mouseX+245, mouseY+315);
vertex(mouseX+250, mouseY+300);
vertex(mouseX+252, mouseY+280);
vertex(mouseX+253, mouseY+250);
vertex(mouseX+255, mouseY+200);
vertex(mouseX+230, mouseY+180);
vertex(mouseX+210, mouseY+150);
vertex(mouseX+180, mouseY+100);
vertex(mouseX+170, mouseY+80);
vertex(mouseX+130, mouseY+70);
vertex(mouseX+125, mouseY+70);
vertex(mouseX+120, mouseY+80);
vertex(mouseX+115, mouseY+90);
vertex(mouseX+110, mouseY+100);
vertex(mouseX+105, mouseY+120);
vertex(mouseX+105, mouseY+130);
vertex(mouseX+108, mouseY+140);
vertex(mouseX+110, mouseY+170);
vertex(mouseX+113, mouseY+185);
endShape(CLOSE);

// neck

fill(255);
beginShape();
vertex(mouseX+260, mouseY+200);
vertex(mouseX+258, mouseY+300);
vertex(mouseX+230, mouseY+350);
vertex(mouseX+225, mouseY+355);
vertex(mouseX+220, mouseY+360);
vertex(mouseX+230, mouseY+370);
vertex(mouseX+240, mouseY+380);
vertex(mouseX+250, mouseY+400);
vertex(mouseX+260, mouseY+420);
vertex(mouseX+280, mouseY+440);
vertex(mouseX+360, mouseY+350);
vertex(mouseX+365, mouseY+300);
vertex(mouseX+340, mouseY+270);
vertex(mouseX+337, mouseY+250);
vertex(mouseX+330, mouseY+230);
vertex(mouseX+320, mouseY+215);
vertex(mouseX+322, mouseY+205);
vertex(mouseX+321, mouseY+195);
vertex(mouseX+310, mouseY+180);
vertex(mouseX+290, mouseY+176);
endShape(CLOSE);

// hair

fill(255);
beginShape();
vertex(mouseX+113, mouseY+50);
vertex(mouseX+130, mouseY+60);
vertex(mouseX+180, mouseY+75);
vertex(mouseX+240, mouseY+180);
vertex(mouseX+255, mouseY+188);
vertex(mouseX+270, mouseY+180);
vertex(mouseX+290, mouseY+165);
vertex(mouseX+320, mouseY+173);
vertex(mouseX+323, mouseY+180);
vertex(mouseX+326, mouseY+190);
vertex(mouseX+330, mouseY+210);
vertex(mouseX+335, mouseY+205);
vertex(mouseX+338, mouseY+220);
vertex(mouseX+345, mouseY+250);
vertex(mouseX+346, mouseY+265);
vertex(mouseX+370, mouseY+290);
vertex(mouseX+380, mouseY+290);
vertex(mouseX+390, mouseY+265);
vertex(mouseX+388, mouseY+200);
vertex(mouseX+395, mouseY+190);
vertex(mouseX+403, mouseY+200);
vertex(mouseX+430, mouseY+190);
vertex(mouseX+440, mouseY+170);
vertex(mouseX+439, mouseY+150);
vertex(mouseX+434, mouseY+120);
vertex(mouseX+436, mouseY+100);
vertex(mouseX+420, mouseY+60);
vertex(mouseX+400, mouseY+58);
vertex(mouseX+380, mouseY+65);
vertex(mouseX+370, mouseY+66);
vertex(mouseX+350, mouseY+75);
vertex(mouseX+345, mouseY+58);
vertex(mouseX+330, mouseY+30);
vertex(mouseX+250, mouseY+23);
vertex(mouseX+200, mouseY+20);
endShape(CLOSE);

//changing lines
translate(250,200);
int i = 0; 
while (i < height) {
noStroke();
float distance = abs(mouseX -i);
fill (distance);
rect (i,0,5,height);
i+=70;
  }
}




