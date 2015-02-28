
void setup() {
size(500, 300);
background(255);
noStroke();
smooth();


color building = color(204, 23, 0);
color black = color(0, 0, 0);
color grass = color(79, 191, 58);

fill(building); //RedCentre
rect(120, 80, 280, 45);
fill(building); // OldMain
rect(120, 230, 320, 45);
fill(building); // Newton
rect(120, 130, 35, 100);
fill(building); // OldMain
rect(170, 140, 40, 90);
fill(building); // OldMain
rect(240, 140, 30, 90);
fill(building); // Burrows
rect(290, 140, 40, 90);
fill(building); // OldMain
rect(340, 140, 30, 90);
fill(building); // OldMain
rect(400, 140, 35, 90);
fill(black); // ScienceRoad
rect(120, 0, 10, 520);
fill(black); // EngRoad
rect(445, 80, 10, 520);
fill(black); // UniversityMall
rect(0, 60, 600, 20);
fill(grass); // VillageGreen
ellipse(-30, 230, 250, 250);
fill(grass); // ScienceSquare
rect(170, 30, 60, 30);
fill(building); // RobertWebster
rect(260, 30, 185, 30);
fill(building);// RedCentre
rect(130, 0, 40, 60);
}

void draw() {
  {if (mouseX > 130 && mouseX < 400 && mouseY > 80 && mouseY < 125)  {
    stroke(#FFFA00);
    line(mouseX, mouseY, mouseX, mouseY); 
  } else {
    stroke(#00FF59);
    line(mouseX, mouseY+3, mouseX, mouseY-2); 
        }
  }
}


