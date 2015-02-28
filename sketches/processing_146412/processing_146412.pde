
String processingDef = "Processing: Processing ist eine auf die Einsatzbereiche Grafik, Simulation und Animation spezialisierte objektorientierte, stark typisierte Programmiersprache mit zugehÃ¶riger integrierter Entwicklungsumgebung. Sie wird in einem quelloffenen Projekt entwickelt, das am Massachusetts Institute of Technology in Boston von Ben Fry (Broad Institute) und Casey Reas (UCLA Design|Media Arts) initiiert wurde. Processing hat den Charakter einer stark vereinfachten Version der Programmiersprache Java, ermÃ¶glicht Interaktionen und visuelle Elemente zu programmieren und richtet sich vorwiegend an Gestalter, KÃ¼nstler und ProgrammieranfÃ¤nger. Die Klassenbibliotheken der Programmiersprache zielen vor allem auf das Einsatzgebiet von Processing und berÃ¼cksichtigen die Themen Video, Grafik, Grafikformate, Sound, Animation, Typographie, 3D, Simulation, Datenzugriff und -transfer, sowie Netzwerkprotokolle. Im Jahr 2005 wurde Processing mit dem Prix Ars Electronica in der Kategorie Net Vision/Net Excellence ausgezeichnet.";
String javaDef = "Java: Java ist eine objektorientierte Programmiersprache und eine eingetragene Marke des Unternehmens Sun Microsystems (2010 von Oracle aufgekauft). Die Programmiersprache ist ein Bestandteil der Java-Technologie â�� diese besteht grundsÃ¤tzlich aus dem Java-Entwicklungswerkzeug (JDK) zum Erstellen von Java-Programmen und der Java-Laufzeitumgebung (JRE) zu deren AusfÃ¼hrung. Die Laufzeitumgebung selbst umfasst die virtuelle Maschine (JVM) und die mitgelieferten Bibliotheken. Die Programmiersprache Java dient innerhalb der Java-Technologie vor allem dem Formulieren von Programmen. Diese liegen zunÃ¤chst als reiner, menschenverstÃ¤ndlicher Text vor, als sogenannter Quellcode. Dieser Quellcode ist nicht direkt ausfÃ¼hrbar; erst der Java-Compiler, der Teil des Entwicklungswerkzeugs ist, Ã¼bersetzt ihn in einen maschinenverstÃ¤ndlichen Code, den sogenannten Java-Bytecode. Die Maschine, die diesen Bytecode ausfÃ¼hrt, ist jedoch typischerweise virtuell â�� das heiÃ�t, der Code wird meist nicht direkt durch Hardware (etwa einen Mikroprozessor) ausgefÃ¼hrt, sondern durch entsprechende Software auf der Zielplattform. Zweck dieser Virtualisierung ist PlattformunabhÃ¤ngigkeit: Das Programm soll ohne weitere Ã�nderung auf jeder Rechnerarchitektur laufen kÃ¶nnen, wenn dort eine passende Laufzeitumgebung installiert ist. Oracle selbst bietet Laufzeitumgebungen fÃ¼r die Betriebssysteme Linux, OS X, Solaris und Windows an. Andere Hersteller lassen eigene Java-Laufzeitumgebungen fÃ¼r ihre Plattform zertifizieren. Auch in Autos, HiFi-Anlagen und anderen elektronischen GerÃ¤ten wird Java verwendet. Um die AusfÃ¼hrungsgeschwindigkeit zu erhÃ¶hen, werden Konzepte wie die Just-in-time-Kompilierung und die Hotspot-Optimierung verwendet. In Bezug auf den eigentlichen AusfÃ¼hrungsvorgang kann die JVM den Bytecode also interpretieren, ihn bei Bedarf jedoch auch kompilieren und optimieren.";
String input = processingDef + " " + javaDef;

int count = 0;
int delayCounter = 0;

PFont font;
int fontSize;

float x = 0;
float y = 0;

color fillColor = color (0);

void setup ()
{
  size (600, 200);
  smooth();

  background (#57385c);

  // println (PFont.list());

  fontSize = 30;
  font = createFont ("Rockwell", fontSize);
  y = fontSize;

  textFont (font, fontSize);

  frameRate (30);
  textAlign (LEFT);
}

void draw ()
{

  if (count < input.length())
  {   
    noFill();
    noStroke();

    char letter = input.charAt (count);
    switch (letter)
    {
    // Processing JavaScript seems to have some issues with chars
    // in Java mode you write instead:
    // case 'a':
    case "a".charAt (0):
    case "e".charAt (0):
    case "i".charAt (0):
    case "o".charAt (0):
    case "u".charAt (0):
    case "A".charAt (0):
    case "E".charAt (0):
    case "I".charAt (0):
    case "O".charAt (0):
    case "U".charAt (0):
      fillColor = color (#ffedbc);
      fill (fillColor);
      rect ( x, y, textWidth (letter), -fontSize);
      break;
    case "Ã�".charAt (0):
    case "Ã�".charAt (0):
    case "Ã�".charAt (0):
    case "Ã¤".charAt (0):
    case "Ã¶".charAt (0):
    case "Ã¼".charAt (0):
    case "Ã�".charAt (0):
      fillColor = color (#A75265);
       fill (fillColor);
      rect ( x, y, textWidth (letter), -fontSize);
      break;
    default:
      fillColor = color (255, 80);  
      fill (fillColor);
      ellipse (x+textWidth (letter)/2, y-fontSize/2, textWidth (letter), textWidth (letter));
      break;
    }



    //rect ( x, y,  textWidth (letter), fontSize);
    count++;
    x+= textWidth (letter);

    if (x >= width)
    {
      x = 0;
      y += fontSize* 1.5;
    }

    if (y >= height)
    {
      background (#57385c);
      y = fontSize;
    }
  }
}


void keyPressed ()
{
  count = 0;
}

