
// Wackeldach
// 03.12.2014

/*Aufgabenstellung
ErgÃ¤nze das Haus so, dass die Dachspitze mit dem Mauscursor mitwandert. 
Hinweis: Wie du die Mausposition nutzen kannst, ist in Abschnitt 2 erklÃ¤rt.
*/

void setup(){
  size(300,300);
}

void draw(){
  background(183,242,0);
  line(100,200,200,200);
  line(100,100,100,200);
  line(200,100,200,100);
  line(100,100,mouseX,50);
  line(mouseY,50,200,100);
}


