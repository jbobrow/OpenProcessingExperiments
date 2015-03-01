

size (100, 100);
background (0);
smooth ();
noStroke();
fill (140, 90);

String [] lines = loadStrings ("lines.txt");

for (int i = 0; i<lines.length; i++){
  String [] pieces = split (lines[i], '\t');
  if (pieces.length == 2){
  int x = int (pieces[0]);
  int y = int(pieces[1]);
  ellipse (x, y, 15, 15);
  
  }

}





