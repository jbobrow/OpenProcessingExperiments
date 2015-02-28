
String [] names;
int [] scores;

String [] lines = loadStrings("data.txt");

//println("there are " + lines.length + " lines");
names = new String[lines.length];
scores = new int [lines.length];

for (int i=0; i < lines.length; i++) {
  String [] data = split(lines[i],'\t');
  names[i] = data[0];
  scores[i] = int(data[1]);
  scores[i]++;
}

String [] out = new String[lines.length];

for (int i=0; i < lines.length; i++) {
  out[i] = names[i] + '\t' + scores[i];
}

saveStrings("data/data.txt", out);

