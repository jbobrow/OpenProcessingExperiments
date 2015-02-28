
//Original Grid size is 20x30

void setup(){
size(1000,1000);

}
void draw() {
rectMode(CORNERS);
ellipseMode(CORNERS);
background(128);
      //Face Shape
fill((mouseX/2),(mouseX/2),(mouseX/2));
ellipse((mouseX+130)-200,(mouseY+180)-300,(mouseX+270)-200,(mouseY+420)-300);
stroke(128);
fill(128);
rect((mouseX+130)-200,(mouseY+360)-300,(mouseX+270)-200,(mouseY+380)-300);
ellipse((mouseX+100)-200,(mouseY+330)-300,(mouseX+160)-200,(mouseY+440)-300);
ellipse((mouseX+240)-200,(mouseY+330)-300,(mouseX+300)-200,(mouseY+440)-300);
        //eyes 
fill(0);
noStroke();
ellipse((mouseX+140)-200,(mouseY+300)-300,(mouseX+170)-200,(mouseY+320)-300);
ellipse((mouseX+230)-200,(mouseY+300)-300,(mouseX+260)-200,(mouseY+320)-300);
ellipse((mouseX+170)-200,(mouseY+250)-300,(mouseX+230)-200,(mouseY+270)-300);
ellipse((mouseX+190)-200,(mouseY+250)-300,(mouseX+210)-200,(mouseY+270)-300);
      //Pupils
fill(255);
ellipse((mouseX+150)-200,(mouseY+300)-300,(mouseX+160)-200,(mouseY+310)-300);
ellipse((mouseX+240)-200,(mouseY+300)-300,(mouseX+250)-200,(mouseY+310)-300);
ellipse((mouseX+190)-200,(mouseY+250)-300,(mouseX+210)-200,(mouseY+270)-300);
      //Nostrils
fill(0);
ellipse((mouseX+185)-200,(mouseY+330)-300,(mouseX+195)-200,(mouseY+350)-300);
ellipse((mouseX+205)-200,(mouseY+330)-300,(mouseX+215)-200,(mouseY+350)-300);
      //line
stroke(0);
line((mouseX+260)-200,(mouseY+220)-300,(mouseX+260)-200,(mouseY+150)-300);
line((mouseX+260)-200,(mouseY+150)-300,(mouseX+300)-200,(mouseY+150)-300);
line((mouseX+300)-200,(mouseY+150)-300,(mouseX+300)-200,(mouseY+210)-300);
line((mouseX+140)-200,(mouseY+220)-300,(mouseX+140)-200,(mouseY+150)-300);
line((mouseX+140)-200,(mouseY+150)-300,(mouseX+100)-200,(mouseY+150)-300);
line((mouseX+100)-200,(mouseY+150)-300,(mouseX+100)-200,(mouseY+210)-300);
//face Lines
line((mouseX+180)-200,(mouseY+360)-300,(mouseX+170)-200,(mouseY+330)-300);
line((mouseX+170)-200,(mouseY+330)-300,(mouseX+140)-200,(mouseY+325)-300);
line((mouseX+220)-200,(mouseY+360)-300,(mouseX+230)-200,(mouseY+330)-300);
line((mouseX+230)-200,(mouseY+330)-300,(mouseX+260)-200,(mouseY+325)-300);

}
