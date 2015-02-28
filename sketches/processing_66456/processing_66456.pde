
/*
Copyright by Diana Lange 2012
 www.diana -lange.de
 
 https://vimeo.com/dianalange
 https://twitter.com/dianaontheroad
 http://www.flickr.com/photos/dianalange/
 */

int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;
float zoom = 0.3;
float drehen = TWO_PI;

String txt = " ";
int [] dir;
HashMap letters;
int letterMinCount = 10000, letterMaxCount = 0;
Word [] words;
;

int wR = 400, wL = 70, lL = 60, lR = 280, wbL = 25, lbL = 80;

void setup ()
{
  size(900, 450);

  centerX = width/3;
  centerY = height/2;

  cursor(HAND);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();

  words = new Word [0];
  if (frameCount == 0) txt = buergschaft;

  String delimiters = " ,.?!;:+()&\"'";

  /* use this for external text data -->
   String [] raw = loadText ("text.txt");
   txt = join (raw, " ");
   */

  countLetters (txt);
  createWordArray (splitTokens (txt, delimiters));
  initDir (words.length, 3);
}

void draw ()
{
  background (0, 0, 97);

  if (mousePressed == true) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;
  }


  translate(centerX, centerY);
  rotate (drehen);
  scale(zoom);

  visualizeLetters(txt, 0, 0, lL, lR);
  visualizeText(0, 0, wR, wL, wbL, lbL, -PI/5);
}

String [] loadText(String path)
{
  String urlSmall = path.toLowerCase();
  return loadStrings (path);
}

void countLetters (String raw)
{
  letters = new HashMap();

  char c;

  for (int i = 0; i < raw.length(); i++)
  {
    c = raw.toLowerCase().charAt (i);

    if (c != ' ' && letters.containsKey (c))
    {
      Letter l = (Letter) letters.get (c);
      l.increase();
      letters.put (c, new Letter (c, l.count));
    }
    else {
      letters.put(c, new Letter(c));
    }
  }

  checkMinMaxLetterCount();
}

void checkMinMaxLetterCount ()
{
  Iterator i = letters.entrySet().iterator();

  while (i.hasNext ()) 
  {
    Map.Entry me = (Map.Entry)i.next();
    Letter l = (Letter) letters.get (me.getKey());
    if (l.count > letterMaxCount) letterMaxCount = l.count;
    if (l.count < letterMinCount) letterMinCount = l.count;
  }
}

void createWordArray (String [] raw)
{
  boolean foundInList = false;
  for (int i = 0; i < raw.length; i++)
  {
    foundInList = false;
    for (int j = 0; j < words.length; j++)
    {
      if (words[j].txt.equals (raw[i].toLowerCase()))
      {
        words[j].increase();
        foundInList = true;
        break;
      }
    }

    if (!foundInList) 
      words = (Word []) append (words, new Word (raw[i].toLowerCase ()));
  }
}

class Letter
{
  char c;
  int count;

  Letter(char c)
  {
    this.c = c;
    count = 1;
  }

  Letter(char c, int count)
  {
    this.c = c;
    this.count = count;
  }

  void increase ()
  {
    count++;
  }
}

class Vec2D
{
  protected float x, y;

  Vec2D (float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  Vec2D ()
  {
    x = 0;
    y = 0;
  }

  void init (float centerX, float centerY, float angle, float d)
  {
    //this();
    x = centerX + cos (angle) * d;
    y = centerY + sin (angle) * d;
  }
}


Vec2D [] initEmptyVec2DArray (int n)
{
  Vec2D [] a = new Vec2D [n];
  for (int i = 0; i < n; i++) a[i] = new Vec2D();
  return a;
}

class Word
{
  String txt;
  String lowerCaseTxt;

  int count;
  Word (String txt)
  {
    this.txt = txt;
    lowerCaseTxt = txt.toLowerCase();
    count = 1;
  }

  void increase ()
  {
    count++;
  }

  char [] chars ()
  {
    return lowerCaseTxt.toCharArray();
  }
}

void mousePressed() {
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}

void keyPressed() 
{
  if (keyCode == KeyEvent.VK_Q) wL -= 5;
  if (keyCode == KeyEvent.VK_W) wL += 5;

  if (keyCode == KeyEvent.VK_A) wR -= 5;
  if (keyCode == KeyEvent.VK_S) wR += 5;

  if (keyCode == KeyEvent.VK_E) lL -= 5;
  if (keyCode == KeyEvent.VK_R) lL += 5;

  if (keyCode == KeyEvent.VK_D) lR -= 5;
  if (keyCode == KeyEvent.VK_F) lR += 5;

  if (keyCode == KeyEvent.VK_Z) wbL -= 1;
  if (keyCode == KeyEvent.VK_U) wbL += 1;

  if (keyCode == KeyEvent.VK_H) lbL -= 5;
  if (keyCode == KeyEvent.VK_J) lbL += 5;

  wL = constrain (wL, 10, width);
  wR = constrain (wR, 10, width);
  lL = constrain (lL, 10, width);
  lR = constrain (lR, lL + 10, width);
  wbL = constrain (wbL, 1, width);
  lbL = constrain (wbL, 5, width);

  if (keyCode == KeyEvent.VK_1) 
  {
    txt = buergschaft;
    setup();
  }

  if (keyCode == KeyEvent.VK_2) 
  {
    txt = moor;
    setup();
  }

  if (keyCode == KeyEvent.VK_3) 
  {
    txt = braut;
    setup();
  }

  if (keyCode == UP) 
  { 
    zoom += 0.02; 
    loop();
  }
  if (keyCode == DOWN) 
  {
    zoom -= 0.02;   
    loop();
  }

  //drehen
  if (keyCode == RIGHT) {
    drehen += PI/18; 
    loop();
  }
  if (keyCode == LEFT) {
    drehen -= PI/18;  
    loop();
  }

  if (keyCode == KeyEvent.VK_SPACE ) initDir (words.length, 3);
}


void drawLine (Vec2D start, Vec2D end, color c, float sw)
{
  stroke (c);
  strokeWeight (sw);
  line (start.x, start.y, end.x, end.y);
}

void drawCurve (Vec2D [] pos, color c, float sw )
{
  noFill();
  stroke (c);
  strokeWeight (sw);
  beginShape();
  for (int i = 0; i < pos.length; i++)
  {
    curveVertex (pos[i].x, pos [i].y);
    if (i == 0 || i == pos.length - 1) curveVertex (pos[i].x, pos [i].y);
  }   
  endShape();
}


void drawEllipse (boolean fill, boolean stroke, color fillC, color strokeC, float sw, float d, float x, float y)
{
  if (!stroke && fill) drawEllipse (fill, stroke, fillC, d, x, y);
  else if (stroke && fill)
  {
    stroke (strokeC);
    strokeWeight (sw);
    fill (fillC);
    ellipse (x, y, d, d);
  }
  else {
    drawEllipse (fill, stroke, strokeC, sw, d, x, y);
  }
}

void drawEllipse (boolean fill, boolean stroke, color strokeC, float sw, float d, float x, float y)
{
  if (!fill)
  {
    noFill ();
    stroke (strokeC);
    strokeWeight (sw);
    ellipse (x, y, d, d);
  }
  else drawEllipse (fill, stroke, color (0, 0, 100, 100), strokeC, sw, d, x, y);
}

void drawEllipse (boolean fill, boolean stroke, color fillC, float d, float x, float y)
{
  if (stroke) drawEllipse (fill, stroke, fillC, color (0, 0, 0, 100), 1.0, d);
  else {
    noStroke();
    fill(fillC);
    ellipse (x, y, d, d);
  }
}


void visualizeLetters(String raw, float centerX, float centerY, int centerR, int r )
{
  color c = color (0, 35, 75, 60);
  float a = 0;
  Letter l;
  char ch;

  Vec2D [] linePos = initEmptyVec2DArray(2);

  for (int i = 0; i < raw.length(); i++) 
  {
    ch = raw.toLowerCase().charAt (i);

    if (!letters.containsKey (ch)) continue;

    l = (Letter) letters.get(ch);
    a = TWO_PI / (float) raw.length() * i;

    linePos [0].init (centerX, centerY, a, centerR);
    linePos [1].init (centerX, centerY, a, map (l.count, letterMinCount, letterMaxCount, centerR, r));


    drawLine (linePos [0], linePos [1], color (360.0 / (float) raw.length() * (float) i, saturation(c), brightness (c), alpha(c)), 0.4);
  }
}


void initDir (int n, int max)
{
  dir = new int [n];
  for (int i = 0; i < n; i++) dir [i] = (int) random (0, max);
}

void visualizeText(int centerX, int centerY, int r, int l, int l2, int letterL, float startAngle)
{
  Vec2D [] curvePos = initEmptyVec2DArray(4);
  Vec2D [] letterPos = initEmptyVec2DArray(4);
  for (int i = 0; i < words.length; i++)
  {
    visualizeWords (centerX, centerY, words [i], r, l, l2, letterL, startAngle + (float) i * TWO_PI / (float) words.length, TWO_PI / (float)  words.length, words.length, curvePos, letterPos);
  }
}


color createColorbyCount (int count)
{
  if (constrain (count*18, 0, 360) > 58 && constrain (count*18, 0, 360) < 193 ) return color (constrain (count*18, 0, 360), 70, 70, 50);
  else return color(constrain (count*18, 0, 360), constrain (100 - count, 20, 100), constrain (50+count, 45, 100), constrain (20 + count, 40, 70));
}

void createPosForMultiWords (int centerX, int centerY, Vec2D [] curvePos, int i, float a, float s, float r, float dis)
{
  if (dir[i] == 0)
  {
    curvePos [1].init (centerX, centerY, a +(-s*8), r + dis*0.3333);  
    curvePos [2].init (centerX, centerY, a+(s*14), r + dis*0.66667);
  }
  else if (dir[i] == 1)
  {
    curvePos [1].init (centerX, centerY, a+(s*16), r + dis*0.25);  
    curvePos [2].init (centerX, centerY, a+(-s*10), r + dis*0.75);
  }
  else
  {
    curvePos [1].init (centerX, centerY, a+(s*18), r + dis*0.4);  
    curvePos [2].init (centerX, centerY, a+(s*8), r + dis*0.8);
  }
}

void visualizeWords (int centerX, int centerY, Word w, int radius, int minL, int maxL, int letterL, float angle, float steps, int length, Vec2D [] curvePos, Vec2D [] letterPos)
{
  color c = createColorbyCount (w.count);

  int targetRadius = minL + radius + w.count*maxL + 50/length;

  curvePos [0].init (centerX, centerY, angle, radius);         // start--> x,y
  curvePos [3].init (centerX, centerY, angle, targetRadius);      // end-->bigx, bigy

  float distance = dist (curvePos [0].x, curvePos [0].y, curvePos [3].x, curvePos [3].y);
  float sw = 3+w.count/4;

  if (w.count > 1) 
  {
    createPosForMultiWords (centerX, centerY, curvePos, w.count, angle, steps, radius, distance);
    drawCurve (curvePos, c, sw);
    drawEllipse (true, false, color (hue (c), saturation (c), brightness (c), 100), 15+w.count*4, curvePos [3].x, curvePos [3].y);
  }
  else
  {
    curvePos [3].init (centerX, centerY, angle, targetRadius);      // end-->bigx, bigy
    drawLine (curvePos [0], curvePos [3], color (hue (c), saturation (c), brightness (c), 100), 1.0);
    drawEllipse (false, true, color (hue (c), saturation (c), brightness (c), 100), 1.0, 15+w.count*4, curvePos [3].x, curvePos [3].y);
  }

  drawSplittedWords (w.chars(), c, w.count, letterL, angle, curvePos, letterPos, 15+w.count*4, dir [w.count]);
}

void drawSplittedWords (char [] ch, color c, int n, int startL, float angle, Vec2D [] curvePos, Vec2D [] letterPos, float startRadius, int dir)
{
  Letter l;

  float letterAngle = angle-PI/4;
  float letterSteps = 0.5*TWO_PI/(float) ch.length;
  float letterRadius = startL;

  float letterDistance = dist (letterPos [0].x, letterPos [0].y, letterPos [2].x, letterPos [2].y);

  letterPos [0].init (curvePos [3].x, curvePos [3].y, letterAngle, startRadius/2); //start

  for (int i = 0; i < ch.length; i++)
  {
    if (!letters.containsKey (ch[i])) continue;
    l = (Letter) letters.get(ch[i]);

    letterRadius = (startL+l.count);
    letterPos [2].init (curvePos [3].x, curvePos [3].y, letterAngle, letterRadius); //target

    if ( dir == 0)
    {
      letterPos [1].init (curvePos [3].x, curvePos [3].y, letterAngle+(-letterSteps*7), startRadius/2 + letterDistance/2);
      letterPos [3].init (curvePos [3].x, curvePos [3].y, letterAngle+(letterSteps/3), letterRadius + letterDistance/10);
    }
    else if ( dir == 1)
    {
      letterPos [1].init (curvePos [3].x, curvePos [3].y, letterAngle+(-letterSteps*3), startRadius/2 + letterDistance/3);
      letterPos [3].init (curvePos [3].x, curvePos [3].y, letterAngle+(letterSteps/3), letterRadius + letterDistance/5);
    }
    else
    {
      letterPos [1].init (curvePos [3].x, curvePos [3].y, letterAngle-letterSteps/3, startRadius/2 + letterDistance*3/5);
      letterPos [3].init (curvePos [3].x, curvePos [3].y, letterAngle+(letterSteps/3), letterRadius + letterDistance/10);                          // target
    }

    drawCurve (letterPos, c, 0.5);

    if (n > 2) drawEllipse (true, true, color (0, 0, 97, 100), color (0, 0, 0, 100), 0.5, 20+n*2, letterPos [3].x, letterPos [3].y);

    letterAngle += letterSteps;
  }
}

//Text: Goethe: Schiller - Die Bürgschaft"
String buergschaft = "Zu Dionys, dem Tyrannen, schlich Damon, den Dolch im Gewande: Ihn schlugen die Häscher in Bande, \"Was wolltest du mit dem Dolche? sprich!\" Entgegnet ihm finster der Wüterich. \"Die Stadt vom Tyrannen befreien!\" \"Das sollst du am Kreuze bereuen.\" \"Ich bin\", spricht jener, \"zu sterben bereit Und bitte nicht um mein Leben: Doch willst du Gnade mir geben, Ich flehe dich um drei Tage Zeit, Bis ich die Schwester dem Gatten gefreit; Ich lasse den Freund dir als Bürgen, Ihn magst du, entrinn' ich, erwürgen.\" Da lächelt der König mit arger List Und spricht nach kurzem Bedenken: \"Drei Tage will ich dir schenken; Doch wisse, wenn sie verstrichen, die Frist, Eh' du zurück mir gegeben bist, So muß er statt deiner erblassen, Doch dir ist die Strafe erlassen.\" Und er kommt zum Freunde: \"Der König gebeut, Daß ich am Kreuz mit dem Leben Bezahle das frevelnde Streben. Doch will er mir gönnen drei Tage Zeit, Bis ich die Schwester dem Gatten gefreit; So bleib du dem König zum Pfande, Bis ich komme zu lösen die Bande.\" Und schweigend umarmt ihn der treue Freund Und liefert sich aus dem Tyrannen; Der andere ziehet von dannen. Und ehe das dritte Morgenrot scheint, Hat er schnell mit dem Gatten die Schwester vereint, Eilt heim mit sorgender Seele, Damit er die Frist nicht verfehle. Da gießt unendlicher Regen herab, Von den Bergen stürzen die Quellen, Und die Bäche, die Ströme schwellen. Und er kommt ans Ufer mit wanderndem Stab, Da reißet die Brücke der Strudel herab, Und donnernd sprengen die Wogen Des Gewölbes krachenden Bogen. Und trostlos irrt er an Ufers Rand: Wie weit er auch spähet und blicket Und die Stimme, die rufende, schicket. Da stößet kein Nachen vom sichern Strand, Der ihn setze an das gewünschte Land, Kein Schiffer lenket die Fähre, Und der wilde Strom wird zum Meere. Da sinkt er ans Ufer und weint und fleht, Die Hände zum Zeus erhoben: \"O hemme des Stromes Toben! Es eilen die Stunden, im Mittag steht Die Sonne, und wenn sie niedergeht Und ich kann die Stadt nicht erreichen, So muß der Freund mir erbleichen.\" Doch wachsend erneut sich des Stromes Wut, Und Welle auf Welle zerrinnet, Und Stunde an Stunde ertrinnet. Da treibt ihn die Angst, da faßt er sich Mut Und wirft sich hinein in die brausende Flut Und teilt mit gewaltigen Armen Den Strom, und ein Gott hat Erbarmen. Und gewinnt das Ufer und eilet fort Und danket dem rettenden Gotte; Da stürzet die raubende Rotte Hervor aus des Waldes nächtlichem Ort, Den Pfad ihm sperrend, und schnaubert Mord Und hemmet des Wanderers Eile Mit drohend geschwungener Keule. \"Was wollt ihr?\" ruft er vor Schrecken bleich, \"Ich habe nichts als mein Leben, Das muß ich dem Könige geben!\" Und entreißt die Keule dem nächsten gleich: \"Um des Freundes willen erbarmet euch!\" Und drei mit gewaltigen Streichen Erlegt er, die andern entweichen. Und die Sonne versendet glühenden Brand, Und von der unendlichen Mühe Ermattet sinken die Kniee. \"O hast du mich gnädig aus Räubershand, Aus dem Strom mich gerettet ans heilige Land, Und soll hier verschmachtend verderben, Und der Freund mir, der liebende, sterben!\" Und horch! da sprudelt es silberhell, Ganz nahe, wie rieselndes Rauschen, Und stille hält er, zu lauschen; Und sieh, aus dem Felsen, geschwätzig, schnell, Springt murmelnd hervor ein lebendiger Quell, Und freudig bückt er sich nieder Und erfrischet die brennenden Glieder. Und die Sonne blickt durch der Zweige Grün Und malt auf den glänzenden Matten Der Bäume gigantische Schatten; Und zwei Wanderer sieht er die Straße ziehn, Will eilenden Laufes vorüber fliehn, Da hört er die Worte sie sagen: \"Jetzt wird er ans Kreuz geschlagen.\" Und die Angst beflügelt den eilenden Fuß, Ihn jagen der Sorge Qualen; Da schimmern in Abendrots Strahlen Von ferne die Zinnen von Syrakus, Und entgegen kommt ihm Philostratus, Des Hauses redlicher Hüter, Der erkennet entsetzt den Gebieter: \"Zurück! du rettest den Freund nicht mehr, So rette das eigene Leben! Den Tod erleidet er eben. Von Stunde zu Stunde gewartet' er Mit hoffender Seele der Wiederkehr, Ihm konnte den mutigen Glauben Der Hohn des Tyrannen nicht rauben.\" \"Und ist es zu spät, und kann ich ihm nicht, Ein Retter, willkommen erscheinen, So soll mich der Tod ihm vereinen. Des rühme der blut'ge Tyrann sich nicht, Daß der Freund dem Freunde gebrochen die Pflicht, Er schlachte der Opfer zweie Und glaube an Liebe und Treue!\" Und die Sonne geht unter, da steht er am Tor, Und sieht das Kreuz schon erhöhet, Das die Menge gaffend umstehet; An dem Seile schon zieht man den Freund empor, Da zertrennt er gewaltig den dichter Chor: \"Mich, Henker\", ruft er, \"erwürget! Da bin ich, für den er gebürget!\" Und Erstaunen ergreifet das Volk umher, In den Armen liegen sich beide Und weinen vor Schmerzen und Freude. Da sieht man kein Augen tränenleer, Und zum Könige bringt man die Wundermär'; Der fühlt ein menschliches Rühren, Läßt schnell vor den Thron sie führen, Und blicket sie lange verwundert an. Drauf spricht er: \"Es ist euch gelungen, Ihr habt das Herz mir bezwungen; Und die Treue, sie ist doch kein leerer Wahn - So nehmet auch mich zum Genossen an: Ich sei, gewährt mir die Bitte, In eurem Bunde der dritte\"";

//Text: von Droste-Huelshoff - Der Knabe im Moor
String moor = "O schaurig ist's übers Moor zu gehn, Wenn es wimmelt vom Heiderauche, Sich wie Phantome die Dünste drehn Und die Ranke häkelt am Strauche, Unter jedem Tritte ein Quellchen springt, Wenn aus der Spalte es zischt und singt, O schaurig ist's übers Moor zu gehn, Wenn das Röhricht knistert im Hauche! Fest hält die Fibel das zitternde Kind Und rennt als ob man es jage; Hohl über der Fläche sauset der Wind - Was raschelt da drüben im Hage? Das ist der gespentische Gräberknecht, Der dem Meister die besten Torfe verzecht; Hu, hu, es bricht wie ein irres Rind! Hinducket das Knäblein sich zage. Vom Ufer starret Gestumpf hervor, Unheimlich nicket die Föhre, Der Knabe rennt, gespannt das Ohr, Durch Riesenhalme wie Speere; Und wie es rieselt und knittert darin! Das ist die unselige Spinnerin, Das ist die gebannte Spinnlenor', Die den Haspel dreht im Geröhre! Voran, voran, nur immer im Lauf, Voran, als woll' es ihn holen; Vor seinem Fuße brodelt es auf, Es pfeift ihm unter den Sohlen Wie eine gespenstige Melodei; Das ist der Geigemann ungetreu, Das ist der diebische Fiedler Knauf, Der den Hochzeitheller gestohlen! Da birst das Moor, ein Seufzer geht Hervor aus der klaffenden Höhle; Weh, weh, da ruft die verdammte Margret: \"Ho, ho, meine arme Seele!\" Der Knabe springt wie ein wundes Reh, Wär nicht Schutzengel in seiner Näh', Seine bleichenden Knöchelchen fände spät Ein Gräber im Moorgeschwehle. Da mählich gründet der Boden sich, Und drüben, neben der Weide, Die Lampe flimmert so heimatlich, Der Knabe steht an der Scheide. Tief atmet er auf, zum Moor zurück Noch immer wirft er den scheuen Blick: Ja, im Geröhre war's fürchterlich, O schaurig war's in der Heide!";

//Text: Goethe: Die Braut von Korinth
String braut = "Nach Korinthus von Athen gezogen Kam ein Jüngling, dort noch unbekannt. Einen Bürger hofft' er sich gewogen; Beide Väter waren gastverwandt, Hatten frühe schon Töchterchen und Sohn Braut und Bräutigam voraus genannt. Aber wird er auch willkommen scheinen, Wenn er teuer nicht die Gunst erkauft? Er ist noch ein Heide mit den Seinen, Und sie sind schon Christen und getauft. Keimt ein Glaube neu, Wird oft Lieb' und Treu Wie ein böses Unkraut ausgerauft. Und schon lag das ganze Haus im stillen, Vater, Töchter, nur die Mutter wacht; Sie empfängt den Gast mit bestem Willen, Gleich ins Prunkgemach wird er gebracht. Wein und Essen prangt, Eh' er es verlangt: So versorgend wünscht sie gute Nacht. Aber bei dem wohl bestellten Essen Wird die Lust der Speise nicht erregt; Müdigkeit lässt Speis' und Trank vergessen, Dass er angekleidet sich aufs Bette legt; Und er schlummert fast, Als ein seltner Gast Sich zur offnen Tür herein bewegt. Denn er sieht, bei seiner Lampe Schimmer Tritt mit weißem Schleier und Gewand Sittsam still ein Mädchen in das Zimmer, Um die Stirn ein schwarz- und goldnes Band. wie sie ihn erblickt, Hebt sie, die erschrickt, Mit Erstaunen eine weiße Hand. \"Bin ich,\" rief sie aus, \"so fremd im Hause, Dass ich von dem Gaste nichts vernahm? Ach, so hält man mich in meiner Klause! Und nun überfällt mich hier die Scham. Ruhe nur so fort Auf dem Lager dort, Und ich gehe schnell, so wie ich kam.\" \"Bleibe, schönes Mädchen!\", ruft der Knabe, Rafft von seinem Lager sich geschwind: \"Hier ist Ceres', hier ist Baccus' Gabe, Und du bringst den Amor, liebes Kind! Bist vor Schrecken blass! Liebe, komm und lass, Lass uns sehn, wie froh die Götter sind!\" \"Ferne bleib, o Jüngling, bleibe stehen! Ich gehöre nicht den Freuden an. Schon der letzte Schritt ist, ach! Geschehen Durch der guten Mutter kranken Wahn, Die genesend schwur, Jugend und Natur Sei dem Himmel künftig untertan. Und der alten Götter bunt Gewimmel Hat sogleich das stille Haus geleert. Unsichtbar wird einer nur im Himmel, Und ein Heiland wird am Kreuz verehrt; Opfer fallen hier, Weder Lamm noch Stier, Aber Menschenopfer unerhört.\" Und er fragt und wäget alle Worte, Deren keines seinem Geist entgeht. Ist es möglich, dass am stillen Orte Die geliebte Braut hier vor mir steht? \"Sei die Meine nur! Unsrer Väter Schwur Hat vom Himmel Segen uns erfleht.\" \"Mich erhältst du nicht, du gute Seele! Meiner zweiten Schwester gönnt man dich. Wenn ich mich in stiller Klause quäle, Ach! In ihren Armen denk' an mich, Die an dich nur denkt, Die sich liebend kränkt; In die Erde bald verbirgt sie sich.\" \"Nein! Bei dieser Flamme sei's geschworen, Gütig zeigt die Hymen uns voraus; Bist der Freude nicht und mir verloren, Kommst mit mir in meines Vaters Haus. Liebchen, bleibe hier! Feire gleich mit mir Unerwartet unsern Hochzeitsschmaus!\" Und schon wechseln sie der Treue Zeichen: Golden reicht sie ihm die Kette dar, Und er will ihr eine Schale reichen, Silbern, künstlich, wie nicht eine war. \"Die ist nicht für mich; Doch, ich bitte dich, Eine Locke gib von deinem Haar.\" Eben schlug die dumpfe Geisterstunde, Und nun schien es ihr erst wohl zu sein. Gierig schlürfte sie mit blassem Munde Nun den dunkel blutgefärbten Wein; Doch vom Weizenbrot, Das er freundlich bot, Nahm sie nicht den kleinsten Bissen ein. Und dem Jüngling reichte sie die Schale, Der wie sie nun hastig lüstern trank. Liebe fordert er beim stillen Mahle; Ach, sein armes Herz war liebekrank. Doch sie widersteht, Wie er immer fleht, Bis er weinend auf das Bette sank. Und sie kommt und wirft sich zu ihm nieder: \"Ach, wie ungern seh' ich dich gequält! Aber, ach! Berührst du meine Glieder, Fühlst du schaudernd, was ich dir verhehlt. Wie der Schnee so weiß, Aber kalt wie Eis Ist das Liebchen, das du dir erwählt.\" Heftig fasst er sie mit starken Armen, Von der Liebe Jugendkraft durchmannt: \"Hoffe doch, bei mir noch zu erwarmen, Wärst du selbst mir aus dem Grab gesandt! Wechselhauch und Kuss! Liebesüberfluss! Brennst du nicht und fühlest mich entbrannt?\" Liebe schließet fester sie zusammen, Tränen mischen sich in ihre Lust; Gierig saugt sie seines Mundes Flammen, Eins ist nur im andern sich bewusst. Seien Liebeswut Wärmt ihr starres Blut; Doch es schlägt kein Herz in ihrer Brust. Unterdessen schleichet auf dem Gange Häuslich spät die Mutter noch vorbei, Horchet an der Tür und horchet lange, welch ein sonderbarer Ton es sei. Klag- und Wonnelaut Bräutigams und Braut Und des Liebestammelns Raserei. Unbeweglich bleibt sie an der Türe, Weil sie erst sich überzeugen muss, Und sie hört die höchsten Liebesschwure, Lieb' und Schmeichelworte mit Verdruss - Still! Der Hahn erwacht! - \"Aber morgen Nacht Bist du wieder da?\" - Und Kuss auf Kuss. Länge rhält die Mutter nicht das Zürnen, Öffnet das bekannte Schloss geschwind: \"Gibt es hier im Hause solche Dirnen, Die dem Fremden gleich zu Willen sind?\" So zur Tür hinein. Bei der Lampe Schein Sieht sie - Gott! Sie sieht ihr eigen Kind. Und der Jüngling will im ersten Schrecken Mit des Mädchens eignem Schleierflor, Mit dem Teppich die Geliebte decken; Doch sie windet gleich sich selbst hervor. Wie mit Geists Gewalt Hebet die Gestalt Lang und langsam sich im Bett empor. \"Mutter! Mutter! Spricht sie hohle Worte, So missgönnt ihr mir die schöne Nacht! Ihr vertreibt mich von dem warmen Orte! Bin ich zur Verzweiflung nur erwacht? Ist's euch nicht genug, Dass ins Leichentuch, Dass ihr früh mich in das Grab gebracht? Aber aus der schwer bedeckten Enge Treibet mich ein eigenes Gericht. Eurer Priester summende Gesänge Und ihr Segen haben kein Gewicht; Salz und Wasser kühlt Nicht, wo Jugend fühlt, Ach! Die Erde kühlt die Liebe nicht. Dieser Jüngling war mir erst versprochen, Als noch Venus' heitrer Tempel stand. Mutter, habt ihr doch das Wort gebrochen, Weil ein fremd, ein falsch Gelübd' euch band! Doch kein Gott erhöhrt, Wenn die Mutter schwört, Zu versagen ihrer Tochter Hand. Aus dem Grabe werd' ich ausgetrieben, Noch zu suchen das vermisste Gut, Noch den schon verlornen Mann zu lieben Und zu saugen seines Herzens Blut. Ist's um den geschehn, Muss nach andern gehn, Und das junge Volk erliegt der Wut. Schöner Jüngling, kannst nicht länger leben! Du versiechest nun an diesem Ort. Meine Kette hab' ich dir gegeben, Deine Locke nehm' ich mit mir fort. Sieh sie an genau, Morgen bist du grau, Und nur braun erscheinst du wieder dort. Höre, Mutter, nun die letzte Bitte: Einen Scheiterhaufen schichte du! Öffne meine bange kleine Hütte, Bring' in Flammen Liebende zur Ruh'! Wenn der Funke sprüht, Wenn die Asche glüht, Eilen wir den alten Göttern zu.\"";



