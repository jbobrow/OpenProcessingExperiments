
String[] themeArray =
{
  "Scharf!",
  "Wenn ich ein Tier wäre, wäre ich...",
  "Hätte ich in der Schule aufgepasst...",
  "Du? Hier?",
  "Auf einer einsamen Insel...",
  "Rückwärts Einparken.",
  "Sekt oder Selters?",
  "Tee oder Kaffee?",
  "Mein schlimmster Albtraum.",
  "Meer oder Berge?",
  "Unter der Dusche singe ich...",
  "Ich könnte den ganzen Tag...",
  "Sport ist...",
  "Party bis zum...",
  "Rock’n’Roll!",
  "Der schlechteste Film aller Zeiten.",
  "So fühle ich mich kurz nach dem Aufstehen.",
  "Frühstück? Croissant? Rührei? Filetsteak?",
  "Morgens halb Zehn bei mir",
  "Wochenende",
  "Mein Job"
};
   
void setup()
{
  size(920,160);
  background(230, 200, 150);
   
  PFont font;
  font = createFont("Tahoma", 45);
  textFont(font);
  int index = (int) random(0, themeArray.length);
  fill(160, 30, 40);
  text(themeArray[index], 30, 100); 
}


