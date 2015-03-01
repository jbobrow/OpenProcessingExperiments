
String[] premier =
{"Picture yourself..."};
String[] ancre =
{"boat","river","tangerine","marmalade skies","the sky","parrot wing","plasticine porters","looking-glass ties","dream","trip","dyeing stars smiling","inletting the sky"};
/*String[] noeud =
{"in the", "in a", "with the","on a","with","in the","that","of"};*/
/*String[] ponctuation =
{".","!","?"};*/

PFont mapolice;


void setup()
{
 size(720,480);
 background(255);
 mapolice = loadFont("ACaslonPro-Bold-48.vlw");
 textFont(mapolice,24);
 textAlign(CENTER);

 smooth();
 fill(0);
}


void draw()
{
 if(mousePressed)
 {
  background(255);
  text( premier[int(random(0, premier.length))]+" " + "\n" + "on a" + " " + ancre[int(random(0,ancre.length))] + " " + "\n" + "with" + " " + 
  ancre[int(random(0,ancre.length))]+ " " + "and" + " " + ancre[int(random(0,ancre.length))] + ".", width/2, height/2);
 }
} 

 
 void mouseMoved()
{
  

}


