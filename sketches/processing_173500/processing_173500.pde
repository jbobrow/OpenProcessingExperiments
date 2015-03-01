
//Einfuehrung in Processing
// 2-1 Mausposition

/* Von nun an werden wir Programme aufteilen. Zuerst werden Dinge wie ein dauerhaft angezeigter Hintergrund und die Fenstergroesse eingestellt: Das geschieht immer mit 
        void setup()
        { ... Einstellungen...
        }
*/

void setup ()
{
  size (400, 200);
  background (0,154,188);
}
 

/* Als zweites beginnt die Zeichnung. Dieser Abschnitt wird immer wieder von vorne durchgefÃ�Â¼hrt. Es wird also wie im Beispiel nicht nur ein Kreis gemalt, sondern immer wieder neue.
Dieser Abschnitt hat immer die Form
        void draw()
        { ... Zeichnung ...
        }
*/

void draw ()
{
  stroke (255,206,0);
  strokeWeight (2);
  fill (208,242,2);
  ellipse (mouseX, mouseY, 50, 50);
}


